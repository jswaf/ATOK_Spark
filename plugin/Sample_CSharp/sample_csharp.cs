using System;
namespace atokSparkplugin
{
    class Program
    {
        // メイン
        static int Main(string[] args)
        {
            string xLastError = "";

            // サンプルの置換コマンド
            // トリガーと、置換先テキストを記載しています。
            string[,] xPattern = new string[2, 2] { 
						{ "plugincs:", "C#サンプルです" },
						{ "plugincs2:", "==========================\n  ATOK Spark + C# Plugin\n==========================" },
					};

            // ATOK Sparkと接続するための識別文字列を返却します
            System.Console.WriteLine("HELLO ATOK Spark/0.0");

            while (true)
            {

                // ATOK Spark からの接続要求を待機します
                // 処理は一行で受信します
                string xInLine = System.Console.ReadLine();
                int xSpace = xInLine.IndexOf(' ');

                // 引数渡しでコマンドが呼ばれます
                // 「コマンド、半角スペース、引数」で渡されます
                if (xSpace != -1)
                {
                    // コマンド
                    string xCommand = xInLine.Substring(0, xSpace);
                    // 引数
                    string xData = xInLine.Substring(xSpace + 1);

                    // コマンドの種別によって処理が変わります
                    if (xCommand == "CHECK")
                    {

                        // CHECKは、ストローク情報とのマッチングを行います。
                        // 可能な限り早く応答を返す必要があります
                        // CHECK中は返却する文字列は生成する必要はありません。
                        //
                        // 任意のトークン(整数型)を渡すことができます。
                        // 本サンプルではパターン中のIndex位置に利用しています

                        // ストローク情報とのマッチング
                        int xMatchIndex = -1;
                        for (int i = 0; i < xPattern.GetLength(0); i++)
                        {
                            if (xData == xPattern[i, 0])
                            {
                                // マッチ
                                xMatchIndex = i;
                            }
                        }

                        // マッチング結果があれば、
                        // REPLACEまたはVIEWとトークン（整数型）を返します。
                        // マッチングしなければNONEを返します
                        if (xMatchIndex != -1)
                        {
                            System.Console.WriteLine("REPLACE " + xMatchIndex.ToString());
                        }
                        else
                        {
                            System.Console.WriteLine("NONE");
                        }
                        continue;
                    }
                    else if (xCommand == "GETTEXT")
                    {

                        // GETTEXTは、CHECKでマッチングした文字列の置換先を取得します。
                        // REPLACEの場合は文字列を、VIEWの場合はXHTMLを返してください。
                        // 改行は\nで行うことができます。

                        // 本サンプルではCHECKでパターン中の位置を格納しているので、
                        // その位置の文字列を取得して返却する

                        int xMatchIndex = int.Parse(xData);
                        if (xMatchIndex < xPattern.GetLength(0))
                        {
                            System.Console.WriteLine("TEXT " + xPattern[xMatchIndex, 1]);
                        }
                        else
                        {
                            // エラー発生の場合は、ERRORを返します。
                            System.Console.WriteLine("ERROR");
                            xLastError = "渡されたトークンが不正です";
                        }
                    }
                }

                // エラー返却要求
                if (xInLine == "GETERROR")
                {
                    // GETERRORは、エラーが発生した場合の文字列をATOK Sparkに渡します。
                    // GETTEXTなどでERRORを渡した場合は、本呼び出しが行われ、
                    // ATOK Spark側にエラーメッセージを送信することで、ATOK Sparkがメッセージボックスを表示します。
                    System.Console.WriteLine(xLastError);
                    continue;
                }

                // 終了要求
                if (xInLine == "QUIT")
                {
                    // QUITは、ATOK Sparkがプラグインを終了させる場合に呼び出されます。
                    // QUITを受信した場合、ただちにアプリを終了してください。
                    return 0;
                }
            }
        }
    }
}
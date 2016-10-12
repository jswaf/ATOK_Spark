#include <iostream>
#include <string>
#include <vector>
#include <map>
#include <stdlib.h>

/**
 * ATOK Spark プラグイン
 */
int main()
{
    std::string xInBuffer;
    std::string xLastError;

    // サンプルの置換コマンド
    // トリガーと、置換先テキストを記載しています。
    std::vector<std::pair<std::string, std::string>> xPattern;
    xPattern.push_back(std::make_pair("plugincpp:", "CPPサンプルです"));
    xPattern.push_back(std::make_pair("plugincpp2:", "=============\n  ATOK Spark + Cpp Plugin\n============="));

    // ATOK Sparkと接続するための識別文字列を返却します
    std::cout << "HELLO ATOK Spark/0.0" << std::endl;

    while (true)
    {

        // ATOK Spark からの接続要求を待機します
        // 処理は一行で受信します
        getline(std::cin, xInBuffer);

        // 引数渡しでコマンドが呼ばれます
        // 「コマンド、半角スペース、引数」で渡されます
        size_t xSpace = xInBuffer.find(' ');
        if (xSpace != std::string::npos)
        {
            // コマンド
            std::string xCommand = xInBuffer.substr(0, xSpace);
            // 引数
            std::string xData = xInBuffer.substr(xSpace + 1);

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
                for (int i = 0; i < xPattern.size(); i++)
                {
                    if (xData == xPattern[i].first)
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
                    std::cout << "REPLACE " << xMatchIndex << std::endl;
                }
                else
                {
                    std::cout << "NONE" << std::endl;
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
                int xMatchIndex = atoi(xData.c_str());
                if (xMatchIndex < xPattern.size())
                {
                    std::cout << "TEXT " << xPattern[xMatchIndex].second << std::endl;
                }
                else
                {
                    // エラー発生の場合は、ERRORを返します。
                    std::cout << "ERROR" << std::endl;
                    xLastError = "渡されたトークンが不正です";
                }
                continue;
            }
        }

        // エラー返却要求
        if (xInBuffer == "GETERROR")
        {
            // GETERRORは、エラーが発生した場合の文字列をATOK Sparkに渡します。
            // GETTEXTなどでERRORを渡した場合は、本呼び出しが行われ、
            // ATOK Spark側にエラーメッセージを送信することで、ATOK Sparkがメッセージボックスを表示します。
            std::cout << xLastError << std::endl;
            continue;
        }

        // 終了要求
        if (xInBuffer == "QUIT")
        {
            // QUITは、ATOK Sparkがプラグインを終了させる場合に呼び出されます。
            // QUITを受信した場合、ただちにアプリを終了してください。
            return 0;
        }

        // 未知のコマンドが渡された場合はUNKNOWNを返します。
        std::cout << "UNKNOWN" << std::endl;
    }
    return 1;
}

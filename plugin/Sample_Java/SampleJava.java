import java.io.*;

/**
 * ATOK Spark プラグイン
 */
class SampleJava {
    public static void main(String args[]) {
        String xLastError = "";
        // サンプルの置換コマンド
        // トリガーと、置換先テキストを記載しています。
        String[][] xPattern = {
                {"pluginjava:", "Javaサンプルです"},
                {"pluginjava2:", "==========================\n  ATOK Spark + Java Plugin\n=========================="}
        };

        // ATOK Sparkと接続するための識別文字列を返却します
        System.out.println("HELLO ATOK Spark/0.0");
        BufferedReader xStdInput = new BufferedReader(new InputStreamReader(System.in));


        while (true) {

            // ATOK Spark からの接続要求を待機します
            // 処理は一行で受信します
            String xInLine;
            try {
                xInLine = xStdInput.readLine().trim();
            } catch (IOException e) {
                System.err.println("ATOK Sparkとの接続が切れました");
                return;
            }
            int xSpace = xInLine.indexOf(' ');

            // 引数渡しでコマンドが呼ばれます
            // 「コマンド、半角スペース、引数」で渡されます
            if (xSpace != -1) {
                // コマンド
                String xCommand = xInLine.substring(0, xSpace);
                // 引数
                String xData = xInLine.substring(xSpace + 1);

                // コマンドの種別によって処理が変わります
                if (xCommand.equals("CHECK")) {

                    // CHECKは、ストローク情報とのマッチングを行います。
                    // 可能な限り早く応答を返す必要があります
                    // CHECK中は返却する文字列は生成する必要はありません。
                    //
                    // 任意のトークン(整数型)を渡すことができます。
                    // 本サンプルではパターン中のIndex位置に利用しています

                    // ストローク情報とのマッチング
                    int xMatchIndex = -1;
                    for (int i = 0; i < xPattern.length; i++) {
                        if (xData.equals(xPattern[i][0])) {
                            // マッチ
                            xMatchIndex = i;
                        }
                    }

                    // マッチング結果があれば、
                    // REPLACEまたはVIEWとトークン（整数型）を返します。
                    // マッチングしなければNONEを返します
                    if (xMatchIndex != -1) {
                        System.out.println("REPLACE " + String.valueOf(xMatchIndex));
                    } else {
                        System.out.println("NONE");
                    }
                    continue;
                } else if (xCommand.equals("GETTEXT")) {

                    // GETTEXTは、CHECKでマッチングした文字列の置換先を取得します。
                    // REPLACEの場合は文字列を、VIEWの場合はXHTMLを返してください。
                    // 改行は\nで行うことができます。

                    // 本サンプルではCHECKでパターン中の位置を格納しているので、
                    // その位置の文字列を取得して返却する

                    int xMatchIndex = Integer.parseInt(xData);
                    if (xMatchIndex < xPattern.length) {
                        System.out.println("TEXT " + xPattern[xMatchIndex][1]);
                    } else {
                        // エラー発生の場合は、ERRORを返します。
                        System.out.println("ERROR");
                        xLastError = "渡されたトークンが不正です";
                    }
                    continue;
                }
            }

            // エラー返却要求
            if (xInLine.equals("GETERROR")) {
                // GETERRORは、エラーが発生した場合の文字列をATOK Sparkに渡します。
                // GETTEXTなどでERRORを渡した場合は、本呼び出しが行われ、
                // ATOK Spark側にエラーメッセージを送信することで、ATOK Sparkがメッセージボックスを表示します。
                System.out.println(xLastError);
                continue;
            }

            // 終了要求
            if (xInLine.equals("QUIT")) {
                // QUITは、ATOK Sparkがプラグインを終了させる場合に呼び出されます。
                // QUITを受信した場合、ただちにアプリを終了してください。
                return;
            }
            System.out.println("UNKNOWN");
        }
    }
}
using System;
namespace atokSparkplugin
{
    class Program
    {
        // ���C��
        static int Main(string[] args)
        {
            string xLastError = "";

            // �T���v���̒u���R�}���h
            // �g���K�[�ƁA�u����e�L�X�g���L�ڂ��Ă��܂��B
            string[,] xPattern = new string[2, 2] { 
						{ "plugincs:", "C#�T���v���ł�" },
						{ "plugincs2:", "==========================\n  ATOK Spark + C# Plugin\n==========================" },
					};

            // ATOK Spark�Ɛڑ����邽�߂̎��ʕ������ԋp���܂�
            System.Console.WriteLine("HELLO ATOK Spark/0.0");

            while (true)
            {

                // ATOK Spark ����̐ڑ��v����ҋ@���܂�
                // �����͈�s�Ŏ�M���܂�
                string xInLine = System.Console.ReadLine();
                int xSpace = xInLine.IndexOf(' ');

                // �����n���ŃR�}���h���Ă΂�܂�
                // �u�R�}���h�A���p�X�y�[�X�A�����v�œn����܂�
                if (xSpace != -1)
                {
                    // �R�}���h
                    string xCommand = xInLine.Substring(0, xSpace);
                    // ����
                    string xData = xInLine.Substring(xSpace + 1);

                    // �R�}���h�̎�ʂɂ���ď������ς��܂�
                    if (xCommand == "CHECK")
                    {

                        // CHECK�́A�X�g���[�N���Ƃ̃}�b�`���O���s���܂��B
                        // �\�Ȍ��葁��������Ԃ��K�v������܂�
                        // CHECK���͕ԋp���镶����͐�������K�v�͂���܂���B
                        //
                        // �C�ӂ̃g�[�N��(�����^)��n�����Ƃ��ł��܂��B
                        // �{�T���v���ł̓p�^�[������Index�ʒu�ɗ��p���Ă��܂�

                        // �X�g���[�N���Ƃ̃}�b�`���O
                        int xMatchIndex = -1;
                        for (int i = 0; i < xPattern.GetLength(0); i++)
                        {
                            if (xData == xPattern[i, 0])
                            {
                                // �}�b�`
                                xMatchIndex = i;
                            }
                        }

                        // �}�b�`���O���ʂ�����΁A
                        // REPLACE�܂���VIEW�ƃg�[�N���i�����^�j��Ԃ��܂��B
                        // �}�b�`���O���Ȃ����NONE��Ԃ��܂�
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

                        // GETTEXT�́ACHECK�Ń}�b�`���O����������̒u������擾���܂��B
                        // REPLACE�̏ꍇ�͕�������AVIEW�̏ꍇ��XHTML��Ԃ��Ă��������B
                        // ���s��\n�ōs�����Ƃ��ł��܂��B

                        // �{�T���v���ł�CHECK�Ńp�^�[�����̈ʒu���i�[���Ă���̂ŁA
                        // ���̈ʒu�̕�������擾���ĕԋp����

                        int xMatchIndex = int.Parse(xData);
                        if (xMatchIndex < xPattern.GetLength(0))
                        {
                            System.Console.WriteLine("TEXT " + xPattern[xMatchIndex, 1]);
                        }
                        else
                        {
                            // �G���[�����̏ꍇ�́AERROR��Ԃ��܂��B
                            System.Console.WriteLine("ERROR");
                            xLastError = "�n���ꂽ�g�[�N�����s���ł�";
                        }
                    }
                }

                // �G���[�ԋp�v��
                if (xInLine == "GETERROR")
                {
                    // GETERROR�́A�G���[�����������ꍇ�̕������ATOK Spark�ɓn���܂��B
                    // GETTEXT�Ȃǂ�ERROR��n�����ꍇ�́A�{�Ăяo�����s���A
                    // ATOK Spark���ɃG���[���b�Z�[�W�𑗐M���邱�ƂŁAATOK Spark�����b�Z�[�W�{�b�N�X��\�����܂��B
                    System.Console.WriteLine(xLastError);
                    continue;
                }

                // �I���v��
                if (xInLine == "QUIT")
                {
                    // QUIT�́AATOK Spark���v���O�C�����I��������ꍇ�ɌĂяo����܂��B
                    // QUIT����M�����ꍇ�A�������ɃA�v�����I�����Ă��������B
                    return 0;
                }
            }
        }
    }
}
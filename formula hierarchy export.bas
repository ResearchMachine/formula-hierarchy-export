Attribute VB_Name = "Module1"
Option Explicit



'Application.SendKeys "^g ^a {DEL}"

Sub Macro()
    Open ThisWorkbook.Path & "\template.txt" For Output As #1
    'Print #1, "Hello"

    'Dim strKolvoAndSpisokFormulCharov As String
    Dim strHelp As String '��������� ���������
    Dim strHelp2 As String '��������� ���������
    Dim lngHelp As Long '������������� ���������
    Dim lngHelp2 As Long '������������� ���������
    Dim strCurrentList As String '������� ����
    Dim strCurrentChar As String '������� ������
    Dim lngIterChar As Long '������������� �������� �� �������
    Dim strIter As Variant '��������� ��������
    Dim strMainFormula As String '�������
    Dim strIterChar As String '���������� ��� ����������� ������
    Dim arrSearchField(1 To 2, 1 To 1) As Variant '������� ������
    Dim lngHowMuchForm As Long '������� ������
    Dim lngWhereIterCharInFormula As Long '��� � ������� ������
    Dim strCurrentFormula As String '������� ������� �� ���������
    Dim lngWhereListIterCharInFormula As Long '��������� ��� ������ � ����� � �������
    Dim strListIterChar As String '������� ������� �� ���������
    'Dim strKolvoAndSpisokFormulCharov As String '��������
    Dim strType As String '��� ���������� ������� ��� �����
    Dim strLeftNomerForm As String '��������� ���������
    Dim strCurrentKolvoAndSpisokFormulCharov As String '��������� ���������
    Dim lngNYarus As Long '����� �����
    Dim lngNForm As Long '����� �������
    Dim strVivodPredYarus As String '����� ����������� �����
    Dim strVivodTekYarus As String '����� �������� �����
    Dim strObshSpisokForm As String '����� ������ ������ ������
    Dim lngIter As Long '������������� ��������
    Dim lngKolvoFormulPredYarus As Long '����� ������ �� ���������� �����
    Dim lngKolvoFormulTekYarus As Long '����� ������ � ������� �����
    
    strCurrentList = "������ �������"
    strCurrentChar = "B2"
    strLeftNomerForm = ""
    lngNYarus = 1
    strVivodPredYarus = strKolvoAndSpisokFormulCharov(strCurrentList, strCurrentChar, lngNYarus) '����� ����������� �����
    lngNYarus = 1 '����� �����
    lngNForm = 1 '����� �������
    strVivodTekYarus = "" '����� �������� �����
    
    Print #1, strVivodPredYarus + strCurrentList
    Debug.Print strVivodPredYarus + strCurrentList
    lngKolvoFormulPredYarus = CInt(Left(strVivodPredYarus, 1))
    If lngKolvoFormulPredYarus > 9 Then
        strVivodPredYarus = Replace(strVivodPredYarus, Left(strVivodPredYarus, 2) + "#", "", , 1)  '������ ������ �����
    Else
        strVivodPredYarus = Replace(strVivodPredYarus, Left(strVivodPredYarus, 1) + "#", "", , 1)
    End If
    strObshSpisokForm = strVivodPredYarus '����� ������ ������ ������

    'Print #1, "����� ����� ������", lngNYarus
    '���� N��<3 � �����(���������)<>0 ������:
    Do While lngNYarus < 20 And lngKolvoFormulPredYarus <> 0
        Print #1, "' ############################################################################"
        Debug.Print "' ############################################################################"
        Debug.Print "����� ����� ������", lngNYarus
        Print #1, "����� ����� ������", lngNYarus '������ N��
        '� ����� ����� ���� ������� ���� ���������� ���������� � ����������� ����������.
        '� ���� ����� ��������� ������� �������� � ������ ����������� �����
        '� ��������� ������ ���������� ���������� �����
        
        lngKolvoFormulTekYarus = 0
        lngIter = 1
        Do While lngIter < lngKolvoFormulPredYarus And StrComp(strVivodPredYarus, "") <> 0
            '����� �������� ������ ������� ���������� � ������� �����
            'Print #1, "=====" + strVivodPredYarus
            strCurrentChar = Left(strVivodPredYarus, InStr(strVivodPredYarus, "#") - 1) '��������� �������� ������� ����������
            strVivodPredYarus = Replace(strVivodPredYarus, strCurrentChar + "#", "", , 1) '������� �������� ������� ���������� �� ������ ������
            strCurrentList = Left(strCurrentChar, InStr(strCurrentChar, "!") - 1) '��������� �������� ����� ������� ����������
            strCurrentChar = Replace(strCurrentChar, strCurrentList + "!", "", , 1) '������� �������� ����� ������� ����������
                       
            strHelp = strKolvoAndSpisokFormulCharov(strCurrentList, strCurrentChar, lngNYarus)
'            lngHelp = CInt(Left(strHelp, 1)) '����� ������ � ������� ����������
'            strHelp = Replace(strHelp, Left(strHelp, 1) + "#", "", , 1)  '������ ������ �����
            
            If InStr(strHelp, "#") < 3 Then '������ ������ �����
                lngHelp = CInt(Left(strHelp, 1)) '����� ������ � ������� ����������
                strHelp = Replace(strHelp, Left(strHelp, 1) + "#", "", , 1)  '������ ������ �����
            Else
                lngHelp = CInt(Left(strHelp, 2)) '����� ������ � ������� ����������
                strHelp = Replace(strHelp, Left(strHelp, 2) + "#", "", , 1)  '������ ������ �����
            End If
                           
            If lngHelp > 0 Then
                lngKolvoFormulTekYarus = lngKolvoFormulTekYarus + lngHelp
                strVivodTekYarus = strVivodTekYarus + strHelp '����� ���������� � ����� ����
            End If
            '�������� ������ ���������� ���������� ����� '����� = ����� + f(���������(i)) �1
            lngNForm = lngNForm + 1
        Loop '����� �����
         
        strVivodTekYarus = strDeleter(strVivodTekYarus, strObshSpisokForm) '  ����� = ����� - ������
        strVivodTekYarus = strCopyDeleter(strVivodTekYarus)
        strObshSpisokForm = strObshSpisokForm + strVivodTekYarus '  ������ = ������ + �����  �2
        strVivodTekYarus = CStr(lngKolvoFormulTekYarus) + "#" + strVivodTekYarus
        strVivodPredYarus = strVivodTekYarus '��������� = �����
        Print #1, "=====" + strVivodPredYarus
        If lngKolvoFormulTekYarus > 9 Then
            If lngKolvoFormulTekYarus > 99 Then
                lngKolvoFormulPredYarus = CInt(Left(strVivodPredYarus, 3)) '��������� ���-�� ������ ����������� �����
                strVivodPredYarus = Replace(strVivodPredYarus, Left(strVivodPredYarus, 3) + "#", "", , 1)   '������ ������ �����
            Else
                lngKolvoFormulPredYarus = CInt(Left(strVivodPredYarus, 2)) '��������� ���-�� ������ ����������� �����
                strVivodPredYarus = Replace(strVivodPredYarus, Left(strVivodPredYarus, 2) + "#", "", , 1)   '������ ������ �����
            End If
        Else
            lngKolvoFormulPredYarus = CInt(Left(strVivodPredYarus, 1)) '��������� ���-�� ������ ����������� �����
            strVivodPredYarus = Replace(strVivodPredYarus, Left(strVivodPredYarus, 1) + "#", "", , 1)
        End If

        strVivodTekYarus = "" '����� = ""
        lngNYarus = lngNYarus + 1 'N�� = N�� + 1
    Loop '����� �����

Close #1
 
End Sub

'������� ����������� � ���������� ���������� ������� ��� ���
Function strCopyDeleter(strVivodYarus1)
    Dim strVarChar As String '��������� ��� ��������� ������
    Dim lngHelp As Long '��������� ��� ��������� ������
    Dim strHelp As String
    strHelp = strVivodYarus1

    Do While StrComp(strHelp, "") <> 0 And lngHelp < 300
        strVarChar = Left(strHelp, InStr(strHelp, "#")) '��������� �������� ������� ����������
        strVivodYarus1 = Replace(strVivodYarus1, strVarChar, "$HEEEY$", , 1) '������� ������ �������� ������� ���������� �� ������ ������
        strVivodYarus1 = Replace(strVivodYarus1, strVarChar, "")
        strVivodYarus1 = Replace(strVivodYarus1, "$HEEEY$", strVarChar, , 1) '���������� ������ ��������
        strHelp = Replace(strHelp, strVarChar, "") '������� �������� ������� ���������� �� ����������
        lngHelp = lngHelp + 1
    Loop '����� �����
    strCopyDeleter = strVivodYarus1
    
End Function

'������� ��������� �� ����� ���������� ���������� (��� �������� �������� �� ���������� ������)
Function strDeleter(strVivodYarus, strObshSpisokForm)
    Dim strVarChar As String '��������� ��� ��������� ������
    Dim lngHelp As Long '��������� ��� ��������� ������
    Dim strHelp As String
    strHelp = strObshSpisokForm

    Do While StrComp(strHelp, "") <> 0 And lngHelp < 300
        strVarChar = Left(strHelp, InStr(strHelp, "#")) '��������� �������� ������� ����������
        strVivodYarus = Replace(strVivodYarus, strVarChar, "") '������� �������� ������� ���������� �� ������ ������
        strHelp = Replace(strHelp, strVarChar, "") '������� �������� ������� ���������� �� ����������
        lngHelp = lngHelp + 1
    Loop '����� �����
    strDeleter = strVivodYarus
End Function


Function strAboutChar(strList, strChar, strType, strLeftNomerForm, lngHowMuchForm, Yarus)
    Dim strHelp As String '��������� ���������
    Dim strWhoIsIt As String '����� �������� ����������
    'strHelp = Worksheets(strList).Range(strChar).Row - 1 & ", " & Worksheets(strList).Range(strChar).Column '������ �������� ����������
   
    If Worksheets(strList).Cells(1, Worksheets(strList).Range(strChar).Column) = "" Then '������ ������ �����
        strWhoIsIt = Mid(strList, 1, 1) + Mid(strList, InStr(strList, " ") + 1, 1) + "������������" + "_" + CStr(lngHowMuchForm) + "_" + CStr(Yarus) '������ �������� ����������
    Else
        strWhoIsIt = Mid(strList, 1, 1) + Mid(strList, InStr(strList, " ") + 1, 1) + Worksheets(strList).Cells(1, Worksheets(strList).Range(strChar).Column) + "_" + CStr(lngHowMuchForm) + CStr(Yarus) '������ �������� ����������
    End If
       
    '�������� �������� /%$-.,()*
    strWhoIsIt = Replace(strWhoIsIt, " ", "")
    strWhoIsIt = Replace(strWhoIsIt, "/", "")
    strWhoIsIt = Replace(strWhoIsIt, "%", "")
    strWhoIsIt = Replace(strWhoIsIt, "$", "")
    strWhoIsIt = Replace(strWhoIsIt, "-", "")
    strWhoIsIt = Replace(strWhoIsIt, ".", "")
    strWhoIsIt = Replace(strWhoIsIt, ",", "")
    strWhoIsIt = Replace(strWhoIsIt, "(", "")
    strWhoIsIt = Replace(strWhoIsIt, ")", "")
    strWhoIsIt = Replace(strWhoIsIt, "*", "")
    strWhoIsIt = Replace(strWhoIsIt, "Chr(34)", "")
    strWhoIsIt = Replace(strWhoIsIt, vbNewLine, "")
    
    If strWhoIsIt = "" Then
        strWhoIsIt = "������ ��� ��������"
    End If

    If strType = "�������" Then '���� �������, �� ��������� � ����� �����, ����� ���
        strAboutChar = "Dim " + strWhoIsIt + " As Double" + " ' " + strType + " " + CStr(lngHowMuchForm) + " " + strList + " " + strChar + vbNewLine
        strAboutChar = strAboutChar + strWhoIsIt + " = " + Replace(CStr(Worksheets(strList).Cells(2, Worksheets(strList).Range(strChar).Column)), ",", ".")
    ElseIf strType = "������ ������" Then
        strAboutChar = "Dim " + strWhoIsIt + " As Double" + " ' " + " " + " " + strList + " " + strChar
    ElseIf strType = "������� �������" Then
        strAboutChar = " " + strList + " " + strChar + " " + " = " + Replace(CStr(Worksheets(strList).Cells(2, Worksheets(strList).Range(strChar).Column)), ",", ".")
    ElseIf strType = "������ ��������" Then
        strAboutChar = strWhoIsIt
    Else
        strAboutChar = "Dim " + strWhoIsIt
        strAboutChar = strAboutChar + " As Double" + " ' " + strType + " " + strList + " " + strChar + vbNewLine
        strAboutChar = strAboutChar + strWhoIsIt + " = " + Replace(CStr(Worksheets(strList).Cells(2, Worksheets(strList).Range(strChar).Column)), ",", ".")
    End If
End Function


Function strKolvoAndSpisokFormulCharov(strCurrentList, strCurrentChar, lngNYarus) '��������� ������ ������� ������� ��� ������
    Dim strHelp As String '��������� ���������
    Dim strOutputPrintCurrentFormula As String '��������� ���������
    Dim lngHelp As String '������������� ���������
    Dim lngHelp2 As String '������������� ���������
    Dim lngIterChar As Long '������������� �������� �� �������
    Dim strIter As Variant '��������� ��������
    Dim strMainFormula As String '�������
    Dim strIterChar As String '���������� ��� ����������� ������
    Dim arrSearchField(1 To 2, 1 To 1) As Variant '������� ������
    Dim lngHowMuchForm As Long '������� ������
    Dim lngWhereIterCharInFormula As Long '��� � ������� ������
    Dim strCurrentFormula As String '������� ������� �� ���������
    Dim lngWhereListIterCharInFormula As Long '��������� ��� ������ � ����� � �������
    Dim strListIterChar As String '������� ������� �� ���������
    'Dim strKolvoAndSpisokFormulCharov As String '��������
    Dim strType As String '��� ���������� ������� ��� �����
    'Dim strLeftNomerForm As String '��������� ���������
    
    Dim strLeftNomerForm As String
    
    Print #1, "' ############################################################################"
    Debug.Print "' ############################################################################"
    
    
    
    strCurrentFormula = ThisWorkbook.Worksheets(strCurrentList).Range(strCurrentChar).Formula
    strCurrentFormula = Replace(strCurrentFormula, "$", "")
    strCurrentFormula = Replace(strCurrentFormula, "IF", "IIf")
    strHelp = strAboutChar(strCurrentList, strCurrentChar, "������� �������", strLeftNomerForm, 0, lngNYarus)
    strOutputPrintCurrentFormula = strCurrentFormula
    
    Debug.Print strAboutChar(strCurrentList, strCurrentChar, "������ ������", strLeftNomerForm, 0, lngNYarus)
    Print #1, strAboutChar(strCurrentList, strCurrentChar, "������ ������", strLeftNomerForm, 0, lngNYarus)

      
    strKolvoAndSpisokFormulCharov = ""
    lngHowMuchForm = 0
    For lngIterChar = 300 To 1 Step -1 '�������� �� ������� AW2..A2
        lngWhereIterCharInFormula = 0
        strIterChar = Worksheets(strCurrentList).Cells(2, lngIterChar).Address '������� ���������� ������ �� ������ � ���������
        strIterChar = Replace(strIterChar, "$", "") '������� ������� �� �������� ������
        
        lngWhereIterCharInFormula = InStr(strCurrentFormula, strIterChar) '��� ��������� ����� � �������
        If lngWhereIterCharInFormula > 0 Then '���� ��������� ����� ���� � �������
        
            lngIterChar = lngIterChar + 1
            If Mid(strCurrentFormula, lngWhereIterCharInFormula - 1, 1) = "!" Then '���� ���� ������ �� ����, �� ������������ ��
                
                lngWhereListIterCharInFormula = InStrRev(strCurrentFormula, "'", lngWhereIterCharInFormula - 3)
                strListIterChar = Mid(strCurrentFormula, lngWhereListIterCharInFormula + 1, lngWhereIterCharInFormula - lngWhereListIterCharInFormula - 3)
                If InStr(Worksheets(strListIterChar).Range(strIterChar).Formula, "=") = 1 Then '�������� �������� �� ��������
                    strType = "�������"
                    lngHowMuchForm = lngHowMuchForm + 1
                    Print #1, strAboutChar(strListIterChar, strIterChar, strType, strLeftNomerForm, lngHowMuchForm, lngNYarus) '����� ���������� � ����������
                    Debug.Print strAboutChar(strListIterChar, strIterChar, strType, strLeftNomerForm, lngHowMuchForm, lngNYarus)
                    strOutputPrintCurrentFormula = Replace(strOutputPrintCurrentFormula, "'" + strListIterChar + "'" + "!" + strIterChar, strAboutChar(strListIterChar, strIterChar, "������ ��������", strLeftNomerForm, lngHowMuchForm, lngNYarus), , 1)
                    strKolvoAndSpisokFormulCharov = strKolvoAndSpisokFormulCharov + strListIterChar + "!" + strIterChar + "#"
                    strCurrentFormula = Replace(strCurrentFormula, "'" + strListIterChar + "'" + "!" + strIterChar, "", , 1)
                Else
                    lngHowMuchForm = lngHowMuchForm + 1 '����������� ������� ������
                    strType = "���������"
                    Print #1, strAboutChar(strListIterChar, strIterChar, strType, 0, lngHowMuchForm, lngNYarus) '����� ���������� � ����������
                    Debug.Print strAboutChar(strListIterChar, strIterChar, strType, 0, lngHowMuchForm, lngNYarus)
                    strOutputPrintCurrentFormula = Replace(strOutputPrintCurrentFormula, "'" + strListIterChar + "'" + "!" + strIterChar, strAboutChar(strListIterChar, strIterChar, "������ ��������", strLeftNomerForm, lngHowMuchForm, lngNYarus), , 1)
                    strCurrentFormula = Replace(strCurrentFormula, "'" + strListIterChar + "'" + "!" + strIterChar, "", , 1)
                   
                End If

            Else '���� ��� ������ �� ����, �� �� ������������ ��
                strListIterChar = strCurrentList
                If InStr(Worksheets(strCurrentList).Range(strIterChar).Formula, "=") = 1 Then '�������� �������� �� ��������
                    lngHowMuchForm = lngHowMuchForm + 1 '����������� ������� ������
                    strType = "�������"
                    Print #1, strAboutChar(strListIterChar, strIterChar, strType, strLeftNomerForm, lngHowMuchForm, lngNYarus) '����� ���������� � ����������
                    Debug.Print strAboutChar(strListIterChar, strIterChar, strType, strLeftNomerForm, lngHowMuchForm, lngNYarus)
                    strKolvoAndSpisokFormulCharov = strKolvoAndSpisokFormulCharov + strListIterChar + "!" + strIterChar + "#"
                    strOutputPrintCurrentFormula = Replace(strOutputPrintCurrentFormula, strIterChar, strAboutChar(strListIterChar, strIterChar, "������ ��������", strLeftNomerForm, lngHowMuchForm, lngNYarus), , 1)
                    strCurrentFormula = Replace(strCurrentFormula, strIterChar, "", , 1)
                Else
                    lngHowMuchForm = lngHowMuchForm + 1 '����������� ������� ������
                    strType = "���������"
                    Print #1, strAboutChar(strListIterChar, strIterChar, strType, 0, lngHowMuchForm, lngNYarus) '����� ���������� � ����������
                    Debug.Print strAboutChar(strListIterChar, strIterChar, strType, 0, lngHowMuchForm, lngNYarus)
                    strOutputPrintCurrentFormula = Replace(strOutputPrintCurrentFormula, strIterChar, strAboutChar(strListIterChar, strIterChar, "������ ��������", strLeftNomerForm, lngHowMuchForm, lngNYarus), , 1)
                    'strOutputPrintCurrentFormula = Replace(strOutputPrintCurrentFormula, strIterChar, strAboutChar(strListIterChar, strIterChar, "������ ��������", strLeftNomerForm, lngHowMuchForm))
                    strCurrentFormula = Replace(strCurrentFormula, strIterChar, "", , 1)
                End If
            End If
            
        End If
    Next lngIterChar
    Print #1, strAboutChar(strCurrentList, strCurrentChar, "������ ��������", strLeftNomerForm, 0, lngNYarus) + strOutputPrintCurrentFormula
    Print #1, " ' " + strHelp
    Print #1, "Debug.Print " + strAboutChar(strCurrentList, strCurrentChar, "������ ��������", strLeftNomerForm, 0, lngNYarus)
    Debug.Print strAboutChar(strCurrentList, strCurrentChar, "������ ��������", strLeftNomerForm, 0, lngNYarus) + strOutputPrintCurrentFormula
    Debug.Print " ' " + strHelp
    Debug.Print "Debug.Print " + strAboutChar(strCurrentList, strCurrentChar, "������ ��������", strLeftNomerForm, 0, lngNYarus)
    strKolvoAndSpisokFormulCharov = CStr(lngHowMuchForm) + "#" + strKolvoAndSpisokFormulCharov '������ � ���������� ������
End Function





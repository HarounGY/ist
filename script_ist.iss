
;script_ist.iss
;Create 2017 Tetian
#ifndef ISS_SCRIPT_IST
#define ISS_SCRIPT_IST


[Preprocessor]

;����utils
#ifndef ISS_SCRIPT_UTILS
#include "script_utils.iss"
#endif

;ist dll·�� �������inno��������λ
#ifndef IST_DLL_PATH
#define IST_DLL_PATH "compiler:..\ist\ist.dll"
#endif

;ist dll�ļ���
#ifndef IST_DLL_NAME
#define IST_DLL_NAME "ist.dll"
#endif

;Ƥ��·�� �������inno��������λ
#ifndef IST_SKIN_PATH
#define IST_SKIN_PATH "compiler:..\ist\ist.zip"
#endif

;Ƥ���ļ���
#ifndef IST_SKIN_NAME
#define IST_SKIN_NAME "ist.zip"
#endif

;������ ������Ϊж�ر�ʶ
#ifndef CMD_IST
#define CMD_IST "/IST"
#endif

;������Ϊ��̬ж�ر�ʶ
#ifndef CMD_IST_SLIENT
#define CMD_IST_SLIENT "/IST_SLIENT"
#endif

;���������
#ifndef IST_MB_TITLE
#define IST_MB_TITLE "��ʾ"
#endif

;ж����ԴĿ¼
#ifndef IST_UNINSTALL_DIR
#define IST_UNINSTALL_DIR "{app}\uninstall"
#endif

;���̼�鷽ʽ
#ifndef IST_PORCESS_CHECK_TYPE
#define IST_PORCESS_CHECK_TYPE 1
#endif

;���̼����
#ifndef IST_PROCESS_CHECK_EXE
#define IST_PROCESS_CHECK_EXE ""
#endif

;���̼�������
#ifndef IST_PROCESS_CHECK_IGNORE
#define IST_PROCESS_CHECK_IGNORE ""
#endif

;��װdll�ӿں�����ʶ
#ifndef IST_INSTALL_DLL_FLAGS
#define IST_INSTALL_DLL_FLAGS "stdcall setuponly delayload loadwithalteredsearchpath"
#endif

;ж��dll�ӿں�����ʶ
#ifndef IST_UNINSTALL_DLL_FLAGS
#define IST_UNINSTALL_DLL_FLAGS "stdcall uninstallonly delayload loadwithalteredsearchpath"
#endif

[Setup]
;��װ��Ĭ�ϰ�װ·��
DefaultDirName={code:ISTDestDir}
;ж��exe�����ض�Ŀ¼
UninstallFilesDir={#IST_UNINSTALL_DIR}

[Files]
;dll
Source:{#IST_DLL_PATH}; flags: dontcopy nocompression noencryption solidbreak 
Source:{#IST_DLL_PATH}; DestDir: {#IST_UNINSTALL_DIR};Flags:ignoreversion replacesameversion
;Ƥ��
Source:{#IST_SKIN_PATH}; flags: dontcopy nocompression noencryption solidbreak 
Source:{#IST_SKIN_PATH}; DestDir: {#IST_UNINSTALL_DIR};Flags:ignoreversion replacesameversion

[Icons]
;����ж�ؿ�ݷ�ʽ��group��app
Name: "{group}\ж��"; Filename: "{uninstallexe}";Comment:"ж�س���";Parameters:"{#CMD_IST} /VERYSILENT /SUPPRESSMSGBOXES /NORESTART"
Name: "{app}\ж��"; Filename: "{uninstallexe}";Comment:"ж�س���";Parameters:"{#CMD_IST} /VERYSILENT /SUPPRESSMSGBOXES /NORESTART"


[Code]
{------------------��װ����------------------}
//��װƤ����ʼ�� ʹ��DUILIB UILIB_ZIP��ʼƤ��
//is_type 1:��װ 2:ж��
//skin_dir Ƥ��·��
//skin_name Ƥ���ļ�
//���� true���óɹ�
function ISTInstallInit(is_type:Integer;skin_dir:String;skin_name:String):Boolean;
external 'ISTInstallInit@files:{#IST_DLL_NAME},{#IST_SKIN_NAME} {#IST_INSTALL_DLL_FLAGS}';

//���ó�ʼ���氲װ·��
//install_dir ·���ִ�
procedure ISTSetInstallDir(install_dir:String);
external 'ISTSetInstallDir@files:{#IST_DLL_NAME},{#IST_SKIN_NAME} {#IST_INSTALL_DLL_FLAGS}';

//�����Զ�������
//data �Զ�������
procedure ISTSetCustomData(data:String);
external 'ISTSetCustomData@files:{#IST_DLL_NAME},{#IST_SKIN_NAME} {#IST_INSTALL_DLL_FLAGS}';

//��ʾ��װ��������
procedure ISTShowShell();
external 'ISTShowShell@files:{#IST_DLL_NAME},{#IST_SKIN_NAME} {#IST_INSTALL_DLL_FLAGS}';

//�ȴ��û�ѡ���Ƿ�װ
//���� ��װʱ:-1����˹رհ�ť�˳� 1�����"��ʼ��װ""
//ж��ʱ: -1����˹ر� 3�����"��ʼж��"
function ISTWaitUserAction(): Integer;
external 'ISTWaitUserAction@files:{#IST_DLL_NAME},{#IST_SKIN_NAME} {#IST_INSTALL_DLL_FLAGS}';

//��ȡ��װ�û�ѡ���·��
//ret ����ָ��
//len ���ݳ���
procedure ISTGetInstallPath(ret:PChar;len:Integer);
external 'ISTGetInstallPath@files:{#IST_DLL_NAME},{#IST_SKIN_NAME} {#IST_INSTALL_DLL_FLAGS}';

//���õ�ǰ��װ�Ľ���
//now ��ǰ��װ�Ľ���ֵ
//max ��װ�������ֵ
//msg ��װ��Ϣ
procedure ISTSetProgress(now:Integer;max:Integer;msg:String);
external 'ISTSetProgress@files:{#IST_DLL_NAME},{#IST_SKIN_NAME} {#IST_INSTALL_DLL_FLAGS}';

//���ð�װ�ļ���Ϣ
//msg �ļ���Ϣ
procedure ISTSetFileName(msg:String);
external 'ISTSetFileName@files:{#IST_DLL_NAME},{#IST_SKIN_NAME} {#IST_INSTALL_DLL_FLAGS}';

//���ð�װ״̬��Ϣ
//msg ״̬��Ϣ
procedure ISTSetStatus(msg:String);
external 'ISTSetStatus@files:{#IST_DLL_NAME},{#IST_SKIN_NAME} {#IST_INSTALL_DLL_FLAGS}';

//�ȴ��û�������
//���� ��װʱ:-1����رհ�ť�˳� 2���"��������"
//ж��ʱ:-1����رհ�ť 4ж�ص��"ж�����"
function ISTWaitCompleted():Integer;
external 'ISTWaitCompleted@files:{#IST_DLL_NAME},{#IST_SKIN_NAME} {#IST_INSTALL_DLL_FLAGS}';

//��ʾģ̬��ʾ�� δ��ʼ��Ƥ��ʱ��ʹ��ϵͳMessageBox
//msg ��Ϣ
//caption ����
//type_ ���� 0:MB_OK ����:MB_OKCANCEL
//���� IDOK(1) IDCANCEL(2)
function ISTShowMessage(msg:String;caption:String;type_:Integer): Integer;
external 'ISTShowMessage@files:{#IST_DLL_NAME},{#IST_SKIN_NAME} {#IST_INSTALL_DLL_FLAGS}';

//�������Ƿ����,�������ó���kill
//type ��������
//0:�����̴���
//1:�������鴦��
//2:�ļ��д���,�����ļ���������exe�Ƿ����������еĽ���,��ͨ����ȡ���̵�����·������·���Ƚ�
//��: D:\dir\a.exe D:\dir\b.exe D:\dir\c.exe D:\a.exe ���еĽ�����a.exe b.exe�趨·��ΪD:\dir ��ֻ���dir�ļ��е�a.exe b.exe���д���
//3:�������������̴���,���̵Ĳ����Ƿ������ĳЩ�ض��ַ�
//��: apache�ж������ httpd.exe�޲����� ��������-d��·�� ��Ҫ�ر�-d�Ľ���
//4:���������������̴���,���̵Ĳ����������ض��ַ�

//param1 ����1 ����typeȷ��:
//type=0 ��������"a.exe"
//type=1 ��������"a.exe,b.exe"
//type=2 �ļ���·��
//type=3��4 ��������

//should_kill ���������Ƿ��Խ��� 1:���Խ��� 0:������

//param2 ����2 ����typeȷ��:
//type=0��1 ������
//type=2 ����Ŀ�� "ignore1.exe,ignore2.exe"
//type=3��4 �������򲻱�����������

//���� 0�����ڻ���ڱ�kill�� 1���� 2���ڵ�kill����:����should_kill���� 1:����0��2 0:����0��1
function ISTProcessExisted(type_:Integer;param1:String;should_kill:Integer;param2:String): Integer;
external 'ISTProcessExisted@files:{#IST_DLL_NAME},{#IST_SKIN_NAME} {#IST_INSTALL_DLL_FLAGS}';

//������̼��:ʹ���ļ���+�����鷽ʽ.
//�ļ����������:������ڸ��º���ܻ����µ����н���exe���밲װĿ¼ ж��ʱ���Զ��ų���ж�س���
//�������������:�������������ڰ�װĿ¼�еĹ������н���;�������ڰ�װ�����Ƶ��ϰ汾���н��� �ɺ��ļ��з�ʽЭͬ�ظ����
//��������������ظ�,���Խ���������趨������Ӱ�찲װ�����н��̼���
//type 1ѯ�ʷ�ʽ 2�Զ��ر� dir�����ļ���;ignore���Ե�exe��;exe_list������
procedure ISTSetProcessCheck(type_:Integer;const dir:String;const ignore:String;exe_list:String);
external 'ISTSetProcessCheck@files:{#IST_DLL_NAME},{#IST_SKIN_NAME} {#IST_INSTALL_DLL_FLAGS}';

{------------------ж�ض���------------------}
function ISTInstallInitU(is_type:Integer;tmp_dir:String;skin:String):Boolean;
external 'ISTInstallInit@{#IST_UNINSTALL_DIR}\{#IST_DLL_NAME} {#IST_UNINSTALL_DLL_FLAGS}';

procedure ISTSetCustomDataU(data:String);
external 'ISTSetCustomData@{#IST_UNINSTALL_DIR}\{#IST_DLL_NAME} {#IST_UNINSTALL_DLL_FLAGS}';

procedure ISTShowShellU();
external 'ISTShowShell@{#IST_UNINSTALL_DIR}\{#IST_DLL_NAME} {#IST_UNINSTALL_DLL_FLAGS}';

function ISTWaitUserActionU(): Integer;
external 'ISTWaitUserAction@{#IST_UNINSTALL_DIR}\{#IST_DLL_NAME} {#IST_UNINSTALL_DLL_FLAGS}';

function ISTWaitCompletedU():Integer;
external 'ISTWaitCompleted@{#IST_UNINSTALL_DIR}\{#IST_DLL_NAME} {#IST_UNINSTALL_DLL_FLAGS}';

function ISTShowMessageU(msg:String;caption:String;type_:Integer): Integer;
external 'ISTShowMessage@{#IST_UNINSTALL_DIR}\{#IST_DLL_NAME} {#IST_UNINSTALL_DLL_FLAGS}';

function ISTProcessExistedU(type_:Integer;param1:String;should_kill:Integer;param2:String): Integer;
external 'ISTProcessExisted@{#IST_UNINSTALL_DIR}\{#IST_DLL_NAME} {#IST_UNINSTALL_DLL_FLAGS}';

procedure ISTSetProcessCheckU(type_:Integer;const dir:String;const ignore:String;exe_list:String);
external 'ISTSetProcessCheck@{#IST_UNINSTALL_DIR}\{#IST_DLL_NAME} {#IST_UNINSTALL_DLL_FLAGS}';

{------------------ȫ�ֶ���------------------}
//ȫ�ֱ���
var
//��װ��Ŀ¼
ISTDestFolder:string;
//�Ƿ�ʹ��IST��װ
ISTUsed:Boolean;
//�Ƿ�ʹ��ISTж��
ISTUsedU:Boolean;
//��װ�Ƿ���ɳ�ʼ��
ISTInitialized:Boolean;
//ж���Ƿ���ɳ�ʼ��
ISTInitializedU:Boolean;
//APPGUID {}_is1
//���ڻ�ȡԭʼ��װ��Ϣ
ISTAppGuid:String;

//���ذ�װ·��
function ISTDestDir(SubDir:String):String;
begin
  if SubDir = '' then
    Result := ISTDestFolder
  else
    Result := ISTDestFolder + '\'+ SubDir;
end;

//����ж��·��+����
function ISTUninstallLink(tail:String):String;
var
TmpStr:String;
begin
    TmpStr:=' {#CMD_IST} /VERYSILENT /SUPPRESSMSGBOXES /NORESTART';
    if '' <> tail then begin
      TmpStr:=TmpStr+' '+tail;
    end;
    Result := ExpandConstant('"{uninstallexe}"' + TmpStr);
end;

//ͨ����Ϣ��ʾ����
//msg ��Ϣ
//itype_ ISSԭʼ TMsgBoxType = (mbInformation, mbConfirmation, mbError, mbCriticalError);
//MB_OKֻ��ȷ�� MB_YESNO MB_OKCANCEL
function ISTMsgBox(msg:String;itype_:TMsgBoxType;button:Integer):Integer;
var
tmpReuslt:Integer;
begin
  if ISTInitialized then begin
   tmpReuslt:= ISTShowMessage(msg,'{#IST_MB_TITLE}',button);
  end else if ISTInitializedU then begin
   tmpReuslt:= ISTShowMessageU(msg,'{#IST_MB_TITLE}',button);
  end else begin
    tmpReuslt:= MsgBox(msg,itype_, button);
  end;
  Result:=tmpReuslt;
end;

{------------------��װ------------------}

//�ͷ�dll
procedure ISTUnload();
begin
  UnloadDLL('{#IST_DLL_NAME}');
end;

//������̼���趨
procedure ISTSetProcessCheckBuild(appGuid:String;defInstallDir:String);
var
oriInstallDir,ignoreList,exeList:String;
begin
  oriInstallDir:=GetInstallDir(ISTAppGuid,defInstallDir);
  //��װʱ�����ų�ж��exe
  ignoreList:='{#IST_PROCESS_CHECK_IGNORE}';
  exeList:='{#IST_PROCESS_CHECK_EXE}';
  ISTSetProcessCheck({#IST_PORCESS_CHECK_TYPE},oriInstallDir,ignoreList,exeList);
end;

//��װ��ʼ��
//appGuid:IS��װ��ע���ID {--}_is1
//defInstallDir:Ĭ�ϰ�װ·��
//customData:�Զ������� ������ϵ���������
function ISTInitialize(appGuid:String;defInstallDir:String;customData:String):Boolean;
var
isContinue:Boolean;//�Ƿ����ִ��
installDir:PChar;//ѡ��İ�װ·��
TmpResult:Boolean;//���ؽ�� �����Ƿ����ִ�а�װ
begin
    //��ʼ��ȫ�ֱ���
    ISTUsed:=true;
    ISTUsedU:=false;
    ISTInitialized:=false;
    ISTInitializedU:=false;
    ISTAppGuid:=appGuid;

    isContinue:=true;
    TmpResult:=true;

    //��̬��װ������IST CheckIsSilent��utils�й���
    isContinue:= not CheckIsSilent;

    if isContinue then begin
      Log('�Ǿ�̬��װ,��ʼ��Ƥ��');
      isContinue:=ISTInstallInit(1,ExpandConstant('{tmp}'),'{#IST_SKIN_NAME}');
      if not isContinue then begin
         ISTShowMessage('��ʼ������','{#IST_MB_TITLE}',0);
         TmpResult:=false;
         Log('��ʼ���������,ȡ����װ');
      end;
    end;

    //��ʾ����
    if isContinue then begin
      //����ԭʼ��װ·�� GetInstallDir��utils�к���
      ISTSetInstallDir(GetInstallDir(appGuid,defInstallDir));
      Log('�趨�Զ�������:'+customData);
      ISTSetCustomData(customData);
      //������̼���趨
      ISTSetProcessCheckBuild(appGuid,defInstallDir);
      //��ʾ��װ����
      ISTShowShell;
    end;

    //�ȴ��û�����
    if isContinue then begin
      //��ȡ�û����� -1Ϊ�ر�
      isContinue:=-1<>ISTWaitUserAction;
      if not isContinue then begin
        //ȡ����װ
        TmpResult:=false;
      end;
    end;

    //��ȡ���ð�װ·��
    if isContinue then begin
      Setlength(installDir,1024);
      //��ȡ��װ·�� ��ȡʧ��Ϊ��
      ISTGetInstallPath(installDir,1024);
      //���û�ȡ�İ�װ·��
      ISTDestFolder:=installDir;
      //Ϊ��ֹͣ��װ
      isContinue:= ''<>ISTDestFolder;
      if not isContinue then begin
        ISTShowMessage('��ʼ������:��װ�趨��·����ȡ����','{#IST_MB_TITLE}',0);
        //ȡ����װ
        TmpResult:=false;
      end;
    end;

    //���ó�ʼ�����
    ISTInitialized:=isContinue;
    //��ʼ��ʧ�����ͷ�DLL
    if not ISTInitialized then begin
      ISTUnload;
    end;

    Result:=TmpResult;
end;

//��װ�����ʼ������
procedure ISTSetWizard();
begin
  if ISTInitialized then begin
    //����������
    WizardForm.BorderStyle:=bsNone;
    WizardForm.ClientWidth := ScaleX(0);
    WizardForm.ClientHeight := ScaleY(0);
  end;
end;

//��װҳ��仯����
procedure ISTSetPageChanged(CurPageID: Integer);
begin
   if ISTInitialized then begin
      //���ڳߴ��Ϊ0
      WizardForm.ClientWidth := ScaleX(0);
      WizardForm.ClientHeight := ScaleY(0);
      //��ӭ�Զ������һ��
      if CurPageID = wpWelcome then
        WizardForm.NextButton.OnClick(WizardForm);
      //��װʱ��������
      if CurPageID >= wpInstalling then
        WizardForm.Visible:=false
      else
        WizardForm.Visible:=true;
    end;
end;

//��������
procedure ISTSetProgressChanged(CurProgress, MaxProgress: Integer);
begin
  if ISTInitialized then begin
    //���ý�����
    ISTSetProgress(CurProgress,MaxProgress,'');
    //���ð�װ�ļ���Ϣ
    ISTSetFileName(WizardForm.FilenameLabel.Caption);
    //����״̬��Ϣ
    ISTSetStatus(WizardForm.StatusLabel.Caption);
  end;
end;

//�������
//���� ��װ:-1:����رհ�ť�˳� 2:��װ���"��������"
function ISTSetStepChanged(CurStep: TSetupStep):Integer;
//uninspath,uninsexe,newUninsFile,newUninsDatFile: string;
begin
  Result:=0;
  if CurStep=ssPostInstall then begin
    //�趨�µ�ж�س����� +�޸���ע��� ����Ҫ����ж�س���
    //ж��·��
    //uninspath:= ExtractFilePath(ExpandConstant('{uninstallexe}'));
    //ж��exe��
    //uninsexe:=ExtractFileName(ExpandConstant('{uninstallexe}'));
    //��ж��exe����·��
    //newUninsFile:= uninspath + '{#IST_UNINSTALL_EXE}';
    //��ж��dat����·��
    //newUninsDatFile:= uninspath + ISTChangeFileExt('{#IST_UNINSTALL_EXE}','dat');

    //ɾ��ԭ����ж���ļ�
    //if FileExists(newUninsFile) then begin
    //  DeleteFile(newUninsFile);
    //end;
    //if FileExists(newUninsDatFile) then begin
    //  DeleteFile(newUninsDatFile);
    //end;

    //��������ж���ļ�
    //RenameFile(ExpandConstant('{uninstallexe}'), newUninsFile);
    //RenameFile(uninspath + ISTChangeFileExt(uninsexe,'dat'), newUninsDatFile);

    //���ð�װע����Ϣ
    //����ж���ִ�
    SetInstallInfo(ISTAppGuid,'UninstallString',ISTUninstallLink(''));
    //�趨��̬ж���ִ�
    SetInstallInfo(ISTAppGuid,'QuietUninstallString',ISTUninstallLink('{#CMD_IST_SLIENT}'));
    //�ȴ��û�������
    if ISTInitialized then begin
      //��װ�ȴ�����
      Result:=ISTWaitCompleted;
    end;
  end;
 end;

//�ȴ�������Ϣ����
procedure ISTSetTaskStatus(msg:String;progressStyle:TNewProgressBarStyle);
begin
  if ISTInitialized then begin
    //����״̬��Ϣ
    ISTSetStatus(msg);
  end else begin
    //����INNOԭ��״̬��Ϣ
    SetTaskStatus(msg,progressStyle);
  end;
end;



{------------------ж��------------------}
//�ͷ�dll
procedure ISTUnloadU();
begin
  UnloadDLL(ExpandConstant('{#IST_UNINSTALL_DIR}\{#IST_DLL_NAME}'));
end;

//��������ִ�
function ISTBuildIgnoreExeListU(oriList:String):String;
var
TmpResult:String;
begin
  if ''=oriList then begin
    //'' -> {#IST_UNINSTALL_EXE}
    //TmpResult:='{#IST_UNINSTALL_EXE}';
    TmpResult:=ExtractFileName(ExpandConstant('{uninstallexe}'));
  end else begin
    //a.exe -> a.exe,{#IST_UNINSTALL_EXE} �� a.exe,b.exe -> a.exe,b.exe,{#IST_UNINSTALL_EXE}
    //TmpResult:=oriList+','+'{#IST_UNINSTALL_EXE}';
    TmpResult:=oriList+','+ExtractFileName(ExpandConstant('{uninstallexe}'));
  end;
  Result:=TmpResult;
end;

//������̼���趨 �ų�����ж�س���ļ��
procedure ISTSetProcessCheckBuildU();
begin
  ISTSetProcessCheckU({#IST_PORCESS_CHECK_TYPE},ExpandConstant('{app}'),ISTBuildIgnoreExeListU('{#IST_PROCESS_CHECK_IGNORE}'),'{#IST_PROCESS_CHECK_EXE}');
end;

//ж�س�ʼ
function ISTInitializeU(customData:String):Boolean;
var
isContinue:Boolean;//�Ƿ����ִ��
TmpResult:Boolean;//���ؽ�� �����Ƿ����ִ��ж��
begin
    //��ʼ��ȫ�ֱ���
    ISTUsed:=false;
    ISTUsedU:=true;
    ISTInitialized:=false;
    ISTInitializedU:=false;

    isContinue:=true;
    TmpResult:=true;

    if CheckContainCmd('{#CMD_IST_SLIENT}') and CheckIsSilent then begin
      //����{#CMD_IST_SHELL} �;�̬ģʽ ��Ϊ'��'��̬ж��
      isContinue:=false;
    end else if CheckContainCmd('{#CMD_IST}') and CheckIsSilent then begin
      //����{#CMD_SHELL}�;�̬ģʽ��ΪISTж��
      isContinue:=true;
    end else begin
      //��������̬ģʽ����ΪIS�Դ�ж�ؽ���
      isContinue:=false;
    end;

    //��ʼ��Ƥ��
    if isContinue then begin
      isContinue:=ISTInstallInitU(2,ExpandConstant('{#IST_UNINSTALL_DIR}'),'{#IST_SKIN_NAME}');
      if not isContinue then begin
        ISTShowMessageU('��ʼ������','{#IST_MB_TITLE}',0);
        //ȡ��ж��
        TmpResult:=false;
      end;
    end;

    //��ʾж�ؽ���
    if isContinue then begin
      //�����Զ�������
      ISTSetCustomDataU(customData);
      //������̼���趨
      ISTSetProcessCheckBuildU;
      //ж�ؽ�����ʾ
      ISTShowShellU;
    end;

    //�ȴ��û�����
    if isContinue then begin
      //��ȡ�û����� -1Ϊ�ر�
      isContinue:=-1<>ISTWaitUserActionU;
      if not isContinue then begin
        //ȡ��ж��
        TmpResult:=false;
      end;
    end;

    //����ж�س�ʼ�����
    ISTInitializedU:=isContinue;
    //��ʼ��ʧ���ͷ�DLL
    if not ISTInitializedU then begin
      ISTUnloadU;
    end;

    Result:=TmpResult;
end;

//ж�ز������
//���� ��װ:-1:����رհ�ť�˳� 4ж�ص��"ж�����"
function ISTSetStepChangedU(CurUninstallStep: TUninstallStep):Integer;
begin
  Result:=0;
  if CurUninstallStep=usPostUninstall then begin
    //�ȴ��û�������
    if ISTInitializedU then begin
      //ж�صȴ�����
      Result:=ISTWaitCompletedU;
    end;
  end;
end;

//�˳�ж�ز���
procedure SetDeinitializeU();
begin
  if ISTInitializedU then begin
    //�ȴ�1��,��Դ�ͷ���ϲ��ͷ�dll ISTWaitCompleted ��������ͷű�ʶ dll0.1����"�ͷ��Լ�"
    //������ͷ����޷���ȫɾ����װĿ¼
    Sleep(1000);
    //ISTUnloadU; //�����ͷ�
    DeleteFile(ExpandConstant('{#IST_UNINSTALL_DIR}\{#IST_DLL_NAME}'));
    DelTree(ExpandConstant('{app}'), True, True, True);
  end;
end;


[/Code]

#endif // ISS_SCRIPT_IST
;����ist ���������λ��
#include "compiler:..\ist\script_ist.iss"

;��װ��ΨһID
;32λ����ע��� HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\{#APP_GUID}_is1 64λû��WOW6432Node
;֮�����õļ�ֵ
;QuietUninstallString ��Ĭж���ִ� "{#INSTALL_DIR}\unins000.exe" /SILENT
;UninstallString ж���ִ� "{#INSTALL_DIR}\unins000.exe"
;InstallLocation ��װ·�� "{#INSTALL_DIR}"
;DisplayName ��ʾ��
;DisplayVersion ��ʾ�汾
;InstallDate ��װ���� yyyymmdd
#define APP_GUID "6C38DB0D-ABDE-40F6-8ADF-B7174E601C12"
;Ӧ�ð汾 �����ð�װ���汾
#define APP_VERSION "0.0.17.826"
;��װӦ����
#define APP_NAME "My Program"
;Ӧ��Ӣ����
#define APP_ENAME "My Program"
;Ĭ�ϵİ�װĿ¼
;��;���Ļ������β��Ŀ¼����Ϊ��װĿ¼,�� C:\Program Files (x86)\APP -> D:\APP
#define INSTALL_DIR "D:\My Program"
;Ĭ�Ͽ�ʼ�˵�����
#define GROUP_NAME "My Program"
;������
#define APP_PUBLISHER "anoah"
;��װ�����Ŀ¼
#define OUT_IDR "userdocs:Inno Setup Examples Output"
;EXE����
#define APP_EXE "MyProg.exe"

[Setup]
AppId={{{#APP_GUID}}
;Ӧ����
AppName={#APP_NAME}
;Ӧ�ð汾
AppVersion={#APP_VERSION}
;��װ���汾
VersionInfoVersion={#APP_VERSION}
;Ĭ�Ͽ�ʼ�˵�����
DefaultGroupName={#GROUP_NAME}
;������
AppPublisher={#APP_PUBLISHER}
;ж��ͼ��
UninstallDisplayIcon={app}\{#APP_EXE}
;ѹ����ʽ
Compression=lzma2
;��ʵѹ��������,��װ���ϴ�ʱ(����100MB),����Ϊno
SolidCompression=yes
;���ù���ԱȨ�� poweruser, admin, or lowest
PrivilegesRequired=lowest
;���ɰ�װ�����Ŀ¼
OutputDir={#OUT_IDR}
;����ļ���
OutputBaseFilename={#APP_ENAME}_{#APP_VERSION}

[Files]
Source: compiler:Examples\MyProg.exe; DestDir: {app};AfterInstall:InstallFramework;Flags: ignoreversion replacesameversion
Source: compiler:Examples\MyProg.chm; DestDir: {app};Flags: ignoreversion replacesameversion
Source: compiler:Examples\Readme.txt; DestDir: {app};Flags: ignoreversion replacesameversion


[Icons]
Name: "{group}\{#APP_NAME}"; Filename: {app}\{#APP_EXE}


[UninstallDelete]
Name: {app};Type:filesandordirs

[Code]

{------------------��װ------------------}

//��װ��ʼ������
function InitializeSetup(): Boolean;
var
isContinue:Boolean;//�Ƿ����ִ��
begin
    isContinue:=true;
    //��ʼ��Ƥ��
    if not ISTInitialize('{'+'{#APP_GUID}'+'}_is1','{#INSTALL_DIR}','{#APP_NAME}'+' {#APP_VERSION}') then begin
      isContinue:=false;
    end;
    Result:=isContinue;
end;

procedure InitializeWizard();
begin
  ISTSetWizard;//��ʼ���洦��,����WizardForm
end;


function ShouldSkipPage(PageID: Integer): Boolean;
begin
  Result := ISTInitialized;//����ʾһЩ�ض���װ����
end;

procedure CurPageChanged(CurPageID: Integer);
begin
   ISTSetPageChanged(CurPageID);//�ı�ҳ��ʱ���ؽ��洰��
end;

procedure CurInstallProgressChanged(CurProgress, MaxProgress: Integer);
begin
  //���ȿ���
  ISTSetProgressChanged(CurProgress,MaxProgress);
end;

procedure CurStepChanged(CurStep: TSetupStep);
var
tmpRet:Integer;
begin
   tmpRet:=ISTSetStepChanged(CurStep);
   if -1=tmpRet then begin
      MsgBox('����ر�',mbInformation, MB_OK);
   end else if 2=tmpRet then begin
      MsgBox('�����������',mbInformation, MB_OK);
   end;
end;

{------------------ж��------------------}

function InitializeUninstall (): Boolean;
var
isContinue:Boolean;//�Ƿ����ִ��
begin
    isContinue:=true;

    isContinue:=ISTInitializeU('{#APP_NAME}'+' {#APP_VERSION}');//��ʼ������

    Result:=isContinue;
end;

procedure CurUninstallStepChanged(CurUninstallStep: TUninstallStep);
var
tmpRet:Integer;
begin
  tmpRet:=ISTSetStepChangedU(CurUninstallStep);
  if -1=tmpRet then begin
      MsgBox('����ر�',mbInformation, MB_OK);
  end else if 4=tmpRet then begin
      MsgBox('���ж�����',mbInformation, MB_OK);
  end;
end;

procedure DeinitializeUninstall();
begin
  SetDeinitializeU;
end;


{------------------����------------------}

//��ʱ��������
procedure InstallFramework;
var
  //ResultCode: Integer;
  StatusText: String;
begin
    StatusText := WizardForm.StatusLabel.Caption;
    ISTSetTaskStatus('���ڰ�װ .NET Framework',npbstMarquee);
    Sleep(3000);
    ISTSetTaskStatus('���ڰ�װ VC++ Runtime',npbstMarquee);
    Sleep(3000);
    ISTSetTaskStatus(StatusText,npbstNormal);
  //һ��ʹ�õ����ð���
  //StatusText := WizardForm.StatusLabel.Caption;
  //WizardForm.StatusLabel.Caption := '���ڰ�װ .NET Framework ���Ե�...';
  //WizardForm.ProgressGauge.Style := npbstMarquee;
  //try
  //  if not IsDotNetDetected('v4\Full',0) then
  //  begin
  //    if not Exec(ExpandConstant('{#BACKUP_DIR}\dotNetFx40_Full_x86_x64.exe'), '/q /norestart', '', SW_SHOW, ewWaitUntilTerminated, ResultCode) then
  //    begin
  //      MsgBox('.NET Framework4��װ����,Code:' + IntToStr(ResultCode) + ',�����Ժ��ڰ�װĿ¼,backup�ļ��н����ֶ���װ.',
  //        mbError, MB_OK);
  //    end;
  //  end;
  //finally
  //  WizardForm.StatusLabel.Caption := StatusText;
  //  WizardForm.ProgressGauge.Style := npbstNormal;
  //end;
end;
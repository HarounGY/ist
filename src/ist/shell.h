#pragma once

#include <string>
namespace shell {
    //��ʼ��
    bool InitShell(int is_type, const std::wstring& tmp_dir, const std::wstring& skin_name);

    //����·��
    void SetInstallDir(const std::wstring& install_dir);

    //�����Զ�������
    void SetCustomData(const std::wstring& data);

    //�ȴ�����
    int WaitAction();

    //���ý���
    void SetProgress(int now, int max, const std::wstring& msg);

    //���ð�װ�ļ���
    void SetFileName(const std::wstring& msg);

    //����״̬
    void SetStatus(const std::wstring& msg);

    //������ɲ��ȴ�����
    int ChangeCompleteAndWait();

    //��ȡ��װ·��
    std::wstring GetInstallPath();

    //�趨
    int ShowMessage(const std::wstring& msg, const std::wstring& caption, int type);

    //�趨���̼�鷽ʽ
    void SetProcessCheck(int pc_type, const std::wstring& dir, const std::wstring& ignore, const std::wstring& exe_list);

    //IS����
    int GetISType();

    //DLL���ر�ʶ
    bool DllLoading();

    //��ȫ�ͷ�
    void AllDetach();
    
    //��ʾ����
    void ShowWin();
}
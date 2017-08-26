#pragma once
#include <Windows.h>
#include <string>
#include <sstream>

namespace util {
    //��ȡʵ�����
	HMODULE GetModuleFromAddr(PVOID p = NULL);

	//�����ö�����
	void TopMost(bool is_top, HWND hwnd);

	//��ȡ���̴��ھ��
	HWND GetProcessHwnd(DWORD pid);

	//�ļ��Ƿ����
	bool FileExsit(const std::wstring& file);

	//�ļ����Ƿ����
	bool DirExsit(const std::wstring& dir);

	//תΪ�����ʺ�����
	template <class T>
	std::wstring ToStdWString(T data) {
		std::wstringstream wstream;
		wstream << data;
		std::wstring result(wstream.str());
		return result;
	}

	//���ص�ǰ���̴���
	bool HideThisProcessWindow();

	//��ȡ·��ĩβ�ļ���
	std::wstring GetPathFileName(const std::wstring& path);

    //���������
	int ProcessExisted(const std::wstring& pro_name, int should_kill);

    //����������
	int ProcessExistedList(const std::wstring& pro_name_s, int should_kill);

    //�����ļ���·�����
	int ProcessExistedDir(const std::wstring& dir, int should_kill, const std::wstring& p_ignore_s);

    //������+���������м��
	int ProcessExistedByCL(const std::wstring& pro_name, int should_kill,const std::wstring cl);

    //������+�������м��
    //��appche web�������� ����� �������ض������в�����Ϊ������
	int ProcessExistedNoCL(const std::wstring& pro_name, int should_kill, const std::wstring cl);

    //���̼�������
	int ProcessExisted(int type, const std::wstring& param1, int should_kill, const std::wstring& param2);

    //��֤·������
    bool IsValidDisk(const std::wstring& path);

    //��ȡ %APPDATA%\..\Local
    std::wstring GetLocalAppDataPath();

    //�ж��Ƿ���XPϵͳ
    bool IsWinXP();

    //�Ƿ���XPSP3����ϵͳ
    bool IsWinXPSP3orGreater();
}

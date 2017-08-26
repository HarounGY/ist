#pragma once
#include "const.h"
//��װ�����ʼ�� ʹ��DUILIB UILIB_ZIP��ʼƤ��
//is_type 1:��װ 2:ж��
//skin_dir Ƥ��·��
//skin_name Ƥ���ļ�
//���� true���óɹ�
DLL_EXPORT bool __stdcall ISTInstallInit(int is_type, const wchar_t* skin_dir, const wchar_t* skin_name);

//���ó�ʼ���氲װ·��
//install_dir ·���ִ�
DLL_EXPORT void __stdcall ISTSetInstallDir(wchar_t* install_dir);

//�����Զ�������
//data �Զ�������
DLL_EXPORT void __stdcall ISTSetCustomData(const wchar_t* data);

//�����Զ�������
//data �Զ�������
DLL_EXPORT void __stdcall ISTShowShell();

//�ȴ��û�ѡ���Ƿ�װ
//���� ��װʱ:-1����˹رհ�ť�˳� 1�����"��ʼ��װ""
//ж��ʱ: -1����˹ر� 3�����"��ʼж��"
DLL_EXPORT int __stdcall ISTWaitUserAction();

//��ȡ��װ�û�ѡ���·��
//ret ����ָ��
//len ���ݳ���
DLL_EXPORT void __stdcall ISTGetInstallPath(const wchar_t* ret, int len);

//���õ�ǰ��װ�Ľ���
//now ��ǰ��װ�Ľ���ֵ
//max ��װ�������ֵ
//msg ��Ϣ
DLL_EXPORT void __stdcall ISTSetProgress(int now, int max, const wchar_t* msg);

//���ð�װ�ļ���Ϣ
//msg �ļ���Ϣ
DLL_EXPORT void __stdcall ISTSetFileName(const wchar_t* msg);

//���ð�װ״̬��Ϣ
//msg ״̬��Ϣ
DLL_EXPORT void __stdcall ISTSetStatus(const wchar_t* msg);

//�ȴ��û�������
//���� ��װʱ:-1����رհ�ť�˳� 2���"��������"
//ж��ʱ:-1����رհ�ť 4ж�ص��"ж�����"
DLL_EXPORT int __stdcall ISTWaitCompleted();

//��ʾģ̬��ʾ�� δ��ʼ��Ƥ��ʱʹ��ϵͳMessageBox
//msg ��Ϣ
//caption ����
//type ���� 0:MB_OK ����:MB_OKCANCEL
//���� IDOK(1) IDCANCEL(2)
DLL_EXPORT int __stdcall ISTShowMessage(const wchar_t* msg, const wchar_t* caption, int type);

//----------------------���������ӿ�----------------------

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
DLL_EXPORT int __stdcall ISTProcessExisted(int type, const wchar_t* param1, int should_kill, const wchar_t* param2);

//������̼��:ʹ���ļ���+�����鷽ʽ.
//�ļ����������:������ڸ��º���ܻ����µ����н���exe���밲װĿ¼ ���Զ��ų���ж�س���{#IST_UNINSTALL_EXE}
//�������������:�������������ڰ�װĿ¼�еĹ������н���;�������ڰ�װ�����Ƶ��ϰ汾���н��� �ɺ��ļ��з�ʽЭͬ�ظ����
//��������������ظ�,���Խ���������趨������Ӱ�찲װ�����н��̼���
//type 1ѯ�ʷ�ʽ 2�Զ��ر� dir�����ļ���;ignore���Ե�exe��;exe_list������
DLL_EXPORT void __stdcall ISTSetProcessCheck(int type, const wchar_t* dir, const wchar_t* ignore, wchar_t* exe_list);

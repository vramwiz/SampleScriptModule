unit AviUtl2Module;

interface

uses
  Windows;

type
  LPCSTR  = PAnsiChar;
  LPCWSTR = PWideChar;

  // �|�C���^�z��p�^�iC�� LPCSTR* �ɑΉ��j
  PLPCSTR = ^LPCSTR;
  PLPCWSTR = ^LPCWSTR;
  PDouble = ^Double;
  PInteger = ^Integer;

  // �X�N���v�g���W���[�������\����
  PSCRIPT_MODULE_PARAM = ^TSCRIPT_MODULE_PARAM;
  TSCRIPT_MODULE_PARAM = packed record
    // �����̎擾�n
    get_param_num: function(): Integer; cdecl;
    get_param_int: function(index: Integer): Integer; cdecl;
    get_param_double: function(index: Integer): Double; cdecl;
    get_param_string: function(index: Integer): LPCSTR; cdecl;
    get_param_data: function(index: Integer): Pointer; cdecl;

    // �A�z�z��擾�n
    get_param_table_int: function(index: Integer; key: LPCSTR): Integer; cdecl;
    get_param_table_double: function(index: Integer; key: LPCSTR): Double; cdecl;
    get_param_table_string: function(index: Integer; key: LPCSTR): LPCSTR; cdecl;

    // �z��擾�n
    get_param_array_num: function(index: Integer): Integer; cdecl;
    get_param_array_int: function(index, key: Integer): Integer; cdecl;
    get_param_array_double: function(index, key: Integer): Double; cdecl;
    get_param_array_string: function(index, key: Integer): LPCSTR; cdecl;

    // �߂�l�ǉ��n
    push_result_int: procedure(value: Integer); cdecl;
    push_result_double: procedure(value: Double); cdecl;
    push_result_string: procedure(value: LPCSTR); cdecl;
    push_result_data: procedure(value: Pointer); cdecl;

    // �A�z�z��߂�l
    push_result_table_int: procedure(key: PLPCSTR; value: PInteger; num: Integer); cdecl;
    push_result_table_double: procedure(key: PLPCSTR; value: PDouble; num: Integer); cdecl;
    push_result_table_string: procedure(key: PLPCSTR; value: PLPCSTR; num: Integer); cdecl;

    // �z��߂�l
    push_result_array_int: procedure(value: PInteger; num: Integer); cdecl;
    push_result_array_double: procedure(value: PDouble; num: Integer); cdecl;
    push_result_array_string: procedure(value: PLPCSTR; num: Integer); cdecl;

    // �G���[�ݒ�
    set_error: procedure(message: LPCSTR); cdecl;
  end;

  // ���W���[���֐���`�\����
  TSCRIPT_MODULE_FUNCTION = packed record
    name: LPCWSTR;
    func: procedure(param: PSCRIPT_MODULE_PARAM); cdecl;
  end;
  PSCRIPT_MODULE_FUNCTION = ^TSCRIPT_MODULE_FUNCTION;

  // ���W���[�����\����
  TSCRIPT_MODULE_TABLE = packed record
    information: LPCWSTR;
    functions: PSCRIPT_MODULE_FUNCTION;
  end;
  PSCRIPT_MODULE_TABLE = ^TSCRIPT_MODULE_TABLE;

implementation

end.


unit AviUtl2Module;

interface

uses
  Windows;

type
  LPCSTR  = PAnsiChar;
  LPCWSTR = PWideChar;

  // ポインタ配列用型（Cの LPCSTR* に対応）
  PLPCSTR = ^LPCSTR;
  PLPCWSTR = ^LPCWSTR;
  PDouble = ^Double;
  PInteger = ^Integer;

  // スクリプトモジュール引数構造体
  PSCRIPT_MODULE_PARAM = ^TSCRIPT_MODULE_PARAM;
  TSCRIPT_MODULE_PARAM = packed record
    // 引数の取得系
    get_param_num: function(): Integer; cdecl;
    get_param_int: function(index: Integer): Integer; cdecl;
    get_param_double: function(index: Integer): Double; cdecl;
    get_param_string: function(index: Integer): LPCSTR; cdecl;
    get_param_data: function(index: Integer): Pointer; cdecl;

    // 連想配列取得系
    get_param_table_int: function(index: Integer; key: LPCSTR): Integer; cdecl;
    get_param_table_double: function(index: Integer; key: LPCSTR): Double; cdecl;
    get_param_table_string: function(index: Integer; key: LPCSTR): LPCSTR; cdecl;

    // 配列取得系
    get_param_array_num: function(index: Integer): Integer; cdecl;
    get_param_array_int: function(index, key: Integer): Integer; cdecl;
    get_param_array_double: function(index, key: Integer): Double; cdecl;
    get_param_array_string: function(index, key: Integer): LPCSTR; cdecl;

    // 戻り値追加系
    push_result_int: procedure(value: Integer); cdecl;
    push_result_double: procedure(value: Double); cdecl;
    push_result_string: procedure(value: LPCSTR); cdecl;
    push_result_data: procedure(value: Pointer); cdecl;

    // 連想配列戻り値
    push_result_table_int: procedure(key: PLPCSTR; value: PInteger; num: Integer); cdecl;
    push_result_table_double: procedure(key: PLPCSTR; value: PDouble; num: Integer); cdecl;
    push_result_table_string: procedure(key: PLPCSTR; value: PLPCSTR; num: Integer); cdecl;

    // 配列戻り値
    push_result_array_int: procedure(value: PInteger; num: Integer); cdecl;
    push_result_array_double: procedure(value: PDouble; num: Integer); cdecl;
    push_result_array_string: procedure(value: PLPCSTR; num: Integer); cdecl;

    // エラー設定
    set_error: procedure(message: LPCSTR); cdecl;
  end;

  // モジュール関数定義構造体
  TSCRIPT_MODULE_FUNCTION = packed record
    name: LPCWSTR;
    func: procedure(param: PSCRIPT_MODULE_PARAM); cdecl;
  end;
  PSCRIPT_MODULE_FUNCTION = ^TSCRIPT_MODULE_FUNCTION;

  // モジュール情報構造体
  TSCRIPT_MODULE_TABLE = packed record
    information: LPCWSTR;
    functions: PSCRIPT_MODULE_FUNCTION;
  end;
  PSCRIPT_MODULE_TABLE = ^TSCRIPT_MODULE_TABLE;

implementation

end.


library SampleScriptModule;

uses
  Windows;

type
  LPCSTR  = PAnsiChar;
  LPCWSTR = PWideChar;
  PLPCSTR = ^LPCSTR;
  PDouble = ^Double;
  PInteger = ^Integer;

  PSCRIPT_MODULE_PARAM = ^TSCRIPT_MODULE_PARAM;
  TSCRIPT_MODULE_PARAM = packed record
    get_param_num: function(): Integer; cdecl;
    get_param_int: function(index: Integer): Integer; cdecl;
    get_param_double: function(index: Integer): Double; cdecl;
    get_param_string: function(index: Integer): LPCSTR; cdecl;
    get_param_data: function(index: Integer): Pointer; cdecl;

    get_param_table_int: function(index: Integer; key: LPCSTR): Integer; cdecl;
    get_param_table_double: function(index: Integer; key: LPCSTR): Double; cdecl;
    get_param_table_string: function(index: Integer; key: LPCSTR): LPCSTR; cdecl;

    get_param_array_num: function(index: Integer): Integer; cdecl;
    get_param_array_int: function(index, key: Integer): Integer; cdecl;
    get_param_array_double: function(index, key: Integer): Double; cdecl;
    get_param_array_string: function(index, key: Integer): LPCSTR; cdecl;

    push_result_int: procedure(value: Integer); cdecl;
    push_result_double: procedure(value: Double); cdecl;
    push_result_string: procedure(value: LPCSTR); cdecl;
    push_result_data: procedure(value: Pointer); cdecl;

    push_result_table_int: procedure(key: PLPCSTR; value: PInteger; num: Integer); cdecl;
    push_result_table_double: procedure(key: PLPCSTR; value: PDouble; num: Integer); cdecl;
    push_result_table_string: procedure(key: PLPCSTR; value: PLPCSTR; num: Integer); cdecl;

    push_result_array_int: procedure(value: PInteger; num: Integer); cdecl;
    push_result_array_double: procedure(value: PDouble; num: Integer); cdecl;
    push_result_array_string: procedure(value: PLPCSTR; num: Integer); cdecl;

    set_error: procedure(message: LPCSTR); cdecl;
  end;

  TSCRIPT_MODULE_FUNCTION = packed record
    name: LPCWSTR;
    func: procedure(param: PSCRIPT_MODULE_PARAM); cdecl;
  end;
  PSCRIPT_MODULE_FUNCTION = ^TSCRIPT_MODULE_FUNCTION;

  TSCRIPT_MODULE_TABLE = packed record
    information: LPCWSTR;
    functions: PSCRIPT_MODULE_FUNCTION;
  end;
  PSCRIPT_MODULE_TABLE = ^TSCRIPT_MODULE_TABLE;

// --- ここが重要：cdecl に統一 ---
function InitializePlugin(version: DWORD): BOOL; cdecl;
begin
  OutputDebugString('InitializePlugin(cdecl)');
  Result := True;
end;

procedure UninitializePlugin; cdecl;
begin
end;

procedure sum(param: PSCRIPT_MODULE_PARAM); cdecl;
var
  total: Double;
  i, count: Integer;
begin
  // 引数の数を取得
  count := param^.get_param_num();
  total := 0;

  // 各引数を合計
  for i := 0 to count - 1 do
    total := total + param^.get_param_double(i);

  // 合計値を戻す
  param^.push_result_double(total);
end;

var
  functions: array[0..1] of TSCRIPT_MODULE_FUNCTION = (
    (name: 'sum'; func: sum),
    (name: nil;  func: nil)
  );

  script_module_table: TSCRIPT_MODULE_TABLE = (
    information: 'Sample ScriptModule version 2.00 by Delphi';
    functions: @functions[0]
  );

function GetScriptModuleTable: PSCRIPT_MODULE_TABLE; cdecl;
begin
  OutputDebugString('GetScriptModuleTable(cdecl)');
  Result := @script_module_table;
end;

exports
  InitializePlugin name 'InitializePlugin',
  UninitializePlugin name 'UninitializePlugin',
  GetScriptModuleTable name 'GetScriptModuleTable';

begin
end.


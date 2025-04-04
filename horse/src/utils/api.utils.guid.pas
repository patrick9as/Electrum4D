unit api.utils.guid;

interface

uses
  SysUtils;

type
  TGuidUtils = class
    class function GuidToString(AGuid: TGuid): string;
  end;

implementation

{ TGuidUtils }

class function TGuidUtils.GuidToString(AGuid: TGuid): string;
begin
  Result := StringReplace(AGuid.ToString(), '{', '', [rfReplaceAll]);
  Result := StringReplace(Result, '}', '', [rfReplaceAll]);
end;

end.

unit api.controller.contract;

interface

uses
  Horse, Horse.Core;

type
  IController = interface
    function New(): IController;
    function Get(): THorseCore;
    function Post(): THorseCore;
    function Put(): THorseCore;
    function RegisterMethods(): Boolean;
  end;

implementation

end.

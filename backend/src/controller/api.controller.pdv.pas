unit api.controller.pdv;

interface

uses
  Horse,
  Vcl.Dialogs, api.utils.windows, api.view.pdv;

procedure PdvController(prefix: string);

implementation

procedure PdvController(prefix: string);
begin
  THorse.Get(prefix + '/pdv/open',
    procedure(req: THorseRequest; res: THorseResponse)
    var
      pdv: TPdvView;
    begin
      Res.Status(200).Send('Abrindo o PDV...');
      BringToFront();
      pdv := TPdvView.Create(nil);
      try
        pdv.ShowModal();
      finally
        pdv.Free();
      end;
    end)
end;

end.

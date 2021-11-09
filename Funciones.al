codeunit 50100 Funciones
{
    trigger OnRun()
    begin

    end;

    procedure CalcPrecioAutor(pAutor: Text[50])
    var
        Libros: Record "BTC Libros-INT";
        PrecioAcum: Decimal;
    begin

        Libros.SetCurrentKey(Autor);
        Libros.SetRange(Autor, pAutor);
        Libros.CalcSums(Precio);
        PrecioAcum := Libros.Precio;

        Libros.Reset();
        Libros.SetRange("Fecha publicacion", 20210101D, 20211231D);
        if Libros.FindSet() then
            repeat
                PrecioAcum += Libros.Precio;
            until Libros.Next() = 0;
    end;

    procedure CrearLibro()
    var
        Libros: Record "BTC Libros-INT";
    begin
        Libros.CreaNuevoRegistro('Reina Roja', 'Juan Gomez-Jurado', 20, 20210101D);
        Libros.CreaNuevoRegistro('Loba Negra', 'Juan Gomez-Jurado', 20, 20220101D);
        Libros.CreaNuevoRegistro('Cicatriz', 'Juan Gomez-Jurado', 10, 20180101D);
        Libros.CreaNuevoRegistro('El Paciente', 'Juan Gomez-Jurado', 10, 20190101D);
    end;

    procedure ModificarLibro()
    var
        Libros: Record "BTC Libros-INT";
    begin
        Libros.Reset();
        if Libros.Get('Reina Roja') then
            Libros.Delete();

        Libros.Reset();
        if Libros.Get('Reina Roja') then begin
            Libros.Validate(Precio, 10);
            Libros.Modify();
        end;

        Libros.Reset();
        Libros.SetRange(Autor, 'Juan Gomez-Jurado');
        libros.DeleteAll(true);
    end;

    var
        myInt: Integer;
}

table 50100 "BTC Libros-INT"
{
    DataClassification = ToBeClassified;
    Caption = 'Libros';
    LookupPageId = "Libros Lista";
    DrillDownPageId = "Libros Lista";

    fields
    {
        field(1; Titulo; Text[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'Título';
        }
        field(2; Precio; Decimal)
        {
            Caption = 'Precio';
            DecimalPlaces = 2 : 5;
            trigger onValidate()
            var
                PrecioErr: Label 'El precio debe ser mayo de 0';
            begin
                if Precio < 0 then
                    Error(PrecioErr);
            end;
        }
        field(3; Autor; Text[50])
        {

        }
        field(4; "Fecha publicacion"; Date)
        {

        }
    }

    keys
    {
        key(PK; Titulo)
        {
            Clustered = true;
        }
        key(k2; Autor)
        {
            SumIndexFields = Precio;
        }
    }

    var
        Userid: text;

    local procedure CrearRegisto(pTitulo: Text[50]; pAutor: text[50]; pPrecio: Decimal; pFechaPubli: Date)
    var
        Libros: Record "BTC Libros-INT";
    begin
        Libros.Init();
        Libros.Titulo := pTitulo;
        Libros.Autor := pAutor;
        Libros.Validate(Precio, pPrecio);
        Libros."Fecha publicacion" := pFechaPubli;
        Libros.Insert(true);
    end;

    procedure CreaNuevoRegistro(pTitulo: Text[50]; pAutor: text[50]; pPrecio: Decimal; pFechaPubli: Date)
    begin
        CrearRegisto(pTitulo, pAutor, Precio, pFechaPubli);
    end;

    trigger OnInsert()
    var
        Fecha: Date;
    begin
        Userid := '';
        Fecha := Today;
    end;

    trigger OnModify()
    begin
        Userid := '';
    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}
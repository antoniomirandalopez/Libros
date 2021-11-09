page 50101 "BTC Libros-INT Card"
{

    Caption = 'BTC Libros-INT Card';
    PageType = Card;
    SourceTable = "BTC Libros-INT";

    layout
    {
        area(content)
        {
            group(General)
            {
                field(Titulo; Rec.Titulo)
                {
                    ApplicationArea = All;
                    ToolTip = 'Tooltip campo codigo';
                }
                field(Autor; Rec.Autor)
                {
                    ApplicationArea = All;
                }
                field("Fecha publicacion"; Rec."Fecha publicacion")
                {
                    ApplicationArea = All;
                }
            }
            group(MyPrecio)
            {
                field(Precio; Rec.Precio)
                {
                    ApplicationArea = All;
                }
            }
        }
    }

}

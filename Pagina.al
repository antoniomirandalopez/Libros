page 50100 "Libros Lista"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "BTC Libros-INT";
    Caption = 'Lista de libros';
    CardPageId = "BTC Libros-INT Card";
    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(Titulo; Rec.Titulo)
                {
                    ApplicationArea = All;
                    StyleExpr = MyStyleExp;
                }

                field(Autor; Rec.Autor)
                {
                    ApplicationArea = All;
                    StyleExpr = MyStyleExp;
                }
                field(Precio; Rec.Precio)
                {
                    ApplicationArea = All;
                    StyleExpr = MyStyleExp;
                }
                field("Fecha publicacion"; Rec."Fecha publicacion")
                {
                    ApplicationArea = All;
                    StyleExpr = MyStyleExp;

                }
            }
        }
    }

    actions
    {
        area(Reporting)
        {
            action(ReportLIbros)
            {
                Caption = 'Informe Libros';
                Image = Action;
                ApplicationArea = All;

                RunObject = report "Informe Libros";
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        if Precio < 10 then
            MyStyleExp := 'Attention'
        else
            MyStyleExp := 'Standard';
    end;

    var
        MyStyleExp: Text;
}
report 50100 "Informe Libros"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = './Libros.rdl';
    dataset
    {
        dataitem(Libros; "BTC Libros-INT")
        {
            column(Titulo; Titulo)
            {
                IncludeCaption = true;
            }
            column(Autor; Autor)
            {
                IncludeCaption = true;
            }
            column(Precio; Precio)
            {
                IncludeCaption = true;
            }
            column(Fecha_publicacion; "Fecha publicacion")
            {
                IncludeCaption = true;
            }
            column(Color; 'Red') { }
        }
    }


}
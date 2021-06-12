controladdin "Addin Example"
{
    HorizontalShrink = true;
    HorizontalStretch = true;
    RequestedHeight = 800;
    Scripts = 'src\ControllAddinExample\page.js';
    StartupScript = 'src\ControllAddinExample\start.js';
    //StyleSheets = 'src\ControllAddinExample\style.css';
    VerticalShrink = true;
    VerticalStretch = true;

    event Ready()

    procedure embedHomePage()
}
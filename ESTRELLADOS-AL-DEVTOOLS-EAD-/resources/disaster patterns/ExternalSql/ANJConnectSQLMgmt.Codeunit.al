codeunit 50100 "ANJ_Connect SQL Mgmt."
{
    trigger OnRun()
    begin
        ConnectToSql();
    end;

    /// <summary>
    /// ConnectToSql.
    /// </summary>
    local procedure ConnectToSql()
    var
        ANJExternalConfig: Record "ANJ_External Config";
#pragma warning disable AA0470
        ConnectionStringLbl: Label 'Data Source=%1\%2;Initial Catalog=%3;User ID=%4;Password=%5';
#pragma warning restore AA0470
        DatabaseConnectionString: Text;
        Server: Text[250];
        SqlDatabase: Text[250];
        SqlIntance: Text[250];
        SqlUser: Text[250];
        SqlPassword: Text[250];
    begin
        ANJExternalConfig.GetRecord();
        ANJExternalConfig.TestField(Server);
        ANJExternalConfig.TestField("Sql Intance");
        ANJExternalConfig.TestField("Sql Database");
        ANJExternalConfig.TestField("Sql User");
        ANJExternalConfig.TestField("Sql Password");
        Server := ANJExternalConfig.Server;
        SqlIntance := ANJExternalConfig."Sql Intance";
        SqlDatabase := ANJExternalConfig."Sql Database";
        SqlUser := ANJExternalConfig."Sql User";
        SqlPassword := ANJExternalConfig."Sql Password";

        IF HasTableConnection(TableConnectionType::ExternalSQL, SqlDatabase) then
            UnregisterTableConnection(TableConnectionType::ExternalSQL, SqlDatabase);

        DatabaseConnectionString := StrSubstNo(ConnectionStringLbl, Server, SqlIntance, SqlDatabase, SqlUser, SqlPassword);

        RegisterTableConnection(TableConnectionType::ExternalSQL, SqlDatabase, DatabaseConnectionString);
        SetDefaultTableConnection(TableConnectionType::ExternalSQL, SqlDatabase);
    end;
}
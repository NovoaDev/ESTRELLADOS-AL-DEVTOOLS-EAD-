tableextension 50000 "Comment Line" extends "Comment Line"
{
    fields
    {
        modify("No.")
        {
            TableRelation = if ("Table Name" = const(Example)) "Master Example";
        }
    }
}
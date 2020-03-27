#include "Chat.h"
#include "Common.h"
#include "ScriptMgr.h"
#include "ObjectMgr.h"
#include "DatabaseEnv.h"

class migrate_commandscript : public CommandScript
{
public:
    migrate_commandscript() : CommandScript("migrate_commandscript") { }

   std::vector<ChatCommand> GetCommands() const override
    {
        static std::vector<ChatCommand> TableCommandMigrate = // .migrate
        {
            { "items",				SEC_ADMINISTRATOR, 		true, &HandleMigrateItems,             	   			"" }
        };

        static std::vector<ChatCommand> commandTable =
        {  
            { "migrate",			SEC_ADMINISTRATOR, 		true, nullptr,             	   				        "", TableCommandMigrate }
        };

        return commandTable;
    }

    static bool HandleMigrateItems(ChatHandler *handler, const char *args)
    {
        // .migrate items characterGuid itemcount

        char* _PlayerGuid = strtok((char*)args, " ");
        if (!_PlayerGuid)
            return false;

        uint32 PlayerGuid = (uint32)atoi(_PlayerGuid);

        char* _ItemCount = strtok(NULL, " ");
        if (!_ItemCount)
            return false;

        uint32 ItemCount = (uint32)atoi(_ItemCount);

        std::string ExecuteStr = "INSERT INTO `item_instance`(`guid`, `owner_guid`) VALUES\n";

        for (uint32 i = 1; i < ItemCount + 1; i++)
        {
            uint32 HighGUIDItem = sObjectMgr->GetGenerator<HighGuid::Item>().Generate();
            ExecuteStr += GetFormatString("(%u, %u)", HighGUIDItem, PlayerGuid);
            if (i < ItemCount)
                ExecuteStr += ",\n";
        }

        ExecuteStr += ";";
        CharacterDatabase.PExecute("%s", ExecuteStr.c_str());

        return true;
	}
	
	static std::string GetFormatString(const char* format, ...)
    {
        va_list ap;
        char str[2048];
        va_start(ap, format);
        vsnprintf(str, 2048, format, ap);
        va_end(ap);
        return std::string(str);
    }
};

void AddSC_migrate_commandscript()
{
    new migrate_commandscript();
}

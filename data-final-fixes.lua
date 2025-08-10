local prefix = "[Recipe Format Updater] "
local isDebug = settings.startup["rfu-debug-mode"] or mods["debugadapter"]

for name, prototype in pairs(data.raw["recipe"]) do
    if prototype.result then
        print(prefix .. "Warning: Nonmigrated recipe " .. name .. " found.")
        local old = table.deepcopy(prototype)
        prototype.results = {
            {
                type = "item",
                name = prototype.result,
                amount = prototype.result_count or 1
            }
        }
        prototype.result = nil
        prototype.result_count = nil
        print(
            prefix .. "Successfully migrated recipe " .. name .. " from:\n" ..
            serpent.block(old) ..
            "\nto:\n" ..
            serpent.block(prototype)
        )
        if isDebug then
            print(prefix .. "DEBUG: Reverting migration.")
            data.raw["recipe"][name] = old
        end
    end
end
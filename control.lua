if not (settings.startup["pfu-debug-mode"].value or script.active_mods["debugadapter"]) then
    script.on_nth_tick(60 * 60 * 10, function()
        game.print("Prototype Format Updater is active in patching mode.")
        game.print("Please give back to the modding community by reporting any errors this mod patches.")
        game.print("See this mod's mod page for more details.")
    end)
end
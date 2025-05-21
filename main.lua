local scrollFrameFontStringCache = {}
hooksecurefunc(Bagnon.Item, "Update", function(self)
    local flag = false
    if (self.hasItem) then
        local itemName, _, _, _, _, _, itemSubType, _, _, _, _, itemTypeId, itemSubTypeId = GetItemInfo(self.info.hyperlink)
        if itemTypeId == Enum.ItemClass.Consumable and itemSubTypeId == Enum.ItemConsumableSubclass.Scroll then
            if not scrollFrameFontStringCache[self] then
                local scrollFrameName = self:GetName() .. "ScrollDetailFrame"
                if not _G[scrollFrameName] then
                    _G[scrollFrameName] = CreateFrame("Frame", scrollFrameName, self)
                    _G[scrollFrameName]:SetAllPoints()
                end
                scrollFrameFontStringCache[self] = _G[scrollFrameName]:CreateFontString()
                scrollFrameFontStringCache[self]:SetDrawLayer("ARTWORK", 1)
                scrollFrameFontStringCache[self]:SetPoint("TOPRIGHT", 0, -2)
                scrollFrameFontStringCache[self]:SetTextColor(.95, .95, .95)
                scrollFrameFontStringCache[self]:SetFont("Fonts\\ARHei.TTF", 10, "OUTLINE")
            end
            scrollFrameFontStringCache[self]:SetText(string.gsub(itemName, itemSubType, ""))
            flag = true
        end
    end
    if (not flag) and scrollFrameFontStringCache[self] then
        scrollFrameFontStringCache[self]:SetText("")
    end
end)
module cimgui_api;

private:

import core.stdc.stdio;

public:

// CImgui include files converted to D (This is a generated file)
// 
// Usage:
//   ** Start program
//   CImguiLoader.load();
//   ** 
//   CImguiLoader.unload();
//   ** Exit program

// CImguiLoader
private struct _CImguiLoader {
	import core.sys.windows.windows;
	import common : throwIf;
	HANDLE handle;
	void load() {
		this.handle = LoadLibraryA("cimgui.dll");
		if(!handle) throw new Exception("Unable to load 'cimgui.dll'");
		
		*(cast(void**)&ImGuiContextHookCallback) = GetProcAddr(handle, "ImGuiContextHookCallback"); throwIf(!ImGuiContextHookCallback);
		*(cast(void**)&ImGuiContextHook_ImGuiContextHook) = GetProcAddr(handle, "ImGuiContextHook_ImGuiContextHook"); throwIf(!ImGuiContextHook_ImGuiContextHook);
		*(cast(void**)&ImGuiContextHook_destroy) = GetProcAddr(handle, "ImGuiContextHook_destroy"); throwIf(!ImGuiContextHook_destroy);
		*(cast(void**)&ImGuiContext_ImGuiContext) = GetProcAddr(handle, "ImGuiContext_ImGuiContext"); throwIf(!ImGuiContext_ImGuiContext);
		*(cast(void**)&ImGuiContext_destroy) = GetProcAddr(handle, "ImGuiContext_destroy"); throwIf(!ImGuiContext_destroy);
		*(cast(void**)&ImGuiErrorLogCallback) = GetProcAddr(handle, "ImGuiErrorLogCallback"); throwIf(!ImGuiErrorLogCallback);
		*(cast(void**)&ImGuiIO_AddInputCharacter) = GetProcAddr(handle, "ImGuiIO_AddInputCharacter"); throwIf(!ImGuiIO_AddInputCharacter);
		*(cast(void**)&ImGuiIO_AddInputCharacterUTF16) = GetProcAddr(handle, "ImGuiIO_AddInputCharacterUTF16"); throwIf(!ImGuiIO_AddInputCharacterUTF16);
		*(cast(void**)&ImGuiIO_AddInputCharactersUTF8) = GetProcAddr(handle, "ImGuiIO_AddInputCharactersUTF8"); throwIf(!ImGuiIO_AddInputCharactersUTF8);
		*(cast(void**)&ImGuiIO_ClearInputCharacters) = GetProcAddr(handle, "ImGuiIO_ClearInputCharacters"); throwIf(!ImGuiIO_ClearInputCharacters);
		*(cast(void**)&ImGuiIO_ImGuiIO) = GetProcAddr(handle, "ImGuiIO_ImGuiIO"); throwIf(!ImGuiIO_ImGuiIO);
		*(cast(void**)&ImGuiIO_destroy) = GetProcAddr(handle, "ImGuiIO_destroy"); throwIf(!ImGuiIO_destroy);
		*(cast(void**)&ImGuiInputTextCallback) = GetProcAddr(handle, "ImGuiInputTextCallback"); throwIf(!ImGuiInputTextCallback);
		*(cast(void**)&ImGuiInputTextCallbackData_ClearSelection) = GetProcAddr(handle, "ImGuiInputTextCallbackData_ClearSelection"); throwIf(!ImGuiInputTextCallbackData_ClearSelection);
		*(cast(void**)&ImGuiInputTextCallbackData_DeleteChars) = GetProcAddr(handle, "ImGuiInputTextCallbackData_DeleteChars"); throwIf(!ImGuiInputTextCallbackData_DeleteChars);
		*(cast(void**)&ImGuiInputTextCallbackData_HasSelection) = GetProcAddr(handle, "ImGuiInputTextCallbackData_HasSelection"); throwIf(!ImGuiInputTextCallbackData_HasSelection);
		*(cast(void**)&ImGuiInputTextCallbackData_ImGuiInputTextCallbackData) = GetProcAddr(handle, "ImGuiInputTextCallbackData_ImGuiInputTextCallbackData"); throwIf(!ImGuiInputTextCallbackData_ImGuiInputTextCallbackData);
		*(cast(void**)&ImGuiInputTextCallbackData_InsertChars) = GetProcAddr(handle, "ImGuiInputTextCallbackData_InsertChars"); throwIf(!ImGuiInputTextCallbackData_InsertChars);
		*(cast(void**)&ImGuiInputTextCallbackData_SelectAll) = GetProcAddr(handle, "ImGuiInputTextCallbackData_SelectAll"); throwIf(!ImGuiInputTextCallbackData_SelectAll);
		*(cast(void**)&ImGuiInputTextCallbackData_destroy) = GetProcAddr(handle, "ImGuiInputTextCallbackData_destroy"); throwIf(!ImGuiInputTextCallbackData_destroy);
		*(cast(void**)&ImGuiInputTextState_ClearFreeMemory) = GetProcAddr(handle, "ImGuiInputTextState_ClearFreeMemory"); throwIf(!ImGuiInputTextState_ClearFreeMemory);
		*(cast(void**)&ImGuiInputTextState_ClearSelection) = GetProcAddr(handle, "ImGuiInputTextState_ClearSelection"); throwIf(!ImGuiInputTextState_ClearSelection);
		*(cast(void**)&ImGuiInputTextState_ClearText) = GetProcAddr(handle, "ImGuiInputTextState_ClearText"); throwIf(!ImGuiInputTextState_ClearText);
		*(cast(void**)&ImGuiInputTextState_CursorAnimReset) = GetProcAddr(handle, "ImGuiInputTextState_CursorAnimReset"); throwIf(!ImGuiInputTextState_CursorAnimReset);
		*(cast(void**)&ImGuiInputTextState_CursorClamp) = GetProcAddr(handle, "ImGuiInputTextState_CursorClamp"); throwIf(!ImGuiInputTextState_CursorClamp);
		*(cast(void**)&ImGuiInputTextState_GetRedoAvailCount) = GetProcAddr(handle, "ImGuiInputTextState_GetRedoAvailCount"); throwIf(!ImGuiInputTextState_GetRedoAvailCount);
		*(cast(void**)&ImGuiInputTextState_GetUndoAvailCount) = GetProcAddr(handle, "ImGuiInputTextState_GetUndoAvailCount"); throwIf(!ImGuiInputTextState_GetUndoAvailCount);
		*(cast(void**)&ImGuiInputTextState_HasSelection) = GetProcAddr(handle, "ImGuiInputTextState_HasSelection"); throwIf(!ImGuiInputTextState_HasSelection);
		*(cast(void**)&ImGuiInputTextState_ImGuiInputTextState) = GetProcAddr(handle, "ImGuiInputTextState_ImGuiInputTextState"); throwIf(!ImGuiInputTextState_ImGuiInputTextState);
		*(cast(void**)&ImGuiInputTextState_OnKeyPressed) = GetProcAddr(handle, "ImGuiInputTextState_OnKeyPressed"); throwIf(!ImGuiInputTextState_OnKeyPressed);
		*(cast(void**)&ImGuiInputTextState_SelectAll) = GetProcAddr(handle, "ImGuiInputTextState_SelectAll"); throwIf(!ImGuiInputTextState_SelectAll);
		*(cast(void**)&ImGuiInputTextState_destroy) = GetProcAddr(handle, "ImGuiInputTextState_destroy"); throwIf(!ImGuiInputTextState_destroy);
		*(cast(void**)&ImGuiLastItemDataBackup_Backup) = GetProcAddr(handle, "ImGuiLastItemDataBackup_Backup"); throwIf(!ImGuiLastItemDataBackup_Backup);
		*(cast(void**)&ImGuiLastItemDataBackup_ImGuiLastItemDataBackup) = GetProcAddr(handle, "ImGuiLastItemDataBackup_ImGuiLastItemDataBackup"); throwIf(!ImGuiLastItemDataBackup_ImGuiLastItemDataBackup);
		*(cast(void**)&ImGuiLastItemDataBackup_Restore) = GetProcAddr(handle, "ImGuiLastItemDataBackup_Restore"); throwIf(!ImGuiLastItemDataBackup_Restore);
		*(cast(void**)&ImGuiLastItemDataBackup_destroy) = GetProcAddr(handle, "ImGuiLastItemDataBackup_destroy"); throwIf(!ImGuiLastItemDataBackup_destroy);
		*(cast(void**)&ImGuiListClipper_Begin) = GetProcAddr(handle, "ImGuiListClipper_Begin"); throwIf(!ImGuiListClipper_Begin);
		*(cast(void**)&ImGuiListClipper_End) = GetProcAddr(handle, "ImGuiListClipper_End"); throwIf(!ImGuiListClipper_End);
		*(cast(void**)&ImGuiListClipper_ImGuiListClipper) = GetProcAddr(handle, "ImGuiListClipper_ImGuiListClipper"); throwIf(!ImGuiListClipper_ImGuiListClipper);
		*(cast(void**)&ImGuiListClipper_Step) = GetProcAddr(handle, "ImGuiListClipper_Step"); throwIf(!ImGuiListClipper_Step);
		*(cast(void**)&ImGuiListClipper_destroy) = GetProcAddr(handle, "ImGuiListClipper_destroy"); throwIf(!ImGuiListClipper_destroy);
		*(cast(void**)&ImGuiMemAllocFunc) = GetProcAddr(handle, "ImGuiMemAllocFunc"); throwIf(!ImGuiMemAllocFunc);
		*(cast(void**)&ImGuiMemFreeFunc) = GetProcAddr(handle, "ImGuiMemFreeFunc"); throwIf(!ImGuiMemFreeFunc);
		*(cast(void**)&ImGuiMenuColumns_CalcExtraSpace) = GetProcAddr(handle, "ImGuiMenuColumns_CalcExtraSpace"); throwIf(!ImGuiMenuColumns_CalcExtraSpace);
		*(cast(void**)&ImGuiMenuColumns_DeclColumns) = GetProcAddr(handle, "ImGuiMenuColumns_DeclColumns"); throwIf(!ImGuiMenuColumns_DeclColumns);
		*(cast(void**)&ImGuiMenuColumns_ImGuiMenuColumns) = GetProcAddr(handle, "ImGuiMenuColumns_ImGuiMenuColumns"); throwIf(!ImGuiMenuColumns_ImGuiMenuColumns);
		*(cast(void**)&ImGuiMenuColumns_Update) = GetProcAddr(handle, "ImGuiMenuColumns_Update"); throwIf(!ImGuiMenuColumns_Update);
		*(cast(void**)&ImGuiMenuColumns_destroy) = GetProcAddr(handle, "ImGuiMenuColumns_destroy"); throwIf(!ImGuiMenuColumns_destroy);
		*(cast(void**)&ImGuiMetricsConfig_ImGuiMetricsConfig) = GetProcAddr(handle, "ImGuiMetricsConfig_ImGuiMetricsConfig"); throwIf(!ImGuiMetricsConfig_ImGuiMetricsConfig);
		*(cast(void**)&ImGuiMetricsConfig_destroy) = GetProcAddr(handle, "ImGuiMetricsConfig_destroy"); throwIf(!ImGuiMetricsConfig_destroy);
		*(cast(void**)&ImGuiNavMoveResult_Clear) = GetProcAddr(handle, "ImGuiNavMoveResult_Clear"); throwIf(!ImGuiNavMoveResult_Clear);
		*(cast(void**)&ImGuiNavMoveResult_ImGuiNavMoveResult) = GetProcAddr(handle, "ImGuiNavMoveResult_ImGuiNavMoveResult"); throwIf(!ImGuiNavMoveResult_ImGuiNavMoveResult);
		*(cast(void**)&ImGuiNavMoveResult_destroy) = GetProcAddr(handle, "ImGuiNavMoveResult_destroy"); throwIf(!ImGuiNavMoveResult_destroy);
		*(cast(void**)&ImGuiNextItemData_ClearFlags) = GetProcAddr(handle, "ImGuiNextItemData_ClearFlags"); throwIf(!ImGuiNextItemData_ClearFlags);
		*(cast(void**)&ImGuiNextItemData_ImGuiNextItemData) = GetProcAddr(handle, "ImGuiNextItemData_ImGuiNextItemData"); throwIf(!ImGuiNextItemData_ImGuiNextItemData);
		*(cast(void**)&ImGuiNextItemData_destroy) = GetProcAddr(handle, "ImGuiNextItemData_destroy"); throwIf(!ImGuiNextItemData_destroy);
		*(cast(void**)&ImGuiNextWindowData_ClearFlags) = GetProcAddr(handle, "ImGuiNextWindowData_ClearFlags"); throwIf(!ImGuiNextWindowData_ClearFlags);
		*(cast(void**)&ImGuiNextWindowData_ImGuiNextWindowData) = GetProcAddr(handle, "ImGuiNextWindowData_ImGuiNextWindowData"); throwIf(!ImGuiNextWindowData_ImGuiNextWindowData);
		*(cast(void**)&ImGuiNextWindowData_destroy) = GetProcAddr(handle, "ImGuiNextWindowData_destroy"); throwIf(!ImGuiNextWindowData_destroy);
		*(cast(void**)&ImGuiOldColumnData_ImGuiOldColumnData) = GetProcAddr(handle, "ImGuiOldColumnData_ImGuiOldColumnData"); throwIf(!ImGuiOldColumnData_ImGuiOldColumnData);
		*(cast(void**)&ImGuiOldColumnData_destroy) = GetProcAddr(handle, "ImGuiOldColumnData_destroy"); throwIf(!ImGuiOldColumnData_destroy);
		*(cast(void**)&ImGuiOldColumns_ImGuiOldColumns) = GetProcAddr(handle, "ImGuiOldColumns_ImGuiOldColumns"); throwIf(!ImGuiOldColumns_ImGuiOldColumns);
		*(cast(void**)&ImGuiOldColumns_destroy) = GetProcAddr(handle, "ImGuiOldColumns_destroy"); throwIf(!ImGuiOldColumns_destroy);
		*(cast(void**)&ImGuiOnceUponAFrame_ImGuiOnceUponAFrame) = GetProcAddr(handle, "ImGuiOnceUponAFrame_ImGuiOnceUponAFrame"); throwIf(!ImGuiOnceUponAFrame_ImGuiOnceUponAFrame);
		*(cast(void**)&ImGuiOnceUponAFrame_destroy) = GetProcAddr(handle, "ImGuiOnceUponAFrame_destroy"); throwIf(!ImGuiOnceUponAFrame_destroy);
		*(cast(void**)&ImGuiPayload_Clear) = GetProcAddr(handle, "ImGuiPayload_Clear"); throwIf(!ImGuiPayload_Clear);
		*(cast(void**)&ImGuiPayload_ImGuiPayload) = GetProcAddr(handle, "ImGuiPayload_ImGuiPayload"); throwIf(!ImGuiPayload_ImGuiPayload);
		*(cast(void**)&ImGuiPayload_IsDataType) = GetProcAddr(handle, "ImGuiPayload_IsDataType"); throwIf(!ImGuiPayload_IsDataType);
		*(cast(void**)&ImGuiPayload_IsDelivery) = GetProcAddr(handle, "ImGuiPayload_IsDelivery"); throwIf(!ImGuiPayload_IsDelivery);
		*(cast(void**)&ImGuiPayload_IsPreview) = GetProcAddr(handle, "ImGuiPayload_IsPreview"); throwIf(!ImGuiPayload_IsPreview);
		*(cast(void**)&ImGuiPayload_destroy) = GetProcAddr(handle, "ImGuiPayload_destroy"); throwIf(!ImGuiPayload_destroy);
		*(cast(void**)&ImGuiPopupData_ImGuiPopupData) = GetProcAddr(handle, "ImGuiPopupData_ImGuiPopupData"); throwIf(!ImGuiPopupData_ImGuiPopupData);
		*(cast(void**)&ImGuiPopupData_destroy) = GetProcAddr(handle, "ImGuiPopupData_destroy"); throwIf(!ImGuiPopupData_destroy);
		*(cast(void**)&ImGuiPtrOrIndex_ImGuiPtrOrIndex_Int) = GetProcAddr(handle, "ImGuiPtrOrIndex_ImGuiPtrOrIndex_Int"); throwIf(!ImGuiPtrOrIndex_ImGuiPtrOrIndex_Int);
		*(cast(void**)&ImGuiPtrOrIndex_ImGuiPtrOrIndex_Ptr) = GetProcAddr(handle, "ImGuiPtrOrIndex_ImGuiPtrOrIndex_Ptr"); throwIf(!ImGuiPtrOrIndex_ImGuiPtrOrIndex_Ptr);
		*(cast(void**)&ImGuiPtrOrIndex_destroy) = GetProcAddr(handle, "ImGuiPtrOrIndex_destroy"); throwIf(!ImGuiPtrOrIndex_destroy);
		*(cast(void**)&ImGuiSettingsHandler_ImGuiSettingsHandler) = GetProcAddr(handle, "ImGuiSettingsHandler_ImGuiSettingsHandler"); throwIf(!ImGuiSettingsHandler_ImGuiSettingsHandler);
		*(cast(void**)&ImGuiSettingsHandler_destroy) = GetProcAddr(handle, "ImGuiSettingsHandler_destroy"); throwIf(!ImGuiSettingsHandler_destroy);
		*(cast(void**)&ImGuiSizeCallback) = GetProcAddr(handle, "ImGuiSizeCallback"); throwIf(!ImGuiSizeCallback);
		*(cast(void**)&ImGuiStackSizes_CompareWithCurrentState) = GetProcAddr(handle, "ImGuiStackSizes_CompareWithCurrentState"); throwIf(!ImGuiStackSizes_CompareWithCurrentState);
		*(cast(void**)&ImGuiStackSizes_ImGuiStackSizes) = GetProcAddr(handle, "ImGuiStackSizes_ImGuiStackSizes"); throwIf(!ImGuiStackSizes_ImGuiStackSizes);
		*(cast(void**)&ImGuiStackSizes_SetToCurrentState) = GetProcAddr(handle, "ImGuiStackSizes_SetToCurrentState"); throwIf(!ImGuiStackSizes_SetToCurrentState);
		*(cast(void**)&ImGuiStackSizes_destroy) = GetProcAddr(handle, "ImGuiStackSizes_destroy"); throwIf(!ImGuiStackSizes_destroy);
		*(cast(void**)&ImGuiStoragePair_ImGuiStoragePair_Float) = GetProcAddr(handle, "ImGuiStoragePair_ImGuiStoragePair_Float"); throwIf(!ImGuiStoragePair_ImGuiStoragePair_Float);
		*(cast(void**)&ImGuiStoragePair_ImGuiStoragePair_Int) = GetProcAddr(handle, "ImGuiStoragePair_ImGuiStoragePair_Int"); throwIf(!ImGuiStoragePair_ImGuiStoragePair_Int);
		*(cast(void**)&ImGuiStoragePair_ImGuiStoragePair_Ptr) = GetProcAddr(handle, "ImGuiStoragePair_ImGuiStoragePair_Ptr"); throwIf(!ImGuiStoragePair_ImGuiStoragePair_Ptr);
		*(cast(void**)&ImGuiStoragePair_destroy) = GetProcAddr(handle, "ImGuiStoragePair_destroy"); throwIf(!ImGuiStoragePair_destroy);
		*(cast(void**)&ImGuiStorage_BuildSortByKey) = GetProcAddr(handle, "ImGuiStorage_BuildSortByKey"); throwIf(!ImGuiStorage_BuildSortByKey);
		*(cast(void**)&ImGuiStorage_Clear) = GetProcAddr(handle, "ImGuiStorage_Clear"); throwIf(!ImGuiStorage_Clear);
		*(cast(void**)&ImGuiStorage_GetBool) = GetProcAddr(handle, "ImGuiStorage_GetBool"); throwIf(!ImGuiStorage_GetBool);
		*(cast(void**)&ImGuiStorage_GetBoolRef) = GetProcAddr(handle, "ImGuiStorage_GetBoolRef"); throwIf(!ImGuiStorage_GetBoolRef);
		*(cast(void**)&ImGuiStorage_GetFloat) = GetProcAddr(handle, "ImGuiStorage_GetFloat"); throwIf(!ImGuiStorage_GetFloat);
		*(cast(void**)&ImGuiStorage_GetFloatRef) = GetProcAddr(handle, "ImGuiStorage_GetFloatRef"); throwIf(!ImGuiStorage_GetFloatRef);
		*(cast(void**)&ImGuiStorage_GetInt) = GetProcAddr(handle, "ImGuiStorage_GetInt"); throwIf(!ImGuiStorage_GetInt);
		*(cast(void**)&ImGuiStorage_GetIntRef) = GetProcAddr(handle, "ImGuiStorage_GetIntRef"); throwIf(!ImGuiStorage_GetIntRef);
		*(cast(void**)&ImGuiStorage_GetVoidPtr) = GetProcAddr(handle, "ImGuiStorage_GetVoidPtr"); throwIf(!ImGuiStorage_GetVoidPtr);
		*(cast(void**)&ImGuiStorage_GetVoidPtrRef) = GetProcAddr(handle, "ImGuiStorage_GetVoidPtrRef"); throwIf(!ImGuiStorage_GetVoidPtrRef);
		*(cast(void**)&ImGuiStorage_SetAllInt) = GetProcAddr(handle, "ImGuiStorage_SetAllInt"); throwIf(!ImGuiStorage_SetAllInt);
		*(cast(void**)&ImGuiStorage_SetBool) = GetProcAddr(handle, "ImGuiStorage_SetBool"); throwIf(!ImGuiStorage_SetBool);
		*(cast(void**)&ImGuiStorage_SetFloat) = GetProcAddr(handle, "ImGuiStorage_SetFloat"); throwIf(!ImGuiStorage_SetFloat);
		*(cast(void**)&ImGuiStorage_SetInt) = GetProcAddr(handle, "ImGuiStorage_SetInt"); throwIf(!ImGuiStorage_SetInt);
		*(cast(void**)&ImGuiStorage_SetVoidPtr) = GetProcAddr(handle, "ImGuiStorage_SetVoidPtr"); throwIf(!ImGuiStorage_SetVoidPtr);
		*(cast(void**)&ImGuiStyleMod_ImGuiStyleMod_Float) = GetProcAddr(handle, "ImGuiStyleMod_ImGuiStyleMod_Float"); throwIf(!ImGuiStyleMod_ImGuiStyleMod_Float);
		*(cast(void**)&ImGuiStyleMod_ImGuiStyleMod_Int) = GetProcAddr(handle, "ImGuiStyleMod_ImGuiStyleMod_Int"); throwIf(!ImGuiStyleMod_ImGuiStyleMod_Int);
		*(cast(void**)&ImGuiStyleMod_ImGuiStyleMod_Vec2) = GetProcAddr(handle, "ImGuiStyleMod_ImGuiStyleMod_Vec2"); throwIf(!ImGuiStyleMod_ImGuiStyleMod_Vec2);
		*(cast(void**)&ImGuiStyleMod_destroy) = GetProcAddr(handle, "ImGuiStyleMod_destroy"); throwIf(!ImGuiStyleMod_destroy);
		*(cast(void**)&ImGuiStyle_ImGuiStyle) = GetProcAddr(handle, "ImGuiStyle_ImGuiStyle"); throwIf(!ImGuiStyle_ImGuiStyle);
		*(cast(void**)&ImGuiStyle_ScaleAllSizes) = GetProcAddr(handle, "ImGuiStyle_ScaleAllSizes"); throwIf(!ImGuiStyle_ScaleAllSizes);
		*(cast(void**)&ImGuiStyle_destroy) = GetProcAddr(handle, "ImGuiStyle_destroy"); throwIf(!ImGuiStyle_destroy);
		*(cast(void**)&ImGuiTabBar_GetTabName) = GetProcAddr(handle, "ImGuiTabBar_GetTabName"); throwIf(!ImGuiTabBar_GetTabName);
		*(cast(void**)&ImGuiTabBar_GetTabOrder) = GetProcAddr(handle, "ImGuiTabBar_GetTabOrder"); throwIf(!ImGuiTabBar_GetTabOrder);
		*(cast(void**)&ImGuiTabBar_ImGuiTabBar) = GetProcAddr(handle, "ImGuiTabBar_ImGuiTabBar"); throwIf(!ImGuiTabBar_ImGuiTabBar);
		*(cast(void**)&ImGuiTabBar_destroy) = GetProcAddr(handle, "ImGuiTabBar_destroy"); throwIf(!ImGuiTabBar_destroy);
		*(cast(void**)&ImGuiTabItem_ImGuiTabItem) = GetProcAddr(handle, "ImGuiTabItem_ImGuiTabItem"); throwIf(!ImGuiTabItem_ImGuiTabItem);
		*(cast(void**)&ImGuiTabItem_destroy) = GetProcAddr(handle, "ImGuiTabItem_destroy"); throwIf(!ImGuiTabItem_destroy);
		*(cast(void**)&ImGuiTableColumnSettings_ImGuiTableColumnSettings) = GetProcAddr(handle, "ImGuiTableColumnSettings_ImGuiTableColumnSettings"); throwIf(!ImGuiTableColumnSettings_ImGuiTableColumnSettings);
		*(cast(void**)&ImGuiTableColumnSettings_destroy) = GetProcAddr(handle, "ImGuiTableColumnSettings_destroy"); throwIf(!ImGuiTableColumnSettings_destroy);
		*(cast(void**)&ImGuiTableColumnSortSpecs_ImGuiTableColumnSortSpecs) = GetProcAddr(handle, "ImGuiTableColumnSortSpecs_ImGuiTableColumnSortSpecs"); throwIf(!ImGuiTableColumnSortSpecs_ImGuiTableColumnSortSpecs);
		*(cast(void**)&ImGuiTableColumnSortSpecs_destroy) = GetProcAddr(handle, "ImGuiTableColumnSortSpecs_destroy"); throwIf(!ImGuiTableColumnSortSpecs_destroy);
		*(cast(void**)&ImGuiTableColumn_ImGuiTableColumn) = GetProcAddr(handle, "ImGuiTableColumn_ImGuiTableColumn"); throwIf(!ImGuiTableColumn_ImGuiTableColumn);
		*(cast(void**)&ImGuiTableColumn_destroy) = GetProcAddr(handle, "ImGuiTableColumn_destroy"); throwIf(!ImGuiTableColumn_destroy);
		*(cast(void**)&ImGuiTableSettings_GetColumnSettings) = GetProcAddr(handle, "ImGuiTableSettings_GetColumnSettings"); throwIf(!ImGuiTableSettings_GetColumnSettings);
		*(cast(void**)&ImGuiTableSettings_ImGuiTableSettings) = GetProcAddr(handle, "ImGuiTableSettings_ImGuiTableSettings"); throwIf(!ImGuiTableSettings_ImGuiTableSettings);
		*(cast(void**)&ImGuiTableSettings_destroy) = GetProcAddr(handle, "ImGuiTableSettings_destroy"); throwIf(!ImGuiTableSettings_destroy);
		*(cast(void**)&ImGuiTableSortSpecs_ImGuiTableSortSpecs) = GetProcAddr(handle, "ImGuiTableSortSpecs_ImGuiTableSortSpecs"); throwIf(!ImGuiTableSortSpecs_ImGuiTableSortSpecs);
		*(cast(void**)&ImGuiTableSortSpecs_destroy) = GetProcAddr(handle, "ImGuiTableSortSpecs_destroy"); throwIf(!ImGuiTableSortSpecs_destroy);
		*(cast(void**)&ImGuiTable_ImGuiTable) = GetProcAddr(handle, "ImGuiTable_ImGuiTable"); throwIf(!ImGuiTable_ImGuiTable);
		*(cast(void**)&ImGuiTable_destroy) = GetProcAddr(handle, "ImGuiTable_destroy"); throwIf(!ImGuiTable_destroy);
		*(cast(void**)&ImGuiTextBuffer_ImGuiTextBuffer) = GetProcAddr(handle, "ImGuiTextBuffer_ImGuiTextBuffer"); throwIf(!ImGuiTextBuffer_ImGuiTextBuffer);
		*(cast(void**)&ImGuiTextBuffer_append) = GetProcAddr(handle, "ImGuiTextBuffer_append"); throwIf(!ImGuiTextBuffer_append);
		*(cast(void**)&ImGuiTextBuffer_appendf) = GetProcAddr(handle, "ImGuiTextBuffer_appendf"); throwIf(!ImGuiTextBuffer_appendf);
		*(cast(void**)&ImGuiTextBuffer_appendfv) = GetProcAddr(handle, "ImGuiTextBuffer_appendfv"); throwIf(!ImGuiTextBuffer_appendfv);
		*(cast(void**)&ImGuiTextBuffer_begin) = GetProcAddr(handle, "ImGuiTextBuffer_begin"); throwIf(!ImGuiTextBuffer_begin);
		*(cast(void**)&ImGuiTextBuffer_c_str) = GetProcAddr(handle, "ImGuiTextBuffer_c_str"); throwIf(!ImGuiTextBuffer_c_str);
		*(cast(void**)&ImGuiTextBuffer_clear) = GetProcAddr(handle, "ImGuiTextBuffer_clear"); throwIf(!ImGuiTextBuffer_clear);
		*(cast(void**)&ImGuiTextBuffer_destroy) = GetProcAddr(handle, "ImGuiTextBuffer_destroy"); throwIf(!ImGuiTextBuffer_destroy);
		*(cast(void**)&ImGuiTextBuffer_empty) = GetProcAddr(handle, "ImGuiTextBuffer_empty"); throwIf(!ImGuiTextBuffer_empty);
		*(cast(void**)&ImGuiTextBuffer_end) = GetProcAddr(handle, "ImGuiTextBuffer_end"); throwIf(!ImGuiTextBuffer_end);
		*(cast(void**)&ImGuiTextBuffer_reserve) = GetProcAddr(handle, "ImGuiTextBuffer_reserve"); throwIf(!ImGuiTextBuffer_reserve);
		*(cast(void**)&ImGuiTextBuffer_size) = GetProcAddr(handle, "ImGuiTextBuffer_size"); throwIf(!ImGuiTextBuffer_size);
		*(cast(void**)&ImGuiTextFilter_Build) = GetProcAddr(handle, "ImGuiTextFilter_Build"); throwIf(!ImGuiTextFilter_Build);
		*(cast(void**)&ImGuiTextFilter_Clear) = GetProcAddr(handle, "ImGuiTextFilter_Clear"); throwIf(!ImGuiTextFilter_Clear);
		*(cast(void**)&ImGuiTextFilter_Draw) = GetProcAddr(handle, "ImGuiTextFilter_Draw"); throwIf(!ImGuiTextFilter_Draw);
		*(cast(void**)&ImGuiTextFilter_ImGuiTextFilter) = GetProcAddr(handle, "ImGuiTextFilter_ImGuiTextFilter"); throwIf(!ImGuiTextFilter_ImGuiTextFilter);
		*(cast(void**)&ImGuiTextFilter_IsActive) = GetProcAddr(handle, "ImGuiTextFilter_IsActive"); throwIf(!ImGuiTextFilter_IsActive);
		*(cast(void**)&ImGuiTextFilter_PassFilter) = GetProcAddr(handle, "ImGuiTextFilter_PassFilter"); throwIf(!ImGuiTextFilter_PassFilter);
		*(cast(void**)&ImGuiTextFilter_destroy) = GetProcAddr(handle, "ImGuiTextFilter_destroy"); throwIf(!ImGuiTextFilter_destroy);
		*(cast(void**)&ImGuiTextRange_ImGuiTextRange_Nil) = GetProcAddr(handle, "ImGuiTextRange_ImGuiTextRange_Nil"); throwIf(!ImGuiTextRange_ImGuiTextRange_Nil);
		*(cast(void**)&ImGuiTextRange_ImGuiTextRange_Str) = GetProcAddr(handle, "ImGuiTextRange_ImGuiTextRange_Str"); throwIf(!ImGuiTextRange_ImGuiTextRange_Str);
		*(cast(void**)&ImGuiTextRange_destroy) = GetProcAddr(handle, "ImGuiTextRange_destroy"); throwIf(!ImGuiTextRange_destroy);
		*(cast(void**)&ImGuiTextRange_empty) = GetProcAddr(handle, "ImGuiTextRange_empty"); throwIf(!ImGuiTextRange_empty);
		*(cast(void**)&ImGuiTextRange_split) = GetProcAddr(handle, "ImGuiTextRange_split"); throwIf(!ImGuiTextRange_split);
		*(cast(void**)&ImGuiViewportP_GetMainRect) = GetProcAddr(handle, "ImGuiViewportP_GetMainRect"); throwIf(!ImGuiViewportP_GetMainRect);
		*(cast(void**)&ImGuiViewportP_GetWorkRect) = GetProcAddr(handle, "ImGuiViewportP_GetWorkRect"); throwIf(!ImGuiViewportP_GetWorkRect);
		*(cast(void**)&ImGuiViewportP_ImGuiViewportP) = GetProcAddr(handle, "ImGuiViewportP_ImGuiViewportP"); throwIf(!ImGuiViewportP_ImGuiViewportP);
		*(cast(void**)&ImGuiViewportP_UpdateWorkRect) = GetProcAddr(handle, "ImGuiViewportP_UpdateWorkRect"); throwIf(!ImGuiViewportP_UpdateWorkRect);
		*(cast(void**)&ImGuiViewportP_destroy) = GetProcAddr(handle, "ImGuiViewportP_destroy"); throwIf(!ImGuiViewportP_destroy);
		*(cast(void**)&ImGuiViewport_GetCenter) = GetProcAddr(handle, "ImGuiViewport_GetCenter"); throwIf(!ImGuiViewport_GetCenter);
		*(cast(void**)&ImGuiViewport_GetWorkCenter) = GetProcAddr(handle, "ImGuiViewport_GetWorkCenter"); throwIf(!ImGuiViewport_GetWorkCenter);
		*(cast(void**)&ImGuiViewport_ImGuiViewport) = GetProcAddr(handle, "ImGuiViewport_ImGuiViewport"); throwIf(!ImGuiViewport_ImGuiViewport);
		*(cast(void**)&ImGuiViewport_destroy) = GetProcAddr(handle, "ImGuiViewport_destroy"); throwIf(!ImGuiViewport_destroy);
		*(cast(void**)&ImGuiWindowSettings_GetName) = GetProcAddr(handle, "ImGuiWindowSettings_GetName"); throwIf(!ImGuiWindowSettings_GetName);
		*(cast(void**)&ImGuiWindowSettings_ImGuiWindowSettings) = GetProcAddr(handle, "ImGuiWindowSettings_ImGuiWindowSettings"); throwIf(!ImGuiWindowSettings_ImGuiWindowSettings);
		*(cast(void**)&ImGuiWindowSettings_destroy) = GetProcAddr(handle, "ImGuiWindowSettings_destroy"); throwIf(!ImGuiWindowSettings_destroy);
		*(cast(void**)&ImGuiWindow_CalcFontSize) = GetProcAddr(handle, "ImGuiWindow_CalcFontSize"); throwIf(!ImGuiWindow_CalcFontSize);
		*(cast(void**)&ImGuiWindow_GetIDFromRectangle) = GetProcAddr(handle, "ImGuiWindow_GetIDFromRectangle"); throwIf(!ImGuiWindow_GetIDFromRectangle);
		*(cast(void**)&ImGuiWindow_GetIDNoKeepAlive_Int) = GetProcAddr(handle, "ImGuiWindow_GetIDNoKeepAlive_Int"); throwIf(!ImGuiWindow_GetIDNoKeepAlive_Int);
		*(cast(void**)&ImGuiWindow_GetIDNoKeepAlive_Ptr) = GetProcAddr(handle, "ImGuiWindow_GetIDNoKeepAlive_Ptr"); throwIf(!ImGuiWindow_GetIDNoKeepAlive_Ptr);
		*(cast(void**)&ImGuiWindow_GetIDNoKeepAlive_Str) = GetProcAddr(handle, "ImGuiWindow_GetIDNoKeepAlive_Str"); throwIf(!ImGuiWindow_GetIDNoKeepAlive_Str);
		*(cast(void**)&ImGuiWindow_GetID_Int) = GetProcAddr(handle, "ImGuiWindow_GetID_Int"); throwIf(!ImGuiWindow_GetID_Int);
		*(cast(void**)&ImGuiWindow_GetID_Ptr) = GetProcAddr(handle, "ImGuiWindow_GetID_Ptr"); throwIf(!ImGuiWindow_GetID_Ptr);
		*(cast(void**)&ImGuiWindow_GetID_Str) = GetProcAddr(handle, "ImGuiWindow_GetID_Str"); throwIf(!ImGuiWindow_GetID_Str);
		*(cast(void**)&ImGuiWindow_ImGuiWindow) = GetProcAddr(handle, "ImGuiWindow_ImGuiWindow"); throwIf(!ImGuiWindow_ImGuiWindow);
		*(cast(void**)&ImGuiWindow_MenuBarHeight) = GetProcAddr(handle, "ImGuiWindow_MenuBarHeight"); throwIf(!ImGuiWindow_MenuBarHeight);
		*(cast(void**)&ImGuiWindow_MenuBarRect) = GetProcAddr(handle, "ImGuiWindow_MenuBarRect"); throwIf(!ImGuiWindow_MenuBarRect);
		*(cast(void**)&ImGuiWindow_Rect) = GetProcAddr(handle, "ImGuiWindow_Rect"); throwIf(!ImGuiWindow_Rect);
		*(cast(void**)&ImGuiWindow_TitleBarHeight) = GetProcAddr(handle, "ImGuiWindow_TitleBarHeight"); throwIf(!ImGuiWindow_TitleBarHeight);
		*(cast(void**)&ImGuiWindow_TitleBarRect) = GetProcAddr(handle, "ImGuiWindow_TitleBarRect"); throwIf(!ImGuiWindow_TitleBarRect);
		*(cast(void**)&ImGuiWindow_destroy) = GetProcAddr(handle, "ImGuiWindow_destroy"); throwIf(!ImGuiWindow_destroy);
		*(cast(void**)&igAcceptDragDropPayload) = GetProcAddr(handle, "igAcceptDragDropPayload"); throwIf(!igAcceptDragDropPayload);
		*(cast(void**)&igActivateItem) = GetProcAddr(handle, "igActivateItem"); throwIf(!igActivateItem);
		*(cast(void**)&igAddContextHook) = GetProcAddr(handle, "igAddContextHook"); throwIf(!igAddContextHook);
		*(cast(void**)&igAlignTextToFramePadding) = GetProcAddr(handle, "igAlignTextToFramePadding"); throwIf(!igAlignTextToFramePadding);
		*(cast(void**)&igArrowButton) = GetProcAddr(handle, "igArrowButton"); throwIf(!igArrowButton);
		*(cast(void**)&igArrowButtonEx) = GetProcAddr(handle, "igArrowButtonEx"); throwIf(!igArrowButtonEx);
		*(cast(void**)&igBegin) = GetProcAddr(handle, "igBegin"); throwIf(!igBegin);
		*(cast(void**)&igBeginChildEx) = GetProcAddr(handle, "igBeginChildEx"); throwIf(!igBeginChildEx);
		*(cast(void**)&igBeginChildFrame) = GetProcAddr(handle, "igBeginChildFrame"); throwIf(!igBeginChildFrame);
		*(cast(void**)&igBeginChild_ID) = GetProcAddr(handle, "igBeginChild_ID"); throwIf(!igBeginChild_ID);
		*(cast(void**)&igBeginChild_Str) = GetProcAddr(handle, "igBeginChild_Str"); throwIf(!igBeginChild_Str);
		*(cast(void**)&igBeginColumns) = GetProcAddr(handle, "igBeginColumns"); throwIf(!igBeginColumns);
		*(cast(void**)&igBeginCombo) = GetProcAddr(handle, "igBeginCombo"); throwIf(!igBeginCombo);
		*(cast(void**)&igBeginDragDropSource) = GetProcAddr(handle, "igBeginDragDropSource"); throwIf(!igBeginDragDropSource);
		*(cast(void**)&igBeginDragDropTarget) = GetProcAddr(handle, "igBeginDragDropTarget"); throwIf(!igBeginDragDropTarget);
		*(cast(void**)&igBeginDragDropTargetCustom) = GetProcAddr(handle, "igBeginDragDropTargetCustom"); throwIf(!igBeginDragDropTargetCustom);
		*(cast(void**)&igBeginGroup) = GetProcAddr(handle, "igBeginGroup"); throwIf(!igBeginGroup);
		*(cast(void**)&igBeginListBox) = GetProcAddr(handle, "igBeginListBox"); throwIf(!igBeginListBox);
		*(cast(void**)&igBeginMainMenuBar) = GetProcAddr(handle, "igBeginMainMenuBar"); throwIf(!igBeginMainMenuBar);
		*(cast(void**)&igBeginMenu) = GetProcAddr(handle, "igBeginMenu"); throwIf(!igBeginMenu);
		*(cast(void**)&igBeginMenuBar) = GetProcAddr(handle, "igBeginMenuBar"); throwIf(!igBeginMenuBar);
		*(cast(void**)&igBeginPopup) = GetProcAddr(handle, "igBeginPopup"); throwIf(!igBeginPopup);
		*(cast(void**)&igBeginPopupContextItem) = GetProcAddr(handle, "igBeginPopupContextItem"); throwIf(!igBeginPopupContextItem);
		*(cast(void**)&igBeginPopupContextVoid) = GetProcAddr(handle, "igBeginPopupContextVoid"); throwIf(!igBeginPopupContextVoid);
		*(cast(void**)&igBeginPopupContextWindow) = GetProcAddr(handle, "igBeginPopupContextWindow"); throwIf(!igBeginPopupContextWindow);
		*(cast(void**)&igBeginPopupEx) = GetProcAddr(handle, "igBeginPopupEx"); throwIf(!igBeginPopupEx);
		*(cast(void**)&igBeginPopupModal) = GetProcAddr(handle, "igBeginPopupModal"); throwIf(!igBeginPopupModal);
		*(cast(void**)&igBeginTabBar) = GetProcAddr(handle, "igBeginTabBar"); throwIf(!igBeginTabBar);
		*(cast(void**)&igBeginTabBarEx) = GetProcAddr(handle, "igBeginTabBarEx"); throwIf(!igBeginTabBarEx);
		*(cast(void**)&igBeginTabItem) = GetProcAddr(handle, "igBeginTabItem"); throwIf(!igBeginTabItem);
		*(cast(void**)&igBeginTable) = GetProcAddr(handle, "igBeginTable"); throwIf(!igBeginTable);
		*(cast(void**)&igBeginTableEx) = GetProcAddr(handle, "igBeginTableEx"); throwIf(!igBeginTableEx);
		*(cast(void**)&igBeginTooltip) = GetProcAddr(handle, "igBeginTooltip"); throwIf(!igBeginTooltip);
		*(cast(void**)&igBeginTooltipEx) = GetProcAddr(handle, "igBeginTooltipEx"); throwIf(!igBeginTooltipEx);
		*(cast(void**)&igBringWindowToDisplayBack) = GetProcAddr(handle, "igBringWindowToDisplayBack"); throwIf(!igBringWindowToDisplayBack);
		*(cast(void**)&igBringWindowToDisplayFront) = GetProcAddr(handle, "igBringWindowToDisplayFront"); throwIf(!igBringWindowToDisplayFront);
		*(cast(void**)&igBringWindowToFocusFront) = GetProcAddr(handle, "igBringWindowToFocusFront"); throwIf(!igBringWindowToFocusFront);
		*(cast(void**)&igBullet) = GetProcAddr(handle, "igBullet"); throwIf(!igBullet);
		*(cast(void**)&igBulletText) = GetProcAddr(handle, "igBulletText"); throwIf(!igBulletText);
		*(cast(void**)&igBulletTextV) = GetProcAddr(handle, "igBulletTextV"); throwIf(!igBulletTextV);
		*(cast(void**)&igButton) = GetProcAddr(handle, "igButton"); throwIf(!igButton);
		*(cast(void**)&igButtonBehavior) = GetProcAddr(handle, "igButtonBehavior"); throwIf(!igButtonBehavior);
		*(cast(void**)&igButtonEx) = GetProcAddr(handle, "igButtonEx"); throwIf(!igButtonEx);
		*(cast(void**)&igCalcItemSize) = GetProcAddr(handle, "igCalcItemSize"); throwIf(!igCalcItemSize);
		*(cast(void**)&igCalcItemWidth) = GetProcAddr(handle, "igCalcItemWidth"); throwIf(!igCalcItemWidth);
		*(cast(void**)&igCalcListClipping) = GetProcAddr(handle, "igCalcListClipping"); throwIf(!igCalcListClipping);
		*(cast(void**)&igCalcTextSize) = GetProcAddr(handle, "igCalcTextSize"); throwIf(!igCalcTextSize);
		*(cast(void**)&igCalcTypematicRepeatAmount) = GetProcAddr(handle, "igCalcTypematicRepeatAmount"); throwIf(!igCalcTypematicRepeatAmount);
		*(cast(void**)&igCalcWindowNextAutoFitSize) = GetProcAddr(handle, "igCalcWindowNextAutoFitSize"); throwIf(!igCalcWindowNextAutoFitSize);
		*(cast(void**)&igCalcWrapWidthForPos) = GetProcAddr(handle, "igCalcWrapWidthForPos"); throwIf(!igCalcWrapWidthForPos);
		*(cast(void**)&igCallContextHooks) = GetProcAddr(handle, "igCallContextHooks"); throwIf(!igCallContextHooks);
		*(cast(void**)&igCaptureKeyboardFromApp) = GetProcAddr(handle, "igCaptureKeyboardFromApp"); throwIf(!igCaptureKeyboardFromApp);
		*(cast(void**)&igCaptureMouseFromApp) = GetProcAddr(handle, "igCaptureMouseFromApp"); throwIf(!igCaptureMouseFromApp);
		*(cast(void**)&igCheckbox) = GetProcAddr(handle, "igCheckbox"); throwIf(!igCheckbox);
		*(cast(void**)&igCheckboxFlags_IntPtr) = GetProcAddr(handle, "igCheckboxFlags_IntPtr"); throwIf(!igCheckboxFlags_IntPtr);
		*(cast(void**)&igCheckboxFlags_S64Ptr) = GetProcAddr(handle, "igCheckboxFlags_S64Ptr"); throwIf(!igCheckboxFlags_S64Ptr);
		*(cast(void**)&igCheckboxFlags_U64Ptr) = GetProcAddr(handle, "igCheckboxFlags_U64Ptr"); throwIf(!igCheckboxFlags_U64Ptr);
		*(cast(void**)&igCheckboxFlags_UintPtr) = GetProcAddr(handle, "igCheckboxFlags_UintPtr"); throwIf(!igCheckboxFlags_UintPtr);
		*(cast(void**)&igClearActiveID) = GetProcAddr(handle, "igClearActiveID"); throwIf(!igClearActiveID);
		*(cast(void**)&igClearDragDrop) = GetProcAddr(handle, "igClearDragDrop"); throwIf(!igClearDragDrop);
		*(cast(void**)&igClearIniSettings) = GetProcAddr(handle, "igClearIniSettings"); throwIf(!igClearIniSettings);
		*(cast(void**)&igCloseButton) = GetProcAddr(handle, "igCloseButton"); throwIf(!igCloseButton);
		*(cast(void**)&igCloseCurrentPopup) = GetProcAddr(handle, "igCloseCurrentPopup"); throwIf(!igCloseCurrentPopup);
		*(cast(void**)&igClosePopupToLevel) = GetProcAddr(handle, "igClosePopupToLevel"); throwIf(!igClosePopupToLevel);
		*(cast(void**)&igClosePopupsOverWindow) = GetProcAddr(handle, "igClosePopupsOverWindow"); throwIf(!igClosePopupsOverWindow);
		*(cast(void**)&igCollapseButton) = GetProcAddr(handle, "igCollapseButton"); throwIf(!igCollapseButton);
		*(cast(void**)&igCollapsingHeader_BoolPtr) = GetProcAddr(handle, "igCollapsingHeader_BoolPtr"); throwIf(!igCollapsingHeader_BoolPtr);
		*(cast(void**)&igCollapsingHeader_TreeNodeFlags) = GetProcAddr(handle, "igCollapsingHeader_TreeNodeFlags"); throwIf(!igCollapsingHeader_TreeNodeFlags);
		*(cast(void**)&igColorButton) = GetProcAddr(handle, "igColorButton"); throwIf(!igColorButton);
		*(cast(void**)&igColorConvertFloat4ToU32) = GetProcAddr(handle, "igColorConvertFloat4ToU32"); throwIf(!igColorConvertFloat4ToU32);
		*(cast(void**)&igColorConvertHSVtoRGB) = GetProcAddr(handle, "igColorConvertHSVtoRGB"); throwIf(!igColorConvertHSVtoRGB);
		*(cast(void**)&igColorConvertRGBtoHSV) = GetProcAddr(handle, "igColorConvertRGBtoHSV"); throwIf(!igColorConvertRGBtoHSV);
		*(cast(void**)&igColorConvertU32ToFloat4) = GetProcAddr(handle, "igColorConvertU32ToFloat4"); throwIf(!igColorConvertU32ToFloat4);
		*(cast(void**)&igColorEdit3) = GetProcAddr(handle, "igColorEdit3"); throwIf(!igColorEdit3);
		*(cast(void**)&igColorEdit4) = GetProcAddr(handle, "igColorEdit4"); throwIf(!igColorEdit4);
		*(cast(void**)&igColorEditOptionsPopup) = GetProcAddr(handle, "igColorEditOptionsPopup"); throwIf(!igColorEditOptionsPopup);
		*(cast(void**)&igColorPicker3) = GetProcAddr(handle, "igColorPicker3"); throwIf(!igColorPicker3);
		*(cast(void**)&igColorPicker4) = GetProcAddr(handle, "igColorPicker4"); throwIf(!igColorPicker4);
		*(cast(void**)&igColorPickerOptionsPopup) = GetProcAddr(handle, "igColorPickerOptionsPopup"); throwIf(!igColorPickerOptionsPopup);
		*(cast(void**)&igColorTooltip) = GetProcAddr(handle, "igColorTooltip"); throwIf(!igColorTooltip);
		*(cast(void**)&igColumns) = GetProcAddr(handle, "igColumns"); throwIf(!igColumns);
		*(cast(void**)&igCombo_FnBoolPtr) = GetProcAddr(handle, "igCombo_FnBoolPtr"); throwIf(!igCombo_FnBoolPtr);
		*(cast(void**)&igCombo_Str) = GetProcAddr(handle, "igCombo_Str"); throwIf(!igCombo_Str);
		*(cast(void**)&igCombo_Str_arr) = GetProcAddr(handle, "igCombo_Str_arr"); throwIf(!igCombo_Str_arr);
		*(cast(void**)&igCreateContext) = GetProcAddr(handle, "igCreateContext"); throwIf(!igCreateContext);
		*(cast(void**)&igCreateNewWindowSettings) = GetProcAddr(handle, "igCreateNewWindowSettings"); throwIf(!igCreateNewWindowSettings);
		*(cast(void**)&igDataTypeApplyOp) = GetProcAddr(handle, "igDataTypeApplyOp"); throwIf(!igDataTypeApplyOp);
		*(cast(void**)&igDataTypeApplyOpFromText) = GetProcAddr(handle, "igDataTypeApplyOpFromText"); throwIf(!igDataTypeApplyOpFromText);
		*(cast(void**)&igDataTypeClamp) = GetProcAddr(handle, "igDataTypeClamp"); throwIf(!igDataTypeClamp);
		*(cast(void**)&igDataTypeCompare) = GetProcAddr(handle, "igDataTypeCompare"); throwIf(!igDataTypeCompare);
		*(cast(void**)&igDataTypeFormatString) = GetProcAddr(handle, "igDataTypeFormatString"); throwIf(!igDataTypeFormatString);
		*(cast(void**)&igDataTypeGetInfo) = GetProcAddr(handle, "igDataTypeGetInfo"); throwIf(!igDataTypeGetInfo);
		*(cast(void**)&igDebugCheckVersionAndDataLayout) = GetProcAddr(handle, "igDebugCheckVersionAndDataLayout"); throwIf(!igDebugCheckVersionAndDataLayout);
		*(cast(void**)&igDebugDrawItemRect) = GetProcAddr(handle, "igDebugDrawItemRect"); throwIf(!igDebugDrawItemRect);
		*(cast(void**)&igDebugNodeColumns) = GetProcAddr(handle, "igDebugNodeColumns"); throwIf(!igDebugNodeColumns);
		*(cast(void**)&igDebugNodeDrawCmdShowMeshAndBoundingBox) = GetProcAddr(handle, "igDebugNodeDrawCmdShowMeshAndBoundingBox"); throwIf(!igDebugNodeDrawCmdShowMeshAndBoundingBox);
		*(cast(void**)&igDebugNodeDrawList) = GetProcAddr(handle, "igDebugNodeDrawList"); throwIf(!igDebugNodeDrawList);
		*(cast(void**)&igDebugNodeStorage) = GetProcAddr(handle, "igDebugNodeStorage"); throwIf(!igDebugNodeStorage);
		*(cast(void**)&igDebugNodeTabBar) = GetProcAddr(handle, "igDebugNodeTabBar"); throwIf(!igDebugNodeTabBar);
		*(cast(void**)&igDebugNodeTable) = GetProcAddr(handle, "igDebugNodeTable"); throwIf(!igDebugNodeTable);
		*(cast(void**)&igDebugNodeTableSettings) = GetProcAddr(handle, "igDebugNodeTableSettings"); throwIf(!igDebugNodeTableSettings);
		*(cast(void**)&igDebugNodeViewport) = GetProcAddr(handle, "igDebugNodeViewport"); throwIf(!igDebugNodeViewport);
		*(cast(void**)&igDebugNodeWindow) = GetProcAddr(handle, "igDebugNodeWindow"); throwIf(!igDebugNodeWindow);
		*(cast(void**)&igDebugNodeWindowSettings) = GetProcAddr(handle, "igDebugNodeWindowSettings"); throwIf(!igDebugNodeWindowSettings);
		*(cast(void**)&igDebugNodeWindowsList) = GetProcAddr(handle, "igDebugNodeWindowsList"); throwIf(!igDebugNodeWindowsList);
		*(cast(void**)&igDebugRenderViewportThumbnail) = GetProcAddr(handle, "igDebugRenderViewportThumbnail"); throwIf(!igDebugRenderViewportThumbnail);
		*(cast(void**)&igDebugStartItemPicker) = GetProcAddr(handle, "igDebugStartItemPicker"); throwIf(!igDebugStartItemPicker);
		*(cast(void**)&igDestroyContext) = GetProcAddr(handle, "igDestroyContext"); throwIf(!igDestroyContext);
		*(cast(void**)&igDragBehavior) = GetProcAddr(handle, "igDragBehavior"); throwIf(!igDragBehavior);
		*(cast(void**)&igDragFloat) = GetProcAddr(handle, "igDragFloat"); throwIf(!igDragFloat);
		*(cast(void**)&igDragFloat2) = GetProcAddr(handle, "igDragFloat2"); throwIf(!igDragFloat2);
		*(cast(void**)&igDragFloat3) = GetProcAddr(handle, "igDragFloat3"); throwIf(!igDragFloat3);
		*(cast(void**)&igDragFloat4) = GetProcAddr(handle, "igDragFloat4"); throwIf(!igDragFloat4);
		*(cast(void**)&igDragFloatRange2) = GetProcAddr(handle, "igDragFloatRange2"); throwIf(!igDragFloatRange2);
		*(cast(void**)&igDragInt) = GetProcAddr(handle, "igDragInt"); throwIf(!igDragInt);
		*(cast(void**)&igDragInt2) = GetProcAddr(handle, "igDragInt2"); throwIf(!igDragInt2);
		*(cast(void**)&igDragInt3) = GetProcAddr(handle, "igDragInt3"); throwIf(!igDragInt3);
		*(cast(void**)&igDragInt4) = GetProcAddr(handle, "igDragInt4"); throwIf(!igDragInt4);
		*(cast(void**)&igDragIntRange2) = GetProcAddr(handle, "igDragIntRange2"); throwIf(!igDragIntRange2);
		*(cast(void**)&igDragScalar) = GetProcAddr(handle, "igDragScalar"); throwIf(!igDragScalar);
		*(cast(void**)&igDragScalarN) = GetProcAddr(handle, "igDragScalarN"); throwIf(!igDragScalarN);
		*(cast(void**)&igDummy) = GetProcAddr(handle, "igDummy"); throwIf(!igDummy);
		*(cast(void**)&igEnd) = GetProcAddr(handle, "igEnd"); throwIf(!igEnd);
		*(cast(void**)&igEndChild) = GetProcAddr(handle, "igEndChild"); throwIf(!igEndChild);
		*(cast(void**)&igEndChildFrame) = GetProcAddr(handle, "igEndChildFrame"); throwIf(!igEndChildFrame);
		*(cast(void**)&igEndColumns) = GetProcAddr(handle, "igEndColumns"); throwIf(!igEndColumns);
		*(cast(void**)&igEndCombo) = GetProcAddr(handle, "igEndCombo"); throwIf(!igEndCombo);
		*(cast(void**)&igEndDragDropSource) = GetProcAddr(handle, "igEndDragDropSource"); throwIf(!igEndDragDropSource);
		*(cast(void**)&igEndDragDropTarget) = GetProcAddr(handle, "igEndDragDropTarget"); throwIf(!igEndDragDropTarget);
		*(cast(void**)&igEndFrame) = GetProcAddr(handle, "igEndFrame"); throwIf(!igEndFrame);
		*(cast(void**)&igEndGroup) = GetProcAddr(handle, "igEndGroup"); throwIf(!igEndGroup);
		*(cast(void**)&igEndListBox) = GetProcAddr(handle, "igEndListBox"); throwIf(!igEndListBox);
		*(cast(void**)&igEndMainMenuBar) = GetProcAddr(handle, "igEndMainMenuBar"); throwIf(!igEndMainMenuBar);
		*(cast(void**)&igEndMenu) = GetProcAddr(handle, "igEndMenu"); throwIf(!igEndMenu);
		*(cast(void**)&igEndMenuBar) = GetProcAddr(handle, "igEndMenuBar"); throwIf(!igEndMenuBar);
		*(cast(void**)&igEndPopup) = GetProcAddr(handle, "igEndPopup"); throwIf(!igEndPopup);
		*(cast(void**)&igEndTabBar) = GetProcAddr(handle, "igEndTabBar"); throwIf(!igEndTabBar);
		*(cast(void**)&igEndTabItem) = GetProcAddr(handle, "igEndTabItem"); throwIf(!igEndTabItem);
		*(cast(void**)&igEndTable) = GetProcAddr(handle, "igEndTable"); throwIf(!igEndTable);
		*(cast(void**)&igEndTooltip) = GetProcAddr(handle, "igEndTooltip"); throwIf(!igEndTooltip);
		*(cast(void**)&igErrorCheckEndFrameRecover) = GetProcAddr(handle, "igErrorCheckEndFrameRecover"); throwIf(!igErrorCheckEndFrameRecover);
		*(cast(void**)&igFindBestWindowPosForPopup) = GetProcAddr(handle, "igFindBestWindowPosForPopup"); throwIf(!igFindBestWindowPosForPopup);
		*(cast(void**)&igFindBestWindowPosForPopupEx) = GetProcAddr(handle, "igFindBestWindowPosForPopupEx"); throwIf(!igFindBestWindowPosForPopupEx);
		*(cast(void**)&igFindOrCreateColumns) = GetProcAddr(handle, "igFindOrCreateColumns"); throwIf(!igFindOrCreateColumns);
		*(cast(void**)&igFindOrCreateWindowSettings) = GetProcAddr(handle, "igFindOrCreateWindowSettings"); throwIf(!igFindOrCreateWindowSettings);
		*(cast(void**)&igFindRenderedTextEnd) = GetProcAddr(handle, "igFindRenderedTextEnd"); throwIf(!igFindRenderedTextEnd);
		*(cast(void**)&igFindSettingsHandler) = GetProcAddr(handle, "igFindSettingsHandler"); throwIf(!igFindSettingsHandler);
		*(cast(void**)&igFindWindowByID) = GetProcAddr(handle, "igFindWindowByID"); throwIf(!igFindWindowByID);
		*(cast(void**)&igFindWindowByName) = GetProcAddr(handle, "igFindWindowByName"); throwIf(!igFindWindowByName);
		*(cast(void**)&igFindWindowSettings) = GetProcAddr(handle, "igFindWindowSettings"); throwIf(!igFindWindowSettings);
		*(cast(void**)&igFocusTopMostWindowUnderOne) = GetProcAddr(handle, "igFocusTopMostWindowUnderOne"); throwIf(!igFocusTopMostWindowUnderOne);
		*(cast(void**)&igFocusWindow) = GetProcAddr(handle, "igFocusWindow"); throwIf(!igFocusWindow);
		*(cast(void**)&igFocusableItemRegister) = GetProcAddr(handle, "igFocusableItemRegister"); throwIf(!igFocusableItemRegister);
		*(cast(void**)&igFocusableItemUnregister) = GetProcAddr(handle, "igFocusableItemUnregister"); throwIf(!igFocusableItemUnregister);
		*(cast(void**)&igGET_FLT_MAX) = GetProcAddr(handle, "igGET_FLT_MAX"); throwIf(!igGET_FLT_MAX);
		*(cast(void**)&igGET_FLT_MIN) = GetProcAddr(handle, "igGET_FLT_MIN"); throwIf(!igGET_FLT_MIN);
		*(cast(void**)&igGcAwakeTransientWindowBuffers) = GetProcAddr(handle, "igGcAwakeTransientWindowBuffers"); throwIf(!igGcAwakeTransientWindowBuffers);
		*(cast(void**)&igGcCompactTransientMiscBuffers) = GetProcAddr(handle, "igGcCompactTransientMiscBuffers"); throwIf(!igGcCompactTransientMiscBuffers);
		*(cast(void**)&igGcCompactTransientWindowBuffers) = GetProcAddr(handle, "igGcCompactTransientWindowBuffers"); throwIf(!igGcCompactTransientWindowBuffers);
		*(cast(void**)&igGetActiveID) = GetProcAddr(handle, "igGetActiveID"); throwIf(!igGetActiveID);
		*(cast(void**)&igGetAllocatorFunctions) = GetProcAddr(handle, "igGetAllocatorFunctions"); throwIf(!igGetAllocatorFunctions);
		*(cast(void**)&igGetBackgroundDrawList_Nil) = GetProcAddr(handle, "igGetBackgroundDrawList_Nil"); throwIf(!igGetBackgroundDrawList_Nil);
		*(cast(void**)&igGetBackgroundDrawList_ViewportPtr) = GetProcAddr(handle, "igGetBackgroundDrawList_ViewportPtr"); throwIf(!igGetBackgroundDrawList_ViewportPtr);
		*(cast(void**)&igGetClipboardText) = GetProcAddr(handle, "igGetClipboardText"); throwIf(!igGetClipboardText);
		*(cast(void**)&igGetColorU32_Col) = GetProcAddr(handle, "igGetColorU32_Col"); throwIf(!igGetColorU32_Col);
		*(cast(void**)&igGetColorU32_U32) = GetProcAddr(handle, "igGetColorU32_U32"); throwIf(!igGetColorU32_U32);
		*(cast(void**)&igGetColorU32_Vec4) = GetProcAddr(handle, "igGetColorU32_Vec4"); throwIf(!igGetColorU32_Vec4);
		*(cast(void**)&igGetColumnIndex) = GetProcAddr(handle, "igGetColumnIndex"); throwIf(!igGetColumnIndex);
		*(cast(void**)&igGetColumnNormFromOffset) = GetProcAddr(handle, "igGetColumnNormFromOffset"); throwIf(!igGetColumnNormFromOffset);
		*(cast(void**)&igGetColumnOffset) = GetProcAddr(handle, "igGetColumnOffset"); throwIf(!igGetColumnOffset);
		*(cast(void**)&igGetColumnOffsetFromNorm) = GetProcAddr(handle, "igGetColumnOffsetFromNorm"); throwIf(!igGetColumnOffsetFromNorm);
		*(cast(void**)&igGetColumnWidth) = GetProcAddr(handle, "igGetColumnWidth"); throwIf(!igGetColumnWidth);
		*(cast(void**)&igGetColumnsCount) = GetProcAddr(handle, "igGetColumnsCount"); throwIf(!igGetColumnsCount);
		*(cast(void**)&igGetColumnsID) = GetProcAddr(handle, "igGetColumnsID"); throwIf(!igGetColumnsID);
		*(cast(void**)&igGetContentRegionAvail) = GetProcAddr(handle, "igGetContentRegionAvail"); throwIf(!igGetContentRegionAvail);
		*(cast(void**)&igGetContentRegionMax) = GetProcAddr(handle, "igGetContentRegionMax"); throwIf(!igGetContentRegionMax);
		*(cast(void**)&igGetContentRegionMaxAbs) = GetProcAddr(handle, "igGetContentRegionMaxAbs"); throwIf(!igGetContentRegionMaxAbs);
		*(cast(void**)&igGetCurrentContext) = GetProcAddr(handle, "igGetCurrentContext"); throwIf(!igGetCurrentContext);
		*(cast(void**)&igGetCurrentTable) = GetProcAddr(handle, "igGetCurrentTable"); throwIf(!igGetCurrentTable);
		*(cast(void**)&igGetCurrentWindow) = GetProcAddr(handle, "igGetCurrentWindow"); throwIf(!igGetCurrentWindow);
		*(cast(void**)&igGetCurrentWindowRead) = GetProcAddr(handle, "igGetCurrentWindowRead"); throwIf(!igGetCurrentWindowRead);
		*(cast(void**)&igGetCursorPos) = GetProcAddr(handle, "igGetCursorPos"); throwIf(!igGetCursorPos);
		*(cast(void**)&igGetCursorPosX) = GetProcAddr(handle, "igGetCursorPosX"); throwIf(!igGetCursorPosX);
		*(cast(void**)&igGetCursorPosY) = GetProcAddr(handle, "igGetCursorPosY"); throwIf(!igGetCursorPosY);
		*(cast(void**)&igGetCursorScreenPos) = GetProcAddr(handle, "igGetCursorScreenPos"); throwIf(!igGetCursorScreenPos);
		*(cast(void**)&igGetCursorStartPos) = GetProcAddr(handle, "igGetCursorStartPos"); throwIf(!igGetCursorStartPos);
		*(cast(void**)&igGetDefaultFont) = GetProcAddr(handle, "igGetDefaultFont"); throwIf(!igGetDefaultFont);
		*(cast(void**)&igGetDragDropPayload) = GetProcAddr(handle, "igGetDragDropPayload"); throwIf(!igGetDragDropPayload);
		*(cast(void**)&igGetDrawData) = GetProcAddr(handle, "igGetDrawData"); throwIf(!igGetDrawData);
		*(cast(void**)&igGetDrawListSharedData) = GetProcAddr(handle, "igGetDrawListSharedData"); throwIf(!igGetDrawListSharedData);
		*(cast(void**)&igGetFocusID) = GetProcAddr(handle, "igGetFocusID"); throwIf(!igGetFocusID);
		*(cast(void**)&igGetFocusScope) = GetProcAddr(handle, "igGetFocusScope"); throwIf(!igGetFocusScope);
		*(cast(void**)&igGetFocusedFocusScope) = GetProcAddr(handle, "igGetFocusedFocusScope"); throwIf(!igGetFocusedFocusScope);
		*(cast(void**)&igGetFont) = GetProcAddr(handle, "igGetFont"); throwIf(!igGetFont);
		*(cast(void**)&igGetFontSize) = GetProcAddr(handle, "igGetFontSize"); throwIf(!igGetFontSize);
		*(cast(void**)&igGetFontTexUvWhitePixel) = GetProcAddr(handle, "igGetFontTexUvWhitePixel"); throwIf(!igGetFontTexUvWhitePixel);
		*(cast(void**)&igGetForegroundDrawList_Nil) = GetProcAddr(handle, "igGetForegroundDrawList_Nil"); throwIf(!igGetForegroundDrawList_Nil);
		*(cast(void**)&igGetForegroundDrawList_ViewportPtr) = GetProcAddr(handle, "igGetForegroundDrawList_ViewportPtr"); throwIf(!igGetForegroundDrawList_ViewportPtr);
		*(cast(void**)&igGetForegroundDrawList_WindowPtr) = GetProcAddr(handle, "igGetForegroundDrawList_WindowPtr"); throwIf(!igGetForegroundDrawList_WindowPtr);
		*(cast(void**)&igGetFrameCount) = GetProcAddr(handle, "igGetFrameCount"); throwIf(!igGetFrameCount);
		*(cast(void**)&igGetFrameHeight) = GetProcAddr(handle, "igGetFrameHeight"); throwIf(!igGetFrameHeight);
		*(cast(void**)&igGetFrameHeightWithSpacing) = GetProcAddr(handle, "igGetFrameHeightWithSpacing"); throwIf(!igGetFrameHeightWithSpacing);
		*(cast(void**)&igGetHoveredID) = GetProcAddr(handle, "igGetHoveredID"); throwIf(!igGetHoveredID);
		*(cast(void**)&igGetIDWithSeed) = GetProcAddr(handle, "igGetIDWithSeed"); throwIf(!igGetIDWithSeed);
		*(cast(void**)&igGetID_Ptr) = GetProcAddr(handle, "igGetID_Ptr"); throwIf(!igGetID_Ptr);
		*(cast(void**)&igGetID_Str) = GetProcAddr(handle, "igGetID_Str"); throwIf(!igGetID_Str);
		*(cast(void**)&igGetID_StrStr) = GetProcAddr(handle, "igGetID_StrStr"); throwIf(!igGetID_StrStr);
		*(cast(void**)&igGetIO) = GetProcAddr(handle, "igGetIO"); throwIf(!igGetIO);
		*(cast(void**)&igGetInputTextState) = GetProcAddr(handle, "igGetInputTextState"); throwIf(!igGetInputTextState);
		*(cast(void**)&igGetItemID) = GetProcAddr(handle, "igGetItemID"); throwIf(!igGetItemID);
		*(cast(void**)&igGetItemRectMax) = GetProcAddr(handle, "igGetItemRectMax"); throwIf(!igGetItemRectMax);
		*(cast(void**)&igGetItemRectMin) = GetProcAddr(handle, "igGetItemRectMin"); throwIf(!igGetItemRectMin);
		*(cast(void**)&igGetItemRectSize) = GetProcAddr(handle, "igGetItemRectSize"); throwIf(!igGetItemRectSize);
		*(cast(void**)&igGetItemStatusFlags) = GetProcAddr(handle, "igGetItemStatusFlags"); throwIf(!igGetItemStatusFlags);
		*(cast(void**)&igGetItemsFlags) = GetProcAddr(handle, "igGetItemsFlags"); throwIf(!igGetItemsFlags);
		*(cast(void**)&igGetKeyIndex) = GetProcAddr(handle, "igGetKeyIndex"); throwIf(!igGetKeyIndex);
		*(cast(void**)&igGetKeyPressedAmount) = GetProcAddr(handle, "igGetKeyPressedAmount"); throwIf(!igGetKeyPressedAmount);
		*(cast(void**)&igGetMainViewport) = GetProcAddr(handle, "igGetMainViewport"); throwIf(!igGetMainViewport);
		*(cast(void**)&igGetMergedKeyModFlags) = GetProcAddr(handle, "igGetMergedKeyModFlags"); throwIf(!igGetMergedKeyModFlags);
		*(cast(void**)&igGetMouseCursor) = GetProcAddr(handle, "igGetMouseCursor"); throwIf(!igGetMouseCursor);
		*(cast(void**)&igGetMouseDragDelta) = GetProcAddr(handle, "igGetMouseDragDelta"); throwIf(!igGetMouseDragDelta);
		*(cast(void**)&igGetMousePos) = GetProcAddr(handle, "igGetMousePos"); throwIf(!igGetMousePos);
		*(cast(void**)&igGetMousePosOnOpeningCurrentPopup) = GetProcAddr(handle, "igGetMousePosOnOpeningCurrentPopup"); throwIf(!igGetMousePosOnOpeningCurrentPopup);
		*(cast(void**)&igGetNavInputAmount) = GetProcAddr(handle, "igGetNavInputAmount"); throwIf(!igGetNavInputAmount);
		*(cast(void**)&igGetNavInputAmount2d) = GetProcAddr(handle, "igGetNavInputAmount2d"); throwIf(!igGetNavInputAmount2d);
		*(cast(void**)&igGetScrollMaxX) = GetProcAddr(handle, "igGetScrollMaxX"); throwIf(!igGetScrollMaxX);
		*(cast(void**)&igGetScrollMaxY) = GetProcAddr(handle, "igGetScrollMaxY"); throwIf(!igGetScrollMaxY);
		*(cast(void**)&igGetScrollX) = GetProcAddr(handle, "igGetScrollX"); throwIf(!igGetScrollX);
		*(cast(void**)&igGetScrollY) = GetProcAddr(handle, "igGetScrollY"); throwIf(!igGetScrollY);
		*(cast(void**)&igGetStateStorage) = GetProcAddr(handle, "igGetStateStorage"); throwIf(!igGetStateStorage);
		*(cast(void**)&igGetStyle) = GetProcAddr(handle, "igGetStyle"); throwIf(!igGetStyle);
		*(cast(void**)&igGetStyleColorName) = GetProcAddr(handle, "igGetStyleColorName"); throwIf(!igGetStyleColorName);
		*(cast(void**)&igGetStyleColorVec4) = GetProcAddr(handle, "igGetStyleColorVec4"); throwIf(!igGetStyleColorVec4);
		*(cast(void**)&igGetTextLineHeight) = GetProcAddr(handle, "igGetTextLineHeight"); throwIf(!igGetTextLineHeight);
		*(cast(void**)&igGetTextLineHeightWithSpacing) = GetProcAddr(handle, "igGetTextLineHeightWithSpacing"); throwIf(!igGetTextLineHeightWithSpacing);
		*(cast(void**)&igGetTime) = GetProcAddr(handle, "igGetTime"); throwIf(!igGetTime);
		*(cast(void**)&igGetTopMostPopupModal) = GetProcAddr(handle, "igGetTopMostPopupModal"); throwIf(!igGetTopMostPopupModal);
		*(cast(void**)&igGetTreeNodeToLabelSpacing) = GetProcAddr(handle, "igGetTreeNodeToLabelSpacing"); throwIf(!igGetTreeNodeToLabelSpacing);
		*(cast(void**)&igGetVersion) = GetProcAddr(handle, "igGetVersion"); throwIf(!igGetVersion);
		*(cast(void**)&igGetWindowAllowedExtentRect) = GetProcAddr(handle, "igGetWindowAllowedExtentRect"); throwIf(!igGetWindowAllowedExtentRect);
		*(cast(void**)&igGetWindowContentRegionMax) = GetProcAddr(handle, "igGetWindowContentRegionMax"); throwIf(!igGetWindowContentRegionMax);
		*(cast(void**)&igGetWindowContentRegionMin) = GetProcAddr(handle, "igGetWindowContentRegionMin"); throwIf(!igGetWindowContentRegionMin);
		*(cast(void**)&igGetWindowContentRegionWidth) = GetProcAddr(handle, "igGetWindowContentRegionWidth"); throwIf(!igGetWindowContentRegionWidth);
		*(cast(void**)&igGetWindowDrawList) = GetProcAddr(handle, "igGetWindowDrawList"); throwIf(!igGetWindowDrawList);
		*(cast(void**)&igGetWindowHeight) = GetProcAddr(handle, "igGetWindowHeight"); throwIf(!igGetWindowHeight);
		*(cast(void**)&igGetWindowPos) = GetProcAddr(handle, "igGetWindowPos"); throwIf(!igGetWindowPos);
		*(cast(void**)&igGetWindowResizeID) = GetProcAddr(handle, "igGetWindowResizeID"); throwIf(!igGetWindowResizeID);
		*(cast(void**)&igGetWindowScrollbarID) = GetProcAddr(handle, "igGetWindowScrollbarID"); throwIf(!igGetWindowScrollbarID);
		*(cast(void**)&igGetWindowScrollbarRect) = GetProcAddr(handle, "igGetWindowScrollbarRect"); throwIf(!igGetWindowScrollbarRect);
		*(cast(void**)&igGetWindowSize) = GetProcAddr(handle, "igGetWindowSize"); throwIf(!igGetWindowSize);
		*(cast(void**)&igGetWindowWidth) = GetProcAddr(handle, "igGetWindowWidth"); throwIf(!igGetWindowWidth);
		*(cast(void**)&igImAbs_Float) = GetProcAddr(handle, "igImAbs_Float"); throwIf(!igImAbs_Float);
		*(cast(void**)&igImAbs_double) = GetProcAddr(handle, "igImAbs_double"); throwIf(!igImAbs_double);
		*(cast(void**)&igImAlphaBlendColors) = GetProcAddr(handle, "igImAlphaBlendColors"); throwIf(!igImAlphaBlendColors);
		*(cast(void**)&igImBezierCubicCalc) = GetProcAddr(handle, "igImBezierCubicCalc"); throwIf(!igImBezierCubicCalc);
		*(cast(void**)&igImBezierCubicClosestPoint) = GetProcAddr(handle, "igImBezierCubicClosestPoint"); throwIf(!igImBezierCubicClosestPoint);
		*(cast(void**)&igImBezierCubicClosestPointCasteljau) = GetProcAddr(handle, "igImBezierCubicClosestPointCasteljau"); throwIf(!igImBezierCubicClosestPointCasteljau);
		*(cast(void**)&igImBezierQuadraticCalc) = GetProcAddr(handle, "igImBezierQuadraticCalc"); throwIf(!igImBezierQuadraticCalc);
		*(cast(void**)&igImBitArrayClearBit) = GetProcAddr(handle, "igImBitArrayClearBit"); throwIf(!igImBitArrayClearBit);
		*(cast(void**)&igImBitArraySetBit) = GetProcAddr(handle, "igImBitArraySetBit"); throwIf(!igImBitArraySetBit);
		*(cast(void**)&igImBitArraySetBitRange) = GetProcAddr(handle, "igImBitArraySetBitRange"); throwIf(!igImBitArraySetBitRange);
		*(cast(void**)&igImBitArrayTestBit) = GetProcAddr(handle, "igImBitArrayTestBit"); throwIf(!igImBitArrayTestBit);
		*(cast(void**)&igImCharIsBlankA) = GetProcAddr(handle, "igImCharIsBlankA"); throwIf(!igImCharIsBlankA);
		*(cast(void**)&igImCharIsBlankW) = GetProcAddr(handle, "igImCharIsBlankW"); throwIf(!igImCharIsBlankW);
		*(cast(void**)&igImClamp) = GetProcAddr(handle, "igImClamp"); throwIf(!igImClamp);
		*(cast(void**)&igImDot) = GetProcAddr(handle, "igImDot"); throwIf(!igImDot);
		*(cast(void**)&igImFileClose) = GetProcAddr(handle, "igImFileClose"); throwIf(!igImFileClose);
		*(cast(void**)&igImFileGetSize) = GetProcAddr(handle, "igImFileGetSize"); throwIf(!igImFileGetSize);
		*(cast(void**)&igImFileLoadToMemory) = GetProcAddr(handle, "igImFileLoadToMemory"); throwIf(!igImFileLoadToMemory);
		*(cast(void**)&igImFileOpen) = GetProcAddr(handle, "igImFileOpen"); throwIf(!igImFileOpen);
		*(cast(void**)&igImFileRead) = GetProcAddr(handle, "igImFileRead"); throwIf(!igImFileRead);
		*(cast(void**)&igImFileWrite) = GetProcAddr(handle, "igImFileWrite"); throwIf(!igImFileWrite);
		*(cast(void**)&igImFloor_Float) = GetProcAddr(handle, "igImFloor_Float"); throwIf(!igImFloor_Float);
		*(cast(void**)&igImFloor_Vec2) = GetProcAddr(handle, "igImFloor_Vec2"); throwIf(!igImFloor_Vec2);
		*(cast(void**)&igImFontAtlasBuildFinish) = GetProcAddr(handle, "igImFontAtlasBuildFinish"); throwIf(!igImFontAtlasBuildFinish);
		*(cast(void**)&igImFontAtlasBuildInit) = GetProcAddr(handle, "igImFontAtlasBuildInit"); throwIf(!igImFontAtlasBuildInit);
		*(cast(void**)&igImFontAtlasBuildMultiplyCalcLookupTable) = GetProcAddr(handle, "igImFontAtlasBuildMultiplyCalcLookupTable"); throwIf(!igImFontAtlasBuildMultiplyCalcLookupTable);
		*(cast(void**)&igImFontAtlasBuildMultiplyRectAlpha8) = GetProcAddr(handle, "igImFontAtlasBuildMultiplyRectAlpha8"); throwIf(!igImFontAtlasBuildMultiplyRectAlpha8);
		*(cast(void**)&igImFontAtlasBuildPackCustomRects) = GetProcAddr(handle, "igImFontAtlasBuildPackCustomRects"); throwIf(!igImFontAtlasBuildPackCustomRects);
		*(cast(void**)&igImFontAtlasBuildRender32bppRectFromString) = GetProcAddr(handle, "igImFontAtlasBuildRender32bppRectFromString"); throwIf(!igImFontAtlasBuildRender32bppRectFromString);
		*(cast(void**)&igImFontAtlasBuildRender8bppRectFromString) = GetProcAddr(handle, "igImFontAtlasBuildRender8bppRectFromString"); throwIf(!igImFontAtlasBuildRender8bppRectFromString);
		*(cast(void**)&igImFontAtlasBuildSetupFont) = GetProcAddr(handle, "igImFontAtlasBuildSetupFont"); throwIf(!igImFontAtlasBuildSetupFont);
		*(cast(void**)&igImFontAtlasGetBuilderForStbTruetype) = GetProcAddr(handle, "igImFontAtlasGetBuilderForStbTruetype"); throwIf(!igImFontAtlasGetBuilderForStbTruetype);
		*(cast(void**)&igImFormatString) = GetProcAddr(handle, "igImFormatString"); throwIf(!igImFormatString);
		*(cast(void**)&igImFormatStringV) = GetProcAddr(handle, "igImFormatStringV"); throwIf(!igImFormatStringV);
		*(cast(void**)&igImGetDirQuadrantFromDelta) = GetProcAddr(handle, "igImGetDirQuadrantFromDelta"); throwIf(!igImGetDirQuadrantFromDelta);
		*(cast(void**)&igImHashData) = GetProcAddr(handle, "igImHashData"); throwIf(!igImHashData);
		*(cast(void**)&igImHashStr) = GetProcAddr(handle, "igImHashStr"); throwIf(!igImHashStr);
		*(cast(void**)&igImInvLength) = GetProcAddr(handle, "igImInvLength"); throwIf(!igImInvLength);
		*(cast(void**)&igImIsPowerOfTwo_Int) = GetProcAddr(handle, "igImIsPowerOfTwo_Int"); throwIf(!igImIsPowerOfTwo_Int);
		*(cast(void**)&igImIsPowerOfTwo_U64) = GetProcAddr(handle, "igImIsPowerOfTwo_U64"); throwIf(!igImIsPowerOfTwo_U64);
		*(cast(void**)&igImLengthSqr_Vec2) = GetProcAddr(handle, "igImLengthSqr_Vec2"); throwIf(!igImLengthSqr_Vec2);
		*(cast(void**)&igImLengthSqr_Vec4) = GetProcAddr(handle, "igImLengthSqr_Vec4"); throwIf(!igImLengthSqr_Vec4);
		*(cast(void**)&igImLerp_Vec2Float) = GetProcAddr(handle, "igImLerp_Vec2Float"); throwIf(!igImLerp_Vec2Float);
		*(cast(void**)&igImLerp_Vec2Vec2) = GetProcAddr(handle, "igImLerp_Vec2Vec2"); throwIf(!igImLerp_Vec2Vec2);
		*(cast(void**)&igImLerp_Vec4) = GetProcAddr(handle, "igImLerp_Vec4"); throwIf(!igImLerp_Vec4);
		*(cast(void**)&igImLineClosestPoint) = GetProcAddr(handle, "igImLineClosestPoint"); throwIf(!igImLineClosestPoint);
		*(cast(void**)&igImLinearSweep) = GetProcAddr(handle, "igImLinearSweep"); throwIf(!igImLinearSweep);
		*(cast(void**)&igImLog_Float) = GetProcAddr(handle, "igImLog_Float"); throwIf(!igImLog_Float);
		*(cast(void**)&igImLog_double) = GetProcAddr(handle, "igImLog_double"); throwIf(!igImLog_double);
		*(cast(void**)&igImMax) = GetProcAddr(handle, "igImMax"); throwIf(!igImMax);
		*(cast(void**)&igImMin) = GetProcAddr(handle, "igImMin"); throwIf(!igImMin);
		*(cast(void**)&igImModPositive) = GetProcAddr(handle, "igImModPositive"); throwIf(!igImModPositive);
		*(cast(void**)&igImMul) = GetProcAddr(handle, "igImMul"); throwIf(!igImMul);
		*(cast(void**)&igImParseFormatFindEnd) = GetProcAddr(handle, "igImParseFormatFindEnd"); throwIf(!igImParseFormatFindEnd);
		*(cast(void**)&igImParseFormatFindStart) = GetProcAddr(handle, "igImParseFormatFindStart"); throwIf(!igImParseFormatFindStart);
		*(cast(void**)&igImParseFormatPrecision) = GetProcAddr(handle, "igImParseFormatPrecision"); throwIf(!igImParseFormatPrecision);
		*(cast(void**)&igImParseFormatTrimDecorations) = GetProcAddr(handle, "igImParseFormatTrimDecorations"); throwIf(!igImParseFormatTrimDecorations);
		*(cast(void**)&igImPow_Float) = GetProcAddr(handle, "igImPow_Float"); throwIf(!igImPow_Float);
		*(cast(void**)&igImPow_double) = GetProcAddr(handle, "igImPow_double"); throwIf(!igImPow_double);
		*(cast(void**)&igImRotate) = GetProcAddr(handle, "igImRotate"); throwIf(!igImRotate);
		*(cast(void**)&igImSaturate) = GetProcAddr(handle, "igImSaturate"); throwIf(!igImSaturate);
		*(cast(void**)&igImSign_Float) = GetProcAddr(handle, "igImSign_Float"); throwIf(!igImSign_Float);
		*(cast(void**)&igImSign_double) = GetProcAddr(handle, "igImSign_double"); throwIf(!igImSign_double);
		*(cast(void**)&igImStrSkipBlank) = GetProcAddr(handle, "igImStrSkipBlank"); throwIf(!igImStrSkipBlank);
		*(cast(void**)&igImStrTrimBlanks) = GetProcAddr(handle, "igImStrTrimBlanks"); throwIf(!igImStrTrimBlanks);
		*(cast(void**)&igImStrbolW) = GetProcAddr(handle, "igImStrbolW"); throwIf(!igImStrbolW);
		*(cast(void**)&igImStrchrRange) = GetProcAddr(handle, "igImStrchrRange"); throwIf(!igImStrchrRange);
		*(cast(void**)&igImStrdup) = GetProcAddr(handle, "igImStrdup"); throwIf(!igImStrdup);
		*(cast(void**)&igImStrdupcpy) = GetProcAddr(handle, "igImStrdupcpy"); throwIf(!igImStrdupcpy);
		*(cast(void**)&igImStreolRange) = GetProcAddr(handle, "igImStreolRange"); throwIf(!igImStreolRange);
		*(cast(void**)&igImStricmp) = GetProcAddr(handle, "igImStricmp"); throwIf(!igImStricmp);
		*(cast(void**)&igImStristr) = GetProcAddr(handle, "igImStristr"); throwIf(!igImStristr);
		*(cast(void**)&igImStrlenW) = GetProcAddr(handle, "igImStrlenW"); throwIf(!igImStrlenW);
		*(cast(void**)&igImStrncpy) = GetProcAddr(handle, "igImStrncpy"); throwIf(!igImStrncpy);
		*(cast(void**)&igImStrnicmp) = GetProcAddr(handle, "igImStrnicmp"); throwIf(!igImStrnicmp);
		*(cast(void**)&igImTextCharFromUtf8) = GetProcAddr(handle, "igImTextCharFromUtf8"); throwIf(!igImTextCharFromUtf8);
		*(cast(void**)&igImTextCountCharsFromUtf8) = GetProcAddr(handle, "igImTextCountCharsFromUtf8"); throwIf(!igImTextCountCharsFromUtf8);
		*(cast(void**)&igImTextCountUtf8BytesFromChar) = GetProcAddr(handle, "igImTextCountUtf8BytesFromChar"); throwIf(!igImTextCountUtf8BytesFromChar);
		*(cast(void**)&igImTextCountUtf8BytesFromStr) = GetProcAddr(handle, "igImTextCountUtf8BytesFromStr"); throwIf(!igImTextCountUtf8BytesFromStr);
		*(cast(void**)&igImTextStrFromUtf8) = GetProcAddr(handle, "igImTextStrFromUtf8"); throwIf(!igImTextStrFromUtf8);
		*(cast(void**)&igImTextStrToUtf8) = GetProcAddr(handle, "igImTextStrToUtf8"); throwIf(!igImTextStrToUtf8);
		*(cast(void**)&igImTriangleArea) = GetProcAddr(handle, "igImTriangleArea"); throwIf(!igImTriangleArea);
		*(cast(void**)&igImTriangleBarycentricCoords) = GetProcAddr(handle, "igImTriangleBarycentricCoords"); throwIf(!igImTriangleBarycentricCoords);
		*(cast(void**)&igImTriangleClosestPoint) = GetProcAddr(handle, "igImTriangleClosestPoint"); throwIf(!igImTriangleClosestPoint);
		*(cast(void**)&igImTriangleContainsPoint) = GetProcAddr(handle, "igImTriangleContainsPoint"); throwIf(!igImTriangleContainsPoint);
		*(cast(void**)&igImUpperPowerOfTwo) = GetProcAddr(handle, "igImUpperPowerOfTwo"); throwIf(!igImUpperPowerOfTwo);
		*(cast(void**)&igImage) = GetProcAddr(handle, "igImage"); throwIf(!igImage);
		*(cast(void**)&igImageButton) = GetProcAddr(handle, "igImageButton"); throwIf(!igImageButton);
		*(cast(void**)&igImageButtonEx) = GetProcAddr(handle, "igImageButtonEx"); throwIf(!igImageButtonEx);
		*(cast(void**)&igIndent) = GetProcAddr(handle, "igIndent"); throwIf(!igIndent);
		*(cast(void**)&igInitialize) = GetProcAddr(handle, "igInitialize"); throwIf(!igInitialize);
		*(cast(void**)&igInputDouble) = GetProcAddr(handle, "igInputDouble"); throwIf(!igInputDouble);
		*(cast(void**)&igInputFloat) = GetProcAddr(handle, "igInputFloat"); throwIf(!igInputFloat);
		*(cast(void**)&igInputFloat2) = GetProcAddr(handle, "igInputFloat2"); throwIf(!igInputFloat2);
		*(cast(void**)&igInputFloat3) = GetProcAddr(handle, "igInputFloat3"); throwIf(!igInputFloat3);
		*(cast(void**)&igInputFloat4) = GetProcAddr(handle, "igInputFloat4"); throwIf(!igInputFloat4);
		*(cast(void**)&igInputInt) = GetProcAddr(handle, "igInputInt"); throwIf(!igInputInt);
		*(cast(void**)&igInputInt2) = GetProcAddr(handle, "igInputInt2"); throwIf(!igInputInt2);
		*(cast(void**)&igInputInt3) = GetProcAddr(handle, "igInputInt3"); throwIf(!igInputInt3);
		*(cast(void**)&igInputInt4) = GetProcAddr(handle, "igInputInt4"); throwIf(!igInputInt4);
		*(cast(void**)&igInputScalar) = GetProcAddr(handle, "igInputScalar"); throwIf(!igInputScalar);
		*(cast(void**)&igInputScalarN) = GetProcAddr(handle, "igInputScalarN"); throwIf(!igInputScalarN);
		*(cast(void**)&igInputText) = GetProcAddr(handle, "igInputText"); throwIf(!igInputText);
		*(cast(void**)&igInputTextEx) = GetProcAddr(handle, "igInputTextEx"); throwIf(!igInputTextEx);
		*(cast(void**)&igInputTextMultiline) = GetProcAddr(handle, "igInputTextMultiline"); throwIf(!igInputTextMultiline);
		*(cast(void**)&igInputTextWithHint) = GetProcAddr(handle, "igInputTextWithHint"); throwIf(!igInputTextWithHint);
		*(cast(void**)&igInvisibleButton) = GetProcAddr(handle, "igInvisibleButton"); throwIf(!igInvisibleButton);
		*(cast(void**)&igIsActiveIdUsingKey) = GetProcAddr(handle, "igIsActiveIdUsingKey"); throwIf(!igIsActiveIdUsingKey);
		*(cast(void**)&igIsActiveIdUsingNavDir) = GetProcAddr(handle, "igIsActiveIdUsingNavDir"); throwIf(!igIsActiveIdUsingNavDir);
		*(cast(void**)&igIsActiveIdUsingNavInput) = GetProcAddr(handle, "igIsActiveIdUsingNavInput"); throwIf(!igIsActiveIdUsingNavInput);
		*(cast(void**)&igIsAnyItemActive) = GetProcAddr(handle, "igIsAnyItemActive"); throwIf(!igIsAnyItemActive);
		*(cast(void**)&igIsAnyItemFocused) = GetProcAddr(handle, "igIsAnyItemFocused"); throwIf(!igIsAnyItemFocused);
		*(cast(void**)&igIsAnyItemHovered) = GetProcAddr(handle, "igIsAnyItemHovered"); throwIf(!igIsAnyItemHovered);
		*(cast(void**)&igIsAnyMouseDown) = GetProcAddr(handle, "igIsAnyMouseDown"); throwIf(!igIsAnyMouseDown);
		*(cast(void**)&igIsClippedEx) = GetProcAddr(handle, "igIsClippedEx"); throwIf(!igIsClippedEx);
		*(cast(void**)&igIsDragDropPayloadBeingAccepted) = GetProcAddr(handle, "igIsDragDropPayloadBeingAccepted"); throwIf(!igIsDragDropPayloadBeingAccepted);
		*(cast(void**)&igIsItemActivated) = GetProcAddr(handle, "igIsItemActivated"); throwIf(!igIsItemActivated);
		*(cast(void**)&igIsItemActive) = GetProcAddr(handle, "igIsItemActive"); throwIf(!igIsItemActive);
		*(cast(void**)&igIsItemClicked) = GetProcAddr(handle, "igIsItemClicked"); throwIf(!igIsItemClicked);
		*(cast(void**)&igIsItemDeactivated) = GetProcAddr(handle, "igIsItemDeactivated"); throwIf(!igIsItemDeactivated);
		*(cast(void**)&igIsItemDeactivatedAfterEdit) = GetProcAddr(handle, "igIsItemDeactivatedAfterEdit"); throwIf(!igIsItemDeactivatedAfterEdit);
		*(cast(void**)&igIsItemEdited) = GetProcAddr(handle, "igIsItemEdited"); throwIf(!igIsItemEdited);
		*(cast(void**)&igIsItemFocused) = GetProcAddr(handle, "igIsItemFocused"); throwIf(!igIsItemFocused);
		*(cast(void**)&igIsItemHovered) = GetProcAddr(handle, "igIsItemHovered"); throwIf(!igIsItemHovered);
		*(cast(void**)&igIsItemToggledOpen) = GetProcAddr(handle, "igIsItemToggledOpen"); throwIf(!igIsItemToggledOpen);
		*(cast(void**)&igIsItemToggledSelection) = GetProcAddr(handle, "igIsItemToggledSelection"); throwIf(!igIsItemToggledSelection);
		*(cast(void**)&igIsItemVisible) = GetProcAddr(handle, "igIsItemVisible"); throwIf(!igIsItemVisible);
		*(cast(void**)&igIsKeyDown) = GetProcAddr(handle, "igIsKeyDown"); throwIf(!igIsKeyDown);
		*(cast(void**)&igIsKeyPressed) = GetProcAddr(handle, "igIsKeyPressed"); throwIf(!igIsKeyPressed);
		*(cast(void**)&igIsKeyPressedMap) = GetProcAddr(handle, "igIsKeyPressedMap"); throwIf(!igIsKeyPressedMap);
		*(cast(void**)&igIsKeyReleased) = GetProcAddr(handle, "igIsKeyReleased"); throwIf(!igIsKeyReleased);
		*(cast(void**)&igIsMouseClicked) = GetProcAddr(handle, "igIsMouseClicked"); throwIf(!igIsMouseClicked);
		*(cast(void**)&igIsMouseDoubleClicked) = GetProcAddr(handle, "igIsMouseDoubleClicked"); throwIf(!igIsMouseDoubleClicked);
		*(cast(void**)&igIsMouseDown) = GetProcAddr(handle, "igIsMouseDown"); throwIf(!igIsMouseDown);
		*(cast(void**)&igIsMouseDragPastThreshold) = GetProcAddr(handle, "igIsMouseDragPastThreshold"); throwIf(!igIsMouseDragPastThreshold);
		*(cast(void**)&igIsMouseDragging) = GetProcAddr(handle, "igIsMouseDragging"); throwIf(!igIsMouseDragging);
		*(cast(void**)&igIsMouseHoveringRect) = GetProcAddr(handle, "igIsMouseHoveringRect"); throwIf(!igIsMouseHoveringRect);
		*(cast(void**)&igIsMousePosValid) = GetProcAddr(handle, "igIsMousePosValid"); throwIf(!igIsMousePosValid);
		*(cast(void**)&igIsMouseReleased) = GetProcAddr(handle, "igIsMouseReleased"); throwIf(!igIsMouseReleased);
		*(cast(void**)&igIsNavInputDown) = GetProcAddr(handle, "igIsNavInputDown"); throwIf(!igIsNavInputDown);
		*(cast(void**)&igIsNavInputTest) = GetProcAddr(handle, "igIsNavInputTest"); throwIf(!igIsNavInputTest);
		*(cast(void**)&igIsPopupOpen_ID) = GetProcAddr(handle, "igIsPopupOpen_ID"); throwIf(!igIsPopupOpen_ID);
		*(cast(void**)&igIsPopupOpen_Str) = GetProcAddr(handle, "igIsPopupOpen_Str"); throwIf(!igIsPopupOpen_Str);
		*(cast(void**)&igIsRectVisible_Nil) = GetProcAddr(handle, "igIsRectVisible_Nil"); throwIf(!igIsRectVisible_Nil);
		*(cast(void**)&igIsRectVisible_Vec2) = GetProcAddr(handle, "igIsRectVisible_Vec2"); throwIf(!igIsRectVisible_Vec2);
		*(cast(void**)&igIsWindowAbove) = GetProcAddr(handle, "igIsWindowAbove"); throwIf(!igIsWindowAbove);
		*(cast(void**)&igIsWindowAppearing) = GetProcAddr(handle, "igIsWindowAppearing"); throwIf(!igIsWindowAppearing);
		*(cast(void**)&igIsWindowChildOf) = GetProcAddr(handle, "igIsWindowChildOf"); throwIf(!igIsWindowChildOf);
		*(cast(void**)&igIsWindowCollapsed) = GetProcAddr(handle, "igIsWindowCollapsed"); throwIf(!igIsWindowCollapsed);
		*(cast(void**)&igIsWindowFocused) = GetProcAddr(handle, "igIsWindowFocused"); throwIf(!igIsWindowFocused);
		*(cast(void**)&igIsWindowHovered) = GetProcAddr(handle, "igIsWindowHovered"); throwIf(!igIsWindowHovered);
		*(cast(void**)&igIsWindowNavFocusable) = GetProcAddr(handle, "igIsWindowNavFocusable"); throwIf(!igIsWindowNavFocusable);
		*(cast(void**)&igItemAdd) = GetProcAddr(handle, "igItemAdd"); throwIf(!igItemAdd);
		*(cast(void**)&igItemHoverable) = GetProcAddr(handle, "igItemHoverable"); throwIf(!igItemHoverable);
		*(cast(void**)&igItemSize_Rect) = GetProcAddr(handle, "igItemSize_Rect"); throwIf(!igItemSize_Rect);
		*(cast(void**)&igItemSize_Vec2) = GetProcAddr(handle, "igItemSize_Vec2"); throwIf(!igItemSize_Vec2);
		*(cast(void**)&igKeepAliveID) = GetProcAddr(handle, "igKeepAliveID"); throwIf(!igKeepAliveID);
		*(cast(void**)&igLabelText) = GetProcAddr(handle, "igLabelText"); throwIf(!igLabelText);
		*(cast(void**)&igLabelTextV) = GetProcAddr(handle, "igLabelTextV"); throwIf(!igLabelTextV);
		*(cast(void**)&igListBox_FnBoolPtr) = GetProcAddr(handle, "igListBox_FnBoolPtr"); throwIf(!igListBox_FnBoolPtr);
		*(cast(void**)&igListBox_Str_arr) = GetProcAddr(handle, "igListBox_Str_arr"); throwIf(!igListBox_Str_arr);
		*(cast(void**)&igLoadIniSettingsFromDisk) = GetProcAddr(handle, "igLoadIniSettingsFromDisk"); throwIf(!igLoadIniSettingsFromDisk);
		*(cast(void**)&igLoadIniSettingsFromMemory) = GetProcAddr(handle, "igLoadIniSettingsFromMemory"); throwIf(!igLoadIniSettingsFromMemory);
		*(cast(void**)&igLogBegin) = GetProcAddr(handle, "igLogBegin"); throwIf(!igLogBegin);
		*(cast(void**)&igLogButtons) = GetProcAddr(handle, "igLogButtons"); throwIf(!igLogButtons);
		*(cast(void**)&igLogFinish) = GetProcAddr(handle, "igLogFinish"); throwIf(!igLogFinish);
		*(cast(void**)&igLogRenderedText) = GetProcAddr(handle, "igLogRenderedText"); throwIf(!igLogRenderedText);
		*(cast(void**)&igLogSetNextTextDecoration) = GetProcAddr(handle, "igLogSetNextTextDecoration"); throwIf(!igLogSetNextTextDecoration);
		*(cast(void**)&igLogText) = GetProcAddr(handle, "igLogText"); throwIf(!igLogText);
		*(cast(void**)&igLogTextV) = GetProcAddr(handle, "igLogTextV"); throwIf(!igLogTextV);
		*(cast(void**)&igLogToBuffer) = GetProcAddr(handle, "igLogToBuffer"); throwIf(!igLogToBuffer);
		*(cast(void**)&igLogToClipboard) = GetProcAddr(handle, "igLogToClipboard"); throwIf(!igLogToClipboard);
		*(cast(void**)&igLogToFile) = GetProcAddr(handle, "igLogToFile"); throwIf(!igLogToFile);
		*(cast(void**)&igLogToTTY) = GetProcAddr(handle, "igLogToTTY"); throwIf(!igLogToTTY);
		*(cast(void**)&igMarkIniSettingsDirty_Nil) = GetProcAddr(handle, "igMarkIniSettingsDirty_Nil"); throwIf(!igMarkIniSettingsDirty_Nil);
		*(cast(void**)&igMarkIniSettingsDirty_WindowPtr) = GetProcAddr(handle, "igMarkIniSettingsDirty_WindowPtr"); throwIf(!igMarkIniSettingsDirty_WindowPtr);
		*(cast(void**)&igMarkItemEdited) = GetProcAddr(handle, "igMarkItemEdited"); throwIf(!igMarkItemEdited);
		*(cast(void**)&igMemAlloc) = GetProcAddr(handle, "igMemAlloc"); throwIf(!igMemAlloc);
		*(cast(void**)&igMemFree) = GetProcAddr(handle, "igMemFree"); throwIf(!igMemFree);
		*(cast(void**)&igMenuItem_Bool) = GetProcAddr(handle, "igMenuItem_Bool"); throwIf(!igMenuItem_Bool);
		*(cast(void**)&igMenuItem_BoolPtr) = GetProcAddr(handle, "igMenuItem_BoolPtr"); throwIf(!igMenuItem_BoolPtr);
		*(cast(void**)&igNavInitWindow) = GetProcAddr(handle, "igNavInitWindow"); throwIf(!igNavInitWindow);
		*(cast(void**)&igNavMoveRequestButNoResultYet) = GetProcAddr(handle, "igNavMoveRequestButNoResultYet"); throwIf(!igNavMoveRequestButNoResultYet);
		*(cast(void**)&igNavMoveRequestCancel) = GetProcAddr(handle, "igNavMoveRequestCancel"); throwIf(!igNavMoveRequestCancel);
		*(cast(void**)&igNavMoveRequestForward) = GetProcAddr(handle, "igNavMoveRequestForward"); throwIf(!igNavMoveRequestForward);
		*(cast(void**)&igNavMoveRequestTryWrapping) = GetProcAddr(handle, "igNavMoveRequestTryWrapping"); throwIf(!igNavMoveRequestTryWrapping);
		*(cast(void**)&igNewFrame) = GetProcAddr(handle, "igNewFrame"); throwIf(!igNewFrame);
		*(cast(void**)&igNewLine) = GetProcAddr(handle, "igNewLine"); throwIf(!igNewLine);
		*(cast(void**)&igNextColumn) = GetProcAddr(handle, "igNextColumn"); throwIf(!igNextColumn);
		*(cast(void**)&igOpenPopup) = GetProcAddr(handle, "igOpenPopup"); throwIf(!igOpenPopup);
		*(cast(void**)&igOpenPopupEx) = GetProcAddr(handle, "igOpenPopupEx"); throwIf(!igOpenPopupEx);
		*(cast(void**)&igOpenPopupOnItemClick) = GetProcAddr(handle, "igOpenPopupOnItemClick"); throwIf(!igOpenPopupOnItemClick);
		*(cast(void**)&igPlotEx) = GetProcAddr(handle, "igPlotEx"); throwIf(!igPlotEx);
		*(cast(void**)&igPlotHistogram_FloatPtr) = GetProcAddr(handle, "igPlotHistogram_FloatPtr"); throwIf(!igPlotHistogram_FloatPtr);
		*(cast(void**)&igPlotHistogram_FnFloatPtr) = GetProcAddr(handle, "igPlotHistogram_FnFloatPtr"); throwIf(!igPlotHistogram_FnFloatPtr);
		*(cast(void**)&igPlotLines_FloatPtr) = GetProcAddr(handle, "igPlotLines_FloatPtr"); throwIf(!igPlotLines_FloatPtr);
		*(cast(void**)&igPlotLines_FnFloatPtr) = GetProcAddr(handle, "igPlotLines_FnFloatPtr"); throwIf(!igPlotLines_FnFloatPtr);
		*(cast(void**)&igPopAllowKeyboardFocus) = GetProcAddr(handle, "igPopAllowKeyboardFocus"); throwIf(!igPopAllowKeyboardFocus);
		*(cast(void**)&igPopButtonRepeat) = GetProcAddr(handle, "igPopButtonRepeat"); throwIf(!igPopButtonRepeat);
		*(cast(void**)&igPopClipRect) = GetProcAddr(handle, "igPopClipRect"); throwIf(!igPopClipRect);
		*(cast(void**)&igPopColumnsBackground) = GetProcAddr(handle, "igPopColumnsBackground"); throwIf(!igPopColumnsBackground);
		*(cast(void**)&igPopFocusScope) = GetProcAddr(handle, "igPopFocusScope"); throwIf(!igPopFocusScope);
		*(cast(void**)&igPopFont) = GetProcAddr(handle, "igPopFont"); throwIf(!igPopFont);
		*(cast(void**)&igPopID) = GetProcAddr(handle, "igPopID"); throwIf(!igPopID);
		*(cast(void**)&igPopItemFlag) = GetProcAddr(handle, "igPopItemFlag"); throwIf(!igPopItemFlag);
		*(cast(void**)&igPopItemWidth) = GetProcAddr(handle, "igPopItemWidth"); throwIf(!igPopItemWidth);
		*(cast(void**)&igPopStyleColor) = GetProcAddr(handle, "igPopStyleColor"); throwIf(!igPopStyleColor);
		*(cast(void**)&igPopStyleVar) = GetProcAddr(handle, "igPopStyleVar"); throwIf(!igPopStyleVar);
		*(cast(void**)&igPopTextWrapPos) = GetProcAddr(handle, "igPopTextWrapPos"); throwIf(!igPopTextWrapPos);
		*(cast(void**)&igProgressBar) = GetProcAddr(handle, "igProgressBar"); throwIf(!igProgressBar);
		*(cast(void**)&igPushAllowKeyboardFocus) = GetProcAddr(handle, "igPushAllowKeyboardFocus"); throwIf(!igPushAllowKeyboardFocus);
		*(cast(void**)&igPushButtonRepeat) = GetProcAddr(handle, "igPushButtonRepeat"); throwIf(!igPushButtonRepeat);
		*(cast(void**)&igPushClipRect) = GetProcAddr(handle, "igPushClipRect"); throwIf(!igPushClipRect);
		*(cast(void**)&igPushColumnClipRect) = GetProcAddr(handle, "igPushColumnClipRect"); throwIf(!igPushColumnClipRect);
		*(cast(void**)&igPushColumnsBackground) = GetProcAddr(handle, "igPushColumnsBackground"); throwIf(!igPushColumnsBackground);
		*(cast(void**)&igPushFocusScope) = GetProcAddr(handle, "igPushFocusScope"); throwIf(!igPushFocusScope);
		*(cast(void**)&igPushFont) = GetProcAddr(handle, "igPushFont"); throwIf(!igPushFont);
		*(cast(void**)&igPushID_Int) = GetProcAddr(handle, "igPushID_Int"); throwIf(!igPushID_Int);
		*(cast(void**)&igPushID_Ptr) = GetProcAddr(handle, "igPushID_Ptr"); throwIf(!igPushID_Ptr);
		*(cast(void**)&igPushID_Str) = GetProcAddr(handle, "igPushID_Str"); throwIf(!igPushID_Str);
		*(cast(void**)&igPushID_StrStr) = GetProcAddr(handle, "igPushID_StrStr"); throwIf(!igPushID_StrStr);
		*(cast(void**)&igPushItemFlag) = GetProcAddr(handle, "igPushItemFlag"); throwIf(!igPushItemFlag);
		*(cast(void**)&igPushItemWidth) = GetProcAddr(handle, "igPushItemWidth"); throwIf(!igPushItemWidth);
		*(cast(void**)&igPushMultiItemsWidths) = GetProcAddr(handle, "igPushMultiItemsWidths"); throwIf(!igPushMultiItemsWidths);
		*(cast(void**)&igPushOverrideID) = GetProcAddr(handle, "igPushOverrideID"); throwIf(!igPushOverrideID);
		*(cast(void**)&igPushStyleColor_U32) = GetProcAddr(handle, "igPushStyleColor_U32"); throwIf(!igPushStyleColor_U32);
		*(cast(void**)&igPushStyleColor_Vec4) = GetProcAddr(handle, "igPushStyleColor_Vec4"); throwIf(!igPushStyleColor_Vec4);
		*(cast(void**)&igPushStyleVar_Float) = GetProcAddr(handle, "igPushStyleVar_Float"); throwIf(!igPushStyleVar_Float);
		*(cast(void**)&igPushStyleVar_Vec2) = GetProcAddr(handle, "igPushStyleVar_Vec2"); throwIf(!igPushStyleVar_Vec2);
		*(cast(void**)&igPushTextWrapPos) = GetProcAddr(handle, "igPushTextWrapPos"); throwIf(!igPushTextWrapPos);
		*(cast(void**)&igRadioButton_Bool) = GetProcAddr(handle, "igRadioButton_Bool"); throwIf(!igRadioButton_Bool);
		*(cast(void**)&igRadioButton_IntPtr) = GetProcAddr(handle, "igRadioButton_IntPtr"); throwIf(!igRadioButton_IntPtr);
		*(cast(void**)&igRemoveContextHook) = GetProcAddr(handle, "igRemoveContextHook"); throwIf(!igRemoveContextHook);
		*(cast(void**)&igRender) = GetProcAddr(handle, "igRender"); throwIf(!igRender);
		*(cast(void**)&igRenderArrow) = GetProcAddr(handle, "igRenderArrow"); throwIf(!igRenderArrow);
		*(cast(void**)&igRenderArrowPointingAt) = GetProcAddr(handle, "igRenderArrowPointingAt"); throwIf(!igRenderArrowPointingAt);
		*(cast(void**)&igRenderBullet) = GetProcAddr(handle, "igRenderBullet"); throwIf(!igRenderBullet);
		*(cast(void**)&igRenderCheckMark) = GetProcAddr(handle, "igRenderCheckMark"); throwIf(!igRenderCheckMark);
		*(cast(void**)&igRenderColorRectWithAlphaCheckerboard) = GetProcAddr(handle, "igRenderColorRectWithAlphaCheckerboard"); throwIf(!igRenderColorRectWithAlphaCheckerboard);
		*(cast(void**)&igRenderFrame) = GetProcAddr(handle, "igRenderFrame"); throwIf(!igRenderFrame);
		*(cast(void**)&igRenderFrameBorder) = GetProcAddr(handle, "igRenderFrameBorder"); throwIf(!igRenderFrameBorder);
		*(cast(void**)&igRenderMouseCursor) = GetProcAddr(handle, "igRenderMouseCursor"); throwIf(!igRenderMouseCursor);
		*(cast(void**)&igRenderNavHighlight) = GetProcAddr(handle, "igRenderNavHighlight"); throwIf(!igRenderNavHighlight);
		*(cast(void**)&igRenderRectFilledRangeH) = GetProcAddr(handle, "igRenderRectFilledRangeH"); throwIf(!igRenderRectFilledRangeH);
		*(cast(void**)&igRenderRectFilledWithHole) = GetProcAddr(handle, "igRenderRectFilledWithHole"); throwIf(!igRenderRectFilledWithHole);
		*(cast(void**)&igRenderText) = GetProcAddr(handle, "igRenderText"); throwIf(!igRenderText);
		*(cast(void**)&igRenderTextClipped) = GetProcAddr(handle, "igRenderTextClipped"); throwIf(!igRenderTextClipped);
		*(cast(void**)&igRenderTextClippedEx) = GetProcAddr(handle, "igRenderTextClippedEx"); throwIf(!igRenderTextClippedEx);
		*(cast(void**)&igRenderTextEllipsis) = GetProcAddr(handle, "igRenderTextEllipsis"); throwIf(!igRenderTextEllipsis);
		*(cast(void**)&igRenderTextWrapped) = GetProcAddr(handle, "igRenderTextWrapped"); throwIf(!igRenderTextWrapped);
		*(cast(void**)&igResetMouseDragDelta) = GetProcAddr(handle, "igResetMouseDragDelta"); throwIf(!igResetMouseDragDelta);
		*(cast(void**)&igSameLine) = GetProcAddr(handle, "igSameLine"); throwIf(!igSameLine);
		*(cast(void**)&igSaveIniSettingsToDisk) = GetProcAddr(handle, "igSaveIniSettingsToDisk"); throwIf(!igSaveIniSettingsToDisk);
		*(cast(void**)&igSaveIniSettingsToMemory) = GetProcAddr(handle, "igSaveIniSettingsToMemory"); throwIf(!igSaveIniSettingsToMemory);
		*(cast(void**)&igScrollToBringRectIntoView) = GetProcAddr(handle, "igScrollToBringRectIntoView"); throwIf(!igScrollToBringRectIntoView);
		*(cast(void**)&igScrollbar) = GetProcAddr(handle, "igScrollbar"); throwIf(!igScrollbar);
		*(cast(void**)&igScrollbarEx) = GetProcAddr(handle, "igScrollbarEx"); throwIf(!igScrollbarEx);
		*(cast(void**)&igSelectable_Bool) = GetProcAddr(handle, "igSelectable_Bool"); throwIf(!igSelectable_Bool);
		*(cast(void**)&igSelectable_BoolPtr) = GetProcAddr(handle, "igSelectable_BoolPtr"); throwIf(!igSelectable_BoolPtr);
		*(cast(void**)&igSeparator) = GetProcAddr(handle, "igSeparator"); throwIf(!igSeparator);
		*(cast(void**)&igSeparatorEx) = GetProcAddr(handle, "igSeparatorEx"); throwIf(!igSeparatorEx);
		*(cast(void**)&igSetActiveID) = GetProcAddr(handle, "igSetActiveID"); throwIf(!igSetActiveID);
		*(cast(void**)&igSetAllocatorFunctions) = GetProcAddr(handle, "igSetAllocatorFunctions"); throwIf(!igSetAllocatorFunctions);
		*(cast(void**)&igSetClipboardText) = GetProcAddr(handle, "igSetClipboardText"); throwIf(!igSetClipboardText);
		*(cast(void**)&igSetColorEditOptions) = GetProcAddr(handle, "igSetColorEditOptions"); throwIf(!igSetColorEditOptions);
		*(cast(void**)&igSetColumnOffset) = GetProcAddr(handle, "igSetColumnOffset"); throwIf(!igSetColumnOffset);
		*(cast(void**)&igSetColumnWidth) = GetProcAddr(handle, "igSetColumnWidth"); throwIf(!igSetColumnWidth);
		*(cast(void**)&igSetCurrentContext) = GetProcAddr(handle, "igSetCurrentContext"); throwIf(!igSetCurrentContext);
		*(cast(void**)&igSetCurrentFont) = GetProcAddr(handle, "igSetCurrentFont"); throwIf(!igSetCurrentFont);
		*(cast(void**)&igSetCursorPos) = GetProcAddr(handle, "igSetCursorPos"); throwIf(!igSetCursorPos);
		*(cast(void**)&igSetCursorPosX) = GetProcAddr(handle, "igSetCursorPosX"); throwIf(!igSetCursorPosX);
		*(cast(void**)&igSetCursorPosY) = GetProcAddr(handle, "igSetCursorPosY"); throwIf(!igSetCursorPosY);
		*(cast(void**)&igSetCursorScreenPos) = GetProcAddr(handle, "igSetCursorScreenPos"); throwIf(!igSetCursorScreenPos);
		*(cast(void**)&igSetDragDropPayload) = GetProcAddr(handle, "igSetDragDropPayload"); throwIf(!igSetDragDropPayload);
		*(cast(void**)&igSetFocusID) = GetProcAddr(handle, "igSetFocusID"); throwIf(!igSetFocusID);
		*(cast(void**)&igSetHoveredID) = GetProcAddr(handle, "igSetHoveredID"); throwIf(!igSetHoveredID);
		*(cast(void**)&igSetItemAllowOverlap) = GetProcAddr(handle, "igSetItemAllowOverlap"); throwIf(!igSetItemAllowOverlap);
		*(cast(void**)&igSetItemDefaultFocus) = GetProcAddr(handle, "igSetItemDefaultFocus"); throwIf(!igSetItemDefaultFocus);
		*(cast(void**)&igSetItemUsingMouseWheel) = GetProcAddr(handle, "igSetItemUsingMouseWheel"); throwIf(!igSetItemUsingMouseWheel);
		*(cast(void**)&igSetKeyboardFocusHere) = GetProcAddr(handle, "igSetKeyboardFocusHere"); throwIf(!igSetKeyboardFocusHere);
		*(cast(void**)&igSetLastItemData) = GetProcAddr(handle, "igSetLastItemData"); throwIf(!igSetLastItemData);
		*(cast(void**)&igSetMouseCursor) = GetProcAddr(handle, "igSetMouseCursor"); throwIf(!igSetMouseCursor);
		*(cast(void**)&igSetNavID) = GetProcAddr(handle, "igSetNavID"); throwIf(!igSetNavID);
		*(cast(void**)&igSetNextItemOpen) = GetProcAddr(handle, "igSetNextItemOpen"); throwIf(!igSetNextItemOpen);
		*(cast(void**)&igSetNextItemWidth) = GetProcAddr(handle, "igSetNextItemWidth"); throwIf(!igSetNextItemWidth);
		*(cast(void**)&igSetNextWindowBgAlpha) = GetProcAddr(handle, "igSetNextWindowBgAlpha"); throwIf(!igSetNextWindowBgAlpha);
		*(cast(void**)&igSetNextWindowCollapsed) = GetProcAddr(handle, "igSetNextWindowCollapsed"); throwIf(!igSetNextWindowCollapsed);
		*(cast(void**)&igSetNextWindowContentSize) = GetProcAddr(handle, "igSetNextWindowContentSize"); throwIf(!igSetNextWindowContentSize);
		*(cast(void**)&igSetNextWindowFocus) = GetProcAddr(handle, "igSetNextWindowFocus"); throwIf(!igSetNextWindowFocus);
		*(cast(void**)&igSetNextWindowPos) = GetProcAddr(handle, "igSetNextWindowPos"); throwIf(!igSetNextWindowPos);
		*(cast(void**)&igSetNextWindowScroll) = GetProcAddr(handle, "igSetNextWindowScroll"); throwIf(!igSetNextWindowScroll);
		*(cast(void**)&igSetNextWindowSize) = GetProcAddr(handle, "igSetNextWindowSize"); throwIf(!igSetNextWindowSize);
		*(cast(void**)&igSetNextWindowSizeConstraints) = GetProcAddr(handle, "igSetNextWindowSizeConstraints"); throwIf(!igSetNextWindowSizeConstraints);
		*(cast(void**)&igSetScrollFromPosX_Float) = GetProcAddr(handle, "igSetScrollFromPosX_Float"); throwIf(!igSetScrollFromPosX_Float);
		*(cast(void**)&igSetScrollFromPosX_WindowPtr) = GetProcAddr(handle, "igSetScrollFromPosX_WindowPtr"); throwIf(!igSetScrollFromPosX_WindowPtr);
		*(cast(void**)&igSetScrollFromPosY_Float) = GetProcAddr(handle, "igSetScrollFromPosY_Float"); throwIf(!igSetScrollFromPosY_Float);
		*(cast(void**)&igSetScrollFromPosY_WindowPtr) = GetProcAddr(handle, "igSetScrollFromPosY_WindowPtr"); throwIf(!igSetScrollFromPosY_WindowPtr);
		*(cast(void**)&igSetScrollHereX) = GetProcAddr(handle, "igSetScrollHereX"); throwIf(!igSetScrollHereX);
		*(cast(void**)&igSetScrollHereY) = GetProcAddr(handle, "igSetScrollHereY"); throwIf(!igSetScrollHereY);
		*(cast(void**)&igSetScrollX_Float) = GetProcAddr(handle, "igSetScrollX_Float"); throwIf(!igSetScrollX_Float);
		*(cast(void**)&igSetScrollX_WindowPtr) = GetProcAddr(handle, "igSetScrollX_WindowPtr"); throwIf(!igSetScrollX_WindowPtr);
		*(cast(void**)&igSetScrollY_Float) = GetProcAddr(handle, "igSetScrollY_Float"); throwIf(!igSetScrollY_Float);
		*(cast(void**)&igSetScrollY_WindowPtr) = GetProcAddr(handle, "igSetScrollY_WindowPtr"); throwIf(!igSetScrollY_WindowPtr);
		*(cast(void**)&igSetStateStorage) = GetProcAddr(handle, "igSetStateStorage"); throwIf(!igSetStateStorage);
		*(cast(void**)&igSetTabItemClosed) = GetProcAddr(handle, "igSetTabItemClosed"); throwIf(!igSetTabItemClosed);
		*(cast(void**)&igSetTooltip) = GetProcAddr(handle, "igSetTooltip"); throwIf(!igSetTooltip);
		*(cast(void**)&igSetTooltipV) = GetProcAddr(handle, "igSetTooltipV"); throwIf(!igSetTooltipV);
		*(cast(void**)&igSetWindowClipRectBeforeSetChannel) = GetProcAddr(handle, "igSetWindowClipRectBeforeSetChannel"); throwIf(!igSetWindowClipRectBeforeSetChannel);
		*(cast(void**)&igSetWindowCollapsed_Bool) = GetProcAddr(handle, "igSetWindowCollapsed_Bool"); throwIf(!igSetWindowCollapsed_Bool);
		*(cast(void**)&igSetWindowCollapsed_Str) = GetProcAddr(handle, "igSetWindowCollapsed_Str"); throwIf(!igSetWindowCollapsed_Str);
		*(cast(void**)&igSetWindowCollapsed_WindowPtr) = GetProcAddr(handle, "igSetWindowCollapsed_WindowPtr"); throwIf(!igSetWindowCollapsed_WindowPtr);
		*(cast(void**)&igSetWindowFocus_Nil) = GetProcAddr(handle, "igSetWindowFocus_Nil"); throwIf(!igSetWindowFocus_Nil);
		*(cast(void**)&igSetWindowFocus_Str) = GetProcAddr(handle, "igSetWindowFocus_Str"); throwIf(!igSetWindowFocus_Str);
		*(cast(void**)&igSetWindowFontScale) = GetProcAddr(handle, "igSetWindowFontScale"); throwIf(!igSetWindowFontScale);
		*(cast(void**)&igSetWindowHitTestHole) = GetProcAddr(handle, "igSetWindowHitTestHole"); throwIf(!igSetWindowHitTestHole);
		*(cast(void**)&igSetWindowPos_Str) = GetProcAddr(handle, "igSetWindowPos_Str"); throwIf(!igSetWindowPos_Str);
		*(cast(void**)&igSetWindowPos_Vec2) = GetProcAddr(handle, "igSetWindowPos_Vec2"); throwIf(!igSetWindowPos_Vec2);
		*(cast(void**)&igSetWindowPos_WindowPtr) = GetProcAddr(handle, "igSetWindowPos_WindowPtr"); throwIf(!igSetWindowPos_WindowPtr);
		*(cast(void**)&igSetWindowSize_Str) = GetProcAddr(handle, "igSetWindowSize_Str"); throwIf(!igSetWindowSize_Str);
		*(cast(void**)&igSetWindowSize_Vec2) = GetProcAddr(handle, "igSetWindowSize_Vec2"); throwIf(!igSetWindowSize_Vec2);
		*(cast(void**)&igSetWindowSize_WindowPtr) = GetProcAddr(handle, "igSetWindowSize_WindowPtr"); throwIf(!igSetWindowSize_WindowPtr);
		*(cast(void**)&igShadeVertsLinearColorGradientKeepAlpha) = GetProcAddr(handle, "igShadeVertsLinearColorGradientKeepAlpha"); throwIf(!igShadeVertsLinearColorGradientKeepAlpha);
		*(cast(void**)&igShadeVertsLinearUV) = GetProcAddr(handle, "igShadeVertsLinearUV"); throwIf(!igShadeVertsLinearUV);
		*(cast(void**)&igShowAboutWindow) = GetProcAddr(handle, "igShowAboutWindow"); throwIf(!igShowAboutWindow);
		*(cast(void**)&igShowDemoWindow) = GetProcAddr(handle, "igShowDemoWindow"); throwIf(!igShowDemoWindow);
		*(cast(void**)&igShowFontSelector) = GetProcAddr(handle, "igShowFontSelector"); throwIf(!igShowFontSelector);
		*(cast(void**)&igShowMetricsWindow) = GetProcAddr(handle, "igShowMetricsWindow"); throwIf(!igShowMetricsWindow);
		*(cast(void**)&igShowStyleEditor) = GetProcAddr(handle, "igShowStyleEditor"); throwIf(!igShowStyleEditor);
		*(cast(void**)&igShowStyleSelector) = GetProcAddr(handle, "igShowStyleSelector"); throwIf(!igShowStyleSelector);
		*(cast(void**)&igShowUserGuide) = GetProcAddr(handle, "igShowUserGuide"); throwIf(!igShowUserGuide);
		*(cast(void**)&igShrinkWidths) = GetProcAddr(handle, "igShrinkWidths"); throwIf(!igShrinkWidths);
		*(cast(void**)&igShutdown) = GetProcAddr(handle, "igShutdown"); throwIf(!igShutdown);
		*(cast(void**)&igSliderAngle) = GetProcAddr(handle, "igSliderAngle"); throwIf(!igSliderAngle);
		*(cast(void**)&igSliderBehavior) = GetProcAddr(handle, "igSliderBehavior"); throwIf(!igSliderBehavior);
		*(cast(void**)&igSliderFloat) = GetProcAddr(handle, "igSliderFloat"); throwIf(!igSliderFloat);
		*(cast(void**)&igSliderFloat2) = GetProcAddr(handle, "igSliderFloat2"); throwIf(!igSliderFloat2);
		*(cast(void**)&igSliderFloat3) = GetProcAddr(handle, "igSliderFloat3"); throwIf(!igSliderFloat3);
		*(cast(void**)&igSliderFloat4) = GetProcAddr(handle, "igSliderFloat4"); throwIf(!igSliderFloat4);
		*(cast(void**)&igSliderInt) = GetProcAddr(handle, "igSliderInt"); throwIf(!igSliderInt);
		*(cast(void**)&igSliderInt2) = GetProcAddr(handle, "igSliderInt2"); throwIf(!igSliderInt2);
		*(cast(void**)&igSliderInt3) = GetProcAddr(handle, "igSliderInt3"); throwIf(!igSliderInt3);
		*(cast(void**)&igSliderInt4) = GetProcAddr(handle, "igSliderInt4"); throwIf(!igSliderInt4);
		*(cast(void**)&igSliderScalar) = GetProcAddr(handle, "igSliderScalar"); throwIf(!igSliderScalar);
		*(cast(void**)&igSliderScalarN) = GetProcAddr(handle, "igSliderScalarN"); throwIf(!igSliderScalarN);
		*(cast(void**)&igSmallButton) = GetProcAddr(handle, "igSmallButton"); throwIf(!igSmallButton);
		*(cast(void**)&igSpacing) = GetProcAddr(handle, "igSpacing"); throwIf(!igSpacing);
		*(cast(void**)&igSplitterBehavior) = GetProcAddr(handle, "igSplitterBehavior"); throwIf(!igSplitterBehavior);
		*(cast(void**)&igStartMouseMovingWindow) = GetProcAddr(handle, "igStartMouseMovingWindow"); throwIf(!igStartMouseMovingWindow);
		*(cast(void**)&igStyleColorsClassic) = GetProcAddr(handle, "igStyleColorsClassic"); throwIf(!igStyleColorsClassic);
		*(cast(void**)&igStyleColorsDark) = GetProcAddr(handle, "igStyleColorsDark"); throwIf(!igStyleColorsDark);
		*(cast(void**)&igStyleColorsLight) = GetProcAddr(handle, "igStyleColorsLight"); throwIf(!igStyleColorsLight);
		*(cast(void**)&igTabBarCloseTab) = GetProcAddr(handle, "igTabBarCloseTab"); throwIf(!igTabBarCloseTab);
		*(cast(void**)&igTabBarFindTabByID) = GetProcAddr(handle, "igTabBarFindTabByID"); throwIf(!igTabBarFindTabByID);
		*(cast(void**)&igTabBarProcessReorder) = GetProcAddr(handle, "igTabBarProcessReorder"); throwIf(!igTabBarProcessReorder);
		*(cast(void**)&igTabBarQueueReorder) = GetProcAddr(handle, "igTabBarQueueReorder"); throwIf(!igTabBarQueueReorder);
		*(cast(void**)&igTabBarRemoveTab) = GetProcAddr(handle, "igTabBarRemoveTab"); throwIf(!igTabBarRemoveTab);
		*(cast(void**)&igTabItemBackground) = GetProcAddr(handle, "igTabItemBackground"); throwIf(!igTabItemBackground);
		*(cast(void**)&igTabItemButton) = GetProcAddr(handle, "igTabItemButton"); throwIf(!igTabItemButton);
		*(cast(void**)&igTabItemCalcSize) = GetProcAddr(handle, "igTabItemCalcSize"); throwIf(!igTabItemCalcSize);
		*(cast(void**)&igTabItemEx) = GetProcAddr(handle, "igTabItemEx"); throwIf(!igTabItemEx);
		*(cast(void**)&igTabItemLabelAndCloseButton) = GetProcAddr(handle, "igTabItemLabelAndCloseButton"); throwIf(!igTabItemLabelAndCloseButton);
		*(cast(void**)&igTableBeginApplyRequests) = GetProcAddr(handle, "igTableBeginApplyRequests"); throwIf(!igTableBeginApplyRequests);
		*(cast(void**)&igTableBeginCell) = GetProcAddr(handle, "igTableBeginCell"); throwIf(!igTableBeginCell);
		*(cast(void**)&igTableBeginInitMemory) = GetProcAddr(handle, "igTableBeginInitMemory"); throwIf(!igTableBeginInitMemory);
		*(cast(void**)&igTableBeginRow) = GetProcAddr(handle, "igTableBeginRow"); throwIf(!igTableBeginRow);
		*(cast(void**)&igTableDrawBorders) = GetProcAddr(handle, "igTableDrawBorders"); throwIf(!igTableDrawBorders);
		*(cast(void**)&igTableDrawContextMenu) = GetProcAddr(handle, "igTableDrawContextMenu"); throwIf(!igTableDrawContextMenu);
		*(cast(void**)&igTableEndCell) = GetProcAddr(handle, "igTableEndCell"); throwIf(!igTableEndCell);
		*(cast(void**)&igTableEndRow) = GetProcAddr(handle, "igTableEndRow"); throwIf(!igTableEndRow);
		*(cast(void**)&igTableFindByID) = GetProcAddr(handle, "igTableFindByID"); throwIf(!igTableFindByID);
		*(cast(void**)&igTableFixColumnSortDirection) = GetProcAddr(handle, "igTableFixColumnSortDirection"); throwIf(!igTableFixColumnSortDirection);
		*(cast(void**)&igTableGcCompactSettings) = GetProcAddr(handle, "igTableGcCompactSettings"); throwIf(!igTableGcCompactSettings);
		*(cast(void**)&igTableGcCompactTransientBuffers) = GetProcAddr(handle, "igTableGcCompactTransientBuffers"); throwIf(!igTableGcCompactTransientBuffers);
		*(cast(void**)&igTableGetBoundSettings) = GetProcAddr(handle, "igTableGetBoundSettings"); throwIf(!igTableGetBoundSettings);
		*(cast(void**)&igTableGetCellBgRect) = GetProcAddr(handle, "igTableGetCellBgRect"); throwIf(!igTableGetCellBgRect);
		*(cast(void**)&igTableGetColumnCount) = GetProcAddr(handle, "igTableGetColumnCount"); throwIf(!igTableGetColumnCount);
		*(cast(void**)&igTableGetColumnFlags) = GetProcAddr(handle, "igTableGetColumnFlags"); throwIf(!igTableGetColumnFlags);
		*(cast(void**)&igTableGetColumnIndex) = GetProcAddr(handle, "igTableGetColumnIndex"); throwIf(!igTableGetColumnIndex);
		*(cast(void**)&igTableGetColumnName_Int) = GetProcAddr(handle, "igTableGetColumnName_Int"); throwIf(!igTableGetColumnName_Int);
		*(cast(void**)&igTableGetColumnName_TablePtr) = GetProcAddr(handle, "igTableGetColumnName_TablePtr"); throwIf(!igTableGetColumnName_TablePtr);
		*(cast(void**)&igTableGetColumnNextSortDirection) = GetProcAddr(handle, "igTableGetColumnNextSortDirection"); throwIf(!igTableGetColumnNextSortDirection);
		*(cast(void**)&igTableGetColumnResizeID) = GetProcAddr(handle, "igTableGetColumnResizeID"); throwIf(!igTableGetColumnResizeID);
		*(cast(void**)&igTableGetColumnWidthAuto) = GetProcAddr(handle, "igTableGetColumnWidthAuto"); throwIf(!igTableGetColumnWidthAuto);
		*(cast(void**)&igTableGetHeaderRowHeight) = GetProcAddr(handle, "igTableGetHeaderRowHeight"); throwIf(!igTableGetHeaderRowHeight);
		*(cast(void**)&igTableGetHoveredColumn) = GetProcAddr(handle, "igTableGetHoveredColumn"); throwIf(!igTableGetHoveredColumn);
		*(cast(void**)&igTableGetMaxColumnWidth) = GetProcAddr(handle, "igTableGetMaxColumnWidth"); throwIf(!igTableGetMaxColumnWidth);
		*(cast(void**)&igTableGetRowIndex) = GetProcAddr(handle, "igTableGetRowIndex"); throwIf(!igTableGetRowIndex);
		*(cast(void**)&igTableGetSortSpecs) = GetProcAddr(handle, "igTableGetSortSpecs"); throwIf(!igTableGetSortSpecs);
		*(cast(void**)&igTableHeader) = GetProcAddr(handle, "igTableHeader"); throwIf(!igTableHeader);
		*(cast(void**)&igTableHeadersRow) = GetProcAddr(handle, "igTableHeadersRow"); throwIf(!igTableHeadersRow);
		*(cast(void**)&igTableLoadSettings) = GetProcAddr(handle, "igTableLoadSettings"); throwIf(!igTableLoadSettings);
		*(cast(void**)&igTableMergeDrawChannels) = GetProcAddr(handle, "igTableMergeDrawChannels"); throwIf(!igTableMergeDrawChannels);
		*(cast(void**)&igTableNextColumn) = GetProcAddr(handle, "igTableNextColumn"); throwIf(!igTableNextColumn);
		*(cast(void**)&igTableNextRow) = GetProcAddr(handle, "igTableNextRow"); throwIf(!igTableNextRow);
		*(cast(void**)&igTableOpenContextMenu) = GetProcAddr(handle, "igTableOpenContextMenu"); throwIf(!igTableOpenContextMenu);
		*(cast(void**)&igTablePopBackgroundChannel) = GetProcAddr(handle, "igTablePopBackgroundChannel"); throwIf(!igTablePopBackgroundChannel);
		*(cast(void**)&igTablePushBackgroundChannel) = GetProcAddr(handle, "igTablePushBackgroundChannel"); throwIf(!igTablePushBackgroundChannel);
		*(cast(void**)&igTableRemove) = GetProcAddr(handle, "igTableRemove"); throwIf(!igTableRemove);
		*(cast(void**)&igTableResetSettings) = GetProcAddr(handle, "igTableResetSettings"); throwIf(!igTableResetSettings);
		*(cast(void**)&igTableSaveSettings) = GetProcAddr(handle, "igTableSaveSettings"); throwIf(!igTableSaveSettings);
		*(cast(void**)&igTableSetBgColor) = GetProcAddr(handle, "igTableSetBgColor"); throwIf(!igTableSetBgColor);
		*(cast(void**)&igTableSetColumnEnabled) = GetProcAddr(handle, "igTableSetColumnEnabled"); throwIf(!igTableSetColumnEnabled);
		*(cast(void**)&igTableSetColumnIndex) = GetProcAddr(handle, "igTableSetColumnIndex"); throwIf(!igTableSetColumnIndex);
		*(cast(void**)&igTableSetColumnSortDirection) = GetProcAddr(handle, "igTableSetColumnSortDirection"); throwIf(!igTableSetColumnSortDirection);
		*(cast(void**)&igTableSetColumnWidth) = GetProcAddr(handle, "igTableSetColumnWidth"); throwIf(!igTableSetColumnWidth);
		*(cast(void**)&igTableSetColumnWidthAutoAll) = GetProcAddr(handle, "igTableSetColumnWidthAutoAll"); throwIf(!igTableSetColumnWidthAutoAll);
		*(cast(void**)&igTableSetColumnWidthAutoSingle) = GetProcAddr(handle, "igTableSetColumnWidthAutoSingle"); throwIf(!igTableSetColumnWidthAutoSingle);
		*(cast(void**)&igTableSettingsCreate) = GetProcAddr(handle, "igTableSettingsCreate"); throwIf(!igTableSettingsCreate);
		*(cast(void**)&igTableSettingsFindByID) = GetProcAddr(handle, "igTableSettingsFindByID"); throwIf(!igTableSettingsFindByID);
		*(cast(void**)&igTableSettingsInstallHandler) = GetProcAddr(handle, "igTableSettingsInstallHandler"); throwIf(!igTableSettingsInstallHandler);
		*(cast(void**)&igTableSetupColumn) = GetProcAddr(handle, "igTableSetupColumn"); throwIf(!igTableSetupColumn);
		*(cast(void**)&igTableSetupDrawChannels) = GetProcAddr(handle, "igTableSetupDrawChannels"); throwIf(!igTableSetupDrawChannels);
		*(cast(void**)&igTableSetupScrollFreeze) = GetProcAddr(handle, "igTableSetupScrollFreeze"); throwIf(!igTableSetupScrollFreeze);
		*(cast(void**)&igTableSortSpecsBuild) = GetProcAddr(handle, "igTableSortSpecsBuild"); throwIf(!igTableSortSpecsBuild);
		*(cast(void**)&igTableSortSpecsSanitize) = GetProcAddr(handle, "igTableSortSpecsSanitize"); throwIf(!igTableSortSpecsSanitize);
		*(cast(void**)&igTableUpdateBorders) = GetProcAddr(handle, "igTableUpdateBorders"); throwIf(!igTableUpdateBorders);
		*(cast(void**)&igTableUpdateColumnsWeightFromWidth) = GetProcAddr(handle, "igTableUpdateColumnsWeightFromWidth"); throwIf(!igTableUpdateColumnsWeightFromWidth);
		*(cast(void**)&igTableUpdateLayout) = GetProcAddr(handle, "igTableUpdateLayout"); throwIf(!igTableUpdateLayout);
		*(cast(void**)&igTempInputIsActive) = GetProcAddr(handle, "igTempInputIsActive"); throwIf(!igTempInputIsActive);
		*(cast(void**)&igTempInputScalar) = GetProcAddr(handle, "igTempInputScalar"); throwIf(!igTempInputScalar);
		*(cast(void**)&igTempInputText) = GetProcAddr(handle, "igTempInputText"); throwIf(!igTempInputText);
		*(cast(void**)&igText) = GetProcAddr(handle, "igText"); throwIf(!igText);
		*(cast(void**)&igTextColored) = GetProcAddr(handle, "igTextColored"); throwIf(!igTextColored);
		*(cast(void**)&igTextColoredV) = GetProcAddr(handle, "igTextColoredV"); throwIf(!igTextColoredV);
		*(cast(void**)&igTextDisabled) = GetProcAddr(handle, "igTextDisabled"); throwIf(!igTextDisabled);
		*(cast(void**)&igTextDisabledV) = GetProcAddr(handle, "igTextDisabledV"); throwIf(!igTextDisabledV);
		*(cast(void**)&igTextEx) = GetProcAddr(handle, "igTextEx"); throwIf(!igTextEx);
		*(cast(void**)&igTextUnformatted) = GetProcAddr(handle, "igTextUnformatted"); throwIf(!igTextUnformatted);
		*(cast(void**)&igTextV) = GetProcAddr(handle, "igTextV"); throwIf(!igTextV);
		*(cast(void**)&igTextWrapped) = GetProcAddr(handle, "igTextWrapped"); throwIf(!igTextWrapped);
		*(cast(void**)&igTextWrappedV) = GetProcAddr(handle, "igTextWrappedV"); throwIf(!igTextWrappedV);
		*(cast(void**)&igTreeNodeBehavior) = GetProcAddr(handle, "igTreeNodeBehavior"); throwIf(!igTreeNodeBehavior);
		*(cast(void**)&igTreeNodeBehaviorIsOpen) = GetProcAddr(handle, "igTreeNodeBehaviorIsOpen"); throwIf(!igTreeNodeBehaviorIsOpen);
		*(cast(void**)&igTreeNodeExV_Ptr) = GetProcAddr(handle, "igTreeNodeExV_Ptr"); throwIf(!igTreeNodeExV_Ptr);
		*(cast(void**)&igTreeNodeExV_Str) = GetProcAddr(handle, "igTreeNodeExV_Str"); throwIf(!igTreeNodeExV_Str);
		*(cast(void**)&igTreeNodeEx_Ptr) = GetProcAddr(handle, "igTreeNodeEx_Ptr"); throwIf(!igTreeNodeEx_Ptr);
		*(cast(void**)&igTreeNodeEx_Str) = GetProcAddr(handle, "igTreeNodeEx_Str"); throwIf(!igTreeNodeEx_Str);
		*(cast(void**)&igTreeNodeEx_StrStr) = GetProcAddr(handle, "igTreeNodeEx_StrStr"); throwIf(!igTreeNodeEx_StrStr);
		*(cast(void**)&igTreeNodeV_Ptr) = GetProcAddr(handle, "igTreeNodeV_Ptr"); throwIf(!igTreeNodeV_Ptr);
		*(cast(void**)&igTreeNodeV_Str) = GetProcAddr(handle, "igTreeNodeV_Str"); throwIf(!igTreeNodeV_Str);
		*(cast(void**)&igTreeNode_Ptr) = GetProcAddr(handle, "igTreeNode_Ptr"); throwIf(!igTreeNode_Ptr);
		*(cast(void**)&igTreeNode_Str) = GetProcAddr(handle, "igTreeNode_Str"); throwIf(!igTreeNode_Str);
		*(cast(void**)&igTreeNode_StrStr) = GetProcAddr(handle, "igTreeNode_StrStr"); throwIf(!igTreeNode_StrStr);
		*(cast(void**)&igTreePop) = GetProcAddr(handle, "igTreePop"); throwIf(!igTreePop);
		*(cast(void**)&igTreePushOverrideID) = GetProcAddr(handle, "igTreePushOverrideID"); throwIf(!igTreePushOverrideID);
		*(cast(void**)&igTreePush_Ptr) = GetProcAddr(handle, "igTreePush_Ptr"); throwIf(!igTreePush_Ptr);
		*(cast(void**)&igTreePush_Str) = GetProcAddr(handle, "igTreePush_Str"); throwIf(!igTreePush_Str);
		*(cast(void**)&igUnindent) = GetProcAddr(handle, "igUnindent"); throwIf(!igUnindent);
		*(cast(void**)&igUpdateHoveredWindowAndCaptureFlags) = GetProcAddr(handle, "igUpdateHoveredWindowAndCaptureFlags"); throwIf(!igUpdateHoveredWindowAndCaptureFlags);
		*(cast(void**)&igUpdateMouseMovingWindowEndFrame) = GetProcAddr(handle, "igUpdateMouseMovingWindowEndFrame"); throwIf(!igUpdateMouseMovingWindowEndFrame);
		*(cast(void**)&igUpdateMouseMovingWindowNewFrame) = GetProcAddr(handle, "igUpdateMouseMovingWindowNewFrame"); throwIf(!igUpdateMouseMovingWindowNewFrame);
		*(cast(void**)&igUpdateWindowParentAndRootLinks) = GetProcAddr(handle, "igUpdateWindowParentAndRootLinks"); throwIf(!igUpdateWindowParentAndRootLinks);
		*(cast(void**)&igVSliderFloat) = GetProcAddr(handle, "igVSliderFloat"); throwIf(!igVSliderFloat);
		*(cast(void**)&igVSliderInt) = GetProcAddr(handle, "igVSliderInt"); throwIf(!igVSliderInt);
		*(cast(void**)&igVSliderScalar) = GetProcAddr(handle, "igVSliderScalar"); throwIf(!igVSliderScalar);
		*(cast(void**)&igValue_Bool) = GetProcAddr(handle, "igValue_Bool"); throwIf(!igValue_Bool);
		*(cast(void**)&igValue_Float) = GetProcAddr(handle, "igValue_Float"); throwIf(!igValue_Float);
		*(cast(void**)&igValue_Int) = GetProcAddr(handle, "igValue_Int"); throwIf(!igValue_Int);
		*(cast(void**)&igValue_Uint) = GetProcAddr(handle, "igValue_Uint"); throwIf(!igValue_Uint);
	}
	void unload() {
		if(handle) FreeLibrary(handle);
	}
}
__gshared _CImguiLoader CImguiLoader;
// End of CImguiLoader

alias ImDrawCallback = void function(ImDrawList* parent_list, ImDrawCmd* cmd);
alias ImDrawFlags = int;
alias ImDrawIdx = ushort;
alias ImDrawListFlags = int;
alias ImFileHandle = FILE*;
alias ImFontAtlasFlags = int;
alias ImGuiBackendFlags = int;
alias ImGuiButtonFlags = int;
alias ImGuiCol = int;
alias ImGuiColorEditFlags = int;
alias ImGuiComboFlags = int;
alias ImGuiCond = int;
alias ImGuiConfigFlags = int;
alias ImGuiContextHookCallback = void function(ImGuiContext* ctx, ImGuiContextHook* hook);
alias ImGuiDataType = int;
alias ImGuiDir = int;
alias ImGuiDragDropFlags = int;
alias ImGuiErrorLogCallback = void function(void* user_data, byte* fmt, ...);
alias ImGuiFocusedFlags = int;
alias ImGuiHoveredFlags = int;
alias ImGuiID = uint;
alias ImGuiInputTextCallback = int function(ImGuiInputTextCallbackData* data);
alias ImGuiInputTextFlags = int;
alias ImGuiItemFlags = int;
alias ImGuiItemStatusFlags = int;
alias ImGuiKey = int;
alias ImGuiKeyModFlags = int;
alias ImGuiLayoutType = int;
alias ImGuiMemAllocFunc = void* function(size_t sz, void* user_data);
alias ImGuiMemFreeFunc = void function(void* ptr, void* user_data);
alias ImGuiMouseButton = int;
alias ImGuiMouseCursor = int;
alias ImGuiNavDirSourceFlags = int;
alias ImGuiNavHighlightFlags = int;
alias ImGuiNavInput = int;
alias ImGuiNavMoveFlags = int;
alias ImGuiNextItemDataFlags = int;
alias ImGuiNextWindowDataFlags = int;
alias ImGuiOldColumnFlags = int;
alias ImGuiPopupFlags = int;
alias ImGuiSelectableFlags = int;
alias ImGuiSeparatorFlags = int;
alias ImGuiSizeCallback = void function(ImGuiSizeCallbackData* data);
alias ImGuiSliderFlags = int;
alias ImGuiSortDirection = int;
alias ImGuiStyleVar = int;
alias ImGuiTabBarFlags = int;
alias ImGuiTabItemFlags = int;
alias ImGuiTableBgTarget = int;
alias ImGuiTableColumnFlags = int;
alias ImGuiTableColumnIdx = ImS8;
alias ImGuiTableDrawChannelIdx = ImU8;
alias ImGuiTableFlags = int;
alias ImGuiTableRowFlags = int;
alias ImGuiTextFlags = int;
alias ImGuiTooltipFlags = int;
alias ImGuiTreeNodeFlags = int;
alias ImGuiViewportFlags = int;
alias ImGuiWindowFlags = int;
alias ImPoolIdx = int;
alias ImS16 = short;
alias ImS64 = int64_t;
alias ImS8 = byte;
alias ImTextureID = void*;
alias ImU32 = uint;
alias ImU64 = uint64_t;
alias ImU8 = ubyte;
alias ImWchar = ImWchar16;
alias ImWchar16 = ushort;
alias int64_t = long;
alias size_t = ulong;
alias uint64_t = ulong;
alias va_list = byte*;

enum {
	ImGuiAxis_None = -1,
	ImGuiAxis_X = 0,
	ImGuiAxis_Y = 1,
}
enum {
	ImGuiBackendFlags_None = 0,
	ImGuiBackendFlags_HasGamepad = 1 << 0,
	ImGuiBackendFlags_HasMouseCursors = 1 << 1,
	ImGuiBackendFlags_HasSetMousePos = 1 << 2,
	ImGuiBackendFlags_RendererHasVtxOffset = 1 << 3,
}
enum {
	ImGuiButtonFlags_PressedOnClick = 1 << 4,
	ImGuiButtonFlags_PressedOnClickRelease = 1 << 5,
	ImGuiButtonFlags_PressedOnClickReleaseAnywhere = 1 << 6,
	ImGuiButtonFlags_PressedOnRelease = 1 << 7,
	ImGuiButtonFlags_PressedOnDoubleClick = 1 << 8,
	ImGuiButtonFlags_PressedOnDragDropHold = 1 << 9,
	ImGuiButtonFlags_Repeat = 1 << 10,
	ImGuiButtonFlags_FlattenChildren = 1 << 11,
	ImGuiButtonFlags_AllowItemOverlap = 1 << 12,
	ImGuiButtonFlags_DontClosePopups = 1 << 13,
	ImGuiButtonFlags_Disabled = 1 << 14,
	ImGuiButtonFlags_AlignTextBaseLine = 1 << 15,
	ImGuiButtonFlags_NoKeyModifiers = 1 << 16,
	ImGuiButtonFlags_NoHoldingActiveId = 1 << 17,
	ImGuiButtonFlags_NoNavFocus = 1 << 18,
	ImGuiButtonFlags_NoHoveredOnFocus = 1 << 19,
	ImGuiButtonFlags_PressedOnMask_ = ImGuiButtonFlags_PressedOnClick | ImGuiButtonFlags_PressedOnClickRelease | ImGuiButtonFlags_PressedOnClickReleaseAnywhere | ImGuiButtonFlags_PressedOnRelease | ImGuiButtonFlags_PressedOnDoubleClick | ImGuiButtonFlags_PressedOnDragDropHold,
	ImGuiButtonFlags_PressedOnDefault_ = ImGuiButtonFlags_PressedOnClickRelease,
}
enum {
	ImGuiButtonFlags_None = 0,
	ImGuiButtonFlags_MouseButtonLeft = 1 << 0,
	ImGuiButtonFlags_MouseButtonRight = 1 << 1,
	ImGuiButtonFlags_MouseButtonMiddle = 1 << 2,
	ImGuiButtonFlags_MouseButtonMask_ = ImGuiButtonFlags_MouseButtonLeft | ImGuiButtonFlags_MouseButtonRight | ImGuiButtonFlags_MouseButtonMiddle,
	ImGuiButtonFlags_MouseButtonDefault_ = ImGuiButtonFlags_MouseButtonLeft,
}
enum {
	ImGuiCol_Text,
	ImGuiCol_TextDisabled,
	ImGuiCol_WindowBg,
	ImGuiCol_ChildBg,
	ImGuiCol_PopupBg,
	ImGuiCol_Border,
	ImGuiCol_BorderShadow,
	ImGuiCol_FrameBg,
	ImGuiCol_FrameBgHovered,
	ImGuiCol_FrameBgActive,
	ImGuiCol_TitleBg,
	ImGuiCol_TitleBgActive,
	ImGuiCol_TitleBgCollapsed,
	ImGuiCol_MenuBarBg,
	ImGuiCol_ScrollbarBg,
	ImGuiCol_ScrollbarGrab,
	ImGuiCol_ScrollbarGrabHovered,
	ImGuiCol_ScrollbarGrabActive,
	ImGuiCol_CheckMark,
	ImGuiCol_SliderGrab,
	ImGuiCol_SliderGrabActive,
	ImGuiCol_Button,
	ImGuiCol_ButtonHovered,
	ImGuiCol_ButtonActive,
	ImGuiCol_Header,
	ImGuiCol_HeaderHovered,
	ImGuiCol_HeaderActive,
	ImGuiCol_Separator,
	ImGuiCol_SeparatorHovered,
	ImGuiCol_SeparatorActive,
	ImGuiCol_ResizeGrip,
	ImGuiCol_ResizeGripHovered,
	ImGuiCol_ResizeGripActive,
	ImGuiCol_Tab,
	ImGuiCol_TabHovered,
	ImGuiCol_TabActive,
	ImGuiCol_TabUnfocused,
	ImGuiCol_TabUnfocusedActive,
	ImGuiCol_PlotLines,
	ImGuiCol_PlotLinesHovered,
	ImGuiCol_PlotHistogram,
	ImGuiCol_PlotHistogramHovered,
	ImGuiCol_TableHeaderBg,
	ImGuiCol_TableBorderStrong,
	ImGuiCol_TableBorderLight,
	ImGuiCol_TableRowBg,
	ImGuiCol_TableRowBgAlt,
	ImGuiCol_TextSelectedBg,
	ImGuiCol_DragDropTarget,
	ImGuiCol_NavHighlight,
	ImGuiCol_NavWindowingHighlight,
	ImGuiCol_NavWindowingDimBg,
	ImGuiCol_ModalWindowDimBg,
	ImGuiCol_COUNT,
}
enum {
	ImGuiColorEditFlags_None = 0,
	ImGuiColorEditFlags_NoAlpha = 1 << 1,
	ImGuiColorEditFlags_NoPicker = 1 << 2,
	ImGuiColorEditFlags_NoOptions = 1 << 3,
	ImGuiColorEditFlags_NoSmallPreview = 1 << 4,
	ImGuiColorEditFlags_NoInputs = 1 << 5,
	ImGuiColorEditFlags_NoTooltip = 1 << 6,
	ImGuiColorEditFlags_NoLabel = 1 << 7,
	ImGuiColorEditFlags_NoSidePreview = 1 << 8,
	ImGuiColorEditFlags_NoDragDrop = 1 << 9,
	ImGuiColorEditFlags_NoBorder = 1 << 10,
	ImGuiColorEditFlags_AlphaBar = 1 << 16,
	ImGuiColorEditFlags_AlphaPreview = 1 << 17,
	ImGuiColorEditFlags_AlphaPreviewHalf = 1 << 18,
	ImGuiColorEditFlags_HDR = 1 << 19,
	ImGuiColorEditFlags_DisplayRGB = 1 << 20,
	ImGuiColorEditFlags_DisplayHSV = 1 << 21,
	ImGuiColorEditFlags_DisplayHex = 1 << 22,
	ImGuiColorEditFlags_Uint8 = 1 << 23,
	ImGuiColorEditFlags_Float = 1 << 24,
	ImGuiColorEditFlags_PickerHueBar = 1 << 25,
	ImGuiColorEditFlags_PickerHueWheel = 1 << 26,
	ImGuiColorEditFlags_InputRGB = 1 << 27,
	ImGuiColorEditFlags_InputHSV = 1 << 28,
	ImGuiColorEditFlags__OptionsDefault = ImGuiColorEditFlags_Uint8 | ImGuiColorEditFlags_DisplayRGB | ImGuiColorEditFlags_InputRGB | ImGuiColorEditFlags_PickerHueBar,
	ImGuiColorEditFlags__DisplayMask = ImGuiColorEditFlags_DisplayRGB | ImGuiColorEditFlags_DisplayHSV | ImGuiColorEditFlags_DisplayHex,
	ImGuiColorEditFlags__DataTypeMask = ImGuiColorEditFlags_Uint8 | ImGuiColorEditFlags_Float,
	ImGuiColorEditFlags__PickerMask = ImGuiColorEditFlags_PickerHueWheel | ImGuiColorEditFlags_PickerHueBar,
	ImGuiColorEditFlags__InputMask = ImGuiColorEditFlags_InputRGB | ImGuiColorEditFlags_InputHSV,
}
enum {
	ImGuiComboFlags_None = 0,
	ImGuiComboFlags_PopupAlignLeft = 1 << 0,
	ImGuiComboFlags_HeightSmall = 1 << 1,
	ImGuiComboFlags_HeightRegular = 1 << 2,
	ImGuiComboFlags_HeightLarge = 1 << 3,
	ImGuiComboFlags_HeightLargest = 1 << 4,
	ImGuiComboFlags_NoArrowButton = 1 << 5,
	ImGuiComboFlags_NoPreview = 1 << 6,
	ImGuiComboFlags_HeightMask_ = ImGuiComboFlags_HeightSmall | ImGuiComboFlags_HeightRegular | ImGuiComboFlags_HeightLarge | ImGuiComboFlags_HeightLargest,
}
enum {
	ImGuiCond_None = 0,
	ImGuiCond_Always = 1 << 0,
	ImGuiCond_Once = 1 << 1,
	ImGuiCond_FirstUseEver = 1 << 2,
	ImGuiCond_Appearing = 1 << 3,
}
enum {
	ImGuiConfigFlags_None = 0,
	ImGuiConfigFlags_NavEnableKeyboard = 1 << 0,
	ImGuiConfigFlags_NavEnableGamepad = 1 << 1,
	ImGuiConfigFlags_NavEnableSetMousePos = 1 << 2,
	ImGuiConfigFlags_NavNoCaptureKeyboard = 1 << 3,
	ImGuiConfigFlags_NoMouse = 1 << 4,
	ImGuiConfigFlags_NoMouseCursorChange = 1 << 5,
	ImGuiConfigFlags_IsSRGB = 1 << 20,
	ImGuiConfigFlags_IsTouchScreen = 1 << 21,
}
enum {
	ImGuiContextHookType_NewFramePre,
	ImGuiContextHookType_NewFramePost,
	ImGuiContextHookType_EndFramePre,
	ImGuiContextHookType_EndFramePost,
	ImGuiContextHookType_RenderPre,
	ImGuiContextHookType_RenderPost,
	ImGuiContextHookType_Shutdown,
	ImGuiContextHookType_PendingRemoval_,
}
enum {
	ImGuiDataType_String = ImGuiDataType_COUNT + 1,
	ImGuiDataType_Pointer,
	ImGuiDataType_ID,
}
enum {
	ImGuiDataType_S8,
	ImGuiDataType_U8,
	ImGuiDataType_S16,
	ImGuiDataType_U16,
	ImGuiDataType_S32,
	ImGuiDataType_U32,
	ImGuiDataType_S64,
	ImGuiDataType_U64,
	ImGuiDataType_Float,
	ImGuiDataType_Double,
	ImGuiDataType_COUNT,
}
enum {
	ImGuiDir_None = -1,
	ImGuiDir_Left = 0,
	ImGuiDir_Right = 1,
	ImGuiDir_Up = 2,
	ImGuiDir_Down = 3,
	ImGuiDir_COUNT,
}
enum {
	ImGuiDragDropFlags_None = 0,
	ImGuiDragDropFlags_SourceNoPreviewTooltip = 1 << 0,
	ImGuiDragDropFlags_SourceNoDisableHover = 1 << 1,
	ImGuiDragDropFlags_SourceNoHoldToOpenOthers = 1 << 2,
	ImGuiDragDropFlags_SourceAllowNullID = 1 << 3,
	ImGuiDragDropFlags_SourceExtern = 1 << 4,
	ImGuiDragDropFlags_SourceAutoExpirePayload = 1 << 5,
	ImGuiDragDropFlags_AcceptBeforeDelivery = 1 << 10,
	ImGuiDragDropFlags_AcceptNoDrawDefaultRect = 1 << 11,
	ImGuiDragDropFlags_AcceptNoPreviewTooltip = 1 << 12,
	ImGuiDragDropFlags_AcceptPeekOnly = ImGuiDragDropFlags_AcceptBeforeDelivery | ImGuiDragDropFlags_AcceptNoDrawDefaultRect,
}
enum {
	ImGuiFocusedFlags_None = 0,
	ImGuiFocusedFlags_ChildWindows = 1 << 0,
	ImGuiFocusedFlags_RootWindow = 1 << 1,
	ImGuiFocusedFlags_AnyWindow = 1 << 2,
	ImGuiFocusedFlags_RootAndChildWindows = ImGuiFocusedFlags_RootWindow | ImGuiFocusedFlags_ChildWindows,
}
enum {
	ImGuiHoveredFlags_None = 0,
	ImGuiHoveredFlags_ChildWindows = 1 << 0,
	ImGuiHoveredFlags_RootWindow = 1 << 1,
	ImGuiHoveredFlags_AnyWindow = 1 << 2,
	ImGuiHoveredFlags_AllowWhenBlockedByPopup = 1 << 3,
	ImGuiHoveredFlags_AllowWhenBlockedByActiveItem = 1 << 5,
	ImGuiHoveredFlags_AllowWhenOverlapped = 1 << 6,
	ImGuiHoveredFlags_AllowWhenDisabled = 1 << 7,
	ImGuiHoveredFlags_RectOnly = ImGuiHoveredFlags_AllowWhenBlockedByPopup | ImGuiHoveredFlags_AllowWhenBlockedByActiveItem | ImGuiHoveredFlags_AllowWhenOverlapped,
	ImGuiHoveredFlags_RootAndChildWindows = ImGuiHoveredFlags_RootWindow | ImGuiHoveredFlags_ChildWindows,
}
enum {
	ImGuiInputReadMode_Down,
	ImGuiInputReadMode_Pressed,
	ImGuiInputReadMode_Released,
	ImGuiInputReadMode_Repeat,
	ImGuiInputReadMode_RepeatSlow,
	ImGuiInputReadMode_RepeatFast,
}
enum {
	ImGuiInputSource_None = 0,
	ImGuiInputSource_Mouse,
	ImGuiInputSource_Keyboard,
	ImGuiInputSource_Gamepad,
	ImGuiInputSource_Nav,
	ImGuiInputSource_COUNT,
}
enum {
	ImGuiInputTextFlags_None = 0,
	ImGuiInputTextFlags_CharsDecimal = 1 << 0,
	ImGuiInputTextFlags_CharsHexadecimal = 1 << 1,
	ImGuiInputTextFlags_CharsUppercase = 1 << 2,
	ImGuiInputTextFlags_CharsNoBlank = 1 << 3,
	ImGuiInputTextFlags_AutoSelectAll = 1 << 4,
	ImGuiInputTextFlags_EnterReturnsTrue = 1 << 5,
	ImGuiInputTextFlags_CallbackCompletion = 1 << 6,
	ImGuiInputTextFlags_CallbackHistory = 1 << 7,
	ImGuiInputTextFlags_CallbackAlways = 1 << 8,
	ImGuiInputTextFlags_CallbackCharFilter = 1 << 9,
	ImGuiInputTextFlags_AllowTabInput = 1 << 10,
	ImGuiInputTextFlags_CtrlEnterForNewLine = 1 << 11,
	ImGuiInputTextFlags_NoHorizontalScroll = 1 << 12,
	ImGuiInputTextFlags_AlwaysOverwrite = 1 << 13,
	ImGuiInputTextFlags_ReadOnly = 1 << 14,
	ImGuiInputTextFlags_Password = 1 << 15,
	ImGuiInputTextFlags_NoUndoRedo = 1 << 16,
	ImGuiInputTextFlags_CharsScientific = 1 << 17,
	ImGuiInputTextFlags_CallbackResize = 1 << 18,
	ImGuiInputTextFlags_CallbackEdit = 1 << 19,
	ImGuiInputTextFlags_Multiline = 1 << 20,
	ImGuiInputTextFlags_NoMarkEdited = 1 << 21,
}
enum {
	ImGuiItemFlags_None = 0,
	ImGuiItemFlags_NoTabStop = 1 << 0,
	ImGuiItemFlags_ButtonRepeat = 1 << 1,
	ImGuiItemFlags_Disabled = 1 << 2,
	ImGuiItemFlags_NoNav = 1 << 3,
	ImGuiItemFlags_NoNavDefaultFocus = 1 << 4,
	ImGuiItemFlags_SelectableDontClosePopup = 1 << 5,
	ImGuiItemFlags_MixedValue = 1 << 6,
	ImGuiItemFlags_ReadOnly = 1 << 7,
	ImGuiItemFlags_Default_ = 0,
}
enum {
	ImGuiItemStatusFlags_None = 0,
	ImGuiItemStatusFlags_HoveredRect = 1 << 0,
	ImGuiItemStatusFlags_HasDisplayRect = 1 << 1,
	ImGuiItemStatusFlags_Edited = 1 << 2,
	ImGuiItemStatusFlags_ToggledSelection = 1 << 3,
	ImGuiItemStatusFlags_ToggledOpen = 1 << 4,
	ImGuiItemStatusFlags_HasDeactivated = 1 << 5,
	ImGuiItemStatusFlags_Deactivated = 1 << 6,
	ImGuiItemStatusFlags_HoveredWindow = 1 << 7,
}
enum {
	ImGuiKeyModFlags_None = 0,
	ImGuiKeyModFlags_Ctrl = 1 << 0,
	ImGuiKeyModFlags_Shift = 1 << 1,
	ImGuiKeyModFlags_Alt = 1 << 2,
	ImGuiKeyModFlags_Super = 1 << 3,
}
enum {
	ImGuiKey_Tab,
	ImGuiKey_LeftArrow,
	ImGuiKey_RightArrow,
	ImGuiKey_UpArrow,
	ImGuiKey_DownArrow,
	ImGuiKey_PageUp,
	ImGuiKey_PageDown,
	ImGuiKey_Home,
	ImGuiKey_End,
	ImGuiKey_Insert,
	ImGuiKey_Delete,
	ImGuiKey_Backspace,
	ImGuiKey_Space,
	ImGuiKey_Enter,
	ImGuiKey_Escape,
	ImGuiKey_KeyPadEnter,
	ImGuiKey_A,
	ImGuiKey_C,
	ImGuiKey_V,
	ImGuiKey_X,
	ImGuiKey_Y,
	ImGuiKey_Z,
	ImGuiKey_COUNT,
}
enum {
	ImGuiLayoutType_Horizontal = 0,
	ImGuiLayoutType_Vertical = 1,
}
enum {
	ImGuiLogType_None = 0,
	ImGuiLogType_TTY,
	ImGuiLogType_File,
	ImGuiLogType_Buffer,
	ImGuiLogType_Clipboard,
}
enum {
	ImGuiMouseButton_Left = 0,
	ImGuiMouseButton_Right = 1,
	ImGuiMouseButton_Middle = 2,
	ImGuiMouseButton_COUNT = 5,
}
enum {
	ImGuiMouseCursor_None = -1,
	ImGuiMouseCursor_Arrow = 0,
	ImGuiMouseCursor_TextInput,
	ImGuiMouseCursor_ResizeAll,
	ImGuiMouseCursor_ResizeNS,
	ImGuiMouseCursor_ResizeEW,
	ImGuiMouseCursor_ResizeNESW,
	ImGuiMouseCursor_ResizeNWSE,
	ImGuiMouseCursor_Hand,
	ImGuiMouseCursor_NotAllowed,
	ImGuiMouseCursor_COUNT,
}
enum {
	ImGuiNavDirSourceFlags_None = 0,
	ImGuiNavDirSourceFlags_Keyboard = 1 << 0,
	ImGuiNavDirSourceFlags_PadDPad = 1 << 1,
	ImGuiNavDirSourceFlags_PadLStick = 1 << 2,
}
enum {
	ImGuiNavForward_None,
	ImGuiNavForward_ForwardQueued,
	ImGuiNavForward_ForwardActive,
}
enum {
	ImGuiNavHighlightFlags_None = 0,
	ImGuiNavHighlightFlags_TypeDefault = 1 << 0,
	ImGuiNavHighlightFlags_TypeThin = 1 << 1,
	ImGuiNavHighlightFlags_AlwaysDraw = 1 << 2,
	ImGuiNavHighlightFlags_NoRounding = 1 << 3,
}
enum {
	ImGuiNavInput_Activate,
	ImGuiNavInput_Cancel,
	ImGuiNavInput_Input,
	ImGuiNavInput_Menu,
	ImGuiNavInput_DpadLeft,
	ImGuiNavInput_DpadRight,
	ImGuiNavInput_DpadUp,
	ImGuiNavInput_DpadDown,
	ImGuiNavInput_LStickLeft,
	ImGuiNavInput_LStickRight,
	ImGuiNavInput_LStickUp,
	ImGuiNavInput_LStickDown,
	ImGuiNavInput_FocusPrev,
	ImGuiNavInput_FocusNext,
	ImGuiNavInput_TweakSlow,
	ImGuiNavInput_TweakFast,
	ImGuiNavInput_KeyMenu_,
	ImGuiNavInput_KeyLeft_,
	ImGuiNavInput_KeyRight_,
	ImGuiNavInput_KeyUp_,
	ImGuiNavInput_KeyDown_,
	ImGuiNavInput_COUNT,
	ImGuiNavInput_InternalStart_ = ImGuiNavInput_KeyMenu_,
}
enum {
	ImGuiNavLayer_Main = 0,
	ImGuiNavLayer_Menu = 1,
	ImGuiNavLayer_COUNT,
}
enum {
	ImGuiNavMoveFlags_None = 0,
	ImGuiNavMoveFlags_LoopX = 1 << 0,
	ImGuiNavMoveFlags_LoopY = 1 << 1,
	ImGuiNavMoveFlags_WrapX = 1 << 2,
	ImGuiNavMoveFlags_WrapY = 1 << 3,
	ImGuiNavMoveFlags_AllowCurrentNavId = 1 << 4,
	ImGuiNavMoveFlags_AlsoScoreVisibleSet = 1 << 5,
	ImGuiNavMoveFlags_ScrollToEdge = 1 << 6,
}
enum {
	ImGuiNextItemDataFlags_None = 0,
	ImGuiNextItemDataFlags_HasWidth = 1 << 0,
	ImGuiNextItemDataFlags_HasOpen = 1 << 1,
}
enum {
	ImGuiNextWindowDataFlags_None = 0,
	ImGuiNextWindowDataFlags_HasPos = 1 << 0,
	ImGuiNextWindowDataFlags_HasSize = 1 << 1,
	ImGuiNextWindowDataFlags_HasContentSize = 1 << 2,
	ImGuiNextWindowDataFlags_HasCollapsed = 1 << 3,
	ImGuiNextWindowDataFlags_HasSizeConstraint = 1 << 4,
	ImGuiNextWindowDataFlags_HasFocus = 1 << 5,
	ImGuiNextWindowDataFlags_HasBgAlpha = 1 << 6,
	ImGuiNextWindowDataFlags_HasScroll = 1 << 7,
}
enum {
	ImGuiOldColumnFlags_None = 0,
	ImGuiOldColumnFlags_NoBorder = 1 << 0,
	ImGuiOldColumnFlags_NoResize = 1 << 1,
	ImGuiOldColumnFlags_NoPreserveWidths = 1 << 2,
	ImGuiOldColumnFlags_NoForceWithinWindow = 1 << 3,
	ImGuiOldColumnFlags_GrowParentContentsSize = 1 << 4,
}
enum {
	ImGuiPlotType_Lines,
	ImGuiPlotType_Histogram,
}
enum {
	ImGuiPopupFlags_None = 0,
	ImGuiPopupFlags_MouseButtonLeft = 0,
	ImGuiPopupFlags_MouseButtonRight = 1,
	ImGuiPopupFlags_MouseButtonMiddle = 2,
	ImGuiPopupFlags_MouseButtonMask_ = 0x1F,
	ImGuiPopupFlags_MouseButtonDefault_ = 1,
	ImGuiPopupFlags_NoOpenOverExistingPopup = 1 << 5,
	ImGuiPopupFlags_NoOpenOverItems = 1 << 6,
	ImGuiPopupFlags_AnyPopupId = 1 << 7,
	ImGuiPopupFlags_AnyPopupLevel = 1 << 8,
	ImGuiPopupFlags_AnyPopup = ImGuiPopupFlags_AnyPopupId | ImGuiPopupFlags_AnyPopupLevel,
}
enum {
	ImGuiPopupPositionPolicy_Default,
	ImGuiPopupPositionPolicy_ComboBox,
	ImGuiPopupPositionPolicy_Tooltip,
}
enum {
	ImGuiSelectableFlags_NoHoldingActiveID = 1 << 20,
	ImGuiSelectableFlags_SelectOnClick = 1 << 21,
	ImGuiSelectableFlags_SelectOnRelease = 1 << 22,
	ImGuiSelectableFlags_SpanAvailWidth = 1 << 23,
	ImGuiSelectableFlags_DrawHoveredWhenHeld = 1 << 24,
	ImGuiSelectableFlags_SetNavIdOnHover = 1 << 25,
	ImGuiSelectableFlags_NoPadWithHalfSpacing = 1 << 26,
}
enum {
	ImGuiSelectableFlags_None = 0,
	ImGuiSelectableFlags_DontClosePopups = 1 << 0,
	ImGuiSelectableFlags_SpanAllColumns = 1 << 1,
	ImGuiSelectableFlags_AllowDoubleClick = 1 << 2,
	ImGuiSelectableFlags_Disabled = 1 << 3,
	ImGuiSelectableFlags_AllowItemOverlap = 1 << 4,
}
enum {
	ImGuiSeparatorFlags_None = 0,
	ImGuiSeparatorFlags_Horizontal = 1 << 0,
	ImGuiSeparatorFlags_Vertical = 1 << 1,
	ImGuiSeparatorFlags_SpanAllColumns = 1 << 2,
}
enum {
	ImGuiSliderFlags_Vertical = 1 << 20,
	ImGuiSliderFlags_ReadOnly = 1 << 21,
}
enum {
	ImGuiSliderFlags_None = 0,
	ImGuiSliderFlags_AlwaysClamp = 1 << 4,
	ImGuiSliderFlags_Logarithmic = 1 << 5,
	ImGuiSliderFlags_NoRoundToFormat = 1 << 6,
	ImGuiSliderFlags_NoInput = 1 << 7,
	ImGuiSliderFlags_InvalidMask_ = 0x7000000F,
}
enum {
	ImGuiSortDirection_None = 0,
	ImGuiSortDirection_Ascending = 1,
	ImGuiSortDirection_Descending = 2,
}
enum {
	ImGuiStyleVar_Alpha,
	ImGuiStyleVar_WindowPadding,
	ImGuiStyleVar_WindowRounding,
	ImGuiStyleVar_WindowBorderSize,
	ImGuiStyleVar_WindowMinSize,
	ImGuiStyleVar_WindowTitleAlign,
	ImGuiStyleVar_ChildRounding,
	ImGuiStyleVar_ChildBorderSize,
	ImGuiStyleVar_PopupRounding,
	ImGuiStyleVar_PopupBorderSize,
	ImGuiStyleVar_FramePadding,
	ImGuiStyleVar_FrameRounding,
	ImGuiStyleVar_FrameBorderSize,
	ImGuiStyleVar_ItemSpacing,
	ImGuiStyleVar_ItemInnerSpacing,
	ImGuiStyleVar_IndentSpacing,
	ImGuiStyleVar_CellPadding,
	ImGuiStyleVar_ScrollbarSize,
	ImGuiStyleVar_ScrollbarRounding,
	ImGuiStyleVar_GrabMinSize,
	ImGuiStyleVar_GrabRounding,
	ImGuiStyleVar_TabRounding,
	ImGuiStyleVar_ButtonTextAlign,
	ImGuiStyleVar_SelectableTextAlign,
	ImGuiStyleVar_COUNT,
}
enum {
	ImGuiTabBarFlags_DockNode = 1 << 20,
	ImGuiTabBarFlags_IsFocused = 1 << 21,
	ImGuiTabBarFlags_SaveSettings = 1 << 22,
}
enum {
	ImGuiTabBarFlags_None = 0,
	ImGuiTabBarFlags_Reorderable = 1 << 0,
	ImGuiTabBarFlags_AutoSelectNewTabs = 1 << 1,
	ImGuiTabBarFlags_TabListPopupButton = 1 << 2,
	ImGuiTabBarFlags_NoCloseWithMiddleMouseButton = 1 << 3,
	ImGuiTabBarFlags_NoTabListScrollingButtons = 1 << 4,
	ImGuiTabBarFlags_NoTooltip = 1 << 5,
	ImGuiTabBarFlags_FittingPolicyResizeDown = 1 << 6,
	ImGuiTabBarFlags_FittingPolicyScroll = 1 << 7,
	ImGuiTabBarFlags_FittingPolicyMask_ = ImGuiTabBarFlags_FittingPolicyResizeDown | ImGuiTabBarFlags_FittingPolicyScroll,
	ImGuiTabBarFlags_FittingPolicyDefault_ = ImGuiTabBarFlags_FittingPolicyResizeDown,
}
enum {
	ImGuiTabItemFlags_NoCloseButton = 1 << 20,
	ImGuiTabItemFlags_Button = 1 << 21,
}
enum {
	ImGuiTabItemFlags_None = 0,
	ImGuiTabItemFlags_UnsavedDocument = 1 << 0,
	ImGuiTabItemFlags_SetSelected = 1 << 1,
	ImGuiTabItemFlags_NoCloseWithMiddleMouseButton = 1 << 2,
	ImGuiTabItemFlags_NoPushId = 1 << 3,
	ImGuiTabItemFlags_NoTooltip = 1 << 4,
	ImGuiTabItemFlags_NoReorder = 1 << 5,
	ImGuiTabItemFlags_Leading = 1 << 6,
	ImGuiTabItemFlags_Trailing = 1 << 7,
}
enum {
	ImGuiTableBgTarget_None = 0,
	ImGuiTableBgTarget_RowBg0 = 1,
	ImGuiTableBgTarget_RowBg1 = 2,
	ImGuiTableBgTarget_CellBg = 3,
}
enum {
	ImGuiTableColumnFlags_None = 0,
	ImGuiTableColumnFlags_DefaultHide = 1 << 0,
	ImGuiTableColumnFlags_DefaultSort = 1 << 1,
	ImGuiTableColumnFlags_WidthStretch = 1 << 2,
	ImGuiTableColumnFlags_WidthFixed = 1 << 3,
	ImGuiTableColumnFlags_NoResize = 1 << 4,
	ImGuiTableColumnFlags_NoReorder = 1 << 5,
	ImGuiTableColumnFlags_NoHide = 1 << 6,
	ImGuiTableColumnFlags_NoClip = 1 << 7,
	ImGuiTableColumnFlags_NoSort = 1 << 8,
	ImGuiTableColumnFlags_NoSortAscending = 1 << 9,
	ImGuiTableColumnFlags_NoSortDescending = 1 << 10,
	ImGuiTableColumnFlags_NoHeaderWidth = 1 << 11,
	ImGuiTableColumnFlags_PreferSortAscending = 1 << 12,
	ImGuiTableColumnFlags_PreferSortDescending = 1 << 13,
	ImGuiTableColumnFlags_IndentEnable = 1 << 14,
	ImGuiTableColumnFlags_IndentDisable = 1 << 15,
	ImGuiTableColumnFlags_IsEnabled = 1 << 20,
	ImGuiTableColumnFlags_IsVisible = 1 << 21,
	ImGuiTableColumnFlags_IsSorted = 1 << 22,
	ImGuiTableColumnFlags_IsHovered = 1 << 23,
	ImGuiTableColumnFlags_WidthMask_ = ImGuiTableColumnFlags_WidthStretch | ImGuiTableColumnFlags_WidthFixed,
	ImGuiTableColumnFlags_IndentMask_ = ImGuiTableColumnFlags_IndentEnable | ImGuiTableColumnFlags_IndentDisable,
	ImGuiTableColumnFlags_StatusMask_ = ImGuiTableColumnFlags_IsEnabled | ImGuiTableColumnFlags_IsVisible | ImGuiTableColumnFlags_IsSorted | ImGuiTableColumnFlags_IsHovered,
	ImGuiTableColumnFlags_NoDirectResize_ = 1 << 30,
}
enum {
	ImGuiTableFlags_None = 0,
	ImGuiTableFlags_Resizable = 1 << 0,
	ImGuiTableFlags_Reorderable = 1 << 1,
	ImGuiTableFlags_Hideable = 1 << 2,
	ImGuiTableFlags_Sortable = 1 << 3,
	ImGuiTableFlags_NoSavedSettings = 1 << 4,
	ImGuiTableFlags_ContextMenuInBody = 1 << 5,
	ImGuiTableFlags_RowBg = 1 << 6,
	ImGuiTableFlags_BordersInnerH = 1 << 7,
	ImGuiTableFlags_BordersOuterH = 1 << 8,
	ImGuiTableFlags_BordersInnerV = 1 << 9,
	ImGuiTableFlags_BordersOuterV = 1 << 10,
	ImGuiTableFlags_BordersH = ImGuiTableFlags_BordersInnerH | ImGuiTableFlags_BordersOuterH,
	ImGuiTableFlags_BordersV = ImGuiTableFlags_BordersInnerV | ImGuiTableFlags_BordersOuterV,
	ImGuiTableFlags_BordersInner = ImGuiTableFlags_BordersInnerV | ImGuiTableFlags_BordersInnerH,
	ImGuiTableFlags_BordersOuter = ImGuiTableFlags_BordersOuterV | ImGuiTableFlags_BordersOuterH,
	ImGuiTableFlags_Borders = ImGuiTableFlags_BordersInner | ImGuiTableFlags_BordersOuter,
	ImGuiTableFlags_NoBordersInBody = 1 << 11,
	ImGuiTableFlags_NoBordersInBodyUntilResize = 1 << 12,
	ImGuiTableFlags_SizingFixedFit = 1 << 13,
	ImGuiTableFlags_SizingFixedSame = 2 << 13,
	ImGuiTableFlags_SizingStretchProp = 3 << 13,
	ImGuiTableFlags_SizingStretchSame = 4 << 13,
	ImGuiTableFlags_NoHostExtendX = 1 << 16,
	ImGuiTableFlags_NoHostExtendY = 1 << 17,
	ImGuiTableFlags_NoKeepColumnsVisible = 1 << 18,
	ImGuiTableFlags_PreciseWidths = 1 << 19,
	ImGuiTableFlags_NoClip = 1 << 20,
	ImGuiTableFlags_PadOuterX = 1 << 21,
	ImGuiTableFlags_NoPadOuterX = 1 << 22,
	ImGuiTableFlags_NoPadInnerX = 1 << 23,
	ImGuiTableFlags_ScrollX = 1 << 24,
	ImGuiTableFlags_ScrollY = 1 << 25,
	ImGuiTableFlags_SortMulti = 1 << 26,
	ImGuiTableFlags_SortTristate = 1 << 27,
	ImGuiTableFlags_SizingMask_ = ImGuiTableFlags_SizingFixedFit | ImGuiTableFlags_SizingFixedSame | ImGuiTableFlags_SizingStretchProp | ImGuiTableFlags_SizingStretchSame,
}
enum {
	ImGuiTableRowFlags_None = 0,
	ImGuiTableRowFlags_Headers = 1 << 0,
}
enum {
	ImGuiTextFlags_None = 0,
	ImGuiTextFlags_NoWidthForLargeClippedText = 1 << 0,
}
enum {
	ImGuiTooltipFlags_None = 0,
	ImGuiTooltipFlags_OverridePreviousTooltip = 1 << 0,
}
enum {
	ImGuiTreeNodeFlags_ClipLabelForTrailingButton = 1 << 20,
}
enum {
	ImGuiTreeNodeFlags_None = 0,
	ImGuiTreeNodeFlags_Selected = 1 << 0,
	ImGuiTreeNodeFlags_Framed = 1 << 1,
	ImGuiTreeNodeFlags_AllowItemOverlap = 1 << 2,
	ImGuiTreeNodeFlags_NoTreePushOnOpen = 1 << 3,
	ImGuiTreeNodeFlags_NoAutoOpenOnLog = 1 << 4,
	ImGuiTreeNodeFlags_DefaultOpen = 1 << 5,
	ImGuiTreeNodeFlags_OpenOnDoubleClick = 1 << 6,
	ImGuiTreeNodeFlags_OpenOnArrow = 1 << 7,
	ImGuiTreeNodeFlags_Leaf = 1 << 8,
	ImGuiTreeNodeFlags_Bullet = 1 << 9,
	ImGuiTreeNodeFlags_FramePadding = 1 << 10,
	ImGuiTreeNodeFlags_SpanAvailWidth = 1 << 11,
	ImGuiTreeNodeFlags_SpanFullWidth = 1 << 12,
	ImGuiTreeNodeFlags_NavLeftJumpsBackHere = 1 << 13,
	ImGuiTreeNodeFlags_CollapsingHeader = ImGuiTreeNodeFlags_Framed | ImGuiTreeNodeFlags_NoTreePushOnOpen | ImGuiTreeNodeFlags_NoAutoOpenOnLog,
}
enum {
	ImGuiViewportFlags_None = 0,
	ImGuiViewportFlags_IsPlatformWindow = 1 << 0,
	ImGuiViewportFlags_IsPlatformMonitor = 1 << 1,
	ImGuiViewportFlags_OwnedByApp = 1 << 2,
}
enum {
	ImGuiWindowFlags_None = 0,
	ImGuiWindowFlags_NoTitleBar = 1 << 0,
	ImGuiWindowFlags_NoResize = 1 << 1,
	ImGuiWindowFlags_NoMove = 1 << 2,
	ImGuiWindowFlags_NoScrollbar = 1 << 3,
	ImGuiWindowFlags_NoScrollWithMouse = 1 << 4,
	ImGuiWindowFlags_NoCollapse = 1 << 5,
	ImGuiWindowFlags_AlwaysAutoResize = 1 << 6,
	ImGuiWindowFlags_NoBackground = 1 << 7,
	ImGuiWindowFlags_NoSavedSettings = 1 << 8,
	ImGuiWindowFlags_NoMouseInputs = 1 << 9,
	ImGuiWindowFlags_MenuBar = 1 << 10,
	ImGuiWindowFlags_HorizontalScrollbar = 1 << 11,
	ImGuiWindowFlags_NoFocusOnAppearing = 1 << 12,
	ImGuiWindowFlags_NoBringToFrontOnFocus = 1 << 13,
	ImGuiWindowFlags_AlwaysVerticalScrollbar = 1 << 14,
	ImGuiWindowFlags_AlwaysHorizontalScrollbar = 1 << 15,
	ImGuiWindowFlags_AlwaysUseWindowPadding = 1 << 16,
	ImGuiWindowFlags_NoNavInputs = 1 << 18,
	ImGuiWindowFlags_NoNavFocus = 1 << 19,
	ImGuiWindowFlags_UnsavedDocument = 1 << 20,
	ImGuiWindowFlags_NoNav = ImGuiWindowFlags_NoNavInputs | ImGuiWindowFlags_NoNavFocus,
	ImGuiWindowFlags_NoDecoration = ImGuiWindowFlags_NoTitleBar | ImGuiWindowFlags_NoResize | ImGuiWindowFlags_NoScrollbar | ImGuiWindowFlags_NoCollapse,
	ImGuiWindowFlags_NoInputs = ImGuiWindowFlags_NoMouseInputs | ImGuiWindowFlags_NoNavInputs | ImGuiWindowFlags_NoNavFocus,
	ImGuiWindowFlags_NavFlattened = 1 << 23,
	ImGuiWindowFlags_ChildWindow = 1 << 24,
	ImGuiWindowFlags_Tooltip = 1 << 25,
	ImGuiWindowFlags_Popup = 1 << 26,
	ImGuiWindowFlags_Modal = 1 << 27,
	ImGuiWindowFlags_ChildMenu = 1 << 28,
}

struct ImChunkStream_ImGuiTableSettings {
	ImVector_ImGuiTableSettings Buf;
}
struct ImChunkStream_ImGuiWindowSettings {
	ImVector_ImGuiWindowSettings Buf;
}
struct ImDrawChannel {
	ImVector_ImDrawCmd _CmdBuffer;
	ImVector_ImDrawIdx _IdxBuffer;
}
struct ImDrawCmd {
	ImVec4 ClipRect;
	ImTextureID TextureId;
	uint VtxOffset;
	uint IdxOffset;
	uint ElemCount;
	ImDrawCallback UserCallback;
	void* UserCallbackData;
}
struct ImDrawCmdHeader {
	ImVec4 ClipRect;
	ImTextureID TextureId;
	uint VtxOffset;
}
struct ImDrawData {
	bool Valid;
	int CmdListsCount;
	int TotalIdxCount;
	int TotalVtxCount;
	ImDrawList** CmdLists;
	ImVec2 DisplayPos;
	ImVec2 DisplaySize;
	ImVec2 FramebufferScale;
}
struct ImDrawDataBuilder {
	ImVector_ImDrawListPtr[2] Layers;
}
struct ImDrawList {
	ImVector_ImDrawCmd CmdBuffer;
	ImVector_ImDrawIdx IdxBuffer;
	ImVector_ImDrawVert VtxBuffer;
	ImDrawListFlags Flags;
	uint _VtxCurrentIdx;
	ImDrawListSharedData* _Data;
	byte* _OwnerName;
	ImDrawVert* _VtxWritePtr;
	ImDrawIdx* _IdxWritePtr;
	ImVector_ImVec4 _ClipRectStack;
	ImVector_ImTextureID _TextureIdStack;
	ImVector_ImVec2 _Path;
	ImDrawCmdHeader _CmdHeader;
	ImDrawListSplitter _Splitter;
	float _FringeScale;
}
struct ImDrawListSharedData {
	ImVec2 TexUvWhitePixel;
	ImFont* Font;
	float FontSize;
	float CurveTessellationTol;
	float CircleSegmentMaxError;
	ImVec4 ClipRectFullscreen;
	ImDrawListFlags InitialFlags;
	ImVec2[48] ArcFastVtx;
	float ArcFastRadiusCutoff;
	ImU8[64] CircleSegmentCounts;
	ImVec4* TexUvLines;
}
struct ImDrawListSplitter {
	int _Current;
	int _Count;
	ImVector_ImDrawChannel _Channels;
}
struct ImDrawVert {
	ImVec2 pos;
	ImVec2 uv;
	ImU32 col;
}
struct ImFont {
	ImVector_float IndexAdvanceX;
	float FallbackAdvanceX;
	float FontSize;
	ImVector_ImWchar IndexLookup;
	ImVector_ImFontGlyph Glyphs;
	ImFontGlyph* FallbackGlyph;
	ImFontAtlas* ContainerAtlas;
	ImFontConfig* ConfigData;
	short ConfigDataCount;
	ImWchar FallbackChar;
	ImWchar EllipsisChar;
	bool DirtyLookupTables;
	float Scale;
	float Ascent;
	float Descent;
	int MetricsTotalSurface;
	ImU8[(0xFFFF + 1) / 4096 / 8] Used4kPagesMap;
}
struct ImFontAtlas {
	ImFontAtlasFlags Flags;
	ImTextureID TexID;
	int TexDesiredWidth;
	int TexGlyphPadding;
	bool Locked;
	bool TexPixelsUseColors;
	ubyte* TexPixelsAlpha8;
	uint* TexPixelsRGBA32;
	int TexWidth;
	int TexHeight;
	ImVec2 TexUvScale;
	ImVec2 TexUvWhitePixel;
	ImVector_ImFontPtr Fonts;
	ImVector_ImFontAtlasCustomRect CustomRects;
	ImVector_ImFontConfig ConfigData;
	ImVec4[(63) + 1] TexUvLines;
	ImFontBuilderIO* FontBuilderIO;
	uint FontBuilderFlags;
	int PackIdMouseCursors;
	int PackIdLines;
}
struct ImFontAtlasCustomRect {
	ushort Width;
	ushort Height;
	ushort X;
	ushort Y;
	uint GlyphID;
	float GlyphAdvanceX;
	ImVec2 GlyphOffset;
	ImFont* Font;
}
struct ImFontBuilderIO {
	bool function(ImFontAtlas* atlas) FontBuilder_Build;
}
struct ImFontConfig {
	void* FontData;
	int FontDataSize;
	bool FontDataOwnedByAtlas;
	int FontNo;
	float SizePixels;
	int OversampleH;
	int OversampleV;
	bool PixelSnapH;
	ImVec2 GlyphExtraSpacing;
	ImVec2 GlyphOffset;
	ImWchar* GlyphRanges;
	float GlyphMinAdvanceX;
	float GlyphMaxAdvanceX;
	bool MergeMode;
	uint FontBuilderFlags;
	float RasterizerMultiply;
	ImWchar EllipsisChar;
	byte[40] Name;
	ImFont* DstFont;
}
struct ImFontGlyph {
	uint Colored;
	uint Visible;
	uint Codepoint;
	float AdvanceX;
	float X0;
	float Y0;
	float X1;
	float Y1;
	float U0;
	float V0;
	float U1;
	float V1;
}
struct ImGuiColorMod {
	ImGuiCol Col;
	ImVec4 BackupValue;
}
struct ImGuiContext {
	bool Initialized;
	bool FontAtlasOwnedByContext;
	ImGuiIO IO;
	ImGuiStyle Style;
	ImFont* Font;
	float FontSize;
	float FontBaseSize;
	ImDrawListSharedData DrawListSharedData;
	double Time;
	int FrameCount;
	int FrameCountEnded;
	int FrameCountRendered;
	bool WithinFrameScope;
	bool WithinFrameScopeWithImplicitWindow;
	bool WithinEndChild;
	bool GcCompactAll;
	bool TestEngineHookItems;
	ImGuiID TestEngineHookIdInfo;
	void* TestEngine;
	ImVector_ImGuiWindowPtr Windows;
	ImVector_ImGuiWindowPtr WindowsFocusOrder;
	ImVector_ImGuiWindowPtr WindowsTempSortBuffer;
	ImVector_ImGuiWindowPtr CurrentWindowStack;
	ImGuiStorage WindowsById;
	int WindowsActiveCount;
	ImGuiWindow* CurrentWindow;
	ImGuiWindow* HoveredWindow;
	ImGuiWindow* HoveredWindowUnderMovingWindow;
	ImGuiWindow* MovingWindow;
	ImGuiWindow* WheelingWindow;
	ImVec2 WheelingWindowRefMousePos;
	float WheelingWindowTimer;
	ImGuiID HoveredId;
	ImGuiID HoveredIdPreviousFrame;
	bool HoveredIdAllowOverlap;
	bool HoveredIdUsingMouseWheel;
	bool HoveredIdPreviousFrameUsingMouseWheel;
	bool HoveredIdDisabled;
	float HoveredIdTimer;
	float HoveredIdNotActiveTimer;
	ImGuiID ActiveId;
	ImGuiID ActiveIdIsAlive;
	float ActiveIdTimer;
	bool ActiveIdIsJustActivated;
	bool ActiveIdAllowOverlap;
	bool ActiveIdNoClearOnFocusLoss;
	bool ActiveIdHasBeenPressedBefore;
	bool ActiveIdHasBeenEditedBefore;
	bool ActiveIdHasBeenEditedThisFrame;
	bool ActiveIdUsingMouseWheel;
	ImU32 ActiveIdUsingNavDirMask;
	ImU32 ActiveIdUsingNavInputMask;
	ImU64 ActiveIdUsingKeyInputMask;
	ImVec2 ActiveIdClickOffset;
	ImGuiWindow* ActiveIdWindow;
	ImGuiInputSource ActiveIdSource;
	int ActiveIdMouseButton;
	ImGuiID ActiveIdPreviousFrame;
	bool ActiveIdPreviousFrameIsAlive;
	bool ActiveIdPreviousFrameHasBeenEditedBefore;
	ImGuiWindow* ActiveIdPreviousFrameWindow;
	ImGuiID LastActiveId;
	float LastActiveIdTimer;
	ImGuiNextWindowData NextWindowData;
	ImGuiNextItemData NextItemData;
	ImVector_ImGuiColorMod ColorStack;
	ImVector_ImGuiStyleMod StyleVarStack;
	ImVector_ImFontPtr FontStack;
	ImVector_ImGuiID FocusScopeStack;
	ImVector_ImGuiItemFlags ItemFlagsStack;
	ImVector_ImGuiGroupData GroupStack;
	ImVector_ImGuiPopupData OpenPopupStack;
	ImVector_ImGuiPopupData BeginPopupStack;
	ImVector_ImGuiViewportPPtr Viewports;
	ImGuiWindow* NavWindow;
	ImGuiID NavId;
	ImGuiID NavFocusScopeId;
	ImGuiID NavActivateId;
	ImGuiID NavActivateDownId;
	ImGuiID NavActivatePressedId;
	ImGuiID NavInputId;
	ImGuiID NavJustTabbedId;
	ImGuiID NavJustMovedToId;
	ImGuiID NavJustMovedToFocusScopeId;
	ImGuiKeyModFlags NavJustMovedToKeyMods;
	ImGuiID NavNextActivateId;
	ImGuiInputSource NavInputSource;
	ImRect NavScoringRect;
	int NavScoringCount;
	ImGuiNavLayer NavLayer;
	int NavIdTabCounter;
	bool NavIdIsAlive;
	bool NavMousePosDirty;
	bool NavDisableHighlight;
	bool NavDisableMouseHover;
	bool NavAnyRequest;
	bool NavInitRequest;
	bool NavInitRequestFromMove;
	ImGuiID NavInitResultId;
	ImRect NavInitResultRectRel;
	bool NavMoveRequest;
	ImGuiNavMoveFlags NavMoveRequestFlags;
	ImGuiNavForward NavMoveRequestForward;
	ImGuiKeyModFlags NavMoveRequestKeyMods;
	ImGuiDir NavMoveDir;
	ImGuiDir NavMoveDirLast;
	ImGuiDir NavMoveClipDir;
	ImGuiNavMoveResult NavMoveResultLocal;
	ImGuiNavMoveResult NavMoveResultLocalVisibleSet;
	ImGuiNavMoveResult NavMoveResultOther;
	ImGuiWindow* NavWrapRequestWindow;
	ImGuiNavMoveFlags NavWrapRequestFlags;
	ImGuiWindow* NavWindowingTarget;
	ImGuiWindow* NavWindowingTargetAnim;
	ImGuiWindow* NavWindowingListWindow;
	float NavWindowingTimer;
	float NavWindowingHighlightAlpha;
	bool NavWindowingToggleLayer;
	ImGuiWindow* TabFocusRequestCurrWindow;
	ImGuiWindow* TabFocusRequestNextWindow;
	int TabFocusRequestCurrCounterRegular;
	int TabFocusRequestCurrCounterTabStop;
	int TabFocusRequestNextCounterRegular;
	int TabFocusRequestNextCounterTabStop;
	bool TabFocusPressed;
	float DimBgRatio;
	ImGuiMouseCursor MouseCursor;
	bool DragDropActive;
	bool DragDropWithinSource;
	bool DragDropWithinTarget;
	ImGuiDragDropFlags DragDropSourceFlags;
	int DragDropSourceFrameCount;
	int DragDropMouseButton;
	ImGuiPayload DragDropPayload;
	ImRect DragDropTargetRect;
	ImGuiID DragDropTargetId;
	ImGuiDragDropFlags DragDropAcceptFlags;
	float DragDropAcceptIdCurrRectSurface;
	ImGuiID DragDropAcceptIdCurr;
	ImGuiID DragDropAcceptIdPrev;
	int DragDropAcceptFrameCount;
	ImGuiID DragDropHoldJustPressedId;
	ImVector_unsigned_char DragDropPayloadBufHeap;
	ubyte[16] DragDropPayloadBufLocal;
	ImGuiTable* CurrentTable;
	ImPool_ImGuiTable Tables;
	ImVector_ImGuiPtrOrIndex CurrentTableStack;
	ImVector_float TablesLastTimeActive;
	ImVector_ImDrawChannel DrawChannelsTempMergeBuffer;
	ImGuiTabBar* CurrentTabBar;
	ImPool_ImGuiTabBar TabBars;
	ImVector_ImGuiPtrOrIndex CurrentTabBarStack;
	ImVector_ImGuiShrinkWidthItem ShrinkWidthBuffer;
	ImVec2 LastValidMousePos;
	ImGuiInputTextState InputTextState;
	ImFont InputTextPasswordFont;
	ImGuiID TempInputId;
	ImGuiColorEditFlags ColorEditOptions;
	float ColorEditLastHue;
	float ColorEditLastSat;
	float[3] ColorEditLastColor;
	ImVec4 ColorPickerRef;
	float SliderCurrentAccum;
	bool SliderCurrentAccumDirty;
	bool DragCurrentAccumDirty;
	float DragCurrentAccum;
	float DragSpeedDefaultRatio;
	float ScrollbarClickDeltaToGrabCenter;
	int TooltipOverrideCount;
	float TooltipSlowDelay;
	ImVector_char ClipboardHandlerData;
	ImVector_ImGuiID MenusIdSubmittedThisFrame;
	ImVec2 PlatformImePos;
	ImVec2 PlatformImeLastPos;
	byte PlatformLocaleDecimalPoint;
	bool SettingsLoaded;
	float SettingsDirtyTimer;
	ImGuiTextBuffer SettingsIniData;
	ImVector_ImGuiSettingsHandler SettingsHandlers;
	ImChunkStream_ImGuiWindowSettings SettingsWindows;
	ImChunkStream_ImGuiTableSettings SettingsTables;
	ImVector_ImGuiContextHook Hooks;
	ImGuiID HookIdNext;
	bool LogEnabled;
	ImGuiLogType LogType;
	ImFileHandle LogFile;
	ImGuiTextBuffer LogBuffer;
	byte* LogNextPrefix;
	byte* LogNextSuffix;
	float LogLinePosY;
	bool LogLineFirstItem;
	int LogDepthRef;
	int LogDepthToExpand;
	int LogDepthToExpandDefault;
	bool DebugItemPickerActive;
	ImGuiID DebugItemPickerBreakId;
	ImGuiMetricsConfig DebugMetricsConfig;
	float[120] FramerateSecPerFrame;
	int FramerateSecPerFrameIdx;
	float FramerateSecPerFrameAccum;
	int WantCaptureMouseNextFrame;
	int WantCaptureKeyboardNextFrame;
	int WantTextInputNextFrame;
	byte[1024 * 3 + 1] TempBuffer;
}
struct ImGuiContextHook {
	ImGuiID HookId;
	ImGuiContextHookType Type;
	ImGuiID Owner;
	ImGuiContextHookCallback Callback;
	void* UserData;
}
struct ImGuiDataTypeInfo {
	size_t Size;
	byte* Name;
	byte* PrintFmt;
	byte* ScanFmt;
}
struct ImGuiDataTypeTempStorage {
	ImU8[8] Data;
}
struct ImGuiGroupData {
	ImGuiID WindowID;
	ImVec2 BackupCursorPos;
	ImVec2 BackupCursorMaxPos;
	ImVec1 BackupIndent;
	ImVec1 BackupGroupOffset;
	ImVec2 BackupCurrLineSize;
	float BackupCurrLineTextBaseOffset;
	ImGuiID BackupActiveIdIsAlive;
	bool BackupActiveIdPreviousFrameIsAlive;
	bool BackupHoveredIdIsAlive;
	bool EmitItem;
}
struct ImGuiIO {
	ImGuiConfigFlags ConfigFlags;
	ImGuiBackendFlags BackendFlags;
	ImVec2 DisplaySize;
	float DeltaTime;
	float IniSavingRate;
	byte* IniFilename;
	byte* LogFilename;
	float MouseDoubleClickTime;
	float MouseDoubleClickMaxDist;
	float MouseDragThreshold;
	int[ImGuiKey_COUNT] KeyMap;
	float KeyRepeatDelay;
	float KeyRepeatRate;
	void* UserData;
	ImFontAtlas* Fonts;
	float FontGlobalScale;
	bool FontAllowUserScaling;
	ImFont* FontDefault;
	ImVec2 DisplayFramebufferScale;
	bool MouseDrawCursor;
	bool ConfigMacOSXBehaviors;
	bool ConfigInputTextCursorBlink;
	bool ConfigDragClickToInputText;
	bool ConfigWindowsResizeFromEdges;
	bool ConfigWindowsMoveFromTitleBarOnly;
	float ConfigMemoryCompactTimer;
	byte* BackendPlatformName;
	byte* BackendRendererName;
	void* BackendPlatformUserData;
	void* BackendRendererUserData;
	void* BackendLanguageUserData;
	byte* function(void* user_data) GetClipboardTextFn;
	void function(void* user_data, byte* text) SetClipboardTextFn;
	void* ClipboardUserData;
	void function(int x, int y) ImeSetInputScreenPosFn;
	void* ImeWindowHandle;
	ImVec2 MousePos;
	bool[5] MouseDown;
	float MouseWheel;
	float MouseWheelH;
	bool KeyCtrl;
	bool KeyShift;
	bool KeyAlt;
	bool KeySuper;
	bool[512] KeysDown;
	float[ImGuiNavInput_COUNT] NavInputs;
	bool WantCaptureMouse;
	bool WantCaptureKeyboard;
	bool WantTextInput;
	bool WantSetMousePos;
	bool WantSaveIniSettings;
	bool NavActive;
	bool NavVisible;
	float Framerate;
	int MetricsRenderVertices;
	int MetricsRenderIndices;
	int MetricsRenderWindows;
	int MetricsActiveWindows;
	int MetricsActiveAllocations;
	ImVec2 MouseDelta;
	ImGuiKeyModFlags KeyMods;
	ImVec2 MousePosPrev;
	ImVec2[5] MouseClickedPos;
	double[5] MouseClickedTime;
	bool[5] MouseClicked;
	bool[5] MouseDoubleClicked;
	bool[5] MouseReleased;
	bool[5] MouseDownOwned;
	bool[5] MouseDownWasDoubleClick;
	float[5] MouseDownDuration;
	float[5] MouseDownDurationPrev;
	ImVec2[5] MouseDragMaxDistanceAbs;
	float[5] MouseDragMaxDistanceSqr;
	float[512] KeysDownDuration;
	float[512] KeysDownDurationPrev;
	float[ImGuiNavInput_COUNT] NavInputsDownDuration;
	float[ImGuiNavInput_COUNT] NavInputsDownDurationPrev;
	float PenPressure;
	ImWchar16 InputQueueSurrogate;
	ImVector_ImWchar InputQueueCharacters;
}
struct ImGuiInputTextCallbackData {
	ImGuiInputTextFlags EventFlag;
	ImGuiInputTextFlags Flags;
	void* UserData;
	ImWchar EventChar;
	ImGuiKey EventKey;
	byte* Buf;
	int BufTextLen;
	int BufSize;
	bool BufDirty;
	int CursorPos;
	int SelectionStart;
	int SelectionEnd;
}
struct ImGuiInputTextState {
	ImGuiID ID;
	int CurLenW;
	int CurLenA;
	ImVector_ImWchar TextW;
	ImVector_char TextA;
	ImVector_char InitialTextA;
	bool TextAIsValid;
	int BufCapacityA;
	float ScrollX;
	STB_TexteditState Stb;
	float CursorAnim;
	bool CursorFollow;
	bool SelectedAllMouseLock;
	bool Edited;
	ImGuiInputTextFlags UserFlags;
	ImGuiInputTextCallback UserCallback;
	void* UserCallbackData;
}
struct ImGuiLastItemDataBackup {
	ImGuiID LastItemId;
	ImGuiItemStatusFlags LastItemStatusFlags;
	ImRect LastItemRect;
	ImRect LastItemDisplayRect;
}
struct ImGuiListClipper {
	int DisplayStart;
	int DisplayEnd;
	int ItemsCount;
	int StepNo;
	int ItemsFrozen;
	float ItemsHeight;
	float StartPosY;
}
struct ImGuiMenuColumns {
	float Spacing;
	float Width;
	float NextWidth;
	float[3] Pos;
	float[3] NextWidths;
}
struct ImGuiMetricsConfig {
	bool ShowWindowsRects;
	bool ShowWindowsBeginOrder;
	bool ShowTablesRects;
	bool ShowDrawCmdMesh;
	bool ShowDrawCmdBoundingBoxes;
	int ShowWindowsRectsType;
	int ShowTablesRectsType;
}
struct ImGuiNavMoveResult {
	ImGuiWindow* Window;
	ImGuiID ID;
	ImGuiID FocusScopeId;
	float DistBox;
	float DistCenter;
	float DistAxial;
	ImRect RectRel;
}
struct ImGuiNextItemData {
	ImGuiNextItemDataFlags Flags;
	float Width;
	ImGuiID FocusScopeId;
	ImGuiCond OpenCond;
	bool OpenVal;
}
struct ImGuiNextWindowData {
	ImGuiNextWindowDataFlags Flags;
	ImGuiCond PosCond;
	ImGuiCond SizeCond;
	ImGuiCond CollapsedCond;
	ImVec2 PosVal;
	ImVec2 PosPivotVal;
	ImVec2 SizeVal;
	ImVec2 ContentSizeVal;
	ImVec2 ScrollVal;
	bool CollapsedVal;
	ImRect SizeConstraintRect;
	ImGuiSizeCallback SizeCallback;
	void* SizeCallbackUserData;
	float BgAlphaVal;
	ImVec2 MenuBarOffsetMinVal;
}
struct ImGuiOldColumnData {
	float OffsetNorm;
	float OffsetNormBeforeResize;
	ImGuiOldColumnFlags Flags;
	ImRect ClipRect;
}
struct ImGuiOldColumns {
	ImGuiID ID;
	ImGuiOldColumnFlags Flags;
	bool IsFirstFrame;
	bool IsBeingResized;
	int Current;
	int Count;
	float OffMinX;
	float OffMaxX;
	float LineMinY;
	float LineMaxY;
	float HostCursorPosY;
	float HostCursorMaxPosX;
	ImRect HostInitialClipRect;
	ImRect HostBackupClipRect;
	ImRect HostBackupParentWorkRect;
	ImVector_ImGuiOldColumnData Columns;
	ImDrawListSplitter Splitter;
}
struct ImGuiOnceUponAFrame {
	int RefFrame;
}
struct ImGuiPayload {
	void* Data;
	int DataSize;
	ImGuiID SourceId;
	ImGuiID SourceParentId;
	int DataFrameCount;
	byte[32 + 1] DataType;
	bool Preview;
	bool Delivery;
}
struct ImGuiPopupData {
	ImGuiID PopupId;
	ImGuiWindow* Window;
	ImGuiWindow* SourceWindow;
	int OpenFrameCount;
	ImGuiID OpenParentId;
	ImVec2 OpenPopupPos;
	ImVec2 OpenMousePos;
}
struct ImGuiPtrOrIndex {
	void* Ptr;
	int Index;
}
struct ImGuiSettingsHandler {
	byte* TypeName;
	ImGuiID TypeHash;
	void function(ImGuiContext* ctx, ImGuiSettingsHandler* handler) ClearAllFn;
	void function(ImGuiContext* ctx, ImGuiSettingsHandler* handler) ReadInitFn;
	void* function(ImGuiContext* ctx, ImGuiSettingsHandler* handler, byte* name) ReadOpenFn;
	void function(ImGuiContext* ctx, ImGuiSettingsHandler* handler, void* entry, byte* line) ReadLineFn;
	void function(ImGuiContext* ctx, ImGuiSettingsHandler* handler) ApplyAllFn;
	void function(ImGuiContext* ctx, ImGuiSettingsHandler* handler, ImGuiTextBuffer* out_buf) WriteAllFn;
	void* UserData;
}
struct ImGuiShrinkWidthItem {
	int Index;
	float Width;
}
struct ImGuiSizeCallbackData {
	void* UserData;
	ImVec2 Pos;
	ImVec2 CurrentSize;
	ImVec2 DesiredSize;
}
struct ImGuiStackSizes {
	short SizeOfIDStack;
	short SizeOfColorStack;
	short SizeOfStyleVarStack;
	short SizeOfFontStack;
	short SizeOfFocusScopeStack;
	short SizeOfGroupStack;
	short SizeOfBeginPopupStack;
}
struct ImGuiStorage {
	ImVector_ImGuiStoragePair Data;
}
struct ImGuiStoragePair {
	ImGuiID key;
	union {
		int val_i;
		float val_f;
		void* val_p;
	}
 }
struct ImGuiStyle {
	float Alpha;
	ImVec2 WindowPadding;
	float WindowRounding;
	float WindowBorderSize;
	ImVec2 WindowMinSize;
	ImVec2 WindowTitleAlign;
	ImGuiDir WindowMenuButtonPosition;
	float ChildRounding;
	float ChildBorderSize;
	float PopupRounding;
	float PopupBorderSize;
	ImVec2 FramePadding;
	float FrameRounding;
	float FrameBorderSize;
	ImVec2 ItemSpacing;
	ImVec2 ItemInnerSpacing;
	ImVec2 CellPadding;
	ImVec2 TouchExtraPadding;
	float IndentSpacing;
	float ColumnsMinSpacing;
	float ScrollbarSize;
	float ScrollbarRounding;
	float GrabMinSize;
	float GrabRounding;
	float LogSliderDeadzone;
	float TabRounding;
	float TabBorderSize;
	float TabMinWidthForCloseButton;
	ImGuiDir ColorButtonPosition;
	ImVec2 ButtonTextAlign;
	ImVec2 SelectableTextAlign;
	ImVec2 DisplayWindowPadding;
	ImVec2 DisplaySafeAreaPadding;
	float MouseCursorScale;
	bool AntiAliasedLines;
	bool AntiAliasedLinesUseTex;
	bool AntiAliasedFill;
	float CurveTessellationTol;
	float CircleTessellationMaxError;
	ImVec4[ImGuiCol_COUNT] Colors;
}
struct ImGuiStyleMod {
	ImGuiStyleVar VarIdx;
	union {
		int[2] BackupInt;
		float[2] BackupFloat;
	}
 }
struct ImGuiTabBar {
	ImVector_ImGuiTabItem Tabs;
	ImGuiTabBarFlags Flags;
	ImGuiID ID;
	ImGuiID SelectedTabId;
	ImGuiID NextSelectedTabId;
	ImGuiID VisibleTabId;
	int CurrFrameVisible;
	int PrevFrameVisible;
	ImRect BarRect;
	float CurrTabsContentsHeight;
	float PrevTabsContentsHeight;
	float WidthAllTabs;
	float WidthAllTabsIdeal;
	float ScrollingAnim;
	float ScrollingTarget;
	float ScrollingTargetDistToVisibility;
	float ScrollingSpeed;
	float ScrollingRectMinX;
	float ScrollingRectMaxX;
	ImGuiID ReorderRequestTabId;
	ImS8 ReorderRequestDir;
	ImS8 BeginCount;
	bool WantLayout;
	bool VisibleTabWasSubmitted;
	bool TabsAddedNew;
	ImS16 TabsActiveCount;
	ImS16 LastTabItemIdx;
	float ItemSpacingY;
	ImVec2 FramePadding;
	ImVec2 BackupCursorPos;
	ImGuiTextBuffer TabsNames;
}
struct ImGuiTabItem {
	ImGuiID ID;
	ImGuiTabItemFlags Flags;
	int LastFrameVisible;
	int LastFrameSelected;
	float Offset;
	float Width;
	float ContentWidth;
	ImS16 NameOffset;
	ImS16 BeginOrder;
	ImS16 IndexDuringLayout;
	bool WantClose;
}
struct ImGuiTable {
	ImGuiID ID;
	ImGuiTableFlags Flags;
	void* RawData;
	ImSpan_ImGuiTableColumn Columns;
	ImSpan_ImGuiTableColumnIdx DisplayOrderToIndex;
	ImSpan_ImGuiTableCellData RowCellData;
	ImU64 EnabledMaskByDisplayOrder;
	ImU64 EnabledMaskByIndex;
	ImU64 VisibleMaskByIndex;
	ImU64 RequestOutputMaskByIndex;
	ImGuiTableFlags SettingsLoadedFlags;
	int SettingsOffset;
	int LastFrameActive;
	int ColumnsCount;
	int CurrentRow;
	int CurrentColumn;
	ImS16 InstanceCurrent;
	ImS16 InstanceInteracted;
	float RowPosY1;
	float RowPosY2;
	float RowMinHeight;
	float RowTextBaseline;
	float RowIndentOffsetX;
	ImGuiTableRowFlags RowFlags;
	ImGuiTableRowFlags LastRowFlags;
	int RowBgColorCounter;
	ImU32[2] RowBgColor;
	ImU32 BorderColorStrong;
	ImU32 BorderColorLight;
	float BorderX1;
	float BorderX2;
	float HostIndentX;
	float MinColumnWidth;
	float OuterPaddingX;
	float CellPaddingX;
	float CellPaddingY;
	float CellSpacingX1;
	float CellSpacingX2;
	float LastOuterHeight;
	float LastFirstRowHeight;
	float InnerWidth;
	float ColumnsGivenWidth;
	float ColumnsAutoFitWidth;
	float ResizedColumnNextWidth;
	float ResizeLockMinContentsX2;
	float RefScale;
	ImRect OuterRect;
	ImRect InnerRect;
	ImRect WorkRect;
	ImRect InnerClipRect;
	ImRect BgClipRect;
	ImRect Bg0ClipRectForDrawCmd;
	ImRect Bg2ClipRectForDrawCmd;
	ImRect HostClipRect;
	ImRect HostBackupWorkRect;
	ImRect HostBackupParentWorkRect;
	ImRect HostBackupInnerClipRect;
	ImVec2 HostBackupPrevLineSize;
	ImVec2 HostBackupCurrLineSize;
	ImVec2 HostBackupCursorMaxPos;
	ImVec2 UserOuterSize;
	ImVec1 HostBackupColumnsOffset;
	float HostBackupItemWidth;
	int HostBackupItemWidthStackSize;
	ImGuiWindow* OuterWindow;
	ImGuiWindow* InnerWindow;
	ImGuiTextBuffer ColumnsNames;
	ImDrawListSplitter DrawSplitter;
	ImGuiTableColumnSortSpecs SortSpecsSingle;
	ImVector_ImGuiTableColumnSortSpecs SortSpecsMulti;
	ImGuiTableSortSpecs SortSpecs;
	ImGuiTableColumnIdx SortSpecsCount;
	ImGuiTableColumnIdx ColumnsEnabledCount;
	ImGuiTableColumnIdx ColumnsEnabledFixedCount;
	ImGuiTableColumnIdx DeclColumnsCount;
	ImGuiTableColumnIdx HoveredColumnBody;
	ImGuiTableColumnIdx HoveredColumnBorder;
	ImGuiTableColumnIdx AutoFitSingleColumn;
	ImGuiTableColumnIdx ResizedColumn;
	ImGuiTableColumnIdx LastResizedColumn;
	ImGuiTableColumnIdx HeldHeaderColumn;
	ImGuiTableColumnIdx ReorderColumn;
	ImGuiTableColumnIdx ReorderColumnDir;
	ImGuiTableColumnIdx LeftMostEnabledColumn;
	ImGuiTableColumnIdx RightMostEnabledColumn;
	ImGuiTableColumnIdx LeftMostStretchedColumn;
	ImGuiTableColumnIdx RightMostStretchedColumn;
	ImGuiTableColumnIdx ContextPopupColumn;
	ImGuiTableColumnIdx FreezeRowsRequest;
	ImGuiTableColumnIdx FreezeRowsCount;
	ImGuiTableColumnIdx FreezeColumnsRequest;
	ImGuiTableColumnIdx FreezeColumnsCount;
	ImGuiTableColumnIdx RowCellDataCurrent;
	ImGuiTableDrawChannelIdx DummyDrawChannel;
	ImGuiTableDrawChannelIdx Bg2DrawChannelCurrent;
	ImGuiTableDrawChannelIdx Bg2DrawChannelUnfrozen;
	bool IsLayoutLocked;
	bool IsInsideRow;
	bool IsInitializing;
	bool IsSortSpecsDirty;
	bool IsUsingHeaders;
	bool IsContextPopupOpen;
	bool IsSettingsRequestLoad;
	bool IsSettingsDirty;
	bool IsDefaultDisplayOrder;
	bool IsResetAllRequest;
	bool IsResetDisplayOrderRequest;
	bool IsUnfrozenRows;
	bool IsDefaultSizingPolicy;
	bool MemoryCompacted;
	bool HostSkipItems;
}
struct ImGuiTableCellData {
	ImU32 BgColor;
	ImGuiTableColumnIdx Column;
}
struct ImGuiTableColumn {
	ImGuiTableColumnFlags Flags;
	float WidthGiven;
	float MinX;
	float MaxX;
	float WidthRequest;
	float WidthAuto;
	float StretchWeight;
	float InitStretchWeightOrWidth;
	ImRect ClipRect;
	ImGuiID UserID;
	float WorkMinX;
	float WorkMaxX;
	float ItemWidth;
	float ContentMaxXFrozen;
	float ContentMaxXUnfrozen;
	float ContentMaxXHeadersUsed;
	float ContentMaxXHeadersIdeal;
	ImS16 NameOffset;
	ImGuiTableColumnIdx DisplayOrder;
	ImGuiTableColumnIdx IndexWithinEnabledSet;
	ImGuiTableColumnIdx PrevEnabledColumn;
	ImGuiTableColumnIdx NextEnabledColumn;
	ImGuiTableColumnIdx SortOrder;
	ImGuiTableDrawChannelIdx DrawChannelCurrent;
	ImGuiTableDrawChannelIdx DrawChannelFrozen;
	ImGuiTableDrawChannelIdx DrawChannelUnfrozen;
	bool IsEnabled;
	bool IsEnabledNextFrame;
	bool IsVisibleX;
	bool IsVisibleY;
	bool IsRequestOutput;
	bool IsSkipItems;
	bool IsPreserveWidthAuto;
	ImS8 NavLayerCurrent;
	ImU8 AutoFitQueue;
	ImU8 CannotSkipItemsQueue;
	ImU8 SortDirection;
	ImU8 SortDirectionsAvailCount;
	ImU8 SortDirectionsAvailMask;
	ImU8 SortDirectionsAvailList;
}
struct ImGuiTableColumnSettings {
	float WidthOrWeight;
	ImGuiID UserID;
	ImGuiTableColumnIdx Index;
	ImGuiTableColumnIdx DisplayOrder;
	ImGuiTableColumnIdx SortOrder;
	ImU8 SortDirection;
	ImU8 IsEnabled;
	ImU8 IsStretch;
}
struct ImGuiTableColumnSortSpecs {
	ImGuiID ColumnUserID;
	ImS16 ColumnIndex;
	ImS16 SortOrder;
	ImGuiSortDirection SortDirection;
}
struct ImGuiTableColumnsSettings {
}
struct ImGuiTableSettings {
	ImGuiID ID;
	ImGuiTableFlags SaveFlags;
	float RefScale;
	ImGuiTableColumnIdx ColumnsCount;
	ImGuiTableColumnIdx ColumnsCountMax;
	bool WantApply;
}
struct ImGuiTableSortSpecs {
	ImGuiTableColumnSortSpecs* Specs;
	int SpecsCount;
	bool SpecsDirty;
}
struct ImGuiTextBuffer {
	ImVector_char Buf;
}
struct ImGuiTextFilter {
	byte[256] InputBuf;
	ImVector_ImGuiTextRange Filters;
	int CountGrep;
}
struct ImGuiTextRange {
	byte* b;
	byte* e;
}
struct ImGuiViewport {
	ImGuiViewportFlags Flags;
	ImVec2 Pos;
	ImVec2 Size;
	ImVec2 WorkPos;
	ImVec2 WorkSize;
}
struct ImGuiViewportP {
	ImGuiViewport _ImGuiViewport;
	int[2] DrawListsLastFrame;
	ImDrawList*[2] DrawLists;
	ImDrawData DrawDataP;
	ImDrawDataBuilder DrawDataBuilder;
	ImVec2 WorkOffsetMin;
	ImVec2 WorkOffsetMax;
	ImVec2 CurrWorkOffsetMin;
	ImVec2 CurrWorkOffsetMax;
}
struct ImGuiWindow {
	byte* Name;
	ImGuiID ID;
	ImGuiWindowFlags Flags;
	ImVec2 Pos;
	ImVec2 Size;
	ImVec2 SizeFull;
	ImVec2 ContentSize;
	ImVec2 ContentSizeIdeal;
	ImVec2 ContentSizeExplicit;
	ImVec2 WindowPadding;
	float WindowRounding;
	float WindowBorderSize;
	int NameBufLen;
	ImGuiID MoveId;
	ImGuiID ChildId;
	ImVec2 Scroll;
	ImVec2 ScrollMax;
	ImVec2 ScrollTarget;
	ImVec2 ScrollTargetCenterRatio;
	ImVec2 ScrollTargetEdgeSnapDist;
	ImVec2 ScrollbarSizes;
	bool ScrollbarX;
	bool ScrollbarY;
	bool Active;
	bool WasActive;
	bool WriteAccessed;
	bool Collapsed;
	bool WantCollapseToggle;
	bool SkipItems;
	bool Appearing;
	bool Hidden;
	bool IsFallbackWindow;
	bool HasCloseButton;
	byte ResizeBorderHeld;
	short BeginCount;
	short BeginOrderWithinParent;
	short BeginOrderWithinContext;
	ImGuiID PopupId;
	ImS8 AutoFitFramesX;
	ImS8 AutoFitFramesY;
	ImS8 AutoFitChildAxises;
	bool AutoFitOnlyGrows;
	ImGuiDir AutoPosLastDirection;
	ImS8 HiddenFramesCanSkipItems;
	ImS8 HiddenFramesCannotSkipItems;
	ImS8 HiddenFramesForRenderOnly;
	ImGuiCond SetWindowPosAllowFlags;
	ImGuiCond SetWindowSizeAllowFlags;
	ImGuiCond SetWindowCollapsedAllowFlags;
	ImVec2 SetWindowPosVal;
	ImVec2 SetWindowPosPivot;
	ImVector_ImGuiID IDStack;
	ImGuiWindowTempData DC;
	ImRect OuterRectClipped;
	ImRect InnerRect;
	ImRect InnerClipRect;
	ImRect WorkRect;
	ImRect ParentWorkRect;
	ImRect ClipRect;
	ImRect ContentRegionRect;
	ImVec2ih HitTestHoleSize;
	ImVec2ih HitTestHoleOffset;
	int LastFrameActive;
	float LastTimeActive;
	float ItemWidthDefault;
	ImGuiStorage StateStorage;
	ImVector_ImGuiOldColumns ColumnsStorage;
	float FontWindowScale;
	int SettingsOffset;
	ImDrawList* DrawList;
	ImDrawList DrawListInst;
	ImGuiWindow* ParentWindow;
	ImGuiWindow* RootWindow;
	ImGuiWindow* RootWindowForTitleBarHighlight;
	ImGuiWindow* RootWindowForNav;
	ImGuiWindow* NavLastChildNavWindow;
	ImGuiID[ImGuiNavLayer_COUNT] NavLastIds;
	ImRect[ImGuiNavLayer_COUNT] NavRectRel;
	int MemoryDrawListIdxCapacity;
	int MemoryDrawListVtxCapacity;
	bool MemoryCompacted;
}
struct ImGuiWindowSettings {
	ImGuiID ID;
	ImVec2ih Pos;
	ImVec2ih Size;
	bool Collapsed;
	bool WantApply;
}
struct ImGuiWindowTempData {
	ImVec2 CursorPos;
	ImVec2 CursorPosPrevLine;
	ImVec2 CursorStartPos;
	ImVec2 CursorMaxPos;
	ImVec2 IdealMaxPos;
	ImVec2 CurrLineSize;
	ImVec2 PrevLineSize;
	float CurrLineTextBaseOffset;
	float PrevLineTextBaseOffset;
	ImVec1 Indent;
	ImVec1 ColumnsOffset;
	ImVec1 GroupOffset;
	ImGuiID LastItemId;
	ImGuiItemStatusFlags LastItemStatusFlags;
	ImRect LastItemRect;
	ImRect LastItemDisplayRect;
	ImGuiNavLayer NavLayerCurrent;
	int NavLayerActiveMask;
	int NavLayerActiveMaskNext;
	ImGuiID NavFocusScopeIdCurrent;
	bool NavHideHighlightOneFrame;
	bool NavHasScroll;
	bool MenuBarAppending;
	ImVec2 MenuBarOffset;
	ImGuiMenuColumns MenuColumns;
	int TreeDepth;
	ImU32 TreeJumpToParentOnPopMask;
	ImVector_ImGuiWindowPtr ChildWindows;
	ImGuiStorage* StateStorage;
	ImGuiOldColumns* CurrentColumns;
	int CurrentTableIdx;
	ImGuiLayoutType LayoutType;
	ImGuiLayoutType ParentLayoutType;
	int FocusCounterRegular;
	int FocusCounterTabStop;
	ImGuiItemFlags ItemFlags;
	float ItemWidth;
	float TextWrapPos;
	ImVector_float ItemWidthStack;
	ImVector_float TextWrapPosStack;
	ImGuiStackSizes StackSizesOnBegin;
}
struct ImPool_ImGuiTabBar {
	ImVector_ImGuiTabBar Buf;
	ImGuiStorage Map;
	ImPoolIdx FreeIdx;
}
struct ImPool_ImGuiTable {
	ImVector_ImGuiTable Buf;
	ImGuiStorage Map;
	ImPoolIdx FreeIdx;
}
struct ImRect {
	ImVec2 Min;
	ImVec2 Max;
}
struct ImSpan_ImGuiTableCellData {
	ImGuiTableCellData* Data;
	ImGuiTableCellData* DataEnd;
}
struct ImSpan_ImGuiTableColumn {
	ImGuiTableColumn* Data;
	ImGuiTableColumn* DataEnd;
}
struct ImSpan_ImGuiTableColumnIdx {
	ImGuiTableColumnIdx* Data;
	ImGuiTableColumnIdx* DataEnd;
}
struct ImVec1 {
	float x;
}
struct ImVec2 {
	float x;
	float y;
}
struct ImVec2ih {
	short x;
	short y;
}
struct ImVec4 {
	float x;
	float y;
	float z;
	float w;
}
struct ImVector_ImDrawChannel {
	int Size;
	int Capacity;
	ImDrawChannel* Data;
}
struct ImVector_ImDrawCmd {
	int Size;
	int Capacity;
	ImDrawCmd* Data;
}
struct ImVector_ImDrawIdx {
	int Size;
	int Capacity;
	ImDrawIdx* Data;
}
struct ImVector_ImDrawVert {
	int Size;
	int Capacity;
	ImDrawVert* Data;
}
struct ImVector_ImFontAtlasCustomRect {
	int Size;
	int Capacity;
	ImFontAtlasCustomRect* Data;
}
struct ImVector_ImFontConfig {
	int Size;
	int Capacity;
	ImFontConfig* Data;
}
struct ImVector_ImFontGlyph {
	int Size;
	int Capacity;
	ImFontGlyph* Data;
}
struct ImVector_ImFontPtr {
	int Size;
	int Capacity;
	ImFont** Data;
}
struct ImVector_ImGuiColorMod {
	int Size;
	int Capacity;
	ImGuiColorMod* Data;
}
struct ImVector_ImGuiContextHook {
	int Size;
	int Capacity;
	ImGuiContextHook* Data;
}
struct ImVector_ImGuiGroupData {
	int Size;
	int Capacity;
	ImGuiGroupData* Data;
}
struct ImVector_ImGuiID {
	int Size;
	int Capacity;
	ImGuiID* Data;
}
struct ImVector_ImGuiItemFlags {
	int Size;
	int Capacity;
	ImGuiItemFlags* Data;
}
struct ImVector_ImGuiOldColumnData {
	int Size;
	int Capacity;
	ImGuiOldColumnData* Data;
}
struct ImVector_ImGuiOldColumns {
	int Size;
	int Capacity;
	ImGuiOldColumns* Data;
}
struct ImVector_ImGuiPopupData {
	int Size;
	int Capacity;
	ImGuiPopupData* Data;
}
struct ImVector_ImGuiPtrOrIndex {
	int Size;
	int Capacity;
	ImGuiPtrOrIndex* Data;
}
struct ImVector_ImGuiSettingsHandler {
	int Size;
	int Capacity;
	ImGuiSettingsHandler* Data;
}
struct ImVector_ImGuiShrinkWidthItem {
	int Size;
	int Capacity;
	ImGuiShrinkWidthItem* Data;
}
struct ImVector_ImGuiStoragePair {
	int Size;
	int Capacity;
	ImGuiStoragePair* Data;
}
struct ImVector_ImGuiStyleMod {
	int Size;
	int Capacity;
	ImGuiStyleMod* Data;
}
struct ImVector_ImGuiTabBar {
	int Size;
	int Capacity;
	ImGuiTabBar* Data;
}
struct ImVector_ImGuiTabItem {
	int Size;
	int Capacity;
	ImGuiTabItem* Data;
}
struct ImVector_ImGuiTable {
	int Size;
	int Capacity;
	ImGuiTable* Data;
}
struct ImVector_ImGuiTableColumnSortSpecs {
	int Size;
	int Capacity;
	ImGuiTableColumnSortSpecs* Data;
}
struct ImVector_ImGuiTableSettings {
	int Size;
	int Capacity;
	ImGuiTableSettings* Data;
}
struct ImVector_ImGuiTextRange {
	int Size;
	int Capacity;
	ImGuiTextRange* Data;
}
struct ImVector_ImGuiViewportPPtr {
	int Size;
	int Capacity;
	ImGuiViewportP** Data;
}
struct ImVector_ImGuiWindowPtr {
	int Size;
	int Capacity;
	ImGuiWindow** Data;
}
struct ImVector_ImGuiWindowSettings {
	int Size;
	int Capacity;
	ImGuiWindowSettings* Data;
}
struct ImVector_ImTextureID {
	int Size;
	int Capacity;
	ImTextureID* Data;
}
struct ImVector_ImVec2 {
	int Size;
	int Capacity;
	ImVec2* Data;
}
struct ImVector_ImVec4 {
	int Size;
	int Capacity;
	ImVec4* Data;
}
struct ImVector_ImWchar {
	int Size;
	int Capacity;
	ImWchar* Data;
}
struct ImVector_char {
	int Size;
	int Capacity;
	byte* Data;
}
struct ImVector_float {
	int Size;
	int Capacity;
	float* Data;
}
struct ImVector_unsigned_char {
	int Size;
	int Capacity;
	ubyte* Data;
}
struct STB_TexteditState {
	int cursor;
	int select_start;
	int select_end;
	ubyte insert_mode;
	int row_count_per_page;
	ubyte cursor_at_end_of_line;
	ubyte initialized;
	ubyte has_preferred_x;
	ubyte single_line;
	ubyte padding1;
	ubyte padding2;
	ubyte padding3;
	float preferred_x;
	StbUndoState undostate;
}
struct StbUndoState {
	StbUndoRecord[99] undo_rec;
	ImWchar[999] undo_char;
	short undo_point;
	short redo_point;
	int undo_char_point;
	int redo_char_point;
}


extern(Windows) { __gshared {

void function(ImGuiContext* ctx, ImGuiContextHook* hook)
	ImGuiContextHookCallback;

ImGuiContextHook* function()
	ImGuiContextHook_ImGuiContextHook;

void function(ImGuiContextHook* self)
	ImGuiContextHook_destroy;

ImGuiContext* function(ImFontAtlas* shared_font_atlas)
	ImGuiContext_ImGuiContext;

void function(ImGuiContext* self)
	ImGuiContext_destroy;

void function(void* user_data, byte* fmt, ...)
	ImGuiErrorLogCallback;

void function(ImGuiIO* self, uint c)
	ImGuiIO_AddInputCharacter;

void function(ImGuiIO* self, ImWchar16 c)
	ImGuiIO_AddInputCharacterUTF16;

void function(ImGuiIO* self, byte* str)
	ImGuiIO_AddInputCharactersUTF8;

void function(ImGuiIO* self)
	ImGuiIO_ClearInputCharacters;

ImGuiIO* function()
	ImGuiIO_ImGuiIO;

void function(ImGuiIO* self)
	ImGuiIO_destroy;

int function(ImGuiInputTextCallbackData* data)
	ImGuiInputTextCallback;

void function(ImGuiInputTextCallbackData* self)
	ImGuiInputTextCallbackData_ClearSelection;

void function(ImGuiInputTextCallbackData* self, int pos, int bytes_count)
	ImGuiInputTextCallbackData_DeleteChars;

bool function(ImGuiInputTextCallbackData* self)
	ImGuiInputTextCallbackData_HasSelection;

ImGuiInputTextCallbackData* function()
	ImGuiInputTextCallbackData_ImGuiInputTextCallbackData;

void function(ImGuiInputTextCallbackData* self, int pos, byte* text, byte* text_end)
	ImGuiInputTextCallbackData_InsertChars;

void function(ImGuiInputTextCallbackData* self)
	ImGuiInputTextCallbackData_SelectAll;

void function(ImGuiInputTextCallbackData* self)
	ImGuiInputTextCallbackData_destroy;

void function(ImGuiInputTextState* self)
	ImGuiInputTextState_ClearFreeMemory;

void function(ImGuiInputTextState* self)
	ImGuiInputTextState_ClearSelection;

void function(ImGuiInputTextState* self)
	ImGuiInputTextState_ClearText;

void function(ImGuiInputTextState* self)
	ImGuiInputTextState_CursorAnimReset;

void function(ImGuiInputTextState* self)
	ImGuiInputTextState_CursorClamp;

int function(ImGuiInputTextState* self)
	ImGuiInputTextState_GetRedoAvailCount;

int function(ImGuiInputTextState* self)
	ImGuiInputTextState_GetUndoAvailCount;

bool function(ImGuiInputTextState* self)
	ImGuiInputTextState_HasSelection;

ImGuiInputTextState* function()
	ImGuiInputTextState_ImGuiInputTextState;

void function(ImGuiInputTextState* self, int key)
	ImGuiInputTextState_OnKeyPressed;

void function(ImGuiInputTextState* self)
	ImGuiInputTextState_SelectAll;

void function(ImGuiInputTextState* self)
	ImGuiInputTextState_destroy;

void function(ImGuiLastItemDataBackup* self)
	ImGuiLastItemDataBackup_Backup;

ImGuiLastItemDataBackup* function()
	ImGuiLastItemDataBackup_ImGuiLastItemDataBackup;

void function(ImGuiLastItemDataBackup* self)
	ImGuiLastItemDataBackup_Restore;

void function(ImGuiLastItemDataBackup* self)
	ImGuiLastItemDataBackup_destroy;

void function(ImGuiListClipper* self, int items_count, float items_height)
	ImGuiListClipper_Begin;

void function(ImGuiListClipper* self)
	ImGuiListClipper_End;

ImGuiListClipper* function()
	ImGuiListClipper_ImGuiListClipper;

bool function(ImGuiListClipper* self)
	ImGuiListClipper_Step;

void function(ImGuiListClipper* self)
	ImGuiListClipper_destroy;

void* function(size_t sz, void* user_data)
	ImGuiMemAllocFunc;

void function(void* ptr, void* user_data)
	ImGuiMemFreeFunc;

float function(ImGuiMenuColumns* self, float avail_w)
	ImGuiMenuColumns_CalcExtraSpace;

float function(ImGuiMenuColumns* self, float w0, float w1, float w2)
	ImGuiMenuColumns_DeclColumns;

ImGuiMenuColumns* function()
	ImGuiMenuColumns_ImGuiMenuColumns;

void function(ImGuiMenuColumns* self, int count, float spacing, bool clear)
	ImGuiMenuColumns_Update;

void function(ImGuiMenuColumns* self)
	ImGuiMenuColumns_destroy;

ImGuiMetricsConfig* function()
	ImGuiMetricsConfig_ImGuiMetricsConfig;

void function(ImGuiMetricsConfig* self)
	ImGuiMetricsConfig_destroy;

void function(ImGuiNavMoveResult* self)
	ImGuiNavMoveResult_Clear;

ImGuiNavMoveResult* function()
	ImGuiNavMoveResult_ImGuiNavMoveResult;

void function(ImGuiNavMoveResult* self)
	ImGuiNavMoveResult_destroy;

void function(ImGuiNextItemData* self)
	ImGuiNextItemData_ClearFlags;

ImGuiNextItemData* function()
	ImGuiNextItemData_ImGuiNextItemData;

void function(ImGuiNextItemData* self)
	ImGuiNextItemData_destroy;

void function(ImGuiNextWindowData* self)
	ImGuiNextWindowData_ClearFlags;

ImGuiNextWindowData* function()
	ImGuiNextWindowData_ImGuiNextWindowData;

void function(ImGuiNextWindowData* self)
	ImGuiNextWindowData_destroy;

ImGuiOldColumnData* function()
	ImGuiOldColumnData_ImGuiOldColumnData;

void function(ImGuiOldColumnData* self)
	ImGuiOldColumnData_destroy;

ImGuiOldColumns* function()
	ImGuiOldColumns_ImGuiOldColumns;

void function(ImGuiOldColumns* self)
	ImGuiOldColumns_destroy;

ImGuiOnceUponAFrame* function()
	ImGuiOnceUponAFrame_ImGuiOnceUponAFrame;

void function(ImGuiOnceUponAFrame* self)
	ImGuiOnceUponAFrame_destroy;

void function(ImGuiPayload* self)
	ImGuiPayload_Clear;

ImGuiPayload* function()
	ImGuiPayload_ImGuiPayload;

bool function(ImGuiPayload* self, byte* type)
	ImGuiPayload_IsDataType;

bool function(ImGuiPayload* self)
	ImGuiPayload_IsDelivery;

bool function(ImGuiPayload* self)
	ImGuiPayload_IsPreview;

void function(ImGuiPayload* self)
	ImGuiPayload_destroy;

ImGuiPopupData* function()
	ImGuiPopupData_ImGuiPopupData;

void function(ImGuiPopupData* self)
	ImGuiPopupData_destroy;

ImGuiPtrOrIndex* function(int index)
	ImGuiPtrOrIndex_ImGuiPtrOrIndex_Int;

ImGuiPtrOrIndex* function(void* ptr)
	ImGuiPtrOrIndex_ImGuiPtrOrIndex_Ptr;

void function(ImGuiPtrOrIndex* self)
	ImGuiPtrOrIndex_destroy;

ImGuiSettingsHandler* function()
	ImGuiSettingsHandler_ImGuiSettingsHandler;

void function(ImGuiSettingsHandler* self)
	ImGuiSettingsHandler_destroy;

void function(ImGuiSizeCallbackData* data)
	ImGuiSizeCallback;

void function(ImGuiStackSizes* self)
	ImGuiStackSizes_CompareWithCurrentState;

ImGuiStackSizes* function()
	ImGuiStackSizes_ImGuiStackSizes;

void function(ImGuiStackSizes* self)
	ImGuiStackSizes_SetToCurrentState;

void function(ImGuiStackSizes* self)
	ImGuiStackSizes_destroy;

ImGuiStoragePair* function(ImGuiID _key, float _val_f)
	ImGuiStoragePair_ImGuiStoragePair_Float;

ImGuiStoragePair* function(ImGuiID _key, int _val_i)
	ImGuiStoragePair_ImGuiStoragePair_Int;

ImGuiStoragePair* function(ImGuiID _key, void* _val_p)
	ImGuiStoragePair_ImGuiStoragePair_Ptr;

void function(ImGuiStoragePair* self)
	ImGuiStoragePair_destroy;

void function(ImGuiStorage* self)
	ImGuiStorage_BuildSortByKey;

void function(ImGuiStorage* self)
	ImGuiStorage_Clear;

bool function(ImGuiStorage* self, ImGuiID key, bool default_val)
	ImGuiStorage_GetBool;

bool* function(ImGuiStorage* self, ImGuiID key, bool default_val)
	ImGuiStorage_GetBoolRef;

float function(ImGuiStorage* self, ImGuiID key, float default_val)
	ImGuiStorage_GetFloat;

float* function(ImGuiStorage* self, ImGuiID key, float default_val)
	ImGuiStorage_GetFloatRef;

int function(ImGuiStorage* self, ImGuiID key, int default_val)
	ImGuiStorage_GetInt;

int* function(ImGuiStorage* self, ImGuiID key, int default_val)
	ImGuiStorage_GetIntRef;

void* function(ImGuiStorage* self, ImGuiID key)
	ImGuiStorage_GetVoidPtr;

void** function(ImGuiStorage* self, ImGuiID key, void* default_val)
	ImGuiStorage_GetVoidPtrRef;

void function(ImGuiStorage* self, int val)
	ImGuiStorage_SetAllInt;

void function(ImGuiStorage* self, ImGuiID key, bool val)
	ImGuiStorage_SetBool;

void function(ImGuiStorage* self, ImGuiID key, float val)
	ImGuiStorage_SetFloat;

void function(ImGuiStorage* self, ImGuiID key, int val)
	ImGuiStorage_SetInt;

void function(ImGuiStorage* self, ImGuiID key, void* val)
	ImGuiStorage_SetVoidPtr;

ImGuiStyleMod* function(ImGuiStyleVar idx, float v)
	ImGuiStyleMod_ImGuiStyleMod_Float;

ImGuiStyleMod* function(ImGuiStyleVar idx, int v)
	ImGuiStyleMod_ImGuiStyleMod_Int;

ImGuiStyleMod* function(ImGuiStyleVar idx, ImVec2 v)
	ImGuiStyleMod_ImGuiStyleMod_Vec2;

void function(ImGuiStyleMod* self)
	ImGuiStyleMod_destroy;

ImGuiStyle* function()
	ImGuiStyle_ImGuiStyle;

void function(ImGuiStyle* self, float scale_factor)
	ImGuiStyle_ScaleAllSizes;

void function(ImGuiStyle* self)
	ImGuiStyle_destroy;

byte* function(ImGuiTabBar* self, ImGuiTabItem* tab)
	ImGuiTabBar_GetTabName;

int function(ImGuiTabBar* self, ImGuiTabItem* tab)
	ImGuiTabBar_GetTabOrder;

ImGuiTabBar* function()
	ImGuiTabBar_ImGuiTabBar;

void function(ImGuiTabBar* self)
	ImGuiTabBar_destroy;

ImGuiTabItem* function()
	ImGuiTabItem_ImGuiTabItem;

void function(ImGuiTabItem* self)
	ImGuiTabItem_destroy;

ImGuiTableColumnSettings* function()
	ImGuiTableColumnSettings_ImGuiTableColumnSettings;

void function(ImGuiTableColumnSettings* self)
	ImGuiTableColumnSettings_destroy;

ImGuiTableColumnSortSpecs* function()
	ImGuiTableColumnSortSpecs_ImGuiTableColumnSortSpecs;

void function(ImGuiTableColumnSortSpecs* self)
	ImGuiTableColumnSortSpecs_destroy;

ImGuiTableColumn* function()
	ImGuiTableColumn_ImGuiTableColumn;

void function(ImGuiTableColumn* self)
	ImGuiTableColumn_destroy;

ImGuiTableColumnSettings* function(ImGuiTableSettings* self)
	ImGuiTableSettings_GetColumnSettings;

ImGuiTableSettings* function()
	ImGuiTableSettings_ImGuiTableSettings;

void function(ImGuiTableSettings* self)
	ImGuiTableSettings_destroy;

ImGuiTableSortSpecs* function()
	ImGuiTableSortSpecs_ImGuiTableSortSpecs;

void function(ImGuiTableSortSpecs* self)
	ImGuiTableSortSpecs_destroy;

ImGuiTable* function()
	ImGuiTable_ImGuiTable;

void function(ImGuiTable* self)
	ImGuiTable_destroy;

ImGuiTextBuffer* function()
	ImGuiTextBuffer_ImGuiTextBuffer;

void function(ImGuiTextBuffer* self, byte* str, byte* str_end)
	ImGuiTextBuffer_append;

void function(ImGuiTextBuffer* buffer, byte* fmt, ...)
	ImGuiTextBuffer_appendf;

void function(ImGuiTextBuffer* self, byte* fmt, va_list args)
	ImGuiTextBuffer_appendfv;

byte* function(ImGuiTextBuffer* self)
	ImGuiTextBuffer_begin;

byte* function(ImGuiTextBuffer* self)
	ImGuiTextBuffer_c_str;

void function(ImGuiTextBuffer* self)
	ImGuiTextBuffer_clear;

void function(ImGuiTextBuffer* self)
	ImGuiTextBuffer_destroy;

bool function(ImGuiTextBuffer* self)
	ImGuiTextBuffer_empty;

byte* function(ImGuiTextBuffer* self)
	ImGuiTextBuffer_end;

void function(ImGuiTextBuffer* self, int capacity)
	ImGuiTextBuffer_reserve;

int function(ImGuiTextBuffer* self)
	ImGuiTextBuffer_size;

void function(ImGuiTextFilter* self)
	ImGuiTextFilter_Build;

void function(ImGuiTextFilter* self)
	ImGuiTextFilter_Clear;

bool function(ImGuiTextFilter* self, byte* label, float width)
	ImGuiTextFilter_Draw;

ImGuiTextFilter* function(byte* default_filter)
	ImGuiTextFilter_ImGuiTextFilter;

bool function(ImGuiTextFilter* self)
	ImGuiTextFilter_IsActive;

bool function(ImGuiTextFilter* self, byte* text, byte* text_end)
	ImGuiTextFilter_PassFilter;

void function(ImGuiTextFilter* self)
	ImGuiTextFilter_destroy;

ImGuiTextRange* function()
	ImGuiTextRange_ImGuiTextRange_Nil;

ImGuiTextRange* function(byte* _b, byte* _e)
	ImGuiTextRange_ImGuiTextRange_Str;

void function(ImGuiTextRange* self)
	ImGuiTextRange_destroy;

bool function(ImGuiTextRange* self)
	ImGuiTextRange_empty;

void function(ImGuiTextRange* self, byte separator, ImVector_ImGuiTextRange* out_)
	ImGuiTextRange_split;

void function(ImRect* pOut, ImGuiViewportP* self)
	ImGuiViewportP_GetMainRect;

void function(ImRect* pOut, ImGuiViewportP* self)
	ImGuiViewportP_GetWorkRect;

ImGuiViewportP* function()
	ImGuiViewportP_ImGuiViewportP;

void function(ImGuiViewportP* self)
	ImGuiViewportP_UpdateWorkRect;

void function(ImGuiViewportP* self)
	ImGuiViewportP_destroy;

void function(ImVec2* pOut, ImGuiViewport* self)
	ImGuiViewport_GetCenter;

void function(ImVec2* pOut, ImGuiViewport* self)
	ImGuiViewport_GetWorkCenter;

ImGuiViewport* function()
	ImGuiViewport_ImGuiViewport;

void function(ImGuiViewport* self)
	ImGuiViewport_destroy;

byte* function(ImGuiWindowSettings* self)
	ImGuiWindowSettings_GetName;

ImGuiWindowSettings* function()
	ImGuiWindowSettings_ImGuiWindowSettings;

void function(ImGuiWindowSettings* self)
	ImGuiWindowSettings_destroy;

float function(ImGuiWindow* self)
	ImGuiWindow_CalcFontSize;

ImGuiID function(ImGuiWindow* self, ImRect r_abs)
	ImGuiWindow_GetIDFromRectangle;

ImGuiID function(ImGuiWindow* self, int n)
	ImGuiWindow_GetIDNoKeepAlive_Int;

ImGuiID function(ImGuiWindow* self, void* ptr)
	ImGuiWindow_GetIDNoKeepAlive_Ptr;

ImGuiID function(ImGuiWindow* self, byte* str, byte* str_end)
	ImGuiWindow_GetIDNoKeepAlive_Str;

ImGuiID function(ImGuiWindow* self, int n)
	ImGuiWindow_GetID_Int;

ImGuiID function(ImGuiWindow* self, void* ptr)
	ImGuiWindow_GetID_Ptr;

ImGuiID function(ImGuiWindow* self, byte* str, byte* str_end)
	ImGuiWindow_GetID_Str;

ImGuiWindow* function(ImGuiContext* context, byte* name)
	ImGuiWindow_ImGuiWindow;

float function(ImGuiWindow* self)
	ImGuiWindow_MenuBarHeight;

void function(ImRect* pOut, ImGuiWindow* self)
	ImGuiWindow_MenuBarRect;

void function(ImRect* pOut, ImGuiWindow* self)
	ImGuiWindow_Rect;

float function(ImGuiWindow* self)
	ImGuiWindow_TitleBarHeight;

void function(ImRect* pOut, ImGuiWindow* self)
	ImGuiWindow_TitleBarRect;

void function(ImGuiWindow* self)
	ImGuiWindow_destroy;

ImGuiPayload* function(byte* type, ImGuiDragDropFlags flags)
	igAcceptDragDropPayload;

void function(ImGuiID id)
	igActivateItem;

ImGuiID function(ImGuiContext* context, ImGuiContextHook* hook)
	igAddContextHook;

void function()
	igAlignTextToFramePadding;

bool function(byte* str_id, ImGuiDir dir)
	igArrowButton;

bool function(byte* str_id, ImGuiDir dir, ImVec2 size_arg, ImGuiButtonFlags flags)
	igArrowButtonEx;

bool function(byte* name, bool* p_open, ImGuiWindowFlags flags)
	igBegin;

bool function(byte* name, ImGuiID id, ImVec2 size_arg, bool border, ImGuiWindowFlags flags)
	igBeginChildEx;

bool function(ImGuiID id, ImVec2 size, ImGuiWindowFlags flags)
	igBeginChildFrame;

bool function(ImGuiID id, ImVec2 size, bool border, ImGuiWindowFlags flags)
	igBeginChild_ID;

bool function(byte* str_id, ImVec2 size, bool border, ImGuiWindowFlags flags)
	igBeginChild_Str;

void function(byte* str_id, int count, ImGuiOldColumnFlags flags)
	igBeginColumns;

bool function(byte* label, byte* preview_value, ImGuiComboFlags flags)
	igBeginCombo;

bool function(ImGuiDragDropFlags flags)
	igBeginDragDropSource;

bool function()
	igBeginDragDropTarget;

bool function(ImRect bb, ImGuiID id)
	igBeginDragDropTargetCustom;

void function()
	igBeginGroup;

bool function(byte* label, ImVec2 size)
	igBeginListBox;

bool function()
	igBeginMainMenuBar;

bool function(byte* label, bool enabled)
	igBeginMenu;

bool function()
	igBeginMenuBar;

bool function(byte* str_id, ImGuiWindowFlags flags)
	igBeginPopup;

bool function(byte* str_id, ImGuiPopupFlags popup_flags)
	igBeginPopupContextItem;

bool function(byte* str_id, ImGuiPopupFlags popup_flags)
	igBeginPopupContextVoid;

bool function(byte* str_id, ImGuiPopupFlags popup_flags)
	igBeginPopupContextWindow;

bool function(ImGuiID id, ImGuiWindowFlags extra_flags)
	igBeginPopupEx;

bool function(byte* name, bool* p_open, ImGuiWindowFlags flags)
	igBeginPopupModal;

bool function(byte* str_id, ImGuiTabBarFlags flags)
	igBeginTabBar;

bool function(ImGuiTabBar* tab_bar, ImRect bb, ImGuiTabBarFlags flags)
	igBeginTabBarEx;

bool function(byte* label, bool* p_open, ImGuiTabItemFlags flags)
	igBeginTabItem;

bool function(byte* str_id, int column, ImGuiTableFlags flags, ImVec2 outer_size, float inner_width)
	igBeginTable;

bool function(byte* name, ImGuiID id, int columns_count, ImGuiTableFlags flags, ImVec2 outer_size, float inner_width)
	igBeginTableEx;

void function()
	igBeginTooltip;

void function(ImGuiWindowFlags extra_flags, ImGuiTooltipFlags tooltip_flags)
	igBeginTooltipEx;

void function(ImGuiWindow* window)
	igBringWindowToDisplayBack;

void function(ImGuiWindow* window)
	igBringWindowToDisplayFront;

void function(ImGuiWindow* window)
	igBringWindowToFocusFront;

void function()
	igBullet;

void function(byte* fmt, ...)
	igBulletText;

void function(byte* fmt, va_list args)
	igBulletTextV;

bool function(byte* label, ImVec2 size)
	igButton;

bool function(ImRect bb, ImGuiID id, bool* out_hovered, bool* out_held, ImGuiButtonFlags flags)
	igButtonBehavior;

bool function(byte* label, ImVec2 size_arg, ImGuiButtonFlags flags)
	igButtonEx;

void function(ImVec2* pOut, ImVec2 size, float default_w, float default_h)
	igCalcItemSize;

float function()
	igCalcItemWidth;

void function(int items_count, float items_height, int* out_items_display_start, int* out_items_display_end)
	igCalcListClipping;

void function(ImVec2* pOut, byte* text, byte* text_end, bool hide_text_after_double_hash, float wrap_width)
	igCalcTextSize;

int function(float t0, float t1, float repeat_delay, float repeat_rate)
	igCalcTypematicRepeatAmount;

void function(ImVec2* pOut, ImGuiWindow* window)
	igCalcWindowNextAutoFitSize;

float function(ImVec2 pos, float wrap_pos_x)
	igCalcWrapWidthForPos;

void function(ImGuiContext* context, ImGuiContextHookType type)
	igCallContextHooks;

void function(bool want_capture_keyboard_value)
	igCaptureKeyboardFromApp;

void function(bool want_capture_mouse_value)
	igCaptureMouseFromApp;

bool function(byte* label, bool* v)
	igCheckbox;

bool function(byte* label, int* flags, int flags_value)
	igCheckboxFlags_IntPtr;

bool function(byte* label, ImS64* flags, ImS64 flags_value)
	igCheckboxFlags_S64Ptr;

bool function(byte* label, ImU64* flags, ImU64 flags_value)
	igCheckboxFlags_U64Ptr;

bool function(byte* label, uint* flags, uint flags_value)
	igCheckboxFlags_UintPtr;

void function()
	igClearActiveID;

void function()
	igClearDragDrop;

void function()
	igClearIniSettings;

bool function(ImGuiID id, ImVec2 pos)
	igCloseButton;

void function()
	igCloseCurrentPopup;

void function(int remaining, bool restore_focus_to_window_under_popup)
	igClosePopupToLevel;

void function(ImGuiWindow* ref_window, bool restore_focus_to_window_under_popup)
	igClosePopupsOverWindow;

bool function(ImGuiID id, ImVec2 pos)
	igCollapseButton;

bool function(byte* label, bool* p_visible, ImGuiTreeNodeFlags flags)
	igCollapsingHeader_BoolPtr;

bool function(byte* label, ImGuiTreeNodeFlags flags)
	igCollapsingHeader_TreeNodeFlags;

bool function(byte* desc_id, ImVec4 col, ImGuiColorEditFlags flags, ImVec2 size)
	igColorButton;

ImU32 function(ImVec4 in_)
	igColorConvertFloat4ToU32;

void function(float h, float s, float v, float* out_r, float* out_g, float* out_b)
	igColorConvertHSVtoRGB;

void function(float r, float g, float b, float* out_h, float* out_s, float* out_v)
	igColorConvertRGBtoHSV;

void function(ImVec4* pOut, ImU32 in_)
	igColorConvertU32ToFloat4;

bool function(byte* label, float[3] col, ImGuiColorEditFlags flags)
	igColorEdit3;

bool function(byte* label, float[4] col, ImGuiColorEditFlags flags)
	igColorEdit4;

void function(float* col, ImGuiColorEditFlags flags)
	igColorEditOptionsPopup;

bool function(byte* label, float[3] col, ImGuiColorEditFlags flags)
	igColorPicker3;

bool function(byte* label, float[4] col, ImGuiColorEditFlags flags, float* ref_col)
	igColorPicker4;

void function(float* ref_col, ImGuiColorEditFlags flags)
	igColorPickerOptionsPopup;

void function(byte* text, float* col, ImGuiColorEditFlags flags)
	igColorTooltip;

void function(int count, byte* id, bool border)
	igColumns;

bool function(byte* label, int* current_item, bool function(void* data, int idx, byte** out_text) items_getter, void* data, int items_count, int popup_max_height_in_items)
	igCombo_FnBoolPtr;

bool function(byte* label, int* current_item, byte* items_separated_by_zeros, int popup_max_height_in_items)
	igCombo_Str;

bool function(byte* label, int* current_item, byte*[-1] items, int items_count, int popup_max_height_in_items)
	igCombo_Str_arr;

ImGuiContext* function(ImFontAtlas* shared_font_atlas)
	igCreateContext;

ImGuiWindowSettings* function(byte* name)
	igCreateNewWindowSettings;

void function(ImGuiDataType data_type, int op, void* output, void* arg_1, void* arg_2)
	igDataTypeApplyOp;

bool function(byte* buf, byte* initial_value_buf, ImGuiDataType data_type, void* p_data, byte* format)
	igDataTypeApplyOpFromText;

bool function(ImGuiDataType data_type, void* p_data, void* p_min, void* p_max)
	igDataTypeClamp;

int function(ImGuiDataType data_type, void* arg_1, void* arg_2)
	igDataTypeCompare;

int function(byte* buf, int buf_size, ImGuiDataType data_type, void* p_data, byte* format)
	igDataTypeFormatString;

ImGuiDataTypeInfo* function(ImGuiDataType data_type)
	igDataTypeGetInfo;

bool function(byte* version_str, size_t sz_io, size_t sz_style, size_t sz_vec2, size_t sz_vec4, size_t sz_drawvert, size_t sz_drawidx)
	igDebugCheckVersionAndDataLayout;

void function(ImU32 col)
	igDebugDrawItemRect;

void function(ImGuiOldColumns* columns)
	igDebugNodeColumns;

void function(ImDrawList* out_draw_list, ImDrawList* draw_list, ImDrawCmd* draw_cmd, bool show_mesh, bool show_aabb)
	igDebugNodeDrawCmdShowMeshAndBoundingBox;

void function(ImGuiWindow* window, ImDrawList* draw_list, byte* label)
	igDebugNodeDrawList;

void function(ImGuiStorage* storage, byte* label)
	igDebugNodeStorage;

void function(ImGuiTabBar* tab_bar, byte* label)
	igDebugNodeTabBar;

void function(ImGuiTable* table)
	igDebugNodeTable;

void function(ImGuiTableSettings* settings)
	igDebugNodeTableSettings;

void function(ImGuiViewportP* viewport)
	igDebugNodeViewport;

void function(ImGuiWindow* window, byte* label)
	igDebugNodeWindow;

void function(ImGuiWindowSettings* settings)
	igDebugNodeWindowSettings;

void function(ImVector_ImGuiWindowPtr* windows, byte* label)
	igDebugNodeWindowsList;

void function(ImDrawList* draw_list, ImGuiViewportP* viewport, ImRect bb)
	igDebugRenderViewportThumbnail;

void function()
	igDebugStartItemPicker;

void function(ImGuiContext* ctx)
	igDestroyContext;

bool function(ImGuiID id, ImGuiDataType data_type, void* p_v, float v_speed, void* p_min, void* p_max, byte* format, ImGuiSliderFlags flags)
	igDragBehavior;

bool function(byte* label, float* v, float v_speed, float v_min, float v_max, byte* format, ImGuiSliderFlags flags)
	igDragFloat;

bool function(byte* label, float[2] v, float v_speed, float v_min, float v_max, byte* format, ImGuiSliderFlags flags)
	igDragFloat2;

bool function(byte* label, float[3] v, float v_speed, float v_min, float v_max, byte* format, ImGuiSliderFlags flags)
	igDragFloat3;

bool function(byte* label, float[4] v, float v_speed, float v_min, float v_max, byte* format, ImGuiSliderFlags flags)
	igDragFloat4;

bool function(byte* label, float* v_current_min, float* v_current_max, float v_speed, float v_min, float v_max, byte* format, byte* format_max, ImGuiSliderFlags flags)
	igDragFloatRange2;

bool function(byte* label, int* v, float v_speed, int v_min, int v_max, byte* format, ImGuiSliderFlags flags)
	igDragInt;

bool function(byte* label, int[2] v, float v_speed, int v_min, int v_max, byte* format, ImGuiSliderFlags flags)
	igDragInt2;

bool function(byte* label, int[3] v, float v_speed, int v_min, int v_max, byte* format, ImGuiSliderFlags flags)
	igDragInt3;

bool function(byte* label, int[4] v, float v_speed, int v_min, int v_max, byte* format, ImGuiSliderFlags flags)
	igDragInt4;

bool function(byte* label, int* v_current_min, int* v_current_max, float v_speed, int v_min, int v_max, byte* format, byte* format_max, ImGuiSliderFlags flags)
	igDragIntRange2;

bool function(byte* label, ImGuiDataType data_type, void* p_data, float v_speed, void* p_min, void* p_max, byte* format, ImGuiSliderFlags flags)
	igDragScalar;

bool function(byte* label, ImGuiDataType data_type, void* p_data, int components, float v_speed, void* p_min, void* p_max, byte* format, ImGuiSliderFlags flags)
	igDragScalarN;

void function(ImVec2 size)
	igDummy;

void function()
	igEnd;

void function()
	igEndChild;

void function()
	igEndChildFrame;

void function()
	igEndColumns;

void function()
	igEndCombo;

void function()
	igEndDragDropSource;

void function()
	igEndDragDropTarget;

void function()
	igEndFrame;

void function()
	igEndGroup;

void function()
	igEndListBox;

void function()
	igEndMainMenuBar;

void function()
	igEndMenu;

void function()
	igEndMenuBar;

void function()
	igEndPopup;

void function()
	igEndTabBar;

void function()
	igEndTabItem;

void function()
	igEndTable;

void function()
	igEndTooltip;

void function(ImGuiErrorLogCallback log_callback, void* user_data)
	igErrorCheckEndFrameRecover;

void function(ImVec2* pOut, ImGuiWindow* window)
	igFindBestWindowPosForPopup;

void function(ImVec2* pOut, ImVec2 ref_pos, ImVec2 size, ImGuiDir* last_dir, ImRect r_outer, ImRect r_avoid, ImGuiPopupPositionPolicy policy)
	igFindBestWindowPosForPopupEx;

ImGuiOldColumns* function(ImGuiWindow* window, ImGuiID id)
	igFindOrCreateColumns;

ImGuiWindowSettings* function(byte* name)
	igFindOrCreateWindowSettings;

byte* function(byte* text, byte* text_end)
	igFindRenderedTextEnd;

ImGuiSettingsHandler* function(byte* type_name)
	igFindSettingsHandler;

ImGuiWindow* function(ImGuiID id)
	igFindWindowByID;

ImGuiWindow* function(byte* name)
	igFindWindowByName;

ImGuiWindowSettings* function(ImGuiID id)
	igFindWindowSettings;

void function(ImGuiWindow* under_this_window, ImGuiWindow* ignore_window)
	igFocusTopMostWindowUnderOne;

void function(ImGuiWindow* window)
	igFocusWindow;

bool function(ImGuiWindow* window, ImGuiID id)
	igFocusableItemRegister;

void function(ImGuiWindow* window)
	igFocusableItemUnregister;

float function()
	igGET_FLT_MAX;

float function()
	igGET_FLT_MIN;

void function(ImGuiWindow* window)
	igGcAwakeTransientWindowBuffers;

void function()
	igGcCompactTransientMiscBuffers;

void function(ImGuiWindow* window)
	igGcCompactTransientWindowBuffers;

ImGuiID function()
	igGetActiveID;

void function(ImGuiMemAllocFunc* p_alloc_func, ImGuiMemFreeFunc* p_free_func, void** p_user_data)
	igGetAllocatorFunctions;

ImDrawList* function()
	igGetBackgroundDrawList_Nil;

ImDrawList* function(ImGuiViewport* viewport)
	igGetBackgroundDrawList_ViewportPtr;

byte* function()
	igGetClipboardText;

ImU32 function(ImGuiCol idx, float alpha_mul)
	igGetColorU32_Col;

ImU32 function(ImU32 col)
	igGetColorU32_U32;

ImU32 function(ImVec4 col)
	igGetColorU32_Vec4;

int function()
	igGetColumnIndex;

float function(ImGuiOldColumns* columns, float offset)
	igGetColumnNormFromOffset;

float function(int column_index)
	igGetColumnOffset;

float function(ImGuiOldColumns* columns, float offset_norm)
	igGetColumnOffsetFromNorm;

float function(int column_index)
	igGetColumnWidth;

int function()
	igGetColumnsCount;

ImGuiID function(byte* str_id, int count)
	igGetColumnsID;

void function(ImVec2* pOut)
	igGetContentRegionAvail;

void function(ImVec2* pOut)
	igGetContentRegionMax;

void function(ImVec2* pOut)
	igGetContentRegionMaxAbs;

ImGuiContext* function()
	igGetCurrentContext;

ImGuiTable* function()
	igGetCurrentTable;

ImGuiWindow* function()
	igGetCurrentWindow;

ImGuiWindow* function()
	igGetCurrentWindowRead;

void function(ImVec2* pOut)
	igGetCursorPos;

float function()
	igGetCursorPosX;

float function()
	igGetCursorPosY;

void function(ImVec2* pOut)
	igGetCursorScreenPos;

void function(ImVec2* pOut)
	igGetCursorStartPos;

ImFont* function()
	igGetDefaultFont;

ImGuiPayload* function()
	igGetDragDropPayload;

ImDrawData* function()
	igGetDrawData;

ImDrawListSharedData* function()
	igGetDrawListSharedData;

ImGuiID function()
	igGetFocusID;

ImGuiID function()
	igGetFocusScope;

ImGuiID function()
	igGetFocusedFocusScope;

ImFont* function()
	igGetFont;

float function()
	igGetFontSize;

void function(ImVec2* pOut)
	igGetFontTexUvWhitePixel;

ImDrawList* function()
	igGetForegroundDrawList_Nil;

ImDrawList* function(ImGuiViewport* viewport)
	igGetForegroundDrawList_ViewportPtr;

ImDrawList* function(ImGuiWindow* window)
	igGetForegroundDrawList_WindowPtr;

int function()
	igGetFrameCount;

float function()
	igGetFrameHeight;

float function()
	igGetFrameHeightWithSpacing;

ImGuiID function()
	igGetHoveredID;

ImGuiID function(byte* str_id_begin, byte* str_id_end, ImGuiID seed)
	igGetIDWithSeed;

ImGuiID function(void* ptr_id)
	igGetID_Ptr;

ImGuiID function(byte* str_id)
	igGetID_Str;

ImGuiID function(byte* str_id_begin, byte* str_id_end)
	igGetID_StrStr;

ImGuiIO* function()
	igGetIO;

ImGuiInputTextState* function(ImGuiID id)
	igGetInputTextState;

ImGuiID function()
	igGetItemID;

void function(ImVec2* pOut)
	igGetItemRectMax;

void function(ImVec2* pOut)
	igGetItemRectMin;

void function(ImVec2* pOut)
	igGetItemRectSize;

ImGuiItemStatusFlags function()
	igGetItemStatusFlags;

ImGuiItemFlags function()
	igGetItemsFlags;

int function(ImGuiKey imgui_key)
	igGetKeyIndex;

int function(int key_index, float repeat_delay, float rate)
	igGetKeyPressedAmount;

ImGuiViewport* function()
	igGetMainViewport;

ImGuiKeyModFlags function()
	igGetMergedKeyModFlags;

ImGuiMouseCursor function()
	igGetMouseCursor;

void function(ImVec2* pOut, ImGuiMouseButton button, float lock_threshold)
	igGetMouseDragDelta;

void function(ImVec2* pOut)
	igGetMousePos;

void function(ImVec2* pOut)
	igGetMousePosOnOpeningCurrentPopup;

float function(ImGuiNavInput n, ImGuiInputReadMode mode)
	igGetNavInputAmount;

void function(ImVec2* pOut, ImGuiNavDirSourceFlags dir_sources, ImGuiInputReadMode mode, float slow_factor, float fast_factor)
	igGetNavInputAmount2d;

float function()
	igGetScrollMaxX;

float function()
	igGetScrollMaxY;

float function()
	igGetScrollX;

float function()
	igGetScrollY;

ImGuiStorage* function()
	igGetStateStorage;

ImGuiStyle* function()
	igGetStyle;

byte* function(ImGuiCol idx)
	igGetStyleColorName;

ImVec4* function(ImGuiCol idx)
	igGetStyleColorVec4;

float function()
	igGetTextLineHeight;

float function()
	igGetTextLineHeightWithSpacing;

double function()
	igGetTime;

ImGuiWindow* function()
	igGetTopMostPopupModal;

float function()
	igGetTreeNodeToLabelSpacing;

byte* function()
	igGetVersion;

void function(ImRect* pOut, ImGuiWindow* window)
	igGetWindowAllowedExtentRect;

void function(ImVec2* pOut)
	igGetWindowContentRegionMax;

void function(ImVec2* pOut)
	igGetWindowContentRegionMin;

float function()
	igGetWindowContentRegionWidth;

ImDrawList* function()
	igGetWindowDrawList;

float function()
	igGetWindowHeight;

void function(ImVec2* pOut)
	igGetWindowPos;

ImGuiID function(ImGuiWindow* window, int n)
	igGetWindowResizeID;

ImGuiID function(ImGuiWindow* window, ImGuiAxis axis)
	igGetWindowScrollbarID;

void function(ImRect* pOut, ImGuiWindow* window, ImGuiAxis axis)
	igGetWindowScrollbarRect;

void function(ImVec2* pOut)
	igGetWindowSize;

float function()
	igGetWindowWidth;

float function(float x)
	igImAbs_Float;

double function(double x)
	igImAbs_double;

ImU32 function(ImU32 col_a, ImU32 col_b)
	igImAlphaBlendColors;

void function(ImVec2* pOut, ImVec2 p1, ImVec2 p2, ImVec2 p3, ImVec2 p4, float t)
	igImBezierCubicCalc;

void function(ImVec2* pOut, ImVec2 p1, ImVec2 p2, ImVec2 p3, ImVec2 p4, ImVec2 p, int num_segments)
	igImBezierCubicClosestPoint;

void function(ImVec2* pOut, ImVec2 p1, ImVec2 p2, ImVec2 p3, ImVec2 p4, ImVec2 p, float tess_tol)
	igImBezierCubicClosestPointCasteljau;

void function(ImVec2* pOut, ImVec2 p1, ImVec2 p2, ImVec2 p3, float t)
	igImBezierQuadraticCalc;

void function(ImU32* arr, int n)
	igImBitArrayClearBit;

void function(ImU32* arr, int n)
	igImBitArraySetBit;

void function(ImU32* arr, int n, int n2)
	igImBitArraySetBitRange;

bool function(ImU32* arr, int n)
	igImBitArrayTestBit;

bool function(byte c)
	igImCharIsBlankA;

bool function(uint c)
	igImCharIsBlankW;

void function(ImVec2* pOut, ImVec2 v, ImVec2 mn, ImVec2 mx)
	igImClamp;

float function(ImVec2 a, ImVec2 b)
	igImDot;

bool function(ImFileHandle file)
	igImFileClose;

ImU64 function(ImFileHandle file)
	igImFileGetSize;

void* function(byte* filename, byte* mode, size_t* out_file_size, int padding_bytes)
	igImFileLoadToMemory;

ImFileHandle function(byte* filename, byte* mode)
	igImFileOpen;

ImU64 function(void* data, ImU64 size, ImU64 count, ImFileHandle file)
	igImFileRead;

ImU64 function(void* data, ImU64 size, ImU64 count, ImFileHandle file)
	igImFileWrite;

float function(float f)
	igImFloor_Float;

void function(ImVec2* pOut, ImVec2 v)
	igImFloor_Vec2;

void function(ImFontAtlas* atlas)
	igImFontAtlasBuildFinish;

void function(ImFontAtlas* atlas)
	igImFontAtlasBuildInit;

void function(ubyte[256] out_table, float in_multiply_factor)
	igImFontAtlasBuildMultiplyCalcLookupTable;

void function(ubyte[256] table, ubyte* pixels, int x, int y, int w, int h, int stride)
	igImFontAtlasBuildMultiplyRectAlpha8;

void function(ImFontAtlas* atlas, void* stbrp_context_opaque)
	igImFontAtlasBuildPackCustomRects;

void function(ImFontAtlas* atlas, int x, int y, int w, int h, byte* in_str, byte in_marker_char, uint in_marker_pixel_value)
	igImFontAtlasBuildRender32bppRectFromString;

void function(ImFontAtlas* atlas, int x, int y, int w, int h, byte* in_str, byte in_marker_char, ubyte in_marker_pixel_value)
	igImFontAtlasBuildRender8bppRectFromString;

void function(ImFontAtlas* atlas, ImFont* font, ImFontConfig* font_config, float ascent, float descent)
	igImFontAtlasBuildSetupFont;

ImFontBuilderIO* function()
	igImFontAtlasGetBuilderForStbTruetype;

int function(byte* buf, size_t buf_size, byte* fmt, ...)
	igImFormatString;

int function(byte* buf, size_t buf_size, byte* fmt, va_list args)
	igImFormatStringV;

ImGuiDir function(float dx, float dy)
	igImGetDirQuadrantFromDelta;

ImGuiID function(void* data, size_t data_size, ImU32 seed)
	igImHashData;

ImGuiID function(byte* data, size_t data_size, ImU32 seed)
	igImHashStr;

float function(ImVec2 lhs, float fail_value)
	igImInvLength;

bool function(int v)
	igImIsPowerOfTwo_Int;

bool function(ImU64 v)
	igImIsPowerOfTwo_U64;

float function(ImVec2 lhs)
	igImLengthSqr_Vec2;

float function(ImVec4 lhs)
	igImLengthSqr_Vec4;

void function(ImVec2* pOut, ImVec2 a, ImVec2 b, float t)
	igImLerp_Vec2Float;

void function(ImVec2* pOut, ImVec2 a, ImVec2 b, ImVec2 t)
	igImLerp_Vec2Vec2;

void function(ImVec4* pOut, ImVec4 a, ImVec4 b, float t)
	igImLerp_Vec4;

void function(ImVec2* pOut, ImVec2 a, ImVec2 b, ImVec2 p)
	igImLineClosestPoint;

float function(float current, float target, float speed)
	igImLinearSweep;

float function(float x)
	igImLog_Float;

double function(double x)
	igImLog_double;

void function(ImVec2* pOut, ImVec2 lhs, ImVec2 rhs)
	igImMax;

void function(ImVec2* pOut, ImVec2 lhs, ImVec2 rhs)
	igImMin;

int function(int a, int b)
	igImModPositive;

void function(ImVec2* pOut, ImVec2 lhs, ImVec2 rhs)
	igImMul;

byte* function(byte* format)
	igImParseFormatFindEnd;

byte* function(byte* format)
	igImParseFormatFindStart;

int function(byte* format, int default_value)
	igImParseFormatPrecision;

byte* function(byte* format, byte* buf, size_t buf_size)
	igImParseFormatTrimDecorations;

float function(float x, float y)
	igImPow_Float;

double function(double x, double y)
	igImPow_double;

void function(ImVec2* pOut, ImVec2 v, float cos_a, float sin_a)
	igImRotate;

float function(float f)
	igImSaturate;

float function(float x)
	igImSign_Float;

double function(double x)
	igImSign_double;

byte* function(byte* str)
	igImStrSkipBlank;

void function(byte* str)
	igImStrTrimBlanks;

ImWchar* function(ImWchar* buf_mid_line, ImWchar* buf_begin)
	igImStrbolW;

byte* function(byte* str_begin, byte* str_end, byte c)
	igImStrchrRange;

byte* function(byte* str)
	igImStrdup;

byte* function(byte* dst, size_t* p_dst_size, byte* str)
	igImStrdupcpy;

byte* function(byte* str, byte* str_end)
	igImStreolRange;

int function(byte* str1, byte* str2)
	igImStricmp;

byte* function(byte* haystack, byte* haystack_end, byte* needle, byte* needle_end)
	igImStristr;

int function(ImWchar* str)
	igImStrlenW;

void function(byte* dst, byte* src, size_t count)
	igImStrncpy;

int function(byte* str1, byte* str2, size_t count)
	igImStrnicmp;

int function(uint* out_char, byte* in_text, byte* in_text_end)
	igImTextCharFromUtf8;

int function(byte* in_text, byte* in_text_end)
	igImTextCountCharsFromUtf8;

int function(byte* in_text, byte* in_text_end)
	igImTextCountUtf8BytesFromChar;

int function(ImWchar* in_text, ImWchar* in_text_end)
	igImTextCountUtf8BytesFromStr;

int function(ImWchar* buf, int buf_size, byte* in_text, byte* in_text_end, byte** in_remaining)
	igImTextStrFromUtf8;

int function(byte* buf, int buf_size, ImWchar* in_text, ImWchar* in_text_end)
	igImTextStrToUtf8;

float function(ImVec2 a, ImVec2 b, ImVec2 c)
	igImTriangleArea;

void function(ImVec2 a, ImVec2 b, ImVec2 c, ImVec2 p, float* out_u, float* out_v, float* out_w)
	igImTriangleBarycentricCoords;

void function(ImVec2* pOut, ImVec2 a, ImVec2 b, ImVec2 c, ImVec2 p)
	igImTriangleClosestPoint;

bool function(ImVec2 a, ImVec2 b, ImVec2 c, ImVec2 p)
	igImTriangleContainsPoint;

int function(int v)
	igImUpperPowerOfTwo;

void function(ImVec2 size, ImVec2 uv0, ImVec2 uv1, ImVec4 tint_col, ImVec4 border_col)
	igImage;

bool function(ImVec2 size, ImVec2 uv0, ImVec2 uv1, int frame_padding, ImVec4 bg_col, ImVec4 tint_col)
	igImageButton;

bool function(ImGuiID id, ImVec2 size, ImVec2 uv0, ImVec2 uv1, ImVec2 padding, ImVec4 bg_col, ImVec4 tint_col)
	igImageButtonEx;

void function(float indent_w)
	igIndent;

void function(ImGuiContext* context)
	igInitialize;

bool function(byte* label, double* v, double step, double step_fast, byte* format, ImGuiInputTextFlags flags)
	igInputDouble;

bool function(byte* label, float* v, float step, float step_fast, byte* format, ImGuiInputTextFlags flags)
	igInputFloat;

bool function(byte* label, float[2] v, byte* format, ImGuiInputTextFlags flags)
	igInputFloat2;

bool function(byte* label, float[3] v, byte* format, ImGuiInputTextFlags flags)
	igInputFloat3;

bool function(byte* label, float[4] v, byte* format, ImGuiInputTextFlags flags)
	igInputFloat4;

bool function(byte* label, int* v, int step, int step_fast, ImGuiInputTextFlags flags)
	igInputInt;

bool function(byte* label, int[2] v, ImGuiInputTextFlags flags)
	igInputInt2;

bool function(byte* label, int[3] v, ImGuiInputTextFlags flags)
	igInputInt3;

bool function(byte* label, int[4] v, ImGuiInputTextFlags flags)
	igInputInt4;

bool function(byte* label, ImGuiDataType data_type, void* p_data, void* p_step, void* p_step_fast, byte* format, ImGuiInputTextFlags flags)
	igInputScalar;

bool function(byte* label, ImGuiDataType data_type, void* p_data, int components, void* p_step, void* p_step_fast, byte* format, ImGuiInputTextFlags flags)
	igInputScalarN;

bool function(byte* label, byte* buf, size_t buf_size, ImGuiInputTextFlags flags, ImGuiInputTextCallback callback, void* user_data)
	igInputText;

bool function(byte* label, byte* hint, byte* buf, int buf_size, ImVec2 size_arg, ImGuiInputTextFlags flags, ImGuiInputTextCallback callback, void* user_data)
	igInputTextEx;

bool function(byte* label, byte* buf, size_t buf_size, ImVec2 size, ImGuiInputTextFlags flags, ImGuiInputTextCallback callback, void* user_data)
	igInputTextMultiline;

bool function(byte* label, byte* hint, byte* buf, size_t buf_size, ImGuiInputTextFlags flags, ImGuiInputTextCallback callback, void* user_data)
	igInputTextWithHint;

bool function(byte* str_id, ImVec2 size, ImGuiButtonFlags flags)
	igInvisibleButton;

bool function(ImGuiKey key)
	igIsActiveIdUsingKey;

bool function(ImGuiDir dir)
	igIsActiveIdUsingNavDir;

bool function(ImGuiNavInput input)
	igIsActiveIdUsingNavInput;

bool function()
	igIsAnyItemActive;

bool function()
	igIsAnyItemFocused;

bool function()
	igIsAnyItemHovered;

bool function()
	igIsAnyMouseDown;

bool function(ImRect bb, ImGuiID id, bool clip_even_when_logged)
	igIsClippedEx;

bool function()
	igIsDragDropPayloadBeingAccepted;

bool function()
	igIsItemActivated;

bool function()
	igIsItemActive;

bool function(ImGuiMouseButton mouse_button)
	igIsItemClicked;

bool function()
	igIsItemDeactivated;

bool function()
	igIsItemDeactivatedAfterEdit;

bool function()
	igIsItemEdited;

bool function()
	igIsItemFocused;

bool function(ImGuiHoveredFlags flags)
	igIsItemHovered;

bool function()
	igIsItemToggledOpen;

bool function()
	igIsItemToggledSelection;

bool function()
	igIsItemVisible;

bool function(int user_key_index)
	igIsKeyDown;

bool function(int user_key_index, bool repeat)
	igIsKeyPressed;

bool function(ImGuiKey key, bool repeat)
	igIsKeyPressedMap;

bool function(int user_key_index)
	igIsKeyReleased;

bool function(ImGuiMouseButton button, bool repeat)
	igIsMouseClicked;

bool function(ImGuiMouseButton button)
	igIsMouseDoubleClicked;

bool function(ImGuiMouseButton button)
	igIsMouseDown;

bool function(ImGuiMouseButton button, float lock_threshold)
	igIsMouseDragPastThreshold;

bool function(ImGuiMouseButton button, float lock_threshold)
	igIsMouseDragging;

bool function(ImVec2 r_min, ImVec2 r_max, bool clip)
	igIsMouseHoveringRect;

bool function(ImVec2* mouse_pos)
	igIsMousePosValid;

bool function(ImGuiMouseButton button)
	igIsMouseReleased;

bool function(ImGuiNavInput n)
	igIsNavInputDown;

bool function(ImGuiNavInput n, ImGuiInputReadMode rm)
	igIsNavInputTest;

bool function(ImGuiID id, ImGuiPopupFlags popup_flags)
	igIsPopupOpen_ID;

bool function(byte* str_id, ImGuiPopupFlags flags)
	igIsPopupOpen_Str;

bool function(ImVec2 size)
	igIsRectVisible_Nil;

bool function(ImVec2 rect_min, ImVec2 rect_max)
	igIsRectVisible_Vec2;

bool function(ImGuiWindow* potential_above, ImGuiWindow* potential_below)
	igIsWindowAbove;

bool function()
	igIsWindowAppearing;

bool function(ImGuiWindow* window, ImGuiWindow* potential_parent)
	igIsWindowChildOf;

bool function()
	igIsWindowCollapsed;

bool function(ImGuiFocusedFlags flags)
	igIsWindowFocused;

bool function(ImGuiHoveredFlags flags)
	igIsWindowHovered;

bool function(ImGuiWindow* window)
	igIsWindowNavFocusable;

bool function(ImRect bb, ImGuiID id, ImRect* nav_bb)
	igItemAdd;

bool function(ImRect bb, ImGuiID id)
	igItemHoverable;

void function(ImRect bb, float text_baseline_y)
	igItemSize_Rect;

void function(ImVec2 size, float text_baseline_y)
	igItemSize_Vec2;

void function(ImGuiID id)
	igKeepAliveID;

void function(byte* label, byte* fmt, ...)
	igLabelText;

void function(byte* label, byte* fmt, va_list args)
	igLabelTextV;

bool function(byte* label, int* current_item, bool function(void* data, int idx, byte** out_text) items_getter, void* data, int items_count, int height_in_items)
	igListBox_FnBoolPtr;

bool function(byte* label, int* current_item, byte*[-1] items, int items_count, int height_in_items)
	igListBox_Str_arr;

void function(byte* ini_filename)
	igLoadIniSettingsFromDisk;

void function(byte* ini_data, size_t ini_size)
	igLoadIniSettingsFromMemory;

void function(ImGuiLogType type, int auto_open_depth)
	igLogBegin;

void function()
	igLogButtons;

void function()
	igLogFinish;

void function(ImVec2* ref_pos, byte* text, byte* text_end)
	igLogRenderedText;

void function(byte* prefix, byte* suffix)
	igLogSetNextTextDecoration;

void function(byte* fmt, ...)
	igLogText;

void function(byte* fmt, va_list args)
	igLogTextV;

void function(int auto_open_depth)
	igLogToBuffer;

void function(int auto_open_depth)
	igLogToClipboard;

void function(int auto_open_depth, byte* filename)
	igLogToFile;

void function(int auto_open_depth)
	igLogToTTY;

void function()
	igMarkIniSettingsDirty_Nil;

void function(ImGuiWindow* window)
	igMarkIniSettingsDirty_WindowPtr;

void function(ImGuiID id)
	igMarkItemEdited;

void* function(size_t size)
	igMemAlloc;

void function(void* ptr)
	igMemFree;

bool function(byte* label, byte* shortcut, bool selected, bool enabled)
	igMenuItem_Bool;

bool function(byte* label, byte* shortcut, bool* p_selected, bool enabled)
	igMenuItem_BoolPtr;

void function(ImGuiWindow* window, bool force_reinit)
	igNavInitWindow;

bool function()
	igNavMoveRequestButNoResultYet;

void function()
	igNavMoveRequestCancel;

void function(ImGuiDir move_dir, ImGuiDir clip_dir, ImRect bb_rel, ImGuiNavMoveFlags move_flags)
	igNavMoveRequestForward;

void function(ImGuiWindow* window, ImGuiNavMoveFlags move_flags)
	igNavMoveRequestTryWrapping;

void function()
	igNewFrame;

void function()
	igNewLine;

void function()
	igNextColumn;

void function(byte* str_id, ImGuiPopupFlags popup_flags)
	igOpenPopup;

void function(ImGuiID id, ImGuiPopupFlags popup_flags)
	igOpenPopupEx;

void function(byte* str_id, ImGuiPopupFlags popup_flags)
	igOpenPopupOnItemClick;

int function(ImGuiPlotType plot_type, byte* label, float function(void* data, int idx) values_getter, void* data, int values_count, int values_offset, byte* overlay_text, float scale_min, float scale_max, ImVec2 frame_size)
	igPlotEx;

void function(byte* label, float* values, int values_count, int values_offset, byte* overlay_text, float scale_min, float scale_max, ImVec2 graph_size, int stride)
	igPlotHistogram_FloatPtr;

void function(byte* label, float function(void* data, int idx) values_getter, void* data, int values_count, int values_offset, byte* overlay_text, float scale_min, float scale_max, ImVec2 graph_size)
	igPlotHistogram_FnFloatPtr;

void function(byte* label, float* values, int values_count, int values_offset, byte* overlay_text, float scale_min, float scale_max, ImVec2 graph_size, int stride)
	igPlotLines_FloatPtr;

void function(byte* label, float function(void* data, int idx) values_getter, void* data, int values_count, int values_offset, byte* overlay_text, float scale_min, float scale_max, ImVec2 graph_size)
	igPlotLines_FnFloatPtr;

void function()
	igPopAllowKeyboardFocus;

void function()
	igPopButtonRepeat;

void function()
	igPopClipRect;

void function()
	igPopColumnsBackground;

void function()
	igPopFocusScope;

void function()
	igPopFont;

void function()
	igPopID;

void function()
	igPopItemFlag;

void function()
	igPopItemWidth;

void function(int count)
	igPopStyleColor;

void function(int count)
	igPopStyleVar;

void function()
	igPopTextWrapPos;

void function(float fraction, ImVec2 size_arg, byte* overlay)
	igProgressBar;

void function(bool allow_keyboard_focus)
	igPushAllowKeyboardFocus;

void function(bool repeat)
	igPushButtonRepeat;

void function(ImVec2 clip_rect_min, ImVec2 clip_rect_max, bool intersect_with_current_clip_rect)
	igPushClipRect;

void function(int column_index)
	igPushColumnClipRect;

void function()
	igPushColumnsBackground;

void function(ImGuiID id)
	igPushFocusScope;

void function(ImFont* font)
	igPushFont;

void function(int int_id)
	igPushID_Int;

void function(void* ptr_id)
	igPushID_Ptr;

void function(byte* str_id)
	igPushID_Str;

void function(byte* str_id_begin, byte* str_id_end)
	igPushID_StrStr;

void function(ImGuiItemFlags option, bool enabled)
	igPushItemFlag;

void function(float item_width)
	igPushItemWidth;

void function(int components, float width_full)
	igPushMultiItemsWidths;

void function(ImGuiID id)
	igPushOverrideID;

void function(ImGuiCol idx, ImU32 col)
	igPushStyleColor_U32;

void function(ImGuiCol idx, ImVec4 col)
	igPushStyleColor_Vec4;

void function(ImGuiStyleVar idx, float val)
	igPushStyleVar_Float;

void function(ImGuiStyleVar idx, ImVec2 val)
	igPushStyleVar_Vec2;

void function(float wrap_local_pos_x)
	igPushTextWrapPos;

bool function(byte* label, bool active)
	igRadioButton_Bool;

bool function(byte* label, int* v, int v_button)
	igRadioButton_IntPtr;

void function(ImGuiContext* context, ImGuiID hook_to_remove)
	igRemoveContextHook;

void function()
	igRender;

void function(ImDrawList* draw_list, ImVec2 pos, ImU32 col, ImGuiDir dir, float scale)
	igRenderArrow;

void function(ImDrawList* draw_list, ImVec2 pos, ImVec2 half_sz, ImGuiDir direction, ImU32 col)
	igRenderArrowPointingAt;

void function(ImDrawList* draw_list, ImVec2 pos, ImU32 col)
	igRenderBullet;

void function(ImDrawList* draw_list, ImVec2 pos, ImU32 col, float sz)
	igRenderCheckMark;

void function(ImDrawList* draw_list, ImVec2 p_min, ImVec2 p_max, ImU32 fill_col, float grid_step, ImVec2 grid_off, float rounding, ImDrawFlags flags)
	igRenderColorRectWithAlphaCheckerboard;

void function(ImVec2 p_min, ImVec2 p_max, ImU32 fill_col, bool border, float rounding)
	igRenderFrame;

void function(ImVec2 p_min, ImVec2 p_max, float rounding)
	igRenderFrameBorder;

void function(ImDrawList* draw_list, ImVec2 pos, float scale, ImGuiMouseCursor mouse_cursor, ImU32 col_fill, ImU32 col_border, ImU32 col_shadow)
	igRenderMouseCursor;

void function(ImRect bb, ImGuiID id, ImGuiNavHighlightFlags flags)
	igRenderNavHighlight;

void function(ImDrawList* draw_list, ImRect rect, ImU32 col, float x_start_norm, float x_end_norm, float rounding)
	igRenderRectFilledRangeH;

void function(ImDrawList* draw_list, ImRect outer, ImRect inner, ImU32 col, float rounding)
	igRenderRectFilledWithHole;

void function(ImVec2 pos, byte* text, byte* text_end, bool hide_text_after_hash)
	igRenderText;

void function(ImVec2 pos_min, ImVec2 pos_max, byte* text, byte* text_end, ImVec2* text_size_if_known, ImVec2 align_, ImRect* clip_rect)
	igRenderTextClipped;

void function(ImDrawList* draw_list, ImVec2 pos_min, ImVec2 pos_max, byte* text, byte* text_end, ImVec2* text_size_if_known, ImVec2 align_, ImRect* clip_rect)
	igRenderTextClippedEx;

void function(ImDrawList* draw_list, ImVec2 pos_min, ImVec2 pos_max, float clip_max_x, float ellipsis_max_x, byte* text, byte* text_end, ImVec2* text_size_if_known)
	igRenderTextEllipsis;

void function(ImVec2 pos, byte* text, byte* text_end, float wrap_width)
	igRenderTextWrapped;

void function(ImGuiMouseButton button)
	igResetMouseDragDelta;

void function(float offset_from_start_x, float spacing)
	igSameLine;

void function(byte* ini_filename)
	igSaveIniSettingsToDisk;

byte* function(size_t* out_ini_size)
	igSaveIniSettingsToMemory;

void function(ImVec2* pOut, ImGuiWindow* window, ImRect item_rect)
	igScrollToBringRectIntoView;

void function(ImGuiAxis axis)
	igScrollbar;

bool function(ImRect bb, ImGuiID id, ImGuiAxis axis, float* p_scroll_v, float avail_v, float contents_v, ImDrawFlags flags)
	igScrollbarEx;

bool function(byte* label, bool selected, ImGuiSelectableFlags flags, ImVec2 size)
	igSelectable_Bool;

bool function(byte* label, bool* p_selected, ImGuiSelectableFlags flags, ImVec2 size)
	igSelectable_BoolPtr;

void function()
	igSeparator;

void function(ImGuiSeparatorFlags flags)
	igSeparatorEx;

void function(ImGuiID id, ImGuiWindow* window)
	igSetActiveID;

void function(ImGuiMemAllocFunc alloc_func, ImGuiMemFreeFunc free_func, void* user_data)
	igSetAllocatorFunctions;

void function(byte* text)
	igSetClipboardText;

void function(ImGuiColorEditFlags flags)
	igSetColorEditOptions;

void function(int column_index, float offset_x)
	igSetColumnOffset;

void function(int column_index, float width)
	igSetColumnWidth;

void function(ImGuiContext* ctx)
	igSetCurrentContext;

void function(ImFont* font)
	igSetCurrentFont;

void function(ImVec2 local_pos)
	igSetCursorPos;

void function(float local_x)
	igSetCursorPosX;

void function(float local_y)
	igSetCursorPosY;

void function(ImVec2 pos)
	igSetCursorScreenPos;

bool function(byte* type, void* data, size_t sz, ImGuiCond cond)
	igSetDragDropPayload;

void function(ImGuiID id, ImGuiWindow* window)
	igSetFocusID;

void function(ImGuiID id)
	igSetHoveredID;

void function()
	igSetItemAllowOverlap;

void function()
	igSetItemDefaultFocus;

void function()
	igSetItemUsingMouseWheel;

void function(int offset)
	igSetKeyboardFocusHere;

void function(ImGuiWindow* window, ImGuiID item_id, ImGuiItemStatusFlags status_flags, ImRect item_rect)
	igSetLastItemData;

void function(ImGuiMouseCursor cursor_type)
	igSetMouseCursor;

void function(ImGuiID id, int nav_layer, ImGuiID focus_scope_id, ImRect rect_rel)
	igSetNavID;

void function(bool is_open, ImGuiCond cond)
	igSetNextItemOpen;

void function(float item_width)
	igSetNextItemWidth;

void function(float alpha)
	igSetNextWindowBgAlpha;

void function(bool collapsed, ImGuiCond cond)
	igSetNextWindowCollapsed;

void function(ImVec2 size)
	igSetNextWindowContentSize;

void function()
	igSetNextWindowFocus;

void function(ImVec2 pos, ImGuiCond cond, ImVec2 pivot)
	igSetNextWindowPos;

void function(ImVec2 scroll)
	igSetNextWindowScroll;

void function(ImVec2 size, ImGuiCond cond)
	igSetNextWindowSize;

void function(ImVec2 size_min, ImVec2 size_max, ImGuiSizeCallback custom_callback, void* custom_callback_data)
	igSetNextWindowSizeConstraints;

void function(float local_x, float center_x_ratio)
	igSetScrollFromPosX_Float;

void function(ImGuiWindow* window, float local_x, float center_x_ratio)
	igSetScrollFromPosX_WindowPtr;

void function(float local_y, float center_y_ratio)
	igSetScrollFromPosY_Float;

void function(ImGuiWindow* window, float local_y, float center_y_ratio)
	igSetScrollFromPosY_WindowPtr;

void function(float center_x_ratio)
	igSetScrollHereX;

void function(float center_y_ratio)
	igSetScrollHereY;

void function(float scroll_x)
	igSetScrollX_Float;

void function(ImGuiWindow* window, float scroll_x)
	igSetScrollX_WindowPtr;

void function(float scroll_y)
	igSetScrollY_Float;

void function(ImGuiWindow* window, float scroll_y)
	igSetScrollY_WindowPtr;

void function(ImGuiStorage* storage)
	igSetStateStorage;

void function(byte* tab_or_docked_window_label)
	igSetTabItemClosed;

void function(byte* fmt, ...)
	igSetTooltip;

void function(byte* fmt, va_list args)
	igSetTooltipV;

void function(ImGuiWindow* window, ImRect clip_rect)
	igSetWindowClipRectBeforeSetChannel;

void function(bool collapsed, ImGuiCond cond)
	igSetWindowCollapsed_Bool;

void function(byte* name, bool collapsed, ImGuiCond cond)
	igSetWindowCollapsed_Str;

void function(ImGuiWindow* window, bool collapsed, ImGuiCond cond)
	igSetWindowCollapsed_WindowPtr;

void function()
	igSetWindowFocus_Nil;

void function(byte* name)
	igSetWindowFocus_Str;

void function(float scale)
	igSetWindowFontScale;

void function(ImGuiWindow* window, ImVec2 pos, ImVec2 size)
	igSetWindowHitTestHole;

void function(byte* name, ImVec2 pos, ImGuiCond cond)
	igSetWindowPos_Str;

void function(ImVec2 pos, ImGuiCond cond)
	igSetWindowPos_Vec2;

void function(ImGuiWindow* window, ImVec2 pos, ImGuiCond cond)
	igSetWindowPos_WindowPtr;

void function(byte* name, ImVec2 size, ImGuiCond cond)
	igSetWindowSize_Str;

void function(ImVec2 size, ImGuiCond cond)
	igSetWindowSize_Vec2;

void function(ImGuiWindow* window, ImVec2 size, ImGuiCond cond)
	igSetWindowSize_WindowPtr;

void function(ImDrawList* draw_list, int vert_start_idx, int vert_end_idx, ImVec2 gradient_p0, ImVec2 gradient_p1, ImU32 col0, ImU32 col1)
	igShadeVertsLinearColorGradientKeepAlpha;

void function(ImDrawList* draw_list, int vert_start_idx, int vert_end_idx, ImVec2 a, ImVec2 b, ImVec2 uv_a, ImVec2 uv_b, bool clamp)
	igShadeVertsLinearUV;

void function(bool* p_open)
	igShowAboutWindow;

void function(bool* p_open)
	igShowDemoWindow;

void function(byte* label)
	igShowFontSelector;

void function(bool* p_open)
	igShowMetricsWindow;

void function(ImGuiStyle* ref_)
	igShowStyleEditor;

bool function(byte* label)
	igShowStyleSelector;

void function()
	igShowUserGuide;

void function(ImGuiShrinkWidthItem* items, int count, float width_excess)
	igShrinkWidths;

void function(ImGuiContext* context)
	igShutdown;

bool function(byte* label, float* v_rad, float v_degrees_min, float v_degrees_max, byte* format, ImGuiSliderFlags flags)
	igSliderAngle;

bool function(ImRect bb, ImGuiID id, ImGuiDataType data_type, void* p_v, void* p_min, void* p_max, byte* format, ImGuiSliderFlags flags, ImRect* out_grab_bb)
	igSliderBehavior;

bool function(byte* label, float* v, float v_min, float v_max, byte* format, ImGuiSliderFlags flags)
	igSliderFloat;

bool function(byte* label, float[2] v, float v_min, float v_max, byte* format, ImGuiSliderFlags flags)
	igSliderFloat2;

bool function(byte* label, float[3] v, float v_min, float v_max, byte* format, ImGuiSliderFlags flags)
	igSliderFloat3;

bool function(byte* label, float[4] v, float v_min, float v_max, byte* format, ImGuiSliderFlags flags)
	igSliderFloat4;

bool function(byte* label, int* v, int v_min, int v_max, byte* format, ImGuiSliderFlags flags)
	igSliderInt;

bool function(byte* label, int[2] v, int v_min, int v_max, byte* format, ImGuiSliderFlags flags)
	igSliderInt2;

bool function(byte* label, int[3] v, int v_min, int v_max, byte* format, ImGuiSliderFlags flags)
	igSliderInt3;

bool function(byte* label, int[4] v, int v_min, int v_max, byte* format, ImGuiSliderFlags flags)
	igSliderInt4;

bool function(byte* label, ImGuiDataType data_type, void* p_data, void* p_min, void* p_max, byte* format, ImGuiSliderFlags flags)
	igSliderScalar;

bool function(byte* label, ImGuiDataType data_type, void* p_data, int components, void* p_min, void* p_max, byte* format, ImGuiSliderFlags flags)
	igSliderScalarN;

bool function(byte* label)
	igSmallButton;

void function()
	igSpacing;

bool function(ImRect bb, ImGuiID id, ImGuiAxis axis, float* size1, float* size2, float min_size1, float min_size2, float hover_extend, float hover_visibility_delay)
	igSplitterBehavior;

void function(ImGuiWindow* window)
	igStartMouseMovingWindow;

void function(ImGuiStyle* dst)
	igStyleColorsClassic;

void function(ImGuiStyle* dst)
	igStyleColorsDark;

void function(ImGuiStyle* dst)
	igStyleColorsLight;

void function(ImGuiTabBar* tab_bar, ImGuiTabItem* tab)
	igTabBarCloseTab;

ImGuiTabItem* function(ImGuiTabBar* tab_bar, ImGuiID tab_id)
	igTabBarFindTabByID;

bool function(ImGuiTabBar* tab_bar)
	igTabBarProcessReorder;

void function(ImGuiTabBar* tab_bar, ImGuiTabItem* tab, int dir)
	igTabBarQueueReorder;

void function(ImGuiTabBar* tab_bar, ImGuiID tab_id)
	igTabBarRemoveTab;

void function(ImDrawList* draw_list, ImRect bb, ImGuiTabItemFlags flags, ImU32 col)
	igTabItemBackground;

bool function(byte* label, ImGuiTabItemFlags flags)
	igTabItemButton;

void function(ImVec2* pOut, byte* label, bool has_close_button)
	igTabItemCalcSize;

bool function(ImGuiTabBar* tab_bar, byte* label, bool* p_open, ImGuiTabItemFlags flags)
	igTabItemEx;

void function(ImDrawList* draw_list, ImRect bb, ImGuiTabItemFlags flags, ImVec2 frame_padding, byte* label, ImGuiID tab_id, ImGuiID close_button_id, bool is_contents_visible, bool* out_just_closed, bool* out_text_clipped)
	igTabItemLabelAndCloseButton;

void function(ImGuiTable* table)
	igTableBeginApplyRequests;

void function(ImGuiTable* table, int column_n)
	igTableBeginCell;

void function(ImGuiTable* table, int columns_count)
	igTableBeginInitMemory;

void function(ImGuiTable* table)
	igTableBeginRow;

void function(ImGuiTable* table)
	igTableDrawBorders;

void function(ImGuiTable* table)
	igTableDrawContextMenu;

void function(ImGuiTable* table)
	igTableEndCell;

void function(ImGuiTable* table)
	igTableEndRow;

ImGuiTable* function(ImGuiID id)
	igTableFindByID;

void function(ImGuiTable* table, ImGuiTableColumn* column)
	igTableFixColumnSortDirection;

void function()
	igTableGcCompactSettings;

void function(ImGuiTable* table)
	igTableGcCompactTransientBuffers;

ImGuiTableSettings* function(ImGuiTable* table)
	igTableGetBoundSettings;

void function(ImRect* pOut, ImGuiTable* table, int column_n)
	igTableGetCellBgRect;

int function()
	igTableGetColumnCount;

ImGuiTableColumnFlags function(int column_n)
	igTableGetColumnFlags;

int function()
	igTableGetColumnIndex;

byte* function(int column_n)
	igTableGetColumnName_Int;

byte* function(ImGuiTable* table, int column_n)
	igTableGetColumnName_TablePtr;

ImGuiSortDirection function(ImGuiTableColumn* column)
	igTableGetColumnNextSortDirection;

ImGuiID function(ImGuiTable* table, int column_n, int instance_no)
	igTableGetColumnResizeID;

float function(ImGuiTable* table, ImGuiTableColumn* column)
	igTableGetColumnWidthAuto;

float function()
	igTableGetHeaderRowHeight;

int function()
	igTableGetHoveredColumn;

float function(ImGuiTable* table, int column_n)
	igTableGetMaxColumnWidth;

int function()
	igTableGetRowIndex;

ImGuiTableSortSpecs* function()
	igTableGetSortSpecs;

void function(byte* label)
	igTableHeader;

void function()
	igTableHeadersRow;

void function(ImGuiTable* table)
	igTableLoadSettings;

void function(ImGuiTable* table)
	igTableMergeDrawChannels;

bool function()
	igTableNextColumn;

void function(ImGuiTableRowFlags row_flags, float min_row_height)
	igTableNextRow;

void function(int column_n)
	igTableOpenContextMenu;

void function()
	igTablePopBackgroundChannel;

void function()
	igTablePushBackgroundChannel;

void function(ImGuiTable* table)
	igTableRemove;

void function(ImGuiTable* table)
	igTableResetSettings;

void function(ImGuiTable* table)
	igTableSaveSettings;

void function(ImGuiTableBgTarget target, ImU32 color, int column_n)
	igTableSetBgColor;

void function(int column_n, bool enabled)
	igTableSetColumnEnabled;

bool function(int column_n)
	igTableSetColumnIndex;

void function(int column_n, ImGuiSortDirection sort_direction, bool append_to_sort_specs)
	igTableSetColumnSortDirection;

void function(int column_n, float width)
	igTableSetColumnWidth;

void function(ImGuiTable* table)
	igTableSetColumnWidthAutoAll;

void function(ImGuiTable* table, int column_n)
	igTableSetColumnWidthAutoSingle;

ImGuiTableSettings* function(ImGuiID id, int columns_count)
	igTableSettingsCreate;

ImGuiTableSettings* function(ImGuiID id)
	igTableSettingsFindByID;

void function(ImGuiContext* context)
	igTableSettingsInstallHandler;

void function(byte* label, ImGuiTableColumnFlags flags, float init_width_or_weight, ImGuiID user_id)
	igTableSetupColumn;

void function(ImGuiTable* table)
	igTableSetupDrawChannels;

void function(int cols, int rows)
	igTableSetupScrollFreeze;

void function(ImGuiTable* table)
	igTableSortSpecsBuild;

void function(ImGuiTable* table)
	igTableSortSpecsSanitize;

void function(ImGuiTable* table)
	igTableUpdateBorders;

void function(ImGuiTable* table)
	igTableUpdateColumnsWeightFromWidth;

void function(ImGuiTable* table)
	igTableUpdateLayout;

bool function(ImGuiID id)
	igTempInputIsActive;

bool function(ImRect bb, ImGuiID id, byte* label, ImGuiDataType data_type, void* p_data, byte* format, void* p_clamp_min, void* p_clamp_max)
	igTempInputScalar;

bool function(ImRect bb, ImGuiID id, byte* label, byte* buf, int buf_size, ImGuiInputTextFlags flags)
	igTempInputText;

void function(byte* fmt, ...)
	igText;

void function(ImVec4 col, byte* fmt, ...)
	igTextColored;

void function(ImVec4 col, byte* fmt, va_list args)
	igTextColoredV;

void function(byte* fmt, ...)
	igTextDisabled;

void function(byte* fmt, va_list args)
	igTextDisabledV;

void function(byte* text, byte* text_end, ImGuiTextFlags flags)
	igTextEx;

void function(byte* text, byte* text_end)
	igTextUnformatted;

void function(byte* fmt, va_list args)
	igTextV;

void function(byte* fmt, ...)
	igTextWrapped;

void function(byte* fmt, va_list args)
	igTextWrappedV;

bool function(ImGuiID id, ImGuiTreeNodeFlags flags, byte* label, byte* label_end)
	igTreeNodeBehavior;

bool function(ImGuiID id, ImGuiTreeNodeFlags flags)
	igTreeNodeBehaviorIsOpen;

bool function(void* ptr_id, ImGuiTreeNodeFlags flags, byte* fmt, va_list args)
	igTreeNodeExV_Ptr;

bool function(byte* str_id, ImGuiTreeNodeFlags flags, byte* fmt, va_list args)
	igTreeNodeExV_Str;

bool function(void* ptr_id, ImGuiTreeNodeFlags flags, byte* fmt, ...)
	igTreeNodeEx_Ptr;

bool function(byte* label, ImGuiTreeNodeFlags flags)
	igTreeNodeEx_Str;

bool function(byte* str_id, ImGuiTreeNodeFlags flags, byte* fmt, ...)
	igTreeNodeEx_StrStr;

bool function(void* ptr_id, byte* fmt, va_list args)
	igTreeNodeV_Ptr;

bool function(byte* str_id, byte* fmt, va_list args)
	igTreeNodeV_Str;

bool function(void* ptr_id, byte* fmt, ...)
	igTreeNode_Ptr;

bool function(byte* label)
	igTreeNode_Str;

bool function(byte* str_id, byte* fmt, ...)
	igTreeNode_StrStr;

void function()
	igTreePop;

void function(ImGuiID id)
	igTreePushOverrideID;

void function(void* ptr_id)
	igTreePush_Ptr;

void function(byte* str_id)
	igTreePush_Str;

void function(float indent_w)
	igUnindent;

void function()
	igUpdateHoveredWindowAndCaptureFlags;

void function()
	igUpdateMouseMovingWindowEndFrame;

void function()
	igUpdateMouseMovingWindowNewFrame;

void function(ImGuiWindow* window, ImGuiWindowFlags flags, ImGuiWindow* parent_window)
	igUpdateWindowParentAndRootLinks;

bool function(byte* label, ImVec2 size, float* v, float v_min, float v_max, byte* format, ImGuiSliderFlags flags)
	igVSliderFloat;

bool function(byte* label, ImVec2 size, int* v, int v_min, int v_max, byte* format, ImGuiSliderFlags flags)
	igVSliderInt;

bool function(byte* label, ImVec2 size, ImGuiDataType data_type, void* p_data, void* p_min, void* p_max, byte* format, ImGuiSliderFlags flags)
	igVSliderScalar;

void function(byte* prefix, bool b)
	igValue_Bool;

void function(byte* prefix, float v, byte* float_format)
	igValue_Float;

void function(byte* prefix, int v)
	igValue_Int;

void function(byte* prefix, uint v)
	igValue_Uint;

}} // extern(Windows), __gshared

// UFCS camel case struct methods
pragma(inline,true) {

void destroy(ImGuiContextHook* self) {
	ImGuiContextHook_destroy(self);
}
void destroy(ImGuiContext* self) {
	ImGuiContext_destroy(self);
}
void addInputCharacter(ImGuiIO* self, uint c) {
	ImGuiIO_AddInputCharacter(self, c);
}
void addInputCharacterUTF16(ImGuiIO* self, ImWchar16 c) {
	ImGuiIO_AddInputCharacterUTF16(self, c);
}
void addInputCharactersUTF8(ImGuiIO* self, byte* str) {
	ImGuiIO_AddInputCharactersUTF8(self, str);
}
void clearInputCharacters(ImGuiIO* self) {
	ImGuiIO_ClearInputCharacters(self);
}
void destroy(ImGuiIO* self) {
	ImGuiIO_destroy(self);
}
void clearSelection(ImGuiInputTextCallbackData* self) {
	ImGuiInputTextCallbackData_ClearSelection(self);
}
void deleteChars(ImGuiInputTextCallbackData* self, int pos, int bytes_count) {
	ImGuiInputTextCallbackData_DeleteChars(self, pos, bytes_count);
}
bool hasSelection(ImGuiInputTextCallbackData* self) {
	return ImGuiInputTextCallbackData_HasSelection(self);
}
void insertChars(ImGuiInputTextCallbackData* self, int pos, byte* text, byte* text_end) {
	ImGuiInputTextCallbackData_InsertChars(self, pos, text, text_end);
}
void selectAll(ImGuiInputTextCallbackData* self) {
	ImGuiInputTextCallbackData_SelectAll(self);
}
void destroy(ImGuiInputTextCallbackData* self) {
	ImGuiInputTextCallbackData_destroy(self);
}
void clearFreeMemory(ImGuiInputTextState* self) {
	ImGuiInputTextState_ClearFreeMemory(self);
}
void clearSelection(ImGuiInputTextState* self) {
	ImGuiInputTextState_ClearSelection(self);
}
void clearText(ImGuiInputTextState* self) {
	ImGuiInputTextState_ClearText(self);
}
void cursorAnimReset(ImGuiInputTextState* self) {
	ImGuiInputTextState_CursorAnimReset(self);
}
void cursorClamp(ImGuiInputTextState* self) {
	ImGuiInputTextState_CursorClamp(self);
}
int getRedoAvailCount(ImGuiInputTextState* self) {
	return ImGuiInputTextState_GetRedoAvailCount(self);
}
int getUndoAvailCount(ImGuiInputTextState* self) {
	return ImGuiInputTextState_GetUndoAvailCount(self);
}
bool hasSelection(ImGuiInputTextState* self) {
	return ImGuiInputTextState_HasSelection(self);
}
void onKeyPressed(ImGuiInputTextState* self, int key) {
	ImGuiInputTextState_OnKeyPressed(self, key);
}
void selectAll(ImGuiInputTextState* self) {
	ImGuiInputTextState_SelectAll(self);
}
void destroy(ImGuiInputTextState* self) {
	ImGuiInputTextState_destroy(self);
}
void backup(ImGuiLastItemDataBackup* self) {
	ImGuiLastItemDataBackup_Backup(self);
}
void restore(ImGuiLastItemDataBackup* self) {
	ImGuiLastItemDataBackup_Restore(self);
}
void destroy(ImGuiLastItemDataBackup* self) {
	ImGuiLastItemDataBackup_destroy(self);
}
void begin(ImGuiListClipper* self, int items_count, float items_height) {
	ImGuiListClipper_Begin(self, items_count, items_height);
}
void end(ImGuiListClipper* self) {
	ImGuiListClipper_End(self);
}
bool step(ImGuiListClipper* self) {
	return ImGuiListClipper_Step(self);
}
void destroy(ImGuiListClipper* self) {
	ImGuiListClipper_destroy(self);
}
float calcExtraSpace(ImGuiMenuColumns* self, float avail_w) {
	return ImGuiMenuColumns_CalcExtraSpace(self, avail_w);
}
float declColumns(ImGuiMenuColumns* self, float w0, float w1, float w2) {
	return ImGuiMenuColumns_DeclColumns(self, w0, w1, w2);
}
void update(ImGuiMenuColumns* self, int count, float spacing, bool clear) {
	ImGuiMenuColumns_Update(self, count, spacing, clear);
}
void destroy(ImGuiMenuColumns* self) {
	ImGuiMenuColumns_destroy(self);
}
void destroy(ImGuiMetricsConfig* self) {
	ImGuiMetricsConfig_destroy(self);
}
void clear(ImGuiNavMoveResult* self) {
	ImGuiNavMoveResult_Clear(self);
}
void destroy(ImGuiNavMoveResult* self) {
	ImGuiNavMoveResult_destroy(self);
}
void clearFlags(ImGuiNextItemData* self) {
	ImGuiNextItemData_ClearFlags(self);
}
void destroy(ImGuiNextItemData* self) {
	ImGuiNextItemData_destroy(self);
}
void clearFlags(ImGuiNextWindowData* self) {
	ImGuiNextWindowData_ClearFlags(self);
}
void destroy(ImGuiNextWindowData* self) {
	ImGuiNextWindowData_destroy(self);
}
void destroy(ImGuiOldColumnData* self) {
	ImGuiOldColumnData_destroy(self);
}
void destroy(ImGuiOldColumns* self) {
	ImGuiOldColumns_destroy(self);
}
void destroy(ImGuiOnceUponAFrame* self) {
	ImGuiOnceUponAFrame_destroy(self);
}
void clear(ImGuiPayload* self) {
	ImGuiPayload_Clear(self);
}
bool isDataType(ImGuiPayload* self, byte* type) {
	return ImGuiPayload_IsDataType(self, type);
}
bool isDelivery(ImGuiPayload* self) {
	return ImGuiPayload_IsDelivery(self);
}
bool isPreview(ImGuiPayload* self) {
	return ImGuiPayload_IsPreview(self);
}
void destroy(ImGuiPayload* self) {
	ImGuiPayload_destroy(self);
}
void destroy(ImGuiPopupData* self) {
	ImGuiPopupData_destroy(self);
}
void destroy(ImGuiPtrOrIndex* self) {
	ImGuiPtrOrIndex_destroy(self);
}
void destroy(ImGuiSettingsHandler* self) {
	ImGuiSettingsHandler_destroy(self);
}
void compareWithCurrentState(ImGuiStackSizes* self) {
	ImGuiStackSizes_CompareWithCurrentState(self);
}
void setToCurrentState(ImGuiStackSizes* self) {
	ImGuiStackSizes_SetToCurrentState(self);
}
void destroy(ImGuiStackSizes* self) {
	ImGuiStackSizes_destroy(self);
}
void destroy(ImGuiStoragePair* self) {
	ImGuiStoragePair_destroy(self);
}
void buildSortByKey(ImGuiStorage* self) {
	ImGuiStorage_BuildSortByKey(self);
}
void clear(ImGuiStorage* self) {
	ImGuiStorage_Clear(self);
}
bool getBool(ImGuiStorage* self, ImGuiID key, bool default_val) {
	return ImGuiStorage_GetBool(self, key, default_val);
}
bool* getBoolRef(ImGuiStorage* self, ImGuiID key, bool default_val) {
	return ImGuiStorage_GetBoolRef(self, key, default_val);
}
float getFloat(ImGuiStorage* self, ImGuiID key, float default_val) {
	return ImGuiStorage_GetFloat(self, key, default_val);
}
float* getFloatRef(ImGuiStorage* self, ImGuiID key, float default_val) {
	return ImGuiStorage_GetFloatRef(self, key, default_val);
}
int getInt(ImGuiStorage* self, ImGuiID key, int default_val) {
	return ImGuiStorage_GetInt(self, key, default_val);
}
int* getIntRef(ImGuiStorage* self, ImGuiID key, int default_val) {
	return ImGuiStorage_GetIntRef(self, key, default_val);
}
void* getVoidPtr(ImGuiStorage* self, ImGuiID key) {
	return ImGuiStorage_GetVoidPtr(self, key);
}
void** getVoidPtrRef(ImGuiStorage* self, ImGuiID key, void* default_val) {
	return ImGuiStorage_GetVoidPtrRef(self, key, default_val);
}
void setAllInt(ImGuiStorage* self, int val) {
	ImGuiStorage_SetAllInt(self, val);
}
void setBool(ImGuiStorage* self, ImGuiID key, bool val) {
	ImGuiStorage_SetBool(self, key, val);
}
void setFloat(ImGuiStorage* self, ImGuiID key, float val) {
	ImGuiStorage_SetFloat(self, key, val);
}
void setInt(ImGuiStorage* self, ImGuiID key, int val) {
	ImGuiStorage_SetInt(self, key, val);
}
void setVoidPtr(ImGuiStorage* self, ImGuiID key, void* val) {
	ImGuiStorage_SetVoidPtr(self, key, val);
}
void destroy(ImGuiStyleMod* self) {
	ImGuiStyleMod_destroy(self);
}
void scaleAllSizes(ImGuiStyle* self, float scale_factor) {
	ImGuiStyle_ScaleAllSizes(self, scale_factor);
}
void destroy(ImGuiStyle* self) {
	ImGuiStyle_destroy(self);
}
byte* getTabName(ImGuiTabBar* self, ImGuiTabItem* tab) {
	return ImGuiTabBar_GetTabName(self, tab);
}
int getTabOrder(ImGuiTabBar* self, ImGuiTabItem* tab) {
	return ImGuiTabBar_GetTabOrder(self, tab);
}
void destroy(ImGuiTabBar* self) {
	ImGuiTabBar_destroy(self);
}
void destroy(ImGuiTabItem* self) {
	ImGuiTabItem_destroy(self);
}
void destroy(ImGuiTableColumnSettings* self) {
	ImGuiTableColumnSettings_destroy(self);
}
void destroy(ImGuiTableColumnSortSpecs* self) {
	ImGuiTableColumnSortSpecs_destroy(self);
}
void destroy(ImGuiTableColumn* self) {
	ImGuiTableColumn_destroy(self);
}
ImGuiTableColumnSettings* getColumnSettings(ImGuiTableSettings* self) {
	return ImGuiTableSettings_GetColumnSettings(self);
}
void destroy(ImGuiTableSettings* self) {
	ImGuiTableSettings_destroy(self);
}
void destroy(ImGuiTableSortSpecs* self) {
	ImGuiTableSortSpecs_destroy(self);
}
void destroy(ImGuiTable* self) {
	ImGuiTable_destroy(self);
}
void append(ImGuiTextBuffer* self, byte* str, byte* str_end) {
	ImGuiTextBuffer_append(self, str, str_end);
}
void appendf(ImGuiTextBuffer* buffer, byte* fmt, ...) {
	ImGuiTextBuffer_appendf(buffer, fmt);
}
void appendfv(ImGuiTextBuffer* self, byte* fmt, va_list args) {
	ImGuiTextBuffer_appendfv(self, fmt, args);
}
byte* begin(ImGuiTextBuffer* self) {
	return ImGuiTextBuffer_begin(self);
}
byte* c_str(ImGuiTextBuffer* self) {
	return ImGuiTextBuffer_c_str(self);
}
void clear(ImGuiTextBuffer* self) {
	ImGuiTextBuffer_clear(self);
}
void destroy(ImGuiTextBuffer* self) {
	ImGuiTextBuffer_destroy(self);
}
bool empty(ImGuiTextBuffer* self) {
	return ImGuiTextBuffer_empty(self);
}
byte* end(ImGuiTextBuffer* self) {
	return ImGuiTextBuffer_end(self);
}
void reserve(ImGuiTextBuffer* self, int capacity) {
	ImGuiTextBuffer_reserve(self, capacity);
}
int size(ImGuiTextBuffer* self) {
	return ImGuiTextBuffer_size(self);
}
void build(ImGuiTextFilter* self) {
	ImGuiTextFilter_Build(self);
}
void clear(ImGuiTextFilter* self) {
	ImGuiTextFilter_Clear(self);
}
bool draw(ImGuiTextFilter* self, byte* label, float width) {
	return ImGuiTextFilter_Draw(self, label, width);
}
bool isActive(ImGuiTextFilter* self) {
	return ImGuiTextFilter_IsActive(self);
}
bool passFilter(ImGuiTextFilter* self, byte* text, byte* text_end) {
	return ImGuiTextFilter_PassFilter(self, text, text_end);
}
void destroy(ImGuiTextFilter* self) {
	ImGuiTextFilter_destroy(self);
}
void destroy(ImGuiTextRange* self) {
	ImGuiTextRange_destroy(self);
}
bool empty(ImGuiTextRange* self) {
	return ImGuiTextRange_empty(self);
}
void split(ImGuiTextRange* self, byte separator, ImVector_ImGuiTextRange* out_) {
	ImGuiTextRange_split(self, separator, out_);
}
void updateWorkRect(ImGuiViewportP* self) {
	ImGuiViewportP_UpdateWorkRect(self);
}
void destroy(ImGuiViewportP* self) {
	ImGuiViewportP_destroy(self);
}
void destroy(ImGuiViewport* self) {
	ImGuiViewport_destroy(self);
}
byte* getName(ImGuiWindowSettings* self) {
	return ImGuiWindowSettings_GetName(self);
}
void destroy(ImGuiWindowSettings* self) {
	ImGuiWindowSettings_destroy(self);
}
float calcFontSize(ImGuiWindow* self) {
	return ImGuiWindow_CalcFontSize(self);
}
ImGuiID getIDFromRectangle(ImGuiWindow* self, ImRect r_abs) {
	return ImGuiWindow_GetIDFromRectangle(self, r_abs);
}
ImGuiID getIDNoKeepAlive_Int(ImGuiWindow* self, int n) {
	return ImGuiWindow_GetIDNoKeepAlive_Int(self, n);
}
ImGuiID getIDNoKeepAlive_Ptr(ImGuiWindow* self, void* ptr) {
	return ImGuiWindow_GetIDNoKeepAlive_Ptr(self, ptr);
}
ImGuiID getIDNoKeepAlive_Str(ImGuiWindow* self, byte* str, byte* str_end) {
	return ImGuiWindow_GetIDNoKeepAlive_Str(self, str, str_end);
}
ImGuiID getID_Int(ImGuiWindow* self, int n) {
	return ImGuiWindow_GetID_Int(self, n);
}
ImGuiID getID_Ptr(ImGuiWindow* self, void* ptr) {
	return ImGuiWindow_GetID_Ptr(self, ptr);
}
ImGuiID getID_Str(ImGuiWindow* self, byte* str, byte* str_end) {
	return ImGuiWindow_GetID_Str(self, str, str_end);
}
float menuBarHeight(ImGuiWindow* self) {
	return ImGuiWindow_MenuBarHeight(self);
}
float titleBarHeight(ImGuiWindow* self) {
	return ImGuiWindow_TitleBarHeight(self);
}
void destroy(ImGuiWindow* self) {
	ImGuiWindow_destroy(self);
}
} // pragma


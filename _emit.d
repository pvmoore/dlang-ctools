module emit;

public:

// Vulkan include files converted to D (This is a generated file)
// 
// Usage:
//   ** Start program
//   VulkanLoader.load();
//   ** Create your VkInstance here
//   vkLoadInstanceFunctions(instance);
//   ** 
//   VulkanLoader.unload();
//   ** Exit program

// VulkanLoader
private struct _VulkanLoader {
	import core.sys.windows.windows;
	HANDLE handle;
	void load() {
		this.handle = LoadLibraryA("vulkan-1.dll");
		if(!handle) throw new Exception("Unable to load DLL");
		
		*(cast(void**)&vkGetInstanceProcAddr) = GetProcAddr(handle, "vkGetInstanceProcAddr");
	}
	void unload() {
		if(handle) FreeLibrary(handle);
	}
}
__gshared _VulkanLoader VulkanLoader;
// End of VulkanLoader

// Load Instance Functions
void vkLoadInstanceFunctions(VkInstance instance) {
	*(cast(void**)&vkGetDeviceQueue2) = vkGetInstanceProcAddr(instance, "vkGetDeviceQueue2");
	*(cast(void**)&vkInvalidateMappedMemoryRanges) = vkGetInstanceProcAddr(instance, "vkInvalidateMappedMemoryRanges");
	*(cast(void**)&vkGetSemaphoreFdKHR) = vkGetInstanceProcAddr(instance, "vkGetSemaphoreFdKHR");
	*(cast(void**)&vkGetPhysicalDeviceCooperativeMatrixPropertiesNV) = vkGetInstanceProcAddr(instance, "vkGetPhysicalDeviceCooperativeMatrixPropertiesNV");
	*(cast(void**)&vkGetSemaphoreWin32HandleKHR) = vkGetInstanceProcAddr(instance, "vkGetSemaphoreWin32HandleKHR");
	*(cast(void**)&vkGetPhysicalDeviceSurfaceFormats2KHR) = vkGetInstanceProcAddr(instance, "vkGetPhysicalDeviceSurfaceFormats2KHR");
	*(cast(void**)&vkCmdWriteBufferMarkerAMD) = vkGetInstanceProcAddr(instance, "vkCmdWriteBufferMarkerAMD");
	*(cast(void**)&vkSetEvent) = vkGetInstanceProcAddr(instance, "vkSetEvent");
	*(cast(void**)&vkCmdExecuteCommands) = vkGetInstanceProcAddr(instance, "vkCmdExecuteCommands");
	*(cast(void**)&vkGetPhysicalDeviceProperties2) = vkGetInstanceProcAddr(instance, "vkGetPhysicalDeviceProperties2");
	*(cast(void**)&vkGetImageDrmFormatModifierPropertiesEXT) = vkGetInstanceProcAddr(instance, "vkGetImageDrmFormatModifierPropertiesEXT");
	*(cast(void**)&vkDebugMarkerSetObjectTagEXT) = vkGetInstanceProcAddr(instance, "vkDebugMarkerSetObjectTagEXT");
	*(cast(void**)&vkFreeDescriptorSets) = vkGetInstanceProcAddr(instance, "vkFreeDescriptorSets");
	*(cast(void**)&vkGetDeviceGroupPresentCapabilitiesKHR) = vkGetInstanceProcAddr(instance, "vkGetDeviceGroupPresentCapabilitiesKHR");
	*(cast(void**)&vkCompileDeferredNV) = vkGetInstanceProcAddr(instance, "vkCompileDeferredNV");
	*(cast(void**)&vkGetValidationCacheDataEXT) = vkGetInstanceProcAddr(instance, "vkGetValidationCacheDataEXT");
	*(cast(void**)&vkCmdDrawIndirect) = vkGetInstanceProcAddr(instance, "vkCmdDrawIndirect");
	*(cast(void**)&vkGetPhysicalDeviceImageFormatProperties) = vkGetInstanceProcAddr(instance, "vkGetPhysicalDeviceImageFormatProperties");
	*(cast(void**)&vkGetImageMemoryRequirements2KHR) = vkGetInstanceProcAddr(instance, "vkGetImageMemoryRequirements2KHR");
	*(cast(void**)&vkGetBufferDeviceAddress) = vkGetInstanceProcAddr(instance, "vkGetBufferDeviceAddress");
	*(cast(void**)&vkCmdDispatchIndirect) = vkGetInstanceProcAddr(instance, "vkCmdDispatchIndirect");
	*(cast(void**)&vkGetPhysicalDeviceSurfaceSupportKHR) = vkGetInstanceProcAddr(instance, "vkGetPhysicalDeviceSurfaceSupportKHR");
	*(cast(void**)&vkGetPhysicalDeviceExternalSemaphoreProperties) = vkGetInstanceProcAddr(instance, "vkGetPhysicalDeviceExternalSemaphoreProperties");
	*(cast(void**)&vkCreateDescriptorUpdateTemplate) = vkGetInstanceProcAddr(instance, "vkCreateDescriptorUpdateTemplate");
	*(cast(void**)&vkGetPhysicalDevicePresentRectanglesKHR) = vkGetInstanceProcAddr(instance, "vkGetPhysicalDevicePresentRectanglesKHR");
	*(cast(void**)&vkGetPipelineExecutableInternalRepresentationsKHR) = vkGetInstanceProcAddr(instance, "vkGetPipelineExecutableInternalRepresentationsKHR");
	*(cast(void**)&vkDestroySwapchainKHR) = vkGetInstanceProcAddr(instance, "vkDestroySwapchainKHR");
	*(cast(void**)&vkGetDeviceGroupPeerMemoryFeaturesKHR) = vkGetInstanceProcAddr(instance, "vkGetDeviceGroupPeerMemoryFeaturesKHR");
	*(cast(void**)&vkMergePipelineCaches) = vkGetInstanceProcAddr(instance, "vkMergePipelineCaches");
	*(cast(void**)&vkCreateDisplayModeKHR) = vkGetInstanceProcAddr(instance, "vkCreateDisplayModeKHR");
	*(cast(void**)&vkGetPhysicalDeviceExternalFencePropertiesKHR) = vkGetInstanceProcAddr(instance, "vkGetPhysicalDeviceExternalFencePropertiesKHR");
	*(cast(void**)&vkCreateCommandPool) = vkGetInstanceProcAddr(instance, "vkCreateCommandPool");
	*(cast(void**)&vkCmdDrawIndirectByteCountEXT) = vkGetInstanceProcAddr(instance, "vkCmdDrawIndirectByteCountEXT");
	*(cast(void**)&vkCmdBindVertexBuffers) = vkGetInstanceProcAddr(instance, "vkCmdBindVertexBuffers");
	*(cast(void**)&vkQueueSetPerformanceConfigurationINTEL) = vkGetInstanceProcAddr(instance, "vkQueueSetPerformanceConfigurationINTEL");
	*(cast(void**)&vkCmdBeginQueryIndexedEXT) = vkGetInstanceProcAddr(instance, "vkCmdBeginQueryIndexedEXT");
	*(cast(void**)&vkQueueBindSparse) = vkGetInstanceProcAddr(instance, "vkQueueBindSparse");
	*(cast(void**)&vkBindImageMemory2KHR) = vkGetInstanceProcAddr(instance, "vkBindImageMemory2KHR");
	*(cast(void**)&vkCmdEndQuery) = vkGetInstanceProcAddr(instance, "vkCmdEndQuery");
	*(cast(void**)&vkDeviceWaitIdle) = vkGetInstanceProcAddr(instance, "vkDeviceWaitIdle");
	*(cast(void**)&vkCmdEndQueryIndexedEXT) = vkGetInstanceProcAddr(instance, "vkCmdEndQueryIndexedEXT");
	*(cast(void**)&vkCmdTraceRaysNV) = vkGetInstanceProcAddr(instance, "vkCmdTraceRaysNV");
	*(cast(void**)&vkCmdCopyQueryPoolResults) = vkGetInstanceProcAddr(instance, "vkCmdCopyQueryPoolResults");
	*(cast(void**)&vkCreateDescriptorSetLayout) = vkGetInstanceProcAddr(instance, "vkCreateDescriptorSetLayout");
	*(cast(void**)&vkImportSemaphoreFdKHR) = vkGetInstanceProcAddr(instance, "vkImportSemaphoreFdKHR");
	*(cast(void**)&vkGetPhysicalDeviceProperties) = vkGetInstanceProcAddr(instance, "vkGetPhysicalDeviceProperties");
	*(cast(void**)&vkAcquireProfilingLockKHR) = vkGetInstanceProcAddr(instance, "vkAcquireProfilingLockKHR");
	*(cast(void**)&vkCmdSetLineWidth) = vkGetInstanceProcAddr(instance, "vkCmdSetLineWidth");
	*(cast(void**)&vkCmdDrawIndexedIndirectCountKHR) = vkGetInstanceProcAddr(instance, "vkCmdDrawIndexedIndirectCountKHR");
	*(cast(void**)&vkGetPhysicalDeviceSurfaceCapabilities2EXT) = vkGetInstanceProcAddr(instance, "vkGetPhysicalDeviceSurfaceCapabilities2EXT");
	*(cast(void**)&vkQueueSubmit) = vkGetInstanceProcAddr(instance, "vkQueueSubmit");
	*(cast(void**)&vkAcquireNextImage2KHR) = vkGetInstanceProcAddr(instance, "vkAcquireNextImage2KHR");
	*(cast(void**)&vkSetHdrMetadataEXT) = vkGetInstanceProcAddr(instance, "vkSetHdrMetadataEXT");
	*(cast(void**)&vkGetPhysicalDeviceMemoryProperties2KHR) = vkGetInstanceProcAddr(instance, "vkGetPhysicalDeviceMemoryProperties2KHR");
	*(cast(void**)&vkCreatePipelineLayout) = vkGetInstanceProcAddr(instance, "vkCreatePipelineLayout");
	*(cast(void**)&vkGetImageViewHandleNVX) = vkGetInstanceProcAddr(instance, "vkGetImageViewHandleNVX");
	*(cast(void**)&vkGetImageSparseMemoryRequirements) = vkGetInstanceProcAddr(instance, "vkGetImageSparseMemoryRequirements");
	*(cast(void**)&vkGetImageViewAddressNVX) = vkGetInstanceProcAddr(instance, "vkGetImageViewAddressNVX");
	*(cast(void**)&vkCmdBuildAccelerationStructureNV) = vkGetInstanceProcAddr(instance, "vkCmdBuildAccelerationStructureNV");
	*(cast(void**)&vkGetBufferMemoryRequirements2KHR) = vkGetInstanceProcAddr(instance, "vkGetBufferMemoryRequirements2KHR");
	*(cast(void**)&vkCmdCopyImage) = vkGetInstanceProcAddr(instance, "vkCmdCopyImage");
	*(cast(void**)&vkGetDescriptorSetLayoutSupport) = vkGetInstanceProcAddr(instance, "vkGetDescriptorSetLayoutSupport");
	*(cast(void**)&vkEndCommandBuffer) = vkGetInstanceProcAddr(instance, "vkEndCommandBuffer");
	*(cast(void**)&vkDestroyDescriptorSetLayout) = vkGetInstanceProcAddr(instance, "vkDestroyDescriptorSetLayout");
	*(cast(void**)&vkEnumerateInstanceExtensionProperties) = vkGetInstanceProcAddr(instance, "vkEnumerateInstanceExtensionProperties");
	*(cast(void**)&vkGetBufferMemoryRequirements) = vkGetInstanceProcAddr(instance, "vkGetBufferMemoryRequirements");
	*(cast(void**)&vkDestroyPipelineLayout) = vkGetInstanceProcAddr(instance, "vkDestroyPipelineLayout");
	*(cast(void**)&vkCmdSetDeviceMaskKHR) = vkGetInstanceProcAddr(instance, "vkCmdSetDeviceMaskKHR");
	*(cast(void**)&vkGetDeviceMemoryCommitment) = vkGetInstanceProcAddr(instance, "vkGetDeviceMemoryCommitment");
	*(cast(void**)&vkGetPrivateDataEXT) = vkGetInstanceProcAddr(instance, "vkGetPrivateDataEXT");
	*(cast(void**)&vkCmdPushDescriptorSetWithTemplateKHR) = vkGetInstanceProcAddr(instance, "vkCmdPushDescriptorSetWithTemplateKHR");
	*(cast(void**)&vkGetDisplayPlaneCapabilitiesKHR) = vkGetInstanceProcAddr(instance, "vkGetDisplayPlaneCapabilitiesKHR");
	*(cast(void**)&vkSetLocalDimmingAMD) = vkGetInstanceProcAddr(instance, "vkSetLocalDimmingAMD");
	*(cast(void**)&vkReleaseFullScreenExclusiveModeEXT) = vkGetInstanceProcAddr(instance, "vkReleaseFullScreenExclusiveModeEXT");
	*(cast(void**)&vkCmdPushDescriptorSetKHR) = vkGetInstanceProcAddr(instance, "vkCmdPushDescriptorSetKHR");
	*(cast(void**)&vkCmdBindShadingRateImageNV) = vkGetInstanceProcAddr(instance, "vkCmdBindShadingRateImageNV");
	*(cast(void**)&vkCreateAccelerationStructureNV) = vkGetInstanceProcAddr(instance, "vkCreateAccelerationStructureNV");
	*(cast(void**)&vkGetPhysicalDeviceDisplayPlaneProperties2KHR) = vkGetInstanceProcAddr(instance, "vkGetPhysicalDeviceDisplayPlaneProperties2KHR");
	*(cast(void**)&vkSetDebugUtilsObjectNameEXT) = vkGetInstanceProcAddr(instance, "vkSetDebugUtilsObjectNameEXT");
	*(cast(void**)&vkCmdSetSampleLocationsEXT) = vkGetInstanceProcAddr(instance, "vkCmdSetSampleLocationsEXT");
	*(cast(void**)&vkResetEvent) = vkGetInstanceProcAddr(instance, "vkResetEvent");
	*(cast(void**)&vkCmdDrawIndexedIndirectCount) = vkGetInstanceProcAddr(instance, "vkCmdDrawIndexedIndirectCount");
	*(cast(void**)&vkWaitSemaphores) = vkGetInstanceProcAddr(instance, "vkWaitSemaphores");
	*(cast(void**)&vkGetDisplayModeProperties2KHR) = vkGetInstanceProcAddr(instance, "vkGetDisplayModeProperties2KHR");
	*(cast(void**)&vkCmdResetQueryPool) = vkGetInstanceProcAddr(instance, "vkCmdResetQueryPool");
	*(cast(void**)&vkCmdWriteAccelerationStructuresPropertiesKHR) = vkGetInstanceProcAddr(instance, "vkCmdWriteAccelerationStructuresPropertiesKHR");
	*(cast(void**)&vkGetDeviceQueue) = vkGetInstanceProcAddr(instance, "vkGetDeviceQueue");
	*(cast(void**)&vkEnumerateInstanceVersion) = vkGetInstanceProcAddr(instance, "vkEnumerateInstanceVersion");
	*(cast(void**)&vkCmdPreprocessGeneratedCommandsNV) = vkGetInstanceProcAddr(instance, "vkCmdPreprocessGeneratedCommandsNV");
	*(cast(void**)&vkGetFenceFdKHR) = vkGetInstanceProcAddr(instance, "vkGetFenceFdKHR");
	*(cast(void**)&vkCmdSetExclusiveScissorNV) = vkGetInstanceProcAddr(instance, "vkCmdSetExclusiveScissorNV");
	*(cast(void**)&vkCmdSetStencilCompareMask) = vkGetInstanceProcAddr(instance, "vkCmdSetStencilCompareMask");
	*(cast(void**)&vkGetRefreshCycleDurationGOOGLE) = vkGetInstanceProcAddr(instance, "vkGetRefreshCycleDurationGOOGLE");
	*(cast(void**)&vkGetPhysicalDeviceWin32PresentationSupportKHR) = vkGetInstanceProcAddr(instance, "vkGetPhysicalDeviceWin32PresentationSupportKHR");
	*(cast(void**)&vkDestroyDebugReportCallbackEXT) = vkGetInstanceProcAddr(instance, "vkDestroyDebugReportCallbackEXT");
	*(cast(void**)&vkCreateRayTracingPipelinesNV) = vkGetInstanceProcAddr(instance, "vkCreateRayTracingPipelinesNV");
	*(cast(void**)&vkCmdWriteAccelerationStructuresPropertiesNV) = vkGetInstanceProcAddr(instance, "vkCmdWriteAccelerationStructuresPropertiesNV");
	*(cast(void**)&vkGetPhysicalDeviceQueueFamilyPerformanceQueryPassesKHR) = vkGetInstanceProcAddr(instance, "vkGetPhysicalDeviceQueueFamilyPerformanceQueryPassesKHR");
	*(cast(void**)&vkDestroyDevice) = vkGetInstanceProcAddr(instance, "vkDestroyDevice");
	*(cast(void**)&vkGetPhysicalDeviceFormatProperties2) = vkGetInstanceProcAddr(instance, "vkGetPhysicalDeviceFormatProperties2");
	*(cast(void**)&vkGetPhysicalDeviceFeatures) = vkGetInstanceProcAddr(instance, "vkGetPhysicalDeviceFeatures");
	*(cast(void**)&vkGetPhysicalDeviceImageFormatProperties2KHR) = vkGetInstanceProcAddr(instance, "vkGetPhysicalDeviceImageFormatProperties2KHR");
	*(cast(void**)&vkCreateBuffer) = vkGetInstanceProcAddr(instance, "vkCreateBuffer");
	*(cast(void**)&vkGetDeviceGroupSurfacePresentModes2EXT) = vkGetInstanceProcAddr(instance, "vkGetDeviceGroupSurfacePresentModes2EXT");
	*(cast(void**)&vkGetBufferDeviceAddressKHR) = vkGetInstanceProcAddr(instance, "vkGetBufferDeviceAddressKHR");
	*(cast(void**)&vkCmdNextSubpass2) = vkGetInstanceProcAddr(instance, "vkCmdNextSubpass2");
	*(cast(void**)&vkResetQueryPool) = vkGetInstanceProcAddr(instance, "vkResetQueryPool");
	*(cast(void**)&vkDestroyInstance) = vkGetInstanceProcAddr(instance, "vkDestroyInstance");
	*(cast(void**)&vkDestroyFence) = vkGetInstanceProcAddr(instance, "vkDestroyFence");
	*(cast(void**)&vkAcquireFullScreenExclusiveModeEXT) = vkGetInstanceProcAddr(instance, "vkAcquireFullScreenExclusiveModeEXT");
	*(cast(void**)&vkUpdateDescriptorSetWithTemplateKHR) = vkGetInstanceProcAddr(instance, "vkUpdateDescriptorSetWithTemplateKHR");
	*(cast(void**)&vkCmdNextSubpass) = vkGetInstanceProcAddr(instance, "vkCmdNextSubpass");
	*(cast(void**)&vkCmdEndRenderPass2) = vkGetInstanceProcAddr(instance, "vkCmdEndRenderPass2");
	*(cast(void**)&vkDestroyAccelerationStructureNV) = vkGetInstanceProcAddr(instance, "vkDestroyAccelerationStructureNV");
	*(cast(void**)&vkCmdDrawIndirectCountAMD) = vkGetInstanceProcAddr(instance, "vkCmdDrawIndirectCountAMD");
	*(cast(void**)&vkCmdInsertDebugUtilsLabelEXT) = vkGetInstanceProcAddr(instance, "vkCmdInsertDebugUtilsLabelEXT");
	*(cast(void**)&vkGetSwapchainImagesKHR) = vkGetInstanceProcAddr(instance, "vkGetSwapchainImagesKHR");
	*(cast(void**)&vkCreateSamplerYcbcrConversionKHR) = vkGetInstanceProcAddr(instance, "vkCreateSamplerYcbcrConversionKHR");
	*(cast(void**)&vkCmdCopyBufferToImage) = vkGetInstanceProcAddr(instance, "vkCmdCopyBufferToImage");
	*(cast(void**)&vkCreateDebugReportCallbackEXT) = vkGetInstanceProcAddr(instance, "vkCreateDebugReportCallbackEXT");
	*(cast(void**)&vkEnumerateDeviceExtensionProperties) = vkGetInstanceProcAddr(instance, "vkEnumerateDeviceExtensionProperties");
	*(cast(void**)&vkCmdBeginRenderPass2KHR) = vkGetInstanceProcAddr(instance, "vkCmdBeginRenderPass2KHR");
	*(cast(void**)&vkCreateHeadlessSurfaceEXT) = vkGetInstanceProcAddr(instance, "vkCreateHeadlessSurfaceEXT");
	*(cast(void**)&vkCreateBufferView) = vkGetInstanceProcAddr(instance, "vkCreateBufferView");
	*(cast(void**)&vkGetPipelineCacheData) = vkGetInstanceProcAddr(instance, "vkGetPipelineCacheData");
	*(cast(void**)&vkCmdDrawMeshTasksNV) = vkGetInstanceProcAddr(instance, "vkCmdDrawMeshTasksNV");
	*(cast(void**)&vkCmdCopyAccelerationStructureNV) = vkGetInstanceProcAddr(instance, "vkCmdCopyAccelerationStructureNV");
	*(cast(void**)&vkDestroyRenderPass) = vkGetInstanceProcAddr(instance, "vkDestroyRenderPass");
	*(cast(void**)&vkBindImageMemory) = vkGetInstanceProcAddr(instance, "vkBindImageMemory");
	*(cast(void**)&vkCreateWin32SurfaceKHR) = vkGetInstanceProcAddr(instance, "vkCreateWin32SurfaceKHR");
	*(cast(void**)&vkMergeValidationCachesEXT) = vkGetInstanceProcAddr(instance, "vkMergeValidationCachesEXT");
	*(cast(void**)&vkGetPhysicalDeviceToolPropertiesEXT) = vkGetInstanceProcAddr(instance, "vkGetPhysicalDeviceToolPropertiesEXT");
	*(cast(void**)&vkCmdUpdateBuffer) = vkGetInstanceProcAddr(instance, "vkCmdUpdateBuffer");
	*(cast(void**)&vkGetPastPresentationTimingGOOGLE) = vkGetInstanceProcAddr(instance, "vkGetPastPresentationTimingGOOGLE");
	*(cast(void**)&vkDestroyDescriptorUpdateTemplate) = vkGetInstanceProcAddr(instance, "vkDestroyDescriptorUpdateTemplate");
	*(cast(void**)&vkGetBufferOpaqueCaptureAddress) = vkGetInstanceProcAddr(instance, "vkGetBufferOpaqueCaptureAddress");
	*(cast(void**)&vkCmdDebugMarkerEndEXT) = vkGetInstanceProcAddr(instance, "vkCmdDebugMarkerEndEXT");
	*(cast(void**)&vkDisplayPowerControlEXT) = vkGetInstanceProcAddr(instance, "vkDisplayPowerControlEXT");
	*(cast(void**)&vkWaitSemaphoresKHR) = vkGetInstanceProcAddr(instance, "vkWaitSemaphoresKHR");
	*(cast(void**)&vkDestroyImageView) = vkGetInstanceProcAddr(instance, "vkDestroyImageView");
	*(cast(void**)&vkCmdSetLineStippleEXT) = vkGetInstanceProcAddr(instance, "vkCmdSetLineStippleEXT");
	*(cast(void**)&vkCmdDispatchBase) = vkGetInstanceProcAddr(instance, "vkCmdDispatchBase");
	*(cast(void**)&vkCmdBlitImage) = vkGetInstanceProcAddr(instance, "vkCmdBlitImage");
	*(cast(void**)&vkDestroyIndirectCommandsLayoutNV) = vkGetInstanceProcAddr(instance, "vkDestroyIndirectCommandsLayoutNV");
	*(cast(void**)&vkCreateDevice) = vkGetInstanceProcAddr(instance, "vkCreateDevice");
	*(cast(void**)&vkGetPhysicalDeviceMultisamplePropertiesEXT) = vkGetInstanceProcAddr(instance, "vkGetPhysicalDeviceMultisamplePropertiesEXT");
	*(cast(void**)&vkSubmitDebugUtilsMessageEXT) = vkGetInstanceProcAddr(instance, "vkSubmitDebugUtilsMessageEXT");
	*(cast(void**)&vkCmdSetPerformanceMarkerINTEL) = vkGetInstanceProcAddr(instance, "vkCmdSetPerformanceMarkerINTEL");
	*(cast(void**)&vkGetSemaphoreCounterValueKHR) = vkGetInstanceProcAddr(instance, "vkGetSemaphoreCounterValueKHR");
	*(cast(void**)&vkGetPhysicalDeviceMemoryProperties2) = vkGetInstanceProcAddr(instance, "vkGetPhysicalDeviceMemoryProperties2");
	*(cast(void**)&vkEnumeratePhysicalDeviceGroupsKHR) = vkGetInstanceProcAddr(instance, "vkEnumeratePhysicalDeviceGroupsKHR");
	*(cast(void**)&vkDebugMarkerSetObjectNameEXT) = vkGetInstanceProcAddr(instance, "vkDebugMarkerSetObjectNameEXT");
	*(cast(void**)&vkCmdBindIndexBuffer) = vkGetInstanceProcAddr(instance, "vkCmdBindIndexBuffer");
	*(cast(void**)&vkBindAccelerationStructureMemoryKHR) = vkGetInstanceProcAddr(instance, "vkBindAccelerationStructureMemoryKHR");
	*(cast(void**)&vkGetPhysicalDeviceSparseImageFormatProperties2) = vkGetInstanceProcAddr(instance, "vkGetPhysicalDeviceSparseImageFormatProperties2");
	*(cast(void**)&vkCmdDraw) = vkGetInstanceProcAddr(instance, "vkCmdDraw");
	*(cast(void**)&vkGetPipelineExecutablePropertiesKHR) = vkGetInstanceProcAddr(instance, "vkGetPipelineExecutablePropertiesKHR");
	*(cast(void**)&vkCmdSetCoarseSampleOrderNV) = vkGetInstanceProcAddr(instance, "vkCmdSetCoarseSampleOrderNV");
	*(cast(void**)&vkGetMemoryFdKHR) = vkGetInstanceProcAddr(instance, "vkGetMemoryFdKHR");
	*(cast(void**)&vkQueuePresentKHR) = vkGetInstanceProcAddr(instance, "vkQueuePresentKHR");
	*(cast(void**)&vkEnumerateDeviceLayerProperties) = vkGetInstanceProcAddr(instance, "vkEnumerateDeviceLayerProperties");
	*(cast(void**)&vkCreateGraphicsPipelines) = vkGetInstanceProcAddr(instance, "vkCreateGraphicsPipelines");
	*(cast(void**)&vkCmdSetStencilWriteMask) = vkGetInstanceProcAddr(instance, "vkCmdSetStencilWriteMask");
	*(cast(void**)&vkCmdCopyImageToBuffer) = vkGetInstanceProcAddr(instance, "vkCmdCopyImageToBuffer");
	*(cast(void**)&vkReleaseDisplayEXT) = vkGetInstanceProcAddr(instance, "vkReleaseDisplayEXT");
	*(cast(void**)&vkGetMemoryHostPointerPropertiesEXT) = vkGetInstanceProcAddr(instance, "vkGetMemoryHostPointerPropertiesEXT");
	*(cast(void**)&vkEnumeratePhysicalDeviceGroups) = vkGetInstanceProcAddr(instance, "vkEnumeratePhysicalDeviceGroups");
	*(cast(void**)&vkCmdFillBuffer) = vkGetInstanceProcAddr(instance, "vkCmdFillBuffer");
	*(cast(void**)&vkCmdSetDeviceMask) = vkGetInstanceProcAddr(instance, "vkCmdSetDeviceMask");
	*(cast(void**)&vkCreateSamplerYcbcrConversion) = vkGetInstanceProcAddr(instance, "vkCreateSamplerYcbcrConversion");
	*(cast(void**)&vkBeginCommandBuffer) = vkGetInstanceProcAddr(instance, "vkBeginCommandBuffer");
	*(cast(void**)&vkCmdDrawMeshTasksIndirectCountNV) = vkGetInstanceProcAddr(instance, "vkCmdDrawMeshTasksIndirectCountNV");
	*(cast(void**)&vkCreateDebugUtilsMessengerEXT) = vkGetInstanceProcAddr(instance, "vkCreateDebugUtilsMessengerEXT");
	*(cast(void**)&vkCmdBeginTransformFeedbackEXT) = vkGetInstanceProcAddr(instance, "vkCmdBeginTransformFeedbackEXT");
	*(cast(void**)&vkGetBufferMemoryRequirements2) = vkGetInstanceProcAddr(instance, "vkGetBufferMemoryRequirements2");
	*(cast(void**)&vkImportFenceFdKHR) = vkGetInstanceProcAddr(instance, "vkImportFenceFdKHR");
	*(cast(void**)&vkUnmapMemory) = vkGetInstanceProcAddr(instance, "vkUnmapMemory");
	*(cast(void**)&vkGetPhysicalDeviceSupportedFramebufferMixedSamplesCombinationsNV) = vkGetInstanceProcAddr(instance, "vkGetPhysicalDeviceSupportedFramebufferMixedSamplesCombinationsNV");
	*(cast(void**)&vkCmdClearDepthStencilImage) = vkGetInstanceProcAddr(instance, "vkCmdClearDepthStencilImage");
	*(cast(void**)&vkDestroyPrivateDataSlotEXT) = vkGetInstanceProcAddr(instance, "vkDestroyPrivateDataSlotEXT");
	*(cast(void**)&vkGetSemaphoreCounterValue) = vkGetInstanceProcAddr(instance, "vkGetSemaphoreCounterValue");
	*(cast(void**)&vkGetDisplayPlaneSupportedDisplaysKHR) = vkGetInstanceProcAddr(instance, "vkGetDisplayPlaneSupportedDisplaysKHR");
	*(cast(void**)&vkGetImageSparseMemoryRequirements2KHR) = vkGetInstanceProcAddr(instance, "vkGetImageSparseMemoryRequirements2KHR");
	*(cast(void**)&vkCmdEndTransformFeedbackEXT) = vkGetInstanceProcAddr(instance, "vkCmdEndTransformFeedbackEXT");
	*(cast(void**)&vkResetQueryPoolEXT) = vkGetInstanceProcAddr(instance, "vkResetQueryPoolEXT");
	*(cast(void**)&vkCreateComputePipelines) = vkGetInstanceProcAddr(instance, "vkCreateComputePipelines");
	*(cast(void**)&vkDestroyDebugUtilsMessengerEXT) = vkGetInstanceProcAddr(instance, "vkDestroyDebugUtilsMessengerEXT");
	*(cast(void**)&vkCmdSetViewportWScalingNV) = vkGetInstanceProcAddr(instance, "vkCmdSetViewportWScalingNV");
	*(cast(void**)&vkCmdClearColorImage) = vkGetInstanceProcAddr(instance, "vkCmdClearColorImage");
	*(cast(void**)&vkCmdSetEvent) = vkGetInstanceProcAddr(instance, "vkCmdSetEvent");
	*(cast(void**)&vkGetPhysicalDeviceSparseImageFormatProperties) = vkGetInstanceProcAddr(instance, "vkGetPhysicalDeviceSparseImageFormatProperties");
	*(cast(void**)&vkGetPhysicalDeviceImageFormatProperties2) = vkGetInstanceProcAddr(instance, "vkGetPhysicalDeviceImageFormatProperties2");
	*(cast(void**)&vkBindImageMemory2) = vkGetInstanceProcAddr(instance, "vkBindImageMemory2");
	*(cast(void**)&vkGetPhysicalDeviceExternalSemaphorePropertiesKHR) = vkGetInstanceProcAddr(instance, "vkGetPhysicalDeviceExternalSemaphorePropertiesKHR");
	*(cast(void**)&vkRegisterDeviceEventEXT) = vkGetInstanceProcAddr(instance, "vkRegisterDeviceEventEXT");
	*(cast(void**)&vkCmdSetViewport) = vkGetInstanceProcAddr(instance, "vkCmdSetViewport");
	*(cast(void**)&vkCmdBeginQuery) = vkGetInstanceProcAddr(instance, "vkCmdBeginQuery");
	*(cast(void**)&vkCmdExecuteGeneratedCommandsNV) = vkGetInstanceProcAddr(instance, "vkCmdExecuteGeneratedCommandsNV");
	*(cast(void**)&vkQueueInsertDebugUtilsLabelEXT) = vkGetInstanceProcAddr(instance, "vkQueueInsertDebugUtilsLabelEXT");
	*(cast(void**)&vkReleasePerformanceConfigurationINTEL) = vkGetInstanceProcAddr(instance, "vkReleasePerformanceConfigurationINTEL");
	*(cast(void**)&vkGetAccelerationStructureMemoryRequirementsNV) = vkGetInstanceProcAddr(instance, "vkGetAccelerationStructureMemoryRequirementsNV");
	*(cast(void**)&vkGetDeviceProcAddr) = vkGetInstanceProcAddr(instance, "vkGetDeviceProcAddr");
	*(cast(void**)&vkDestroyQueryPool) = vkGetInstanceProcAddr(instance, "vkDestroyQueryPool");
	*(cast(void**)&vkGetShaderInfoAMD) = vkGetInstanceProcAddr(instance, "vkGetShaderInfoAMD");
	*(cast(void**)&vkFreeMemory) = vkGetInstanceProcAddr(instance, "vkFreeMemory");
	*(cast(void**)&vkBindBufferMemory2) = vkGetInstanceProcAddr(instance, "vkBindBufferMemory2");
	*(cast(void**)&vkEnumeratePhysicalDeviceQueueFamilyPerformanceQueryCountersKHR) = vkGetInstanceProcAddr(instance, "vkEnumeratePhysicalDeviceQueueFamilyPerformanceQueryCountersKHR");
	*(cast(void**)&vkDestroyDescriptorUpdateTemplateKHR) = vkGetInstanceProcAddr(instance, "vkDestroyDescriptorUpdateTemplateKHR");
	*(cast(void**)&vkGetPhysicalDeviceSurfaceFormatsKHR) = vkGetInstanceProcAddr(instance, "vkGetPhysicalDeviceSurfaceFormatsKHR");
	*(cast(void**)&vkCmdPushConstants) = vkGetInstanceProcAddr(instance, "vkCmdPushConstants");
	*(cast(void**)&vkCmdDebugMarkerBeginEXT) = vkGetInstanceProcAddr(instance, "vkCmdDebugMarkerBeginEXT");
	*(cast(void**)&vkDestroySamplerYcbcrConversionKHR) = vkGetInstanceProcAddr(instance, "vkDestroySamplerYcbcrConversionKHR");
	*(cast(void**)&vkGetMemoryWin32HandleNV) = vkGetInstanceProcAddr(instance, "vkGetMemoryWin32HandleNV");
	*(cast(void**)&vkGetCalibratedTimestampsEXT) = vkGetInstanceProcAddr(instance, "vkGetCalibratedTimestampsEXT");
	*(cast(void**)&vkGetBufferOpaqueCaptureAddressKHR) = vkGetInstanceProcAddr(instance, "vkGetBufferOpaqueCaptureAddressKHR");
	*(cast(void**)&vkGetPhysicalDeviceExternalImageFormatPropertiesNV) = vkGetInstanceProcAddr(instance, "vkGetPhysicalDeviceExternalImageFormatPropertiesNV");
	*(cast(void**)&vkGetPhysicalDeviceDisplayPropertiesKHR) = vkGetInstanceProcAddr(instance, "vkGetPhysicalDeviceDisplayPropertiesKHR");
	*(cast(void**)&vkGetMemoryFdPropertiesKHR) = vkGetInstanceProcAddr(instance, "vkGetMemoryFdPropertiesKHR");
	*(cast(void**)&vkDestroyShaderModule) = vkGetInstanceProcAddr(instance, "vkDestroyShaderModule");
	*(cast(void**)&vkDestroyImage) = vkGetInstanceProcAddr(instance, "vkDestroyImage");
	*(cast(void**)&vkCreateSampler) = vkGetInstanceProcAddr(instance, "vkCreateSampler");
	*(cast(void**)&vkUpdateDescriptorSetWithTemplate) = vkGetInstanceProcAddr(instance, "vkUpdateDescriptorSetWithTemplate");
	*(cast(void**)&vkCmdSetDepthBias) = vkGetInstanceProcAddr(instance, "vkCmdSetDepthBias");
	*(cast(void**)&vkDebugReportMessageEXT) = vkGetInstanceProcAddr(instance, "vkDebugReportMessageEXT");
	*(cast(void**)&vkGetMemoryWin32HandleKHR) = vkGetInstanceProcAddr(instance, "vkGetMemoryWin32HandleKHR");
	*(cast(void**)&vkEnumeratePhysicalDevices) = vkGetInstanceProcAddr(instance, "vkEnumeratePhysicalDevices");
	*(cast(void**)&vkGetPhysicalDeviceQueueFamilyProperties2) = vkGetInstanceProcAddr(instance, "vkGetPhysicalDeviceQueueFamilyProperties2");
	*(cast(void**)&vkGetSwapchainCounterEXT) = vkGetInstanceProcAddr(instance, "vkGetSwapchainCounterEXT");
	*(cast(void**)&vkCmdNextSubpass2KHR) = vkGetInstanceProcAddr(instance, "vkCmdNextSubpass2KHR");
	*(cast(void**)&vkAllocateCommandBuffers) = vkGetInstanceProcAddr(instance, "vkAllocateCommandBuffers");
	*(cast(void**)&vkResetFences) = vkGetInstanceProcAddr(instance, "vkResetFences");
	*(cast(void**)&vkCmdSetCheckpointNV) = vkGetInstanceProcAddr(instance, "vkCmdSetCheckpointNV");
	*(cast(void**)&vkGetDescriptorSetLayoutSupportKHR) = vkGetInstanceProcAddr(instance, "vkGetDescriptorSetLayoutSupportKHR");
	*(cast(void**)&vkTrimCommandPoolKHR) = vkGetInstanceProcAddr(instance, "vkTrimCommandPoolKHR");
	*(cast(void**)&vkCreateEvent) = vkGetInstanceProcAddr(instance, "vkCreateEvent");
	*(cast(void**)&vkCmdEndRenderPass2KHR) = vkGetInstanceProcAddr(instance, "vkCmdEndRenderPass2KHR");
	*(cast(void**)&vkGetRayTracingShaderGroupHandlesKHR) = vkGetInstanceProcAddr(instance, "vkGetRayTracingShaderGroupHandlesKHR");
	*(cast(void**)&vkUpdateDescriptorSets) = vkGetInstanceProcAddr(instance, "vkUpdateDescriptorSets");
	*(cast(void**)&vkBindAccelerationStructureMemoryNV) = vkGetInstanceProcAddr(instance, "vkBindAccelerationStructureMemoryNV");
	*(cast(void**)&vkCmdEndRenderPass) = vkGetInstanceProcAddr(instance, "vkCmdEndRenderPass");
	*(cast(void**)&vkCmdSetDepthBounds) = vkGetInstanceProcAddr(instance, "vkCmdSetDepthBounds");
	*(cast(void**)&vkCmdCopyBuffer) = vkGetInstanceProcAddr(instance, "vkCmdCopyBuffer");
	*(cast(void**)&vkCmdDrawIndexedIndirectCountAMD) = vkGetInstanceProcAddr(instance, "vkCmdDrawIndexedIndirectCountAMD");
	*(cast(void**)&vkCreateRenderPass2KHR) = vkGetInstanceProcAddr(instance, "vkCreateRenderPass2KHR");
	*(cast(void**)&vkAcquireNextImageKHR) = vkGetInstanceProcAddr(instance, "vkAcquireNextImageKHR");
	*(cast(void**)&vkSetDebugUtilsObjectTagEXT) = vkGetInstanceProcAddr(instance, "vkSetDebugUtilsObjectTagEXT");
	*(cast(void**)&vkCmdBeginDebugUtilsLabelEXT) = vkGetInstanceProcAddr(instance, "vkCmdBeginDebugUtilsLabelEXT");
	*(cast(void**)&vkCmdBindPipelineShaderGroupNV) = vkGetInstanceProcAddr(instance, "vkCmdBindPipelineShaderGroupNV");
	*(cast(void**)&vkGetPhysicalDeviceSurfacePresentModesKHR) = vkGetInstanceProcAddr(instance, "vkGetPhysicalDeviceSurfacePresentModesKHR");
	*(cast(void**)&vkCreateDisplayPlaneSurfaceKHR) = vkGetInstanceProcAddr(instance, "vkCreateDisplayPlaneSurfaceKHR");
	*(cast(void**)&vkGetDeviceMemoryOpaqueCaptureAddress) = vkGetInstanceProcAddr(instance, "vkGetDeviceMemoryOpaqueCaptureAddress");
	*(cast(void**)&vkCmdResetEvent) = vkGetInstanceProcAddr(instance, "vkCmdResetEvent");
	*(cast(void**)&vkCreateRenderPass2) = vkGetInstanceProcAddr(instance, "vkCreateRenderPass2");
	*(cast(void**)&vkCreateDescriptorPool) = vkGetInstanceProcAddr(instance, "vkCreateDescriptorPool");
	*(cast(void**)&vkGetPhysicalDeviceQueueFamilyProperties2KHR) = vkGetInstanceProcAddr(instance, "vkGetPhysicalDeviceQueueFamilyProperties2KHR");
	*(cast(void**)&vkGetPhysicalDeviceSurfaceCapabilitiesKHR) = vkGetInstanceProcAddr(instance, "vkGetPhysicalDeviceSurfaceCapabilitiesKHR");
	*(cast(void**)&vkGetPhysicalDeviceFormatProperties) = vkGetInstanceProcAddr(instance, "vkGetPhysicalDeviceFormatProperties");
	*(cast(void**)&vkGetImageMemoryRequirements) = vkGetInstanceProcAddr(instance, "vkGetImageMemoryRequirements");
	*(cast(void**)&vkCmdBindPipeline) = vkGetInstanceProcAddr(instance, "vkCmdBindPipeline");
	*(cast(void**)&vkCreateValidationCacheEXT) = vkGetInstanceProcAddr(instance, "vkCreateValidationCacheEXT");
	*(cast(void**)&vkRegisterDisplayEventEXT) = vkGetInstanceProcAddr(instance, "vkRegisterDisplayEventEXT");
	*(cast(void**)&vkDestroyEvent) = vkGetInstanceProcAddr(instance, "vkDestroyEvent");
	*(cast(void**)&vkTrimCommandPool) = vkGetInstanceProcAddr(instance, "vkTrimCommandPool");
	*(cast(void**)&vkSetPrivateDataEXT) = vkGetInstanceProcAddr(instance, "vkSetPrivateDataEXT");
	*(cast(void**)&vkCmdWaitEvents) = vkGetInstanceProcAddr(instance, "vkCmdWaitEvents");
	*(cast(void**)&vkAllocateMemory) = vkGetInstanceProcAddr(instance, "vkAllocateMemory");
	*(cast(void**)&vkCmdClearAttachments) = vkGetInstanceProcAddr(instance, "vkCmdClearAttachments");
	*(cast(void**)&vkCmdDrawIndirectCount) = vkGetInstanceProcAddr(instance, "vkCmdDrawIndirectCount");
	*(cast(void**)&vkGetPhysicalDeviceDisplayProperties2KHR) = vkGetInstanceProcAddr(instance, "vkGetPhysicalDeviceDisplayProperties2KHR");
	*(cast(void**)&vkGetAccelerationStructureHandleNV) = vkGetInstanceProcAddr(instance, "vkGetAccelerationStructureHandleNV");
	*(cast(void**)&vkGetPerformanceParameterINTEL) = vkGetInstanceProcAddr(instance, "vkGetPerformanceParameterINTEL");
	*(cast(void**)&vkGetFenceWin32HandleKHR) = vkGetInstanceProcAddr(instance, "vkGetFenceWin32HandleKHR");
	*(cast(void**)&vkCmdBindTransformFeedbackBuffersEXT) = vkGetInstanceProcAddr(instance, "vkCmdBindTransformFeedbackBuffersEXT");
	*(cast(void**)&vkCreateSemaphore) = vkGetInstanceProcAddr(instance, "vkCreateSemaphore");
	*(cast(void**)&vkGetDeviceMemoryOpaqueCaptureAddressKHR) = vkGetInstanceProcAddr(instance, "vkGetDeviceMemoryOpaqueCaptureAddressKHR");
	*(cast(void**)&vkCmdBeginRenderPass) = vkGetInstanceProcAddr(instance, "vkCmdBeginRenderPass");
	*(cast(void**)&vkCmdSetScissor) = vkGetInstanceProcAddr(instance, "vkCmdSetScissor");
	*(cast(void**)&vkSignalSemaphore) = vkGetInstanceProcAddr(instance, "vkSignalSemaphore");
	*(cast(void**)&vkCmdBindDescriptorSets) = vkGetInstanceProcAddr(instance, "vkCmdBindDescriptorSets");
	*(cast(void**)&vkGetDeviceGroupPeerMemoryFeatures) = vkGetInstanceProcAddr(instance, "vkGetDeviceGroupPeerMemoryFeatures");
	*(cast(void**)&vkGetEventStatus) = vkGetInstanceProcAddr(instance, "vkGetEventStatus");
	*(cast(void**)&vkCreateRenderPass) = vkGetInstanceProcAddr(instance, "vkCreateRenderPass");
	*(cast(void**)&vkDestroySamplerYcbcrConversion) = vkGetInstanceProcAddr(instance, "vkDestroySamplerYcbcrConversion");
	*(cast(void**)&vkCmdSetPerformanceStreamMarkerINTEL) = vkGetInstanceProcAddr(instance, "vkCmdSetPerformanceStreamMarkerINTEL");
	*(cast(void**)&vkQueueEndDebugUtilsLabelEXT) = vkGetInstanceProcAddr(instance, "vkQueueEndDebugUtilsLabelEXT");
	*(cast(void**)&vkDestroySurfaceKHR) = vkGetInstanceProcAddr(instance, "vkDestroySurfaceKHR");
	*(cast(void**)&vkGetPhysicalDeviceSurfacePresentModes2EXT) = vkGetInstanceProcAddr(instance, "vkGetPhysicalDeviceSurfacePresentModes2EXT");
	*(cast(void**)&vkGetFenceStatus) = vkGetInstanceProcAddr(instance, "vkGetFenceStatus");
	*(cast(void**)&vkGetPhysicalDeviceCalibrateableTimeDomainsEXT) = vkGetInstanceProcAddr(instance, "vkGetPhysicalDeviceCalibrateableTimeDomainsEXT");
	*(cast(void**)&vkCreatePrivateDataSlotEXT) = vkGetInstanceProcAddr(instance, "vkCreatePrivateDataSlotEXT");
	*(cast(void**)&vkFlushMappedMemoryRanges) = vkGetInstanceProcAddr(instance, "vkFlushMappedMemoryRanges");
	*(cast(void**)&vkDestroySampler) = vkGetInstanceProcAddr(instance, "vkDestroySampler");
	*(cast(void**)&vkCmdBeginRenderPass2) = vkGetInstanceProcAddr(instance, "vkCmdBeginRenderPass2");
	*(cast(void**)&vkCmdEndDebugUtilsLabelEXT) = vkGetInstanceProcAddr(instance, "vkCmdEndDebugUtilsLabelEXT");
	*(cast(void**)&vkCmdEndConditionalRenderingEXT) = vkGetInstanceProcAddr(instance, "vkCmdEndConditionalRenderingEXT");
	*(cast(void**)&vkCmdSetPerformanceOverrideINTEL) = vkGetInstanceProcAddr(instance, "vkCmdSetPerformanceOverrideINTEL");
	*(cast(void**)&vkFreeCommandBuffers) = vkGetInstanceProcAddr(instance, "vkFreeCommandBuffers");
	*(cast(void**)&vkReleaseProfilingLockKHR) = vkGetInstanceProcAddr(instance, "vkReleaseProfilingLockKHR");
	*(cast(void**)&vkCmdDebugMarkerInsertEXT) = vkGetInstanceProcAddr(instance, "vkCmdDebugMarkerInsertEXT");
	*(cast(void**)&vkGetPhysicalDeviceSurfaceCapabilities2KHR) = vkGetInstanceProcAddr(instance, "vkGetPhysicalDeviceSurfaceCapabilities2KHR");
	*(cast(void**)&vkImportSemaphoreWin32HandleKHR) = vkGetInstanceProcAddr(instance, "vkImportSemaphoreWin32HandleKHR");
	*(cast(void**)&vkCmdBeginConditionalRenderingEXT) = vkGetInstanceProcAddr(instance, "vkCmdBeginConditionalRenderingEXT");
	*(cast(void**)&vkCmdSetDiscardRectangleEXT) = vkGetInstanceProcAddr(instance, "vkCmdSetDiscardRectangleEXT");
	*(cast(void**)&vkGetDisplayPlaneCapabilities2KHR) = vkGetInstanceProcAddr(instance, "vkGetDisplayPlaneCapabilities2KHR");
	*(cast(void**)&vkCreatePipelineCache) = vkGetInstanceProcAddr(instance, "vkCreatePipelineCache");
	*(cast(void**)&vkSignalSemaphoreKHR) = vkGetInstanceProcAddr(instance, "vkSignalSemaphoreKHR");
	*(cast(void**)&vkWaitForFences) = vkGetInstanceProcAddr(instance, "vkWaitForFences");
	*(cast(void**)&vkAcquirePerformanceConfigurationINTEL) = vkGetInstanceProcAddr(instance, "vkAcquirePerformanceConfigurationINTEL");
	*(cast(void**)&vkImportFenceWin32HandleKHR) = vkGetInstanceProcAddr(instance, "vkImportFenceWin32HandleKHR");
	*(cast(void**)&vkResetCommandPool) = vkGetInstanceProcAddr(instance, "vkResetCommandPool");
	*(cast(void**)&vkQueueWaitIdle) = vkGetInstanceProcAddr(instance, "vkQueueWaitIdle");
	*(cast(void**)&vkGetQueryPoolResults) = vkGetInstanceProcAddr(instance, "vkGetQueryPoolResults");
	*(cast(void**)&vkCmdDrawIndexedIndirect) = vkGetInstanceProcAddr(instance, "vkCmdDrawIndexedIndirect");
	*(cast(void**)&vkCreateIndirectCommandsLayoutNV) = vkGetInstanceProcAddr(instance, "vkCreateIndirectCommandsLayoutNV");
	*(cast(void**)&vkGetDeviceGroupSurfacePresentModesKHR) = vkGetInstanceProcAddr(instance, "vkGetDeviceGroupSurfacePresentModesKHR");
	*(cast(void**)&vkBindBufferMemory) = vkGetInstanceProcAddr(instance, "vkBindBufferMemory");
	*(cast(void**)&vkGetPhysicalDeviceFormatProperties2KHR) = vkGetInstanceProcAddr(instance, "vkGetPhysicalDeviceFormatProperties2KHR");
	*(cast(void**)&vkGetPhysicalDeviceMemoryProperties) = vkGetInstanceProcAddr(instance, "vkGetPhysicalDeviceMemoryProperties");
	*(cast(void**)&vkEnumerateInstanceLayerProperties) = vkGetInstanceProcAddr(instance, "vkEnumerateInstanceLayerProperties");
	*(cast(void**)&vkDestroyBuffer) = vkGetInstanceProcAddr(instance, "vkDestroyBuffer");
	*(cast(void**)&vkCmdDispatchBaseKHR) = vkGetInstanceProcAddr(instance, "vkCmdDispatchBaseKHR");
	*(cast(void**)&vkGetPhysicalDeviceExternalBufferProperties) = vkGetInstanceProcAddr(instance, "vkGetPhysicalDeviceExternalBufferProperties");
	*(cast(void**)&vkGetPhysicalDeviceExternalFenceProperties) = vkGetInstanceProcAddr(instance, "vkGetPhysicalDeviceExternalFenceProperties");
	*(cast(void**)&vkGetSwapchainStatusKHR) = vkGetInstanceProcAddr(instance, "vkGetSwapchainStatusKHR");
	*(cast(void**)&vkCmdResolveImage) = vkGetInstanceProcAddr(instance, "vkCmdResolveImage");
	*(cast(void**)&vkDestroyDescriptorPool) = vkGetInstanceProcAddr(instance, "vkDestroyDescriptorPool");
	*(cast(void**)&vkGetPhysicalDeviceFeatures2) = vkGetInstanceProcAddr(instance, "vkGetPhysicalDeviceFeatures2");
	*(cast(void**)&vkGetBufferDeviceAddressEXT) = vkGetInstanceProcAddr(instance, "vkGetBufferDeviceAddressEXT");
	*(cast(void**)&vkGetMemoryWin32HandlePropertiesKHR) = vkGetInstanceProcAddr(instance, "vkGetMemoryWin32HandlePropertiesKHR");
	*(cast(void**)&vkCreateImage) = vkGetInstanceProcAddr(instance, "vkCreateImage");
	*(cast(void**)&vkCreateImageView) = vkGetInstanceProcAddr(instance, "vkCreateImageView");
	*(cast(void**)&vkCmdSetViewportShadingRatePaletteNV) = vkGetInstanceProcAddr(instance, "vkCmdSetViewportShadingRatePaletteNV");
	*(cast(void**)&vkCmdPipelineBarrier) = vkGetInstanceProcAddr(instance, "vkCmdPipelineBarrier");
	*(cast(void**)&vkDestroyBufferView) = vkGetInstanceProcAddr(instance, "vkDestroyBufferView");
	*(cast(void**)&vkGetImageSparseMemoryRequirements2) = vkGetInstanceProcAddr(instance, "vkGetImageSparseMemoryRequirements2");
	*(cast(void**)&vkGetPhysicalDeviceQueueFamilyProperties) = vkGetInstanceProcAddr(instance, "vkGetPhysicalDeviceQueueFamilyProperties");
	*(cast(void**)&vkAllocateDescriptorSets) = vkGetInstanceProcAddr(instance, "vkAllocateDescriptorSets");
	*(cast(void**)&vkBindBufferMemory2KHR) = vkGetInstanceProcAddr(instance, "vkBindBufferMemory2KHR");
	*(cast(void**)&vkDestroyPipelineCache) = vkGetInstanceProcAddr(instance, "vkDestroyPipelineCache");
	*(cast(void**)&vkGetPhysicalDeviceExternalBufferPropertiesKHR) = vkGetInstanceProcAddr(instance, "vkGetPhysicalDeviceExternalBufferPropertiesKHR");
	*(cast(void**)&vkGetImageSubresourceLayout) = vkGetInstanceProcAddr(instance, "vkGetImageSubresourceLayout");
	*(cast(void**)&vkDestroyFramebuffer) = vkGetInstanceProcAddr(instance, "vkDestroyFramebuffer");
	*(cast(void**)&vkCreateShaderModule) = vkGetInstanceProcAddr(instance, "vkCreateShaderModule");
	*(cast(void**)&vkCmdSetBlendConstants) = vkGetInstanceProcAddr(instance, "vkCmdSetBlendConstants");
	*(cast(void**)&vkGetPhysicalDeviceProperties2KHR) = vkGetInstanceProcAddr(instance, "vkGetPhysicalDeviceProperties2KHR");
	*(cast(void**)&vkResetDescriptorPool) = vkGetInstanceProcAddr(instance, "vkResetDescriptorPool");
	*(cast(void**)&vkCreateQueryPool) = vkGetInstanceProcAddr(instance, "vkCreateQueryPool");
	*(cast(void**)&vkGetPipelineExecutableStatisticsKHR) = vkGetInstanceProcAddr(instance, "vkGetPipelineExecutableStatisticsKHR");
	*(cast(void**)&vkCreateFramebuffer) = vkGetInstanceProcAddr(instance, "vkCreateFramebuffer");
	*(cast(void**)&vkGetGeneratedCommandsMemoryRequirementsNV) = vkGetInstanceProcAddr(instance, "vkGetGeneratedCommandsMemoryRequirementsNV");
	*(cast(void**)&vkCmdWriteTimestamp) = vkGetInstanceProcAddr(instance, "vkCmdWriteTimestamp");
	*(cast(void**)&vkCmdDrawIndirectCountKHR) = vkGetInstanceProcAddr(instance, "vkCmdDrawIndirectCountKHR");
	*(cast(void**)&vkCmdDispatch) = vkGetInstanceProcAddr(instance, "vkCmdDispatch");
	*(cast(void**)&vkGetPhysicalDeviceFeatures2KHR) = vkGetInstanceProcAddr(instance, "vkGetPhysicalDeviceFeatures2KHR");
	*(cast(void**)&vkGetDisplayModePropertiesKHR) = vkGetInstanceProcAddr(instance, "vkGetDisplayModePropertiesKHR");
	*(cast(void**)&vkMapMemory) = vkGetInstanceProcAddr(instance, "vkMapMemory");
	*(cast(void**)&vkGetRayTracingShaderGroupHandlesNV) = vkGetInstanceProcAddr(instance, "vkGetRayTracingShaderGroupHandlesNV");
	*(cast(void**)&vkCreateFence) = vkGetInstanceProcAddr(instance, "vkCreateFence");
	*(cast(void**)&vkCreateSwapchainKHR) = vkGetInstanceProcAddr(instance, "vkCreateSwapchainKHR");
	*(cast(void**)&vkDestroyAccelerationStructureKHR) = vkGetInstanceProcAddr(instance, "vkDestroyAccelerationStructureKHR");
	*(cast(void**)&vkDestroySemaphore) = vkGetInstanceProcAddr(instance, "vkDestroySemaphore");
	*(cast(void**)&vkCmdDrawIndexed) = vkGetInstanceProcAddr(instance, "vkCmdDrawIndexed");
	*(cast(void**)&vkGetImageMemoryRequirements2) = vkGetInstanceProcAddr(instance, "vkGetImageMemoryRequirements2");
	*(cast(void**)&vkInitializePerformanceApiINTEL) = vkGetInstanceProcAddr(instance, "vkInitializePerformanceApiINTEL");
	*(cast(void**)&vkCreateDescriptorUpdateTemplateKHR) = vkGetInstanceProcAddr(instance, "vkCreateDescriptorUpdateTemplateKHR");
	*(cast(void**)&vkGetPhysicalDeviceDisplayPlanePropertiesKHR) = vkGetInstanceProcAddr(instance, "vkGetPhysicalDeviceDisplayPlanePropertiesKHR");
	*(cast(void**)&vkDestroyValidationCacheEXT) = vkGetInstanceProcAddr(instance, "vkDestroyValidationCacheEXT");
	*(cast(void**)&vkUninitializePerformanceApiINTEL) = vkGetInstanceProcAddr(instance, "vkUninitializePerformanceApiINTEL");
	*(cast(void**)&vkCreateInstance) = vkGetInstanceProcAddr(instance, "vkCreateInstance");
	*(cast(void**)&vkGetRenderAreaGranularity) = vkGetInstanceProcAddr(instance, "vkGetRenderAreaGranularity");
	*(cast(void**)&vkGetPhysicalDeviceSparseImageFormatProperties2KHR) = vkGetInstanceProcAddr(instance, "vkGetPhysicalDeviceSparseImageFormatProperties2KHR");
	*(cast(void**)&vkDestroyCommandPool) = vkGetInstanceProcAddr(instance, "vkDestroyCommandPool");
	*(cast(void**)&vkDestroyPipeline) = vkGetInstanceProcAddr(instance, "vkDestroyPipeline");
	*(cast(void**)&vkQueueBeginDebugUtilsLabelEXT) = vkGetInstanceProcAddr(instance, "vkQueueBeginDebugUtilsLabelEXT");
	*(cast(void**)&vkResetCommandBuffer) = vkGetInstanceProcAddr(instance, "vkResetCommandBuffer");
	*(cast(void**)&vkCmdSetStencilReference) = vkGetInstanceProcAddr(instance, "vkCmdSetStencilReference");
	*(cast(void**)&vkCmdDrawMeshTasksIndirectNV) = vkGetInstanceProcAddr(instance, "vkCmdDrawMeshTasksIndirectNV");
	*(cast(void**)&vkGetQueueCheckpointDataNV) = vkGetInstanceProcAddr(instance, "vkGetQueueCheckpointDataNV");
	*(cast(void**)&vkCreateSharedSwapchainsKHR) = vkGetInstanceProcAddr(instance, "vkCreateSharedSwapchainsKHR");
}
// End Load Instance Functions

alias uint64_t = ulong;
alias VkPrivateDataSlotEXT = VkPrivateDataSlotEXT_T*;
alias VkQueryControlFlags = VkFlags;
alias VkValidationCacheEXT = VkValidationCacheEXT_T*;
alias VkBufferCreateFlags = VkFlags;
alias VkPipeline = VkPipeline_T*;
alias VkExternalSemaphoreFeatureFlags = VkFlags;
alias VkBuildAccelerationStructureFlagsKHR = VkFlags;
alias VkDependencyFlags = VkFlags;
alias VkDeviceAddress = uint64_t;
alias VkFence = VkFence_T*;
alias VkDescriptorSet = VkDescriptorSet_T*;
alias VkIndirectStateFlagsNV = VkFlags;
alias VkExternalFenceHandleTypeFlags = VkFlags;
alias VkQueueFlags = VkFlags;
alias VkExternalMemoryHandleTypeFlags = VkFlags;
alias VkCommandPoolTrimFlags = VkFlags;
alias VkSampleMask = uint32_t;
alias VkDescriptorUpdateTemplateCreateFlags = VkFlags;
alias VkPipelineTessellationStateCreateFlags = VkFlags;
alias VkDebugUtilsMessageTypeFlagsEXT = VkFlags;
alias VkAccelerationStructureNV = VkAccelerationStructureKHR;
alias VkDisplayPlaneAlphaFlagsKHR = VkFlags;
alias VkImage = VkImage_T*;
alias VkSamplerCreateFlags = VkFlags;
alias VkPipelineMultisampleStateCreateFlags = VkFlags;
alias VkBufferUsageFlags = VkFlags;
alias VkExternalMemoryHandleTypeFlagsNV = VkFlags;
alias VkColorComponentFlags = VkFlags;
alias VkDebugUtilsMessengerCallbackDataFlagsEXT = VkFlags;
alias PFN_vkInternalAllocationNotification = void function(void* pUserData, size_t size, VkInternalAllocationType allocationType, VkSystemAllocationScope allocationScope);
alias VkDescriptorUpdateTemplate = VkDescriptorUpdateTemplate_T*;
alias VkAccelerationStructureKHR = VkAccelerationStructureKHR_T*;
alias VkPipelineInputAssemblyStateCreateFlags = VkFlags;
alias VkSurfaceKHR = VkSurfaceKHR_T*;
alias VkDebugReportCallbackEXT = VkDebugReportCallbackEXT_T*;
alias VkPipelineShaderStageCreateFlags = VkFlags;
alias WCHAR = wchar_t;
alias VkSemaphoreWaitFlags = VkFlags;
alias VkStencilFaceFlags = VkFlags;
alias VkDebugReportFlagsEXT = VkFlags;
alias VkPipelineCacheCreateFlags = VkFlags;
alias VkSamplerYcbcrConversion = VkSamplerYcbcrConversion_T*;
alias VkSubpassDescriptionFlags = VkFlags;
alias VkPipelineLayout = VkPipelineLayout_T*;
alias VkShaderModuleCreateFlags = VkFlags;
alias VkExternalFenceFeatureFlags = VkFlags;
alias VkDisplayModeCreateFlagsKHR = VkFlags;
alias VkPeerMemoryFeatureFlags = VkFlags;
alias VkSparseImageFormatFlags = VkFlags;
alias VkCommandPool = VkCommandPool_T*;
alias VkFramebufferCreateFlags = VkFlags;
alias VkFlags = uint32_t;
alias VkImageAspectFlags = VkFlags;
alias VkDisplayModeKHR = VkDisplayModeKHR_T*;
alias VkRenderPassCreateFlags = VkFlags;
alias VkExternalSemaphoreHandleTypeFlags = VkFlags;
alias VkSparseMemoryBindFlags = VkFlags;
alias VkPipelineCache = VkPipelineCache_T*;
alias VkPipelineLayoutCreateFlags = VkFlags;
alias VkAccelerationStructureMemoryRequirementsTypeNV = VkAccelerationStructureMemoryRequirementsTypeKHR;
alias wchar_t = ushort;
alias size_t = ulong;
alias VkDeviceCreateFlags = VkFlags;
alias VkRenderPass = VkRenderPass_T*;
alias PFN_vkReallocationFunction = void* function(void* pUserData, void* pOriginal, size_t size, size_t alignment, VkSystemAllocationScope allocationScope);
alias VkBufferView = VkBufferView_T*;
alias VkBool32 = uint32_t;
alias VkDescriptorPool = VkDescriptorPool_T*;
alias VkDisplayKHR = VkDisplayKHR_T*;
alias VkDeviceMemory = VkDeviceMemory_T*;
alias VkDeviceQueueCreateFlags = VkFlags;
alias VkPipelineViewportStateCreateFlags = VkFlags;
alias VkIndirectCommandsLayoutNV = VkIndirectCommandsLayoutNV_T*;
alias VkWin32SurfaceCreateFlagsKHR = VkFlags;
alias VkToolPurposeFlagsEXT = VkFlags;
alias VkSurfaceTransformFlagsKHR = VkFlags;
alias VkQueryPipelineStatisticFlags = VkFlags;
alias VkAcquireProfilingLockFlagsKHR = VkFlags;
alias PFN_vkDebugReportCallbackEXT = VkBool32 function(VkDebugReportFlagsEXT flags, VkDebugReportObjectTypeEXT objectType, uint64_t object, size_t location, int32_t messageCode, byte* pLayerPrefix, byte* pMessage, void* pUserData);
alias uint16_t = ushort;
alias VkMemoryMapFlags = VkFlags;
alias VkFenceImportFlags = VkFlags;
alias VkQueryPool = VkQueryPool_T*;
alias VkDescriptorPoolResetFlags = VkFlags;
alias VkPipelineDepthStencilStateCreateFlags = VkFlags;
alias VkDescriptorSetLayoutCreateFlags = VkFlags;
alias VkFenceCreateFlags = VkFlags;
alias VkExternalMemoryFeatureFlagsNV = VkFlags;
alias PFN_vkVoidFunction = void function();
alias VkSampler = VkSampler_T*;
alias VkImageViewCreateFlags = VkFlags;
alias VkCommandBufferResetFlags = VkFlags;
alias VkDeviceGroupPresentModeFlagsKHR = VkFlags;
alias VkDevice = VkDevice_T*;
alias VkPipelineCreateFlags = VkFlags;
alias VkPipelineDynamicStateCreateFlags = VkFlags;
alias VkShaderStageFlags = VkFlags;
alias VkDisplaySurfaceCreateFlagsKHR = VkFlags;
alias VkExternalMemoryFeatureFlags = VkFlags;
alias VkDescriptorPoolCreateFlags = VkFlags;
alias VkPerformanceCounterDescriptionFlagsKHR = VkFlags;
alias VkSemaphoreImportFlags = VkFlags;
alias VkImageView = VkImageView_T*;
alias VkAccelerationStructureTypeNV = VkAccelerationStructureTypeKHR;
alias VkPerformanceConfigurationINTEL = VkPerformanceConfigurationINTEL_T*;
alias VkCommandBufferUsageFlags = VkFlags;
alias VkCommandPoolResetFlags = VkFlags;
alias uint32_t = uint;
alias VkValidationCacheCreateFlagsEXT = VkFlags;
alias VkSwapchainKHR = VkSwapchainKHR_T*;
alias VkHeadlessSurfaceCreateFlagsEXT = VkFlags;
alias HWND = HWND__*;
alias VkSampleCountFlags = VkFlags;
alias int32_t = int;
alias VkShaderModule = VkShaderModule_T*;
alias VkCompositeAlphaFlagsKHR = VkFlags;
alias VkFramebuffer = VkFramebuffer_T*;
alias VkPipelineVertexInputStateCreateFlags = VkFlags;
alias VkQueryResultFlags = VkFlags;
alias VkSurfaceCounterFlagsEXT = VkFlags;
alias VkImageUsageFlags = VkFlags;
alias VkDeviceSize = uint64_t;
alias HINSTANCE = HINSTANCE__*;
alias HANDLE = void*;
alias VkPhysicalDevice = VkPhysicalDevice_T*;
alias VkGeometryFlagsKHR = VkFlags;
alias PFN_vkDebugUtilsMessengerCallbackEXT = VkBool32 function(VkDebugUtilsMessageSeverityFlagBitsEXT messageSeverity, VkDebugUtilsMessageTypeFlagsEXT messageTypes, VkDebugUtilsMessengerCallbackDataEXT* pCallbackData, void* pUserData);
alias VkMemoryRequirements2KHR = VkMemoryRequirements2;
alias VkAccessFlags = VkFlags;
alias VkDebugUtilsMessageSeverityFlagsEXT = VkFlags;
alias PFN_vkFreeFunction = void function(void* pUserData, void* pMemory);
alias VkInstanceCreateFlags = VkFlags;
alias VkCullModeFlags = VkFlags;
alias VkAttachmentDescriptionFlags = VkFlags;
alias VkDebugUtilsMessengerEXT = VkDebugUtilsMessengerEXT_T*;
alias VkQueryPoolCreateFlags = VkFlags;
alias VkCommandPoolCreateFlags = VkFlags;
alias VkPipelineColorBlendStateCreateFlags = VkFlags;
alias VkBufferViewCreateFlags = VkFlags;
alias VkInstance = VkInstance_T*;
alias VkQueue = VkQueue_T*;
alias VkPipelineRasterizationStateCreateFlags = VkFlags;
alias VkFormatFeatureFlags = VkFlags;
alias PFN_vkAllocationFunction = void* function(void* pUserData, size_t size, size_t alignment, VkSystemAllocationScope allocationScope);
alias VkConditionalRenderingFlagsEXT = VkFlags;
alias VkEventCreateFlags = VkFlags;
alias VkSwapchainCreateFlagsKHR = VkFlags;
alias VkDebugUtilsMessengerCreateFlagsEXT = VkFlags;
alias PFN_vkInternalFreeNotification = void function(void* pUserData, size_t size, VkInternalAllocationType allocationType, VkSystemAllocationScope allocationScope);
alias VkCommandBuffer = VkCommandBuffer_T*;
alias VkImageCreateFlags = VkFlags;
alias VkSemaphoreCreateFlags = VkFlags;
alias LPCWSTR = WCHAR*;
alias VkPipelineStageFlags = VkFlags;
alias VkDescriptorSetLayout = VkDescriptorSetLayout_T*;
alias VkIndirectCommandsLayoutUsageFlagsNV = VkFlags;
alias VkSemaphore = VkSemaphore_T*;
alias VkEvent = VkEvent_T*;
alias VkBuffer = VkBuffer_T*;
alias VkBuildAccelerationStructureFlagsNV = VkBuildAccelerationStructureFlagsKHR;
alias VkPrivateDataSlotCreateFlagsEXT = VkFlags;

enum VkRayTracingShaderGroupTypeKHR {
	VK_RAY_TRACING_SHADER_GROUP_TYPE_GENERAL_KHR = 0,
	VK_RAY_TRACING_SHADER_GROUP_TYPE_TRIANGLES_HIT_GROUP_KHR = 1,
	VK_RAY_TRACING_SHADER_GROUP_TYPE_PROCEDURAL_HIT_GROUP_KHR = 2,
	VK_RAY_TRACING_SHADER_GROUP_TYPE_GENERAL_NV = VK_RAY_TRACING_SHADER_GROUP_TYPE_GENERAL_KHR,
	VK_RAY_TRACING_SHADER_GROUP_TYPE_TRIANGLES_HIT_GROUP_NV = VK_RAY_TRACING_SHADER_GROUP_TYPE_TRIANGLES_HIT_GROUP_KHR,
	VK_RAY_TRACING_SHADER_GROUP_TYPE_PROCEDURAL_HIT_GROUP_NV = VK_RAY_TRACING_SHADER_GROUP_TYPE_PROCEDURAL_HIT_GROUP_KHR,
	VK_RAY_TRACING_SHADER_GROUP_TYPE_MAX_ENUM_KHR = 0x7FFFFFFF,
}
enum VkSamplerYcbcrRange {
	VK_SAMPLER_YCBCR_RANGE_ITU_FULL = 0,
	VK_SAMPLER_YCBCR_RANGE_ITU_NARROW = 1,
	VK_SAMPLER_YCBCR_RANGE_ITU_FULL_KHR = VK_SAMPLER_YCBCR_RANGE_ITU_FULL,
	VK_SAMPLER_YCBCR_RANGE_ITU_NARROW_KHR = VK_SAMPLER_YCBCR_RANGE_ITU_NARROW,
	VK_SAMPLER_YCBCR_RANGE_MAX_ENUM = 0x7FFFFFFF,
}
enum VkDynamicState {
	VK_DYNAMIC_STATE_VIEWPORT = 0,
	VK_DYNAMIC_STATE_SCISSOR = 1,
	VK_DYNAMIC_STATE_LINE_WIDTH = 2,
	VK_DYNAMIC_STATE_DEPTH_BIAS = 3,
	VK_DYNAMIC_STATE_BLEND_CONSTANTS = 4,
	VK_DYNAMIC_STATE_DEPTH_BOUNDS = 5,
	VK_DYNAMIC_STATE_STENCIL_COMPARE_MASK = 6,
	VK_DYNAMIC_STATE_STENCIL_WRITE_MASK = 7,
	VK_DYNAMIC_STATE_STENCIL_REFERENCE = 8,
	VK_DYNAMIC_STATE_VIEWPORT_W_SCALING_NV = 1000087000,
	VK_DYNAMIC_STATE_DISCARD_RECTANGLE_EXT = 1000099000,
	VK_DYNAMIC_STATE_SAMPLE_LOCATIONS_EXT = 1000143000,
	VK_DYNAMIC_STATE_VIEWPORT_SHADING_RATE_PALETTE_NV = 1000164004,
	VK_DYNAMIC_STATE_VIEWPORT_COARSE_SAMPLE_ORDER_NV = 1000164006,
	VK_DYNAMIC_STATE_EXCLUSIVE_SCISSOR_NV = 1000205001,
	VK_DYNAMIC_STATE_LINE_STIPPLE_EXT = 1000259000,
	VK_DYNAMIC_STATE_MAX_ENUM = 0x7FFFFFFF,
}
enum VkExternalFenceHandleTypeFlagBits {
	VK_EXTERNAL_FENCE_HANDLE_TYPE_OPAQUE_FD_BIT = 0x00000001,
	VK_EXTERNAL_FENCE_HANDLE_TYPE_OPAQUE_WIN32_BIT = 0x00000002,
	VK_EXTERNAL_FENCE_HANDLE_TYPE_OPAQUE_WIN32_KMT_BIT = 0x00000004,
	VK_EXTERNAL_FENCE_HANDLE_TYPE_SYNC_FD_BIT = 0x00000008,
	VK_EXTERNAL_FENCE_HANDLE_TYPE_OPAQUE_FD_BIT_KHR = VK_EXTERNAL_FENCE_HANDLE_TYPE_OPAQUE_FD_BIT,
	VK_EXTERNAL_FENCE_HANDLE_TYPE_OPAQUE_WIN32_BIT_KHR = VK_EXTERNAL_FENCE_HANDLE_TYPE_OPAQUE_WIN32_BIT,
	VK_EXTERNAL_FENCE_HANDLE_TYPE_OPAQUE_WIN32_KMT_BIT_KHR = VK_EXTERNAL_FENCE_HANDLE_TYPE_OPAQUE_WIN32_KMT_BIT,
	VK_EXTERNAL_FENCE_HANDLE_TYPE_SYNC_FD_BIT_KHR = VK_EXTERNAL_FENCE_HANDLE_TYPE_SYNC_FD_BIT,
	VK_EXTERNAL_FENCE_HANDLE_TYPE_FLAG_BITS_MAX_ENUM = 0x7FFFFFFF,
}
enum VkSamplerYcbcrModelConversion {
	VK_SAMPLER_YCBCR_MODEL_CONVERSION_RGB_IDENTITY = 0,
	VK_SAMPLER_YCBCR_MODEL_CONVERSION_YCBCR_IDENTITY = 1,
	VK_SAMPLER_YCBCR_MODEL_CONVERSION_YCBCR_709 = 2,
	VK_SAMPLER_YCBCR_MODEL_CONVERSION_YCBCR_601 = 3,
	VK_SAMPLER_YCBCR_MODEL_CONVERSION_YCBCR_2020 = 4,
	VK_SAMPLER_YCBCR_MODEL_CONVERSION_RGB_IDENTITY_KHR = VK_SAMPLER_YCBCR_MODEL_CONVERSION_RGB_IDENTITY,
	VK_SAMPLER_YCBCR_MODEL_CONVERSION_YCBCR_IDENTITY_KHR = VK_SAMPLER_YCBCR_MODEL_CONVERSION_YCBCR_IDENTITY,
	VK_SAMPLER_YCBCR_MODEL_CONVERSION_YCBCR_709_KHR = VK_SAMPLER_YCBCR_MODEL_CONVERSION_YCBCR_709,
	VK_SAMPLER_YCBCR_MODEL_CONVERSION_YCBCR_601_KHR = VK_SAMPLER_YCBCR_MODEL_CONVERSION_YCBCR_601,
	VK_SAMPLER_YCBCR_MODEL_CONVERSION_YCBCR_2020_KHR = VK_SAMPLER_YCBCR_MODEL_CONVERSION_YCBCR_2020,
	VK_SAMPLER_YCBCR_MODEL_CONVERSION_MAX_ENUM = 0x7FFFFFFF,
}
enum VkPhysicalDeviceType {
	VK_PHYSICAL_DEVICE_TYPE_OTHER = 0,
	VK_PHYSICAL_DEVICE_TYPE_INTEGRATED_GPU = 1,
	VK_PHYSICAL_DEVICE_TYPE_DISCRETE_GPU = 2,
	VK_PHYSICAL_DEVICE_TYPE_VIRTUAL_GPU = 3,
	VK_PHYSICAL_DEVICE_TYPE_CPU = 4,
	VK_PHYSICAL_DEVICE_TYPE_MAX_ENUM = 0x7FFFFFFF,
}
enum VkCoverageReductionModeNV {
	VK_COVERAGE_REDUCTION_MODE_MERGE_NV = 0,
	VK_COVERAGE_REDUCTION_MODE_TRUNCATE_NV = 1,
	VK_COVERAGE_REDUCTION_MODE_MAX_ENUM_NV = 0x7FFFFFFF,
}
enum VkFrontFace {
	VK_FRONT_FACE_COUNTER_CLOCKWISE = 0,
	VK_FRONT_FACE_CLOCKWISE = 1,
	VK_FRONT_FACE_MAX_ENUM = 0x7FFFFFFF,
}
enum VkDisplayPlaneAlphaFlagBitsKHR {
	VK_DISPLAY_PLANE_ALPHA_OPAQUE_BIT_KHR = 0x00000001,
	VK_DISPLAY_PLANE_ALPHA_GLOBAL_BIT_KHR = 0x00000002,
	VK_DISPLAY_PLANE_ALPHA_PER_PIXEL_BIT_KHR = 0x00000004,
	VK_DISPLAY_PLANE_ALPHA_PER_PIXEL_PREMULTIPLIED_BIT_KHR = 0x00000008,
	VK_DISPLAY_PLANE_ALPHA_FLAG_BITS_MAX_ENUM_KHR = 0x7FFFFFFF,
}
enum VkSurfaceCounterFlagBitsEXT {
	VK_SURFACE_COUNTER_VBLANK_EXT = 0x00000001,
	VK_SURFACE_COUNTER_FLAG_BITS_MAX_ENUM_EXT = 0x7FFFFFFF,
}
enum VkColorSpaceKHR {
	VK_COLOR_SPACE_SRGB_NONLINEAR_KHR = 0,
	VK_COLOR_SPACE_DISPLAY_P3_NONLINEAR_EXT = 1000104001,
	VK_COLOR_SPACE_EXTENDED_SRGB_LINEAR_EXT = 1000104002,
	VK_COLOR_SPACE_DISPLAY_P3_LINEAR_EXT = 1000104003,
	VK_COLOR_SPACE_DCI_P3_NONLINEAR_EXT = 1000104004,
	VK_COLOR_SPACE_BT709_LINEAR_EXT = 1000104005,
	VK_COLOR_SPACE_BT709_NONLINEAR_EXT = 1000104006,
	VK_COLOR_SPACE_BT2020_LINEAR_EXT = 1000104007,
	VK_COLOR_SPACE_HDR10_ST2084_EXT = 1000104008,
	VK_COLOR_SPACE_DOLBYVISION_EXT = 1000104009,
	VK_COLOR_SPACE_HDR10_HLG_EXT = 1000104010,
	VK_COLOR_SPACE_ADOBERGB_LINEAR_EXT = 1000104011,
	VK_COLOR_SPACE_ADOBERGB_NONLINEAR_EXT = 1000104012,
	VK_COLOR_SPACE_PASS_THROUGH_EXT = 1000104013,
	VK_COLOR_SPACE_EXTENDED_SRGB_NONLINEAR_EXT = 1000104014,
	VK_COLOR_SPACE_DISPLAY_NATIVE_AMD = 1000213000,
	VK_COLORSPACE_SRGB_NONLINEAR_KHR = VK_COLOR_SPACE_SRGB_NONLINEAR_KHR,
	VK_COLOR_SPACE_DCI_P3_LINEAR_EXT = VK_COLOR_SPACE_DISPLAY_P3_LINEAR_EXT,
	VK_COLOR_SPACE_MAX_ENUM_KHR = 0x7FFFFFFF,
}
enum VkPerformanceValueTypeINTEL {
	VK_PERFORMANCE_VALUE_TYPE_UINT32_INTEL = 0,
	VK_PERFORMANCE_VALUE_TYPE_UINT64_INTEL = 1,
	VK_PERFORMANCE_VALUE_TYPE_FLOAT_INTEL = 2,
	VK_PERFORMANCE_VALUE_TYPE_BOOL_INTEL = 3,
	VK_PERFORMANCE_VALUE_TYPE_STRING_INTEL = 4,
	VK_PERFORMANCE_VALUE_TYPE_MAX_ENUM_INTEL = 0x7FFFFFFF,
}
enum VkDeviceEventTypeEXT {
	VK_DEVICE_EVENT_TYPE_DISPLAY_HOTPLUG_EXT = 0,
	VK_DEVICE_EVENT_TYPE_MAX_ENUM_EXT = 0x7FFFFFFF,
}
enum VkShaderInfoTypeAMD {
	VK_SHADER_INFO_TYPE_STATISTICS_AMD = 0,
	VK_SHADER_INFO_TYPE_BINARY_AMD = 1,
	VK_SHADER_INFO_TYPE_DISASSEMBLY_AMD = 2,
	VK_SHADER_INFO_TYPE_MAX_ENUM_AMD = 0x7FFFFFFF,
}
enum VkChromaLocation {
	VK_CHROMA_LOCATION_COSITED_EVEN = 0,
	VK_CHROMA_LOCATION_MIDPOINT = 1,
	VK_CHROMA_LOCATION_COSITED_EVEN_KHR = VK_CHROMA_LOCATION_COSITED_EVEN,
	VK_CHROMA_LOCATION_MIDPOINT_KHR = VK_CHROMA_LOCATION_MIDPOINT,
	VK_CHROMA_LOCATION_MAX_ENUM = 0x7FFFFFFF,
}
enum VkLogicOp {
	VK_LOGIC_OP_CLEAR = 0,
	VK_LOGIC_OP_AND = 1,
	VK_LOGIC_OP_AND_REVERSE = 2,
	VK_LOGIC_OP_COPY = 3,
	VK_LOGIC_OP_AND_INVERTED = 4,
	VK_LOGIC_OP_NO_OP = 5,
	VK_LOGIC_OP_XOR = 6,
	VK_LOGIC_OP_OR = 7,
	VK_LOGIC_OP_NOR = 8,
	VK_LOGIC_OP_EQUIVALENT = 9,
	VK_LOGIC_OP_INVERT = 10,
	VK_LOGIC_OP_OR_REVERSE = 11,
	VK_LOGIC_OP_COPY_INVERTED = 12,
	VK_LOGIC_OP_OR_INVERTED = 13,
	VK_LOGIC_OP_NAND = 14,
	VK_LOGIC_OP_SET = 15,
	VK_LOGIC_OP_MAX_ENUM = 0x7FFFFFFF,
}
enum VkPerformanceParameterTypeINTEL {
	VK_PERFORMANCE_PARAMETER_TYPE_HW_COUNTERS_SUPPORTED_INTEL = 0,
	VK_PERFORMANCE_PARAMETER_TYPE_STREAM_MARKER_VALID_BITS_INTEL = 1,
	VK_PERFORMANCE_PARAMETER_TYPE_MAX_ENUM_INTEL = 0x7FFFFFFF,
}
enum VkDescriptorType {
	VK_DESCRIPTOR_TYPE_SAMPLER = 0,
	VK_DESCRIPTOR_TYPE_COMBINED_IMAGE_SAMPLER = 1,
	VK_DESCRIPTOR_TYPE_SAMPLED_IMAGE = 2,
	VK_DESCRIPTOR_TYPE_STORAGE_IMAGE = 3,
	VK_DESCRIPTOR_TYPE_UNIFORM_TEXEL_BUFFER = 4,
	VK_DESCRIPTOR_TYPE_STORAGE_TEXEL_BUFFER = 5,
	VK_DESCRIPTOR_TYPE_UNIFORM_BUFFER = 6,
	VK_DESCRIPTOR_TYPE_STORAGE_BUFFER = 7,
	VK_DESCRIPTOR_TYPE_UNIFORM_BUFFER_DYNAMIC = 8,
	VK_DESCRIPTOR_TYPE_STORAGE_BUFFER_DYNAMIC = 9,
	VK_DESCRIPTOR_TYPE_INPUT_ATTACHMENT = 10,
	VK_DESCRIPTOR_TYPE_INLINE_UNIFORM_BLOCK_EXT = 1000138000,
	VK_DESCRIPTOR_TYPE_ACCELERATION_STRUCTURE_KHR = 1000165000,
	VK_DESCRIPTOR_TYPE_ACCELERATION_STRUCTURE_NV = VK_DESCRIPTOR_TYPE_ACCELERATION_STRUCTURE_KHR,
	VK_DESCRIPTOR_TYPE_MAX_ENUM = 0x7FFFFFFF,
}
enum VkPipelineExecutableStatisticFormatKHR {
	VK_PIPELINE_EXECUTABLE_STATISTIC_FORMAT_BOOL32_KHR = 0,
	VK_PIPELINE_EXECUTABLE_STATISTIC_FORMAT_INT64_KHR = 1,
	VK_PIPELINE_EXECUTABLE_STATISTIC_FORMAT_UINT64_KHR = 2,
	VK_PIPELINE_EXECUTABLE_STATISTIC_FORMAT_FLOAT64_KHR = 3,
	VK_PIPELINE_EXECUTABLE_STATISTIC_FORMAT_MAX_ENUM_KHR = 0x7FFFFFFF,
}
enum VkBorderColor {
	VK_BORDER_COLOR_FLOAT_TRANSPARENT_BLACK = 0,
	VK_BORDER_COLOR_INT_TRANSPARENT_BLACK = 1,
	VK_BORDER_COLOR_FLOAT_OPAQUE_BLACK = 2,
	VK_BORDER_COLOR_INT_OPAQUE_BLACK = 3,
	VK_BORDER_COLOR_FLOAT_OPAQUE_WHITE = 4,
	VK_BORDER_COLOR_INT_OPAQUE_WHITE = 5,
	VK_BORDER_COLOR_FLOAT_CUSTOM_EXT = 1000287003,
	VK_BORDER_COLOR_INT_CUSTOM_EXT = 1000287004,
	VK_BORDER_COLOR_MAX_ENUM = 0x7FFFFFFF,
}
enum VkCopyAccelerationStructureModeKHR {
	VK_COPY_ACCELERATION_STRUCTURE_MODE_CLONE_KHR = 0,
	VK_COPY_ACCELERATION_STRUCTURE_MODE_COMPACT_KHR = 1,
	VK_COPY_ACCELERATION_STRUCTURE_MODE_SERIALIZE_KHR = 2,
	VK_COPY_ACCELERATION_STRUCTURE_MODE_DESERIALIZE_KHR = 3,
	VK_COPY_ACCELERATION_STRUCTURE_MODE_CLONE_NV = VK_COPY_ACCELERATION_STRUCTURE_MODE_CLONE_KHR,
	VK_COPY_ACCELERATION_STRUCTURE_MODE_COMPACT_NV = VK_COPY_ACCELERATION_STRUCTURE_MODE_COMPACT_KHR,
	VK_COPY_ACCELERATION_STRUCTURE_MODE_MAX_ENUM_KHR = 0x7FFFFFFF,
}
enum VkPipelineStageFlagBits {
	VK_PIPELINE_STAGE_TOP_OF_PIPE_BIT = 0x00000001,
	VK_PIPELINE_STAGE_DRAW_INDIRECT_BIT = 0x00000002,
	VK_PIPELINE_STAGE_VERTEX_INPUT_BIT = 0x00000004,
	VK_PIPELINE_STAGE_VERTEX_SHADER_BIT = 0x00000008,
	VK_PIPELINE_STAGE_TESSELLATION_CONTROL_SHADER_BIT = 0x00000010,
	VK_PIPELINE_STAGE_TESSELLATION_EVALUATION_SHADER_BIT = 0x00000020,
	VK_PIPELINE_STAGE_GEOMETRY_SHADER_BIT = 0x00000040,
	VK_PIPELINE_STAGE_FRAGMENT_SHADER_BIT = 0x00000080,
	VK_PIPELINE_STAGE_EARLY_FRAGMENT_TESTS_BIT = 0x00000100,
	VK_PIPELINE_STAGE_LATE_FRAGMENT_TESTS_BIT = 0x00000200,
	VK_PIPELINE_STAGE_COLOR_ATTACHMENT_OUTPUT_BIT = 0x00000400,
	VK_PIPELINE_STAGE_COMPUTE_SHADER_BIT = 0x00000800,
	VK_PIPELINE_STAGE_TRANSFER_BIT = 0x00001000,
	VK_PIPELINE_STAGE_BOTTOM_OF_PIPE_BIT = 0x00002000,
	VK_PIPELINE_STAGE_HOST_BIT = 0x00004000,
	VK_PIPELINE_STAGE_ALL_GRAPHICS_BIT = 0x00008000,
	VK_PIPELINE_STAGE_ALL_COMMANDS_BIT = 0x00010000,
	VK_PIPELINE_STAGE_TRANSFORM_FEEDBACK_BIT_EXT = 0x01000000,
	VK_PIPELINE_STAGE_CONDITIONAL_RENDERING_BIT_EXT = 0x00040000,
	VK_PIPELINE_STAGE_RAY_TRACING_SHADER_BIT_KHR = 0x00200000,
	VK_PIPELINE_STAGE_ACCELERATION_STRUCTURE_BUILD_BIT_KHR = 0x02000000,
	VK_PIPELINE_STAGE_SHADING_RATE_IMAGE_BIT_NV = 0x00400000,
	VK_PIPELINE_STAGE_TASK_SHADER_BIT_NV = 0x00080000,
	VK_PIPELINE_STAGE_MESH_SHADER_BIT_NV = 0x00100000,
	VK_PIPELINE_STAGE_FRAGMENT_DENSITY_PROCESS_BIT_EXT = 0x00800000,
	VK_PIPELINE_STAGE_COMMAND_PREPROCESS_BIT_NV = 0x00020000,
	VK_PIPELINE_STAGE_RAY_TRACING_SHADER_BIT_NV = VK_PIPELINE_STAGE_RAY_TRACING_SHADER_BIT_KHR,
	VK_PIPELINE_STAGE_ACCELERATION_STRUCTURE_BUILD_BIT_NV = VK_PIPELINE_STAGE_ACCELERATION_STRUCTURE_BUILD_BIT_KHR,
	VK_PIPELINE_STAGE_FLAG_BITS_MAX_ENUM = 0x7FFFFFFF,
}
enum VkQueueFlagBits {
	VK_QUEUE_GRAPHICS_BIT = 0x00000001,
	VK_QUEUE_COMPUTE_BIT = 0x00000002,
	VK_QUEUE_TRANSFER_BIT = 0x00000004,
	VK_QUEUE_SPARSE_BINDING_BIT = 0x00000008,
	VK_QUEUE_PROTECTED_BIT = 0x00000010,
	VK_QUEUE_FLAG_BITS_MAX_ENUM = 0x7FFFFFFF,
}
enum VkExternalMemoryHandleTypeFlagBits {
	VK_EXTERNAL_MEMORY_HANDLE_TYPE_OPAQUE_FD_BIT = 0x00000001,
	VK_EXTERNAL_MEMORY_HANDLE_TYPE_OPAQUE_WIN32_BIT = 0x00000002,
	VK_EXTERNAL_MEMORY_HANDLE_TYPE_OPAQUE_WIN32_KMT_BIT = 0x00000004,
	VK_EXTERNAL_MEMORY_HANDLE_TYPE_D3D11_TEXTURE_BIT = 0x00000008,
	VK_EXTERNAL_MEMORY_HANDLE_TYPE_D3D11_TEXTURE_KMT_BIT = 0x00000010,
	VK_EXTERNAL_MEMORY_HANDLE_TYPE_D3D12_HEAP_BIT = 0x00000020,
	VK_EXTERNAL_MEMORY_HANDLE_TYPE_D3D12_RESOURCE_BIT = 0x00000040,
	VK_EXTERNAL_MEMORY_HANDLE_TYPE_DMA_BUF_BIT_EXT = 0x00000200,
	VK_EXTERNAL_MEMORY_HANDLE_TYPE_ANDROID_HARDWARE_BUFFER_BIT_ANDROID = 0x00000400,
	VK_EXTERNAL_MEMORY_HANDLE_TYPE_HOST_ALLOCATION_BIT_EXT = 0x00000080,
	VK_EXTERNAL_MEMORY_HANDLE_TYPE_HOST_MAPPED_FOREIGN_MEMORY_BIT_EXT = 0x00000100,
	VK_EXTERNAL_MEMORY_HANDLE_TYPE_OPAQUE_FD_BIT_KHR = VK_EXTERNAL_MEMORY_HANDLE_TYPE_OPAQUE_FD_BIT,
	VK_EXTERNAL_MEMORY_HANDLE_TYPE_OPAQUE_WIN32_BIT_KHR = VK_EXTERNAL_MEMORY_HANDLE_TYPE_OPAQUE_WIN32_BIT,
	VK_EXTERNAL_MEMORY_HANDLE_TYPE_OPAQUE_WIN32_KMT_BIT_KHR = VK_EXTERNAL_MEMORY_HANDLE_TYPE_OPAQUE_WIN32_KMT_BIT,
	VK_EXTERNAL_MEMORY_HANDLE_TYPE_D3D11_TEXTURE_BIT_KHR = VK_EXTERNAL_MEMORY_HANDLE_TYPE_D3D11_TEXTURE_BIT,
	VK_EXTERNAL_MEMORY_HANDLE_TYPE_D3D11_TEXTURE_KMT_BIT_KHR = VK_EXTERNAL_MEMORY_HANDLE_TYPE_D3D11_TEXTURE_KMT_BIT,
	VK_EXTERNAL_MEMORY_HANDLE_TYPE_D3D12_HEAP_BIT_KHR = VK_EXTERNAL_MEMORY_HANDLE_TYPE_D3D12_HEAP_BIT,
	VK_EXTERNAL_MEMORY_HANDLE_TYPE_D3D12_RESOURCE_BIT_KHR = VK_EXTERNAL_MEMORY_HANDLE_TYPE_D3D12_RESOURCE_BIT,
	VK_EXTERNAL_MEMORY_HANDLE_TYPE_FLAG_BITS_MAX_ENUM = 0x7FFFFFFF,
}
enum VkFilter {
	VK_FILTER_NEAREST = 0,
	VK_FILTER_LINEAR = 1,
	VK_FILTER_CUBIC_IMG = 1000015000,
	VK_FILTER_CUBIC_EXT = VK_FILTER_CUBIC_IMG,
	VK_FILTER_MAX_ENUM = 0x7FFFFFFF,
}
enum VkIndexType {
	VK_INDEX_TYPE_UINT16 = 0,
	VK_INDEX_TYPE_UINT32 = 1,
	VK_INDEX_TYPE_NONE_KHR = 1000165000,
	VK_INDEX_TYPE_UINT8_EXT = 1000265000,
	VK_INDEX_TYPE_NONE_NV = VK_INDEX_TYPE_NONE_KHR,
	VK_INDEX_TYPE_MAX_ENUM = 0x7FFFFFFF,
}
enum VkImageViewType {
	VK_IMAGE_VIEW_TYPE_1D = 0,
	VK_IMAGE_VIEW_TYPE_2D = 1,
	VK_IMAGE_VIEW_TYPE_3D = 2,
	VK_IMAGE_VIEW_TYPE_CUBE = 3,
	VK_IMAGE_VIEW_TYPE_1D_ARRAY = 4,
	VK_IMAGE_VIEW_TYPE_2D_ARRAY = 5,
	VK_IMAGE_VIEW_TYPE_CUBE_ARRAY = 6,
	VK_IMAGE_VIEW_TYPE_MAX_ENUM = 0x7FFFFFFF,
}
enum VkComponentSwizzle {
	VK_COMPONENT_SWIZZLE_IDENTITY = 0,
	VK_COMPONENT_SWIZZLE_ZERO = 1,
	VK_COMPONENT_SWIZZLE_ONE = 2,
	VK_COMPONENT_SWIZZLE_R = 3,
	VK_COMPONENT_SWIZZLE_G = 4,
	VK_COMPONENT_SWIZZLE_B = 5,
	VK_COMPONENT_SWIZZLE_A = 6,
	VK_COMPONENT_SWIZZLE_MAX_ENUM = 0x7FFFFFFF,
}
enum VkDebugUtilsMessageSeverityFlagBitsEXT {
	VK_DEBUG_UTILS_MESSAGE_SEVERITY_VERBOSE_BIT_EXT = 0x00000001,
	VK_DEBUG_UTILS_MESSAGE_SEVERITY_INFO_BIT_EXT = 0x00000010,
	VK_DEBUG_UTILS_MESSAGE_SEVERITY_WARNING_BIT_EXT = 0x00000100,
	VK_DEBUG_UTILS_MESSAGE_SEVERITY_ERROR_BIT_EXT = 0x00001000,
	VK_DEBUG_UTILS_MESSAGE_SEVERITY_FLAG_BITS_MAX_ENUM_EXT = 0x7FFFFFFF,
}
enum VkPerformanceCounterScopeKHR {
	VK_PERFORMANCE_COUNTER_SCOPE_COMMAND_BUFFER_KHR = 0,
	VK_PERFORMANCE_COUNTER_SCOPE_RENDER_PASS_KHR = 1,
	VK_PERFORMANCE_COUNTER_SCOPE_COMMAND_KHR = 2,
	VK_QUERY_SCOPE_COMMAND_BUFFER_KHR = VK_PERFORMANCE_COUNTER_SCOPE_COMMAND_BUFFER_KHR,
	VK_QUERY_SCOPE_RENDER_PASS_KHR = VK_PERFORMANCE_COUNTER_SCOPE_RENDER_PASS_KHR,
	VK_QUERY_SCOPE_COMMAND_KHR = VK_PERFORMANCE_COUNTER_SCOPE_COMMAND_KHR,
	VK_PERFORMANCE_COUNTER_SCOPE_MAX_ENUM_KHR = 0x7FFFFFFF,
}
enum VkAccelerationStructureTypeKHR {
	VK_ACCELERATION_STRUCTURE_TYPE_TOP_LEVEL_KHR = 0,
	VK_ACCELERATION_STRUCTURE_TYPE_BOTTOM_LEVEL_KHR = 1,
	VK_ACCELERATION_STRUCTURE_TYPE_TOP_LEVEL_NV = VK_ACCELERATION_STRUCTURE_TYPE_TOP_LEVEL_KHR,
	VK_ACCELERATION_STRUCTURE_TYPE_BOTTOM_LEVEL_NV = VK_ACCELERATION_STRUCTURE_TYPE_BOTTOM_LEVEL_KHR,
	VK_ACCELERATION_STRUCTURE_TYPE_MAX_ENUM_KHR = 0x7FFFFFFF,
}
enum VkCoarseSampleOrderTypeNV {
	VK_COARSE_SAMPLE_ORDER_TYPE_DEFAULT_NV = 0,
	VK_COARSE_SAMPLE_ORDER_TYPE_CUSTOM_NV = 1,
	VK_COARSE_SAMPLE_ORDER_TYPE_PIXEL_MAJOR_NV = 2,
	VK_COARSE_SAMPLE_ORDER_TYPE_SAMPLE_MAJOR_NV = 3,
	VK_COARSE_SAMPLE_ORDER_TYPE_MAX_ENUM_NV = 0x7FFFFFFF,
}
enum VkQueryType {
	VK_QUERY_TYPE_OCCLUSION = 0,
	VK_QUERY_TYPE_PIPELINE_STATISTICS = 1,
	VK_QUERY_TYPE_TIMESTAMP = 2,
	VK_QUERY_TYPE_TRANSFORM_FEEDBACK_STREAM_EXT = 1000028004,
	VK_QUERY_TYPE_PERFORMANCE_QUERY_KHR = 1000116000,
	VK_QUERY_TYPE_ACCELERATION_STRUCTURE_COMPACTED_SIZE_KHR = 1000165000,
	VK_QUERY_TYPE_ACCELERATION_STRUCTURE_SERIALIZATION_SIZE_KHR = 1000150000,
	VK_QUERY_TYPE_PERFORMANCE_QUERY_INTEL = 1000210000,
	VK_QUERY_TYPE_ACCELERATION_STRUCTURE_COMPACTED_SIZE_NV = VK_QUERY_TYPE_ACCELERATION_STRUCTURE_COMPACTED_SIZE_KHR,
	VK_QUERY_TYPE_MAX_ENUM = 0x7FFFFFFF,
}
enum VkDescriptorUpdateTemplateType {
	VK_DESCRIPTOR_UPDATE_TEMPLATE_TYPE_DESCRIPTOR_SET = 0,
	VK_DESCRIPTOR_UPDATE_TEMPLATE_TYPE_PUSH_DESCRIPTORS_KHR = 1,
	VK_DESCRIPTOR_UPDATE_TEMPLATE_TYPE_DESCRIPTOR_SET_KHR = VK_DESCRIPTOR_UPDATE_TEMPLATE_TYPE_DESCRIPTOR_SET,
	VK_DESCRIPTOR_UPDATE_TEMPLATE_TYPE_MAX_ENUM = 0x7FFFFFFF,
}
enum VkIndirectCommandsTokenTypeNV {
	VK_INDIRECT_COMMANDS_TOKEN_TYPE_SHADER_GROUP_NV = 0,
	VK_INDIRECT_COMMANDS_TOKEN_TYPE_STATE_FLAGS_NV = 1,
	VK_INDIRECT_COMMANDS_TOKEN_TYPE_INDEX_BUFFER_NV = 2,
	VK_INDIRECT_COMMANDS_TOKEN_TYPE_VERTEX_BUFFER_NV = 3,
	VK_INDIRECT_COMMANDS_TOKEN_TYPE_PUSH_CONSTANT_NV = 4,
	VK_INDIRECT_COMMANDS_TOKEN_TYPE_DRAW_INDEXED_NV = 5,
	VK_INDIRECT_COMMANDS_TOKEN_TYPE_DRAW_NV = 6,
	VK_INDIRECT_COMMANDS_TOKEN_TYPE_DRAW_TASKS_NV = 7,
	VK_INDIRECT_COMMANDS_TOKEN_TYPE_MAX_ENUM_NV = 0x7FFFFFFF,
}
enum VkStencilOp {
	VK_STENCIL_OP_KEEP = 0,
	VK_STENCIL_OP_ZERO = 1,
	VK_STENCIL_OP_REPLACE = 2,
	VK_STENCIL_OP_INCREMENT_AND_CLAMP = 3,
	VK_STENCIL_OP_DECREMENT_AND_CLAMP = 4,
	VK_STENCIL_OP_INVERT = 5,
	VK_STENCIL_OP_INCREMENT_AND_WRAP = 6,
	VK_STENCIL_OP_DECREMENT_AND_WRAP = 7,
	VK_STENCIL_OP_MAX_ENUM = 0x7FFFFFFF,
}
enum VkPerformanceCounterStorageKHR {
	VK_PERFORMANCE_COUNTER_STORAGE_INT32_KHR = 0,
	VK_PERFORMANCE_COUNTER_STORAGE_INT64_KHR = 1,
	VK_PERFORMANCE_COUNTER_STORAGE_UINT32_KHR = 2,
	VK_PERFORMANCE_COUNTER_STORAGE_UINT64_KHR = 3,
	VK_PERFORMANCE_COUNTER_STORAGE_FLOAT32_KHR = 4,
	VK_PERFORMANCE_COUNTER_STORAGE_FLOAT64_KHR = 5,
	VK_PERFORMANCE_COUNTER_STORAGE_MAX_ENUM_KHR = 0x7FFFFFFF,
}
enum VkFormat {
	VK_FORMAT_UNDEFINED = 0,
	VK_FORMAT_R4G4_UNORM_PACK8 = 1,
	VK_FORMAT_R4G4B4A4_UNORM_PACK16 = 2,
	VK_FORMAT_B4G4R4A4_UNORM_PACK16 = 3,
	VK_FORMAT_R5G6B5_UNORM_PACK16 = 4,
	VK_FORMAT_B5G6R5_UNORM_PACK16 = 5,
	VK_FORMAT_R5G5B5A1_UNORM_PACK16 = 6,
	VK_FORMAT_B5G5R5A1_UNORM_PACK16 = 7,
	VK_FORMAT_A1R5G5B5_UNORM_PACK16 = 8,
	VK_FORMAT_R8_UNORM = 9,
	VK_FORMAT_R8_SNORM = 10,
	VK_FORMAT_R8_USCALED = 11,
	VK_FORMAT_R8_SSCALED = 12,
	VK_FORMAT_R8_UINT = 13,
	VK_FORMAT_R8_SINT = 14,
	VK_FORMAT_R8_SRGB = 15,
	VK_FORMAT_R8G8_UNORM = 16,
	VK_FORMAT_R8G8_SNORM = 17,
	VK_FORMAT_R8G8_USCALED = 18,
	VK_FORMAT_R8G8_SSCALED = 19,
	VK_FORMAT_R8G8_UINT = 20,
	VK_FORMAT_R8G8_SINT = 21,
	VK_FORMAT_R8G8_SRGB = 22,
	VK_FORMAT_R8G8B8_UNORM = 23,
	VK_FORMAT_R8G8B8_SNORM = 24,
	VK_FORMAT_R8G8B8_USCALED = 25,
	VK_FORMAT_R8G8B8_SSCALED = 26,
	VK_FORMAT_R8G8B8_UINT = 27,
	VK_FORMAT_R8G8B8_SINT = 28,
	VK_FORMAT_R8G8B8_SRGB = 29,
	VK_FORMAT_B8G8R8_UNORM = 30,
	VK_FORMAT_B8G8R8_SNORM = 31,
	VK_FORMAT_B8G8R8_USCALED = 32,
	VK_FORMAT_B8G8R8_SSCALED = 33,
	VK_FORMAT_B8G8R8_UINT = 34,
	VK_FORMAT_B8G8R8_SINT = 35,
	VK_FORMAT_B8G8R8_SRGB = 36,
	VK_FORMAT_R8G8B8A8_UNORM = 37,
	VK_FORMAT_R8G8B8A8_SNORM = 38,
	VK_FORMAT_R8G8B8A8_USCALED = 39,
	VK_FORMAT_R8G8B8A8_SSCALED = 40,
	VK_FORMAT_R8G8B8A8_UINT = 41,
	VK_FORMAT_R8G8B8A8_SINT = 42,
	VK_FORMAT_R8G8B8A8_SRGB = 43,
	VK_FORMAT_B8G8R8A8_UNORM = 44,
	VK_FORMAT_B8G8R8A8_SNORM = 45,
	VK_FORMAT_B8G8R8A8_USCALED = 46,
	VK_FORMAT_B8G8R8A8_SSCALED = 47,
	VK_FORMAT_B8G8R8A8_UINT = 48,
	VK_FORMAT_B8G8R8A8_SINT = 49,
	VK_FORMAT_B8G8R8A8_SRGB = 50,
	VK_FORMAT_A8B8G8R8_UNORM_PACK32 = 51,
	VK_FORMAT_A8B8G8R8_SNORM_PACK32 = 52,
	VK_FORMAT_A8B8G8R8_USCALED_PACK32 = 53,
	VK_FORMAT_A8B8G8R8_SSCALED_PACK32 = 54,
	VK_FORMAT_A8B8G8R8_UINT_PACK32 = 55,
	VK_FORMAT_A8B8G8R8_SINT_PACK32 = 56,
	VK_FORMAT_A8B8G8R8_SRGB_PACK32 = 57,
	VK_FORMAT_A2R10G10B10_UNORM_PACK32 = 58,
	VK_FORMAT_A2R10G10B10_SNORM_PACK32 = 59,
	VK_FORMAT_A2R10G10B10_USCALED_PACK32 = 60,
	VK_FORMAT_A2R10G10B10_SSCALED_PACK32 = 61,
	VK_FORMAT_A2R10G10B10_UINT_PACK32 = 62,
	VK_FORMAT_A2R10G10B10_SINT_PACK32 = 63,
	VK_FORMAT_A2B10G10R10_UNORM_PACK32 = 64,
	VK_FORMAT_A2B10G10R10_SNORM_PACK32 = 65,
	VK_FORMAT_A2B10G10R10_USCALED_PACK32 = 66,
	VK_FORMAT_A2B10G10R10_SSCALED_PACK32 = 67,
	VK_FORMAT_A2B10G10R10_UINT_PACK32 = 68,
	VK_FORMAT_A2B10G10R10_SINT_PACK32 = 69,
	VK_FORMAT_R16_UNORM = 70,
	VK_FORMAT_R16_SNORM = 71,
	VK_FORMAT_R16_USCALED = 72,
	VK_FORMAT_R16_SSCALED = 73,
	VK_FORMAT_R16_UINT = 74,
	VK_FORMAT_R16_SINT = 75,
	VK_FORMAT_R16_SFLOAT = 76,
	VK_FORMAT_R16G16_UNORM = 77,
	VK_FORMAT_R16G16_SNORM = 78,
	VK_FORMAT_R16G16_USCALED = 79,
	VK_FORMAT_R16G16_SSCALED = 80,
	VK_FORMAT_R16G16_UINT = 81,
	VK_FORMAT_R16G16_SINT = 82,
	VK_FORMAT_R16G16_SFLOAT = 83,
	VK_FORMAT_R16G16B16_UNORM = 84,
	VK_FORMAT_R16G16B16_SNORM = 85,
	VK_FORMAT_R16G16B16_USCALED = 86,
	VK_FORMAT_R16G16B16_SSCALED = 87,
	VK_FORMAT_R16G16B16_UINT = 88,
	VK_FORMAT_R16G16B16_SINT = 89,
	VK_FORMAT_R16G16B16_SFLOAT = 90,
	VK_FORMAT_R16G16B16A16_UNORM = 91,
	VK_FORMAT_R16G16B16A16_SNORM = 92,
	VK_FORMAT_R16G16B16A16_USCALED = 93,
	VK_FORMAT_R16G16B16A16_SSCALED = 94,
	VK_FORMAT_R16G16B16A16_UINT = 95,
	VK_FORMAT_R16G16B16A16_SINT = 96,
	VK_FORMAT_R16G16B16A16_SFLOAT = 97,
	VK_FORMAT_R32_UINT = 98,
	VK_FORMAT_R32_SINT = 99,
	VK_FORMAT_R32_SFLOAT = 100,
	VK_FORMAT_R32G32_UINT = 101,
	VK_FORMAT_R32G32_SINT = 102,
	VK_FORMAT_R32G32_SFLOAT = 103,
	VK_FORMAT_R32G32B32_UINT = 104,
	VK_FORMAT_R32G32B32_SINT = 105,
	VK_FORMAT_R32G32B32_SFLOAT = 106,
	VK_FORMAT_R32G32B32A32_UINT = 107,
	VK_FORMAT_R32G32B32A32_SINT = 108,
	VK_FORMAT_R32G32B32A32_SFLOAT = 109,
	VK_FORMAT_R64_UINT = 110,
	VK_FORMAT_R64_SINT = 111,
	VK_FORMAT_R64_SFLOAT = 112,
	VK_FORMAT_R64G64_UINT = 113,
	VK_FORMAT_R64G64_SINT = 114,
	VK_FORMAT_R64G64_SFLOAT = 115,
	VK_FORMAT_R64G64B64_UINT = 116,
	VK_FORMAT_R64G64B64_SINT = 117,
	VK_FORMAT_R64G64B64_SFLOAT = 118,
	VK_FORMAT_R64G64B64A64_UINT = 119,
	VK_FORMAT_R64G64B64A64_SINT = 120,
	VK_FORMAT_R64G64B64A64_SFLOAT = 121,
	VK_FORMAT_B10G11R11_UFLOAT_PACK32 = 122,
	VK_FORMAT_E5B9G9R9_UFLOAT_PACK32 = 123,
	VK_FORMAT_D16_UNORM = 124,
	VK_FORMAT_X8_D24_UNORM_PACK32 = 125,
	VK_FORMAT_D32_SFLOAT = 126,
	VK_FORMAT_S8_UINT = 127,
	VK_FORMAT_D16_UNORM_S8_UINT = 128,
	VK_FORMAT_D24_UNORM_S8_UINT = 129,
	VK_FORMAT_D32_SFLOAT_S8_UINT = 130,
	VK_FORMAT_BC1_RGB_UNORM_BLOCK = 131,
	VK_FORMAT_BC1_RGB_SRGB_BLOCK = 132,
	VK_FORMAT_BC1_RGBA_UNORM_BLOCK = 133,
	VK_FORMAT_BC1_RGBA_SRGB_BLOCK = 134,
	VK_FORMAT_BC2_UNORM_BLOCK = 135,
	VK_FORMAT_BC2_SRGB_BLOCK = 136,
	VK_FORMAT_BC3_UNORM_BLOCK = 137,
	VK_FORMAT_BC3_SRGB_BLOCK = 138,
	VK_FORMAT_BC4_UNORM_BLOCK = 139,
	VK_FORMAT_BC4_SNORM_BLOCK = 140,
	VK_FORMAT_BC5_UNORM_BLOCK = 141,
	VK_FORMAT_BC5_SNORM_BLOCK = 142,
	VK_FORMAT_BC6H_UFLOAT_BLOCK = 143,
	VK_FORMAT_BC6H_SFLOAT_BLOCK = 144,
	VK_FORMAT_BC7_UNORM_BLOCK = 145,
	VK_FORMAT_BC7_SRGB_BLOCK = 146,
	VK_FORMAT_ETC2_R8G8B8_UNORM_BLOCK = 147,
	VK_FORMAT_ETC2_R8G8B8_SRGB_BLOCK = 148,
	VK_FORMAT_ETC2_R8G8B8A1_UNORM_BLOCK = 149,
	VK_FORMAT_ETC2_R8G8B8A1_SRGB_BLOCK = 150,
	VK_FORMAT_ETC2_R8G8B8A8_UNORM_BLOCK = 151,
	VK_FORMAT_ETC2_R8G8B8A8_SRGB_BLOCK = 152,
	VK_FORMAT_EAC_R11_UNORM_BLOCK = 153,
	VK_FORMAT_EAC_R11_SNORM_BLOCK = 154,
	VK_FORMAT_EAC_R11G11_UNORM_BLOCK = 155,
	VK_FORMAT_EAC_R11G11_SNORM_BLOCK = 156,
	VK_FORMAT_ASTC_4x4_UNORM_BLOCK = 157,
	VK_FORMAT_ASTC_4x4_SRGB_BLOCK = 158,
	VK_FORMAT_ASTC_5x4_UNORM_BLOCK = 159,
	VK_FORMAT_ASTC_5x4_SRGB_BLOCK = 160,
	VK_FORMAT_ASTC_5x5_UNORM_BLOCK = 161,
	VK_FORMAT_ASTC_5x5_SRGB_BLOCK = 162,
	VK_FORMAT_ASTC_6x5_UNORM_BLOCK = 163,
	VK_FORMAT_ASTC_6x5_SRGB_BLOCK = 164,
	VK_FORMAT_ASTC_6x6_UNORM_BLOCK = 165,
	VK_FORMAT_ASTC_6x6_SRGB_BLOCK = 166,
	VK_FORMAT_ASTC_8x5_UNORM_BLOCK = 167,
	VK_FORMAT_ASTC_8x5_SRGB_BLOCK = 168,
	VK_FORMAT_ASTC_8x6_UNORM_BLOCK = 169,
	VK_FORMAT_ASTC_8x6_SRGB_BLOCK = 170,
	VK_FORMAT_ASTC_8x8_UNORM_BLOCK = 171,
	VK_FORMAT_ASTC_8x8_SRGB_BLOCK = 172,
	VK_FORMAT_ASTC_10x5_UNORM_BLOCK = 173,
	VK_FORMAT_ASTC_10x5_SRGB_BLOCK = 174,
	VK_FORMAT_ASTC_10x6_UNORM_BLOCK = 175,
	VK_FORMAT_ASTC_10x6_SRGB_BLOCK = 176,
	VK_FORMAT_ASTC_10x8_UNORM_BLOCK = 177,
	VK_FORMAT_ASTC_10x8_SRGB_BLOCK = 178,
	VK_FORMAT_ASTC_10x10_UNORM_BLOCK = 179,
	VK_FORMAT_ASTC_10x10_SRGB_BLOCK = 180,
	VK_FORMAT_ASTC_12x10_UNORM_BLOCK = 181,
	VK_FORMAT_ASTC_12x10_SRGB_BLOCK = 182,
	VK_FORMAT_ASTC_12x12_UNORM_BLOCK = 183,
	VK_FORMAT_ASTC_12x12_SRGB_BLOCK = 184,
	VK_FORMAT_G8B8G8R8_422_UNORM = 1000156000,
	VK_FORMAT_B8G8R8G8_422_UNORM = 1000156001,
	VK_FORMAT_G8_B8_R8_3PLANE_420_UNORM = 1000156002,
	VK_FORMAT_G8_B8R8_2PLANE_420_UNORM = 1000156003,
	VK_FORMAT_G8_B8_R8_3PLANE_422_UNORM = 1000156004,
	VK_FORMAT_G8_B8R8_2PLANE_422_UNORM = 1000156005,
	VK_FORMAT_G8_B8_R8_3PLANE_444_UNORM = 1000156006,
	VK_FORMAT_R10X6_UNORM_PACK16 = 1000156007,
	VK_FORMAT_R10X6G10X6_UNORM_2PACK16 = 1000156008,
	VK_FORMAT_R10X6G10X6B10X6A10X6_UNORM_4PACK16 = 1000156009,
	VK_FORMAT_G10X6B10X6G10X6R10X6_422_UNORM_4PACK16 = 1000156010,
	VK_FORMAT_B10X6G10X6R10X6G10X6_422_UNORM_4PACK16 = 1000156011,
	VK_FORMAT_G10X6_B10X6_R10X6_3PLANE_420_UNORM_3PACK16 = 1000156012,
	VK_FORMAT_G10X6_B10X6R10X6_2PLANE_420_UNORM_3PACK16 = 1000156013,
	VK_FORMAT_G10X6_B10X6_R10X6_3PLANE_422_UNORM_3PACK16 = 1000156014,
	VK_FORMAT_G10X6_B10X6R10X6_2PLANE_422_UNORM_3PACK16 = 1000156015,
	VK_FORMAT_G10X6_B10X6_R10X6_3PLANE_444_UNORM_3PACK16 = 1000156016,
	VK_FORMAT_R12X4_UNORM_PACK16 = 1000156017,
	VK_FORMAT_R12X4G12X4_UNORM_2PACK16 = 1000156018,
	VK_FORMAT_R12X4G12X4B12X4A12X4_UNORM_4PACK16 = 1000156019,
	VK_FORMAT_G12X4B12X4G12X4R12X4_422_UNORM_4PACK16 = 1000156020,
	VK_FORMAT_B12X4G12X4R12X4G12X4_422_UNORM_4PACK16 = 1000156021,
	VK_FORMAT_G12X4_B12X4_R12X4_3PLANE_420_UNORM_3PACK16 = 1000156022,
	VK_FORMAT_G12X4_B12X4R12X4_2PLANE_420_UNORM_3PACK16 = 1000156023,
	VK_FORMAT_G12X4_B12X4_R12X4_3PLANE_422_UNORM_3PACK16 = 1000156024,
	VK_FORMAT_G12X4_B12X4R12X4_2PLANE_422_UNORM_3PACK16 = 1000156025,
	VK_FORMAT_G12X4_B12X4_R12X4_3PLANE_444_UNORM_3PACK16 = 1000156026,
	VK_FORMAT_G16B16G16R16_422_UNORM = 1000156027,
	VK_FORMAT_B16G16R16G16_422_UNORM = 1000156028,
	VK_FORMAT_G16_B16_R16_3PLANE_420_UNORM = 1000156029,
	VK_FORMAT_G16_B16R16_2PLANE_420_UNORM = 1000156030,
	VK_FORMAT_G16_B16_R16_3PLANE_422_UNORM = 1000156031,
	VK_FORMAT_G16_B16R16_2PLANE_422_UNORM = 1000156032,
	VK_FORMAT_G16_B16_R16_3PLANE_444_UNORM = 1000156033,
	VK_FORMAT_PVRTC1_2BPP_UNORM_BLOCK_IMG = 1000054000,
	VK_FORMAT_PVRTC1_4BPP_UNORM_BLOCK_IMG = 1000054001,
	VK_FORMAT_PVRTC2_2BPP_UNORM_BLOCK_IMG = 1000054002,
	VK_FORMAT_PVRTC2_4BPP_UNORM_BLOCK_IMG = 1000054003,
	VK_FORMAT_PVRTC1_2BPP_SRGB_BLOCK_IMG = 1000054004,
	VK_FORMAT_PVRTC1_4BPP_SRGB_BLOCK_IMG = 1000054005,
	VK_FORMAT_PVRTC2_2BPP_SRGB_BLOCK_IMG = 1000054006,
	VK_FORMAT_PVRTC2_4BPP_SRGB_BLOCK_IMG = 1000054007,
	VK_FORMAT_ASTC_4x4_SFLOAT_BLOCK_EXT = 1000066000,
	VK_FORMAT_ASTC_5x4_SFLOAT_BLOCK_EXT = 1000066001,
	VK_FORMAT_ASTC_5x5_SFLOAT_BLOCK_EXT = 1000066002,
	VK_FORMAT_ASTC_6x5_SFLOAT_BLOCK_EXT = 1000066003,
	VK_FORMAT_ASTC_6x6_SFLOAT_BLOCK_EXT = 1000066004,
	VK_FORMAT_ASTC_8x5_SFLOAT_BLOCK_EXT = 1000066005,
	VK_FORMAT_ASTC_8x6_SFLOAT_BLOCK_EXT = 1000066006,
	VK_FORMAT_ASTC_8x8_SFLOAT_BLOCK_EXT = 1000066007,
	VK_FORMAT_ASTC_10x5_SFLOAT_BLOCK_EXT = 1000066008,
	VK_FORMAT_ASTC_10x6_SFLOAT_BLOCK_EXT = 1000066009,
	VK_FORMAT_ASTC_10x8_SFLOAT_BLOCK_EXT = 1000066010,
	VK_FORMAT_ASTC_10x10_SFLOAT_BLOCK_EXT = 1000066011,
	VK_FORMAT_ASTC_12x10_SFLOAT_BLOCK_EXT = 1000066012,
	VK_FORMAT_ASTC_12x12_SFLOAT_BLOCK_EXT = 1000066013,
	VK_FORMAT_G8B8G8R8_422_UNORM_KHR = VK_FORMAT_G8B8G8R8_422_UNORM,
	VK_FORMAT_B8G8R8G8_422_UNORM_KHR = VK_FORMAT_B8G8R8G8_422_UNORM,
	VK_FORMAT_G8_B8_R8_3PLANE_420_UNORM_KHR = VK_FORMAT_G8_B8_R8_3PLANE_420_UNORM,
	VK_FORMAT_G8_B8R8_2PLANE_420_UNORM_KHR = VK_FORMAT_G8_B8R8_2PLANE_420_UNORM,
	VK_FORMAT_G8_B8_R8_3PLANE_422_UNORM_KHR = VK_FORMAT_G8_B8_R8_3PLANE_422_UNORM,
	VK_FORMAT_G8_B8R8_2PLANE_422_UNORM_KHR = VK_FORMAT_G8_B8R8_2PLANE_422_UNORM,
	VK_FORMAT_G8_B8_R8_3PLANE_444_UNORM_KHR = VK_FORMAT_G8_B8_R8_3PLANE_444_UNORM,
	VK_FORMAT_R10X6_UNORM_PACK16_KHR = VK_FORMAT_R10X6_UNORM_PACK16,
	VK_FORMAT_R10X6G10X6_UNORM_2PACK16_KHR = VK_FORMAT_R10X6G10X6_UNORM_2PACK16,
	VK_FORMAT_R10X6G10X6B10X6A10X6_UNORM_4PACK16_KHR = VK_FORMAT_R10X6G10X6B10X6A10X6_UNORM_4PACK16,
	VK_FORMAT_G10X6B10X6G10X6R10X6_422_UNORM_4PACK16_KHR = VK_FORMAT_G10X6B10X6G10X6R10X6_422_UNORM_4PACK16,
	VK_FORMAT_B10X6G10X6R10X6G10X6_422_UNORM_4PACK16_KHR = VK_FORMAT_B10X6G10X6R10X6G10X6_422_UNORM_4PACK16,
	VK_FORMAT_G10X6_B10X6_R10X6_3PLANE_420_UNORM_3PACK16_KHR = VK_FORMAT_G10X6_B10X6_R10X6_3PLANE_420_UNORM_3PACK16,
	VK_FORMAT_G10X6_B10X6R10X6_2PLANE_420_UNORM_3PACK16_KHR = VK_FORMAT_G10X6_B10X6R10X6_2PLANE_420_UNORM_3PACK16,
	VK_FORMAT_G10X6_B10X6_R10X6_3PLANE_422_UNORM_3PACK16_KHR = VK_FORMAT_G10X6_B10X6_R10X6_3PLANE_422_UNORM_3PACK16,
	VK_FORMAT_G10X6_B10X6R10X6_2PLANE_422_UNORM_3PACK16_KHR = VK_FORMAT_G10X6_B10X6R10X6_2PLANE_422_UNORM_3PACK16,
	VK_FORMAT_G10X6_B10X6_R10X6_3PLANE_444_UNORM_3PACK16_KHR = VK_FORMAT_G10X6_B10X6_R10X6_3PLANE_444_UNORM_3PACK16,
	VK_FORMAT_R12X4_UNORM_PACK16_KHR = VK_FORMAT_R12X4_UNORM_PACK16,
	VK_FORMAT_R12X4G12X4_UNORM_2PACK16_KHR = VK_FORMAT_R12X4G12X4_UNORM_2PACK16,
	VK_FORMAT_R12X4G12X4B12X4A12X4_UNORM_4PACK16_KHR = VK_FORMAT_R12X4G12X4B12X4A12X4_UNORM_4PACK16,
	VK_FORMAT_G12X4B12X4G12X4R12X4_422_UNORM_4PACK16_KHR = VK_FORMAT_G12X4B12X4G12X4R12X4_422_UNORM_4PACK16,
	VK_FORMAT_B12X4G12X4R12X4G12X4_422_UNORM_4PACK16_KHR = VK_FORMAT_B12X4G12X4R12X4G12X4_422_UNORM_4PACK16,
	VK_FORMAT_G12X4_B12X4_R12X4_3PLANE_420_UNORM_3PACK16_KHR = VK_FORMAT_G12X4_B12X4_R12X4_3PLANE_420_UNORM_3PACK16,
	VK_FORMAT_G12X4_B12X4R12X4_2PLANE_420_UNORM_3PACK16_KHR = VK_FORMAT_G12X4_B12X4R12X4_2PLANE_420_UNORM_3PACK16,
	VK_FORMAT_G12X4_B12X4_R12X4_3PLANE_422_UNORM_3PACK16_KHR = VK_FORMAT_G12X4_B12X4_R12X4_3PLANE_422_UNORM_3PACK16,
	VK_FORMAT_G12X4_B12X4R12X4_2PLANE_422_UNORM_3PACK16_KHR = VK_FORMAT_G12X4_B12X4R12X4_2PLANE_422_UNORM_3PACK16,
	VK_FORMAT_G12X4_B12X4_R12X4_3PLANE_444_UNORM_3PACK16_KHR = VK_FORMAT_G12X4_B12X4_R12X4_3PLANE_444_UNORM_3PACK16,
	VK_FORMAT_G16B16G16R16_422_UNORM_KHR = VK_FORMAT_G16B16G16R16_422_UNORM,
	VK_FORMAT_B16G16R16G16_422_UNORM_KHR = VK_FORMAT_B16G16R16G16_422_UNORM,
	VK_FORMAT_G16_B16_R16_3PLANE_420_UNORM_KHR = VK_FORMAT_G16_B16_R16_3PLANE_420_UNORM,
	VK_FORMAT_G16_B16R16_2PLANE_420_UNORM_KHR = VK_FORMAT_G16_B16R16_2PLANE_420_UNORM,
	VK_FORMAT_G16_B16_R16_3PLANE_422_UNORM_KHR = VK_FORMAT_G16_B16_R16_3PLANE_422_UNORM,
	VK_FORMAT_G16_B16R16_2PLANE_422_UNORM_KHR = VK_FORMAT_G16_B16R16_2PLANE_422_UNORM,
	VK_FORMAT_G16_B16_R16_3PLANE_444_UNORM_KHR = VK_FORMAT_G16_B16_R16_3PLANE_444_UNORM,
	VK_FORMAT_MAX_ENUM = 0x7FFFFFFF,
}
enum VkResult {
	VK_SUCCESS = 0,
	VK_NOT_READY = 1,
	VK_TIMEOUT = 2,
	VK_EVENT_SET = 3,
	VK_EVENT_RESET = 4,
	VK_INCOMPLETE = 5,
	VK_ERROR_OUT_OF_HOST_MEMORY = -1,
	VK_ERROR_OUT_OF_DEVICE_MEMORY = -2,
	VK_ERROR_INITIALIZATION_FAILED = -3,
	VK_ERROR_DEVICE_LOST = -4,
	VK_ERROR_MEMORY_MAP_FAILED = -5,
	VK_ERROR_LAYER_NOT_PRESENT = -6,
	VK_ERROR_EXTENSION_NOT_PRESENT = -7,
	VK_ERROR_FEATURE_NOT_PRESENT = -8,
	VK_ERROR_INCOMPATIBLE_DRIVER = -9,
	VK_ERROR_TOO_MANY_OBJECTS = -10,
	VK_ERROR_FORMAT_NOT_SUPPORTED = -11,
	VK_ERROR_FRAGMENTED_POOL = -12,
	VK_ERROR_UNKNOWN = -13,
	VK_ERROR_OUT_OF_POOL_MEMORY = -1000069000,
	VK_ERROR_INVALID_EXTERNAL_HANDLE = -1000072003,
	VK_ERROR_FRAGMENTATION = -1000161000,
	VK_ERROR_INVALID_OPAQUE_CAPTURE_ADDRESS = -1000257000,
	VK_ERROR_SURFACE_LOST_KHR = -1000000000,
	VK_ERROR_NATIVE_WINDOW_IN_USE_KHR = -1000000001,
	VK_SUBOPTIMAL_KHR = 1000001003,
	VK_ERROR_OUT_OF_DATE_KHR = -1000001004,
	VK_ERROR_INCOMPATIBLE_DISPLAY_KHR = -1000003001,
	VK_ERROR_VALIDATION_FAILED_EXT = -1000011001,
	VK_ERROR_INVALID_SHADER_NV = -1000012000,
	VK_ERROR_INCOMPATIBLE_VERSION_KHR = -1000150000,
	VK_ERROR_INVALID_DRM_FORMAT_MODIFIER_PLANE_LAYOUT_EXT = -1000158000,
	VK_ERROR_NOT_PERMITTED_EXT = -1000174001,
	VK_ERROR_FULL_SCREEN_EXCLUSIVE_MODE_LOST_EXT = -1000255000,
	VK_THREAD_IDLE_KHR = 1000268000,
	VK_THREAD_DONE_KHR = 1000268001,
	VK_OPERATION_DEFERRED_KHR = 1000268002,
	VK_OPERATION_NOT_DEFERRED_KHR = 1000268003,
	VK_PIPELINE_COMPILE_REQUIRED_EXT = 1000297000,
	VK_ERROR_OUT_OF_POOL_MEMORY_KHR = VK_ERROR_OUT_OF_POOL_MEMORY,
	VK_ERROR_INVALID_EXTERNAL_HANDLE_KHR = VK_ERROR_INVALID_EXTERNAL_HANDLE,
	VK_ERROR_FRAGMENTATION_EXT = VK_ERROR_FRAGMENTATION,
	VK_ERROR_INVALID_DEVICE_ADDRESS_EXT = VK_ERROR_INVALID_OPAQUE_CAPTURE_ADDRESS,
	VK_ERROR_INVALID_OPAQUE_CAPTURE_ADDRESS_KHR = VK_ERROR_INVALID_OPAQUE_CAPTURE_ADDRESS,
	VK_ERROR_PIPELINE_COMPILE_REQUIRED_EXT = VK_PIPELINE_COMPILE_REQUIRED_EXT,
	VK_RESULT_MAX_ENUM = 0x7FFFFFFF,
}
enum VkStructureType {
	VK_STRUCTURE_TYPE_APPLICATION_INFO = 0,
	VK_STRUCTURE_TYPE_INSTANCE_CREATE_INFO = 1,
	VK_STRUCTURE_TYPE_DEVICE_QUEUE_CREATE_INFO = 2,
	VK_STRUCTURE_TYPE_DEVICE_CREATE_INFO = 3,
	VK_STRUCTURE_TYPE_SUBMIT_INFO = 4,
	VK_STRUCTURE_TYPE_MEMORY_ALLOCATE_INFO = 5,
	VK_STRUCTURE_TYPE_MAPPED_MEMORY_RANGE = 6,
	VK_STRUCTURE_TYPE_BIND_SPARSE_INFO = 7,
	VK_STRUCTURE_TYPE_FENCE_CREATE_INFO = 8,
	VK_STRUCTURE_TYPE_SEMAPHORE_CREATE_INFO = 9,
	VK_STRUCTURE_TYPE_EVENT_CREATE_INFO = 10,
	VK_STRUCTURE_TYPE_QUERY_POOL_CREATE_INFO = 11,
	VK_STRUCTURE_TYPE_BUFFER_CREATE_INFO = 12,
	VK_STRUCTURE_TYPE_BUFFER_VIEW_CREATE_INFO = 13,
	VK_STRUCTURE_TYPE_IMAGE_CREATE_INFO = 14,
	VK_STRUCTURE_TYPE_IMAGE_VIEW_CREATE_INFO = 15,
	VK_STRUCTURE_TYPE_SHADER_MODULE_CREATE_INFO = 16,
	VK_STRUCTURE_TYPE_PIPELINE_CACHE_CREATE_INFO = 17,
	VK_STRUCTURE_TYPE_PIPELINE_SHADER_STAGE_CREATE_INFO = 18,
	VK_STRUCTURE_TYPE_PIPELINE_VERTEX_INPUT_STATE_CREATE_INFO = 19,
	VK_STRUCTURE_TYPE_PIPELINE_INPUT_ASSEMBLY_STATE_CREATE_INFO = 20,
	VK_STRUCTURE_TYPE_PIPELINE_TESSELLATION_STATE_CREATE_INFO = 21,
	VK_STRUCTURE_TYPE_PIPELINE_VIEWPORT_STATE_CREATE_INFO = 22,
	VK_STRUCTURE_TYPE_PIPELINE_RASTERIZATION_STATE_CREATE_INFO = 23,
	VK_STRUCTURE_TYPE_PIPELINE_MULTISAMPLE_STATE_CREATE_INFO = 24,
	VK_STRUCTURE_TYPE_PIPELINE_DEPTH_STENCIL_STATE_CREATE_INFO = 25,
	VK_STRUCTURE_TYPE_PIPELINE_COLOR_BLEND_STATE_CREATE_INFO = 26,
	VK_STRUCTURE_TYPE_PIPELINE_DYNAMIC_STATE_CREATE_INFO = 27,
	VK_STRUCTURE_TYPE_GRAPHICS_PIPELINE_CREATE_INFO = 28,
	VK_STRUCTURE_TYPE_COMPUTE_PIPELINE_CREATE_INFO = 29,
	VK_STRUCTURE_TYPE_PIPELINE_LAYOUT_CREATE_INFO = 30,
	VK_STRUCTURE_TYPE_SAMPLER_CREATE_INFO = 31,
	VK_STRUCTURE_TYPE_DESCRIPTOR_SET_LAYOUT_CREATE_INFO = 32,
	VK_STRUCTURE_TYPE_DESCRIPTOR_POOL_CREATE_INFO = 33,
	VK_STRUCTURE_TYPE_DESCRIPTOR_SET_ALLOCATE_INFO = 34,
	VK_STRUCTURE_TYPE_WRITE_DESCRIPTOR_SET = 35,
	VK_STRUCTURE_TYPE_COPY_DESCRIPTOR_SET = 36,
	VK_STRUCTURE_TYPE_FRAMEBUFFER_CREATE_INFO = 37,
	VK_STRUCTURE_TYPE_RENDER_PASS_CREATE_INFO = 38,
	VK_STRUCTURE_TYPE_COMMAND_POOL_CREATE_INFO = 39,
	VK_STRUCTURE_TYPE_COMMAND_BUFFER_ALLOCATE_INFO = 40,
	VK_STRUCTURE_TYPE_COMMAND_BUFFER_INHERITANCE_INFO = 41,
	VK_STRUCTURE_TYPE_COMMAND_BUFFER_BEGIN_INFO = 42,
	VK_STRUCTURE_TYPE_RENDER_PASS_BEGIN_INFO = 43,
	VK_STRUCTURE_TYPE_BUFFER_MEMORY_BARRIER = 44,
	VK_STRUCTURE_TYPE_IMAGE_MEMORY_BARRIER = 45,
	VK_STRUCTURE_TYPE_MEMORY_BARRIER = 46,
	VK_STRUCTURE_TYPE_LOADER_INSTANCE_CREATE_INFO = 47,
	VK_STRUCTURE_TYPE_LOADER_DEVICE_CREATE_INFO = 48,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SUBGROUP_PROPERTIES = 1000094000,
	VK_STRUCTURE_TYPE_BIND_BUFFER_MEMORY_INFO = 1000157000,
	VK_STRUCTURE_TYPE_BIND_IMAGE_MEMORY_INFO = 1000157001,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_16BIT_STORAGE_FEATURES = 1000083000,
	VK_STRUCTURE_TYPE_MEMORY_DEDICATED_REQUIREMENTS = 1000127000,
	VK_STRUCTURE_TYPE_MEMORY_DEDICATED_ALLOCATE_INFO = 1000127001,
	VK_STRUCTURE_TYPE_MEMORY_ALLOCATE_FLAGS_INFO = 1000060000,
	VK_STRUCTURE_TYPE_DEVICE_GROUP_RENDER_PASS_BEGIN_INFO = 1000060003,
	VK_STRUCTURE_TYPE_DEVICE_GROUP_COMMAND_BUFFER_BEGIN_INFO = 1000060004,
	VK_STRUCTURE_TYPE_DEVICE_GROUP_SUBMIT_INFO = 1000060005,
	VK_STRUCTURE_TYPE_DEVICE_GROUP_BIND_SPARSE_INFO = 1000060006,
	VK_STRUCTURE_TYPE_BIND_BUFFER_MEMORY_DEVICE_GROUP_INFO = 1000060013,
	VK_STRUCTURE_TYPE_BIND_IMAGE_MEMORY_DEVICE_GROUP_INFO = 1000060014,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_GROUP_PROPERTIES = 1000070000,
	VK_STRUCTURE_TYPE_DEVICE_GROUP_DEVICE_CREATE_INFO = 1000070001,
	VK_STRUCTURE_TYPE_BUFFER_MEMORY_REQUIREMENTS_INFO_2 = 1000146000,
	VK_STRUCTURE_TYPE_IMAGE_MEMORY_REQUIREMENTS_INFO_2 = 1000146001,
	VK_STRUCTURE_TYPE_IMAGE_SPARSE_MEMORY_REQUIREMENTS_INFO_2 = 1000146002,
	VK_STRUCTURE_TYPE_MEMORY_REQUIREMENTS_2 = 1000146003,
	VK_STRUCTURE_TYPE_SPARSE_IMAGE_MEMORY_REQUIREMENTS_2 = 1000146004,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FEATURES_2 = 1000059000,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PROPERTIES_2 = 1000059001,
	VK_STRUCTURE_TYPE_FORMAT_PROPERTIES_2 = 1000059002,
	VK_STRUCTURE_TYPE_IMAGE_FORMAT_PROPERTIES_2 = 1000059003,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_FORMAT_INFO_2 = 1000059004,
	VK_STRUCTURE_TYPE_QUEUE_FAMILY_PROPERTIES_2 = 1000059005,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MEMORY_PROPERTIES_2 = 1000059006,
	VK_STRUCTURE_TYPE_SPARSE_IMAGE_FORMAT_PROPERTIES_2 = 1000059007,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SPARSE_IMAGE_FORMAT_INFO_2 = 1000059008,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_POINT_CLIPPING_PROPERTIES = 1000117000,
	VK_STRUCTURE_TYPE_RENDER_PASS_INPUT_ATTACHMENT_ASPECT_CREATE_INFO = 1000117001,
	VK_STRUCTURE_TYPE_IMAGE_VIEW_USAGE_CREATE_INFO = 1000117002,
	VK_STRUCTURE_TYPE_PIPELINE_TESSELLATION_DOMAIN_ORIGIN_STATE_CREATE_INFO = 1000117003,
	VK_STRUCTURE_TYPE_RENDER_PASS_MULTIVIEW_CREATE_INFO = 1000053000,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MULTIVIEW_FEATURES = 1000053001,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MULTIVIEW_PROPERTIES = 1000053002,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VARIABLE_POINTERS_FEATURES = 1000120000,
	VK_STRUCTURE_TYPE_PROTECTED_SUBMIT_INFO = 1000145000,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PROTECTED_MEMORY_FEATURES = 1000145001,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PROTECTED_MEMORY_PROPERTIES = 1000145002,
	VK_STRUCTURE_TYPE_DEVICE_QUEUE_INFO_2 = 1000145003,
	VK_STRUCTURE_TYPE_SAMPLER_YCBCR_CONVERSION_CREATE_INFO = 1000156000,
	VK_STRUCTURE_TYPE_SAMPLER_YCBCR_CONVERSION_INFO = 1000156001,
	VK_STRUCTURE_TYPE_BIND_IMAGE_PLANE_MEMORY_INFO = 1000156002,
	VK_STRUCTURE_TYPE_IMAGE_PLANE_MEMORY_REQUIREMENTS_INFO = 1000156003,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SAMPLER_YCBCR_CONVERSION_FEATURES = 1000156004,
	VK_STRUCTURE_TYPE_SAMPLER_YCBCR_CONVERSION_IMAGE_FORMAT_PROPERTIES = 1000156005,
	VK_STRUCTURE_TYPE_DESCRIPTOR_UPDATE_TEMPLATE_CREATE_INFO = 1000085000,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_EXTERNAL_IMAGE_FORMAT_INFO = 1000071000,
	VK_STRUCTURE_TYPE_EXTERNAL_IMAGE_FORMAT_PROPERTIES = 1000071001,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_EXTERNAL_BUFFER_INFO = 1000071002,
	VK_STRUCTURE_TYPE_EXTERNAL_BUFFER_PROPERTIES = 1000071003,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ID_PROPERTIES = 1000071004,
	VK_STRUCTURE_TYPE_EXTERNAL_MEMORY_BUFFER_CREATE_INFO = 1000072000,
	VK_STRUCTURE_TYPE_EXTERNAL_MEMORY_IMAGE_CREATE_INFO = 1000072001,
	VK_STRUCTURE_TYPE_EXPORT_MEMORY_ALLOCATE_INFO = 1000072002,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_EXTERNAL_FENCE_INFO = 1000112000,
	VK_STRUCTURE_TYPE_EXTERNAL_FENCE_PROPERTIES = 1000112001,
	VK_STRUCTURE_TYPE_EXPORT_FENCE_CREATE_INFO = 1000113000,
	VK_STRUCTURE_TYPE_EXPORT_SEMAPHORE_CREATE_INFO = 1000077000,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_EXTERNAL_SEMAPHORE_INFO = 1000076000,
	VK_STRUCTURE_TYPE_EXTERNAL_SEMAPHORE_PROPERTIES = 1000076001,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_3_PROPERTIES = 1000168000,
	VK_STRUCTURE_TYPE_DESCRIPTOR_SET_LAYOUT_SUPPORT = 1000168001,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_DRAW_PARAMETERS_FEATURES = 1000063000,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VULKAN_1_1_FEATURES = 49,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VULKAN_1_1_PROPERTIES = 50,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VULKAN_1_2_FEATURES = 51,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VULKAN_1_2_PROPERTIES = 52,
	VK_STRUCTURE_TYPE_IMAGE_FORMAT_LIST_CREATE_INFO = 1000147000,
	VK_STRUCTURE_TYPE_ATTACHMENT_DESCRIPTION_2 = 1000109000,
	VK_STRUCTURE_TYPE_ATTACHMENT_REFERENCE_2 = 1000109001,
	VK_STRUCTURE_TYPE_SUBPASS_DESCRIPTION_2 = 1000109002,
	VK_STRUCTURE_TYPE_SUBPASS_DEPENDENCY_2 = 1000109003,
	VK_STRUCTURE_TYPE_RENDER_PASS_CREATE_INFO_2 = 1000109004,
	VK_STRUCTURE_TYPE_SUBPASS_BEGIN_INFO = 1000109005,
	VK_STRUCTURE_TYPE_SUBPASS_END_INFO = 1000109006,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_8BIT_STORAGE_FEATURES = 1000177000,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DRIVER_PROPERTIES = 1000196000,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_ATOMIC_INT64_FEATURES = 1000180000,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_FLOAT16_INT8_FEATURES = 1000082000,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FLOAT_CONTROLS_PROPERTIES = 1000197000,
	VK_STRUCTURE_TYPE_DESCRIPTOR_SET_LAYOUT_BINDING_FLAGS_CREATE_INFO = 1000161000,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DESCRIPTOR_INDEXING_FEATURES = 1000161001,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DESCRIPTOR_INDEXING_PROPERTIES = 1000161002,
	VK_STRUCTURE_TYPE_DESCRIPTOR_SET_VARIABLE_DESCRIPTOR_COUNT_ALLOCATE_INFO = 1000161003,
	VK_STRUCTURE_TYPE_DESCRIPTOR_SET_VARIABLE_DESCRIPTOR_COUNT_LAYOUT_SUPPORT = 1000161004,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DEPTH_STENCIL_RESOLVE_PROPERTIES = 1000199000,
	VK_STRUCTURE_TYPE_SUBPASS_DESCRIPTION_DEPTH_STENCIL_RESOLVE = 1000199001,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SCALAR_BLOCK_LAYOUT_FEATURES = 1000221000,
	VK_STRUCTURE_TYPE_IMAGE_STENCIL_USAGE_CREATE_INFO = 1000246000,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SAMPLER_FILTER_MINMAX_PROPERTIES = 1000130000,
	VK_STRUCTURE_TYPE_SAMPLER_REDUCTION_MODE_CREATE_INFO = 1000130001,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VULKAN_MEMORY_MODEL_FEATURES = 1000211000,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGELESS_FRAMEBUFFER_FEATURES = 1000108000,
	VK_STRUCTURE_TYPE_FRAMEBUFFER_ATTACHMENTS_CREATE_INFO = 1000108001,
	VK_STRUCTURE_TYPE_FRAMEBUFFER_ATTACHMENT_IMAGE_INFO = 1000108002,
	VK_STRUCTURE_TYPE_RENDER_PASS_ATTACHMENT_BEGIN_INFO = 1000108003,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_UNIFORM_BUFFER_STANDARD_LAYOUT_FEATURES = 1000253000,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_SUBGROUP_EXTENDED_TYPES_FEATURES = 1000175000,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SEPARATE_DEPTH_STENCIL_LAYOUTS_FEATURES = 1000241000,
	VK_STRUCTURE_TYPE_ATTACHMENT_REFERENCE_STENCIL_LAYOUT = 1000241001,
	VK_STRUCTURE_TYPE_ATTACHMENT_DESCRIPTION_STENCIL_LAYOUT = 1000241002,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_HOST_QUERY_RESET_FEATURES = 1000261000,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TIMELINE_SEMAPHORE_FEATURES = 1000207000,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TIMELINE_SEMAPHORE_PROPERTIES = 1000207001,
	VK_STRUCTURE_TYPE_SEMAPHORE_TYPE_CREATE_INFO = 1000207002,
	VK_STRUCTURE_TYPE_TIMELINE_SEMAPHORE_SUBMIT_INFO = 1000207003,
	VK_STRUCTURE_TYPE_SEMAPHORE_WAIT_INFO = 1000207004,
	VK_STRUCTURE_TYPE_SEMAPHORE_SIGNAL_INFO = 1000207005,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_BUFFER_DEVICE_ADDRESS_FEATURES = 1000257000,
	VK_STRUCTURE_TYPE_BUFFER_DEVICE_ADDRESS_INFO = 1000244001,
	VK_STRUCTURE_TYPE_BUFFER_OPAQUE_CAPTURE_ADDRESS_CREATE_INFO = 1000257002,
	VK_STRUCTURE_TYPE_MEMORY_OPAQUE_CAPTURE_ADDRESS_ALLOCATE_INFO = 1000257003,
	VK_STRUCTURE_TYPE_DEVICE_MEMORY_OPAQUE_CAPTURE_ADDRESS_INFO = 1000257004,
	VK_STRUCTURE_TYPE_SWAPCHAIN_CREATE_INFO_KHR = 1000001000,
	VK_STRUCTURE_TYPE_PRESENT_INFO_KHR = 1000001001,
	VK_STRUCTURE_TYPE_DEVICE_GROUP_PRESENT_CAPABILITIES_KHR = 1000060007,
	VK_STRUCTURE_TYPE_IMAGE_SWAPCHAIN_CREATE_INFO_KHR = 1000060008,
	VK_STRUCTURE_TYPE_BIND_IMAGE_MEMORY_SWAPCHAIN_INFO_KHR = 1000060009,
	VK_STRUCTURE_TYPE_ACQUIRE_NEXT_IMAGE_INFO_KHR = 1000060010,
	VK_STRUCTURE_TYPE_DEVICE_GROUP_PRESENT_INFO_KHR = 1000060011,
	VK_STRUCTURE_TYPE_DEVICE_GROUP_SWAPCHAIN_CREATE_INFO_KHR = 1000060012,
	VK_STRUCTURE_TYPE_DISPLAY_MODE_CREATE_INFO_KHR = 1000002000,
	VK_STRUCTURE_TYPE_DISPLAY_SURFACE_CREATE_INFO_KHR = 1000002001,
	VK_STRUCTURE_TYPE_DISPLAY_PRESENT_INFO_KHR = 1000003000,
	VK_STRUCTURE_TYPE_XLIB_SURFACE_CREATE_INFO_KHR = 1000004000,
	VK_STRUCTURE_TYPE_XCB_SURFACE_CREATE_INFO_KHR = 1000005000,
	VK_STRUCTURE_TYPE_WAYLAND_SURFACE_CREATE_INFO_KHR = 1000006000,
	VK_STRUCTURE_TYPE_ANDROID_SURFACE_CREATE_INFO_KHR = 1000008000,
	VK_STRUCTURE_TYPE_WIN32_SURFACE_CREATE_INFO_KHR = 1000009000,
	VK_STRUCTURE_TYPE_DEBUG_REPORT_CALLBACK_CREATE_INFO_EXT = 1000011000,
	VK_STRUCTURE_TYPE_PIPELINE_RASTERIZATION_STATE_RASTERIZATION_ORDER_AMD = 1000018000,
	VK_STRUCTURE_TYPE_DEBUG_MARKER_OBJECT_NAME_INFO_EXT = 1000022000,
	VK_STRUCTURE_TYPE_DEBUG_MARKER_OBJECT_TAG_INFO_EXT = 1000022001,
	VK_STRUCTURE_TYPE_DEBUG_MARKER_MARKER_INFO_EXT = 1000022002,
	VK_STRUCTURE_TYPE_DEDICATED_ALLOCATION_IMAGE_CREATE_INFO_NV = 1000026000,
	VK_STRUCTURE_TYPE_DEDICATED_ALLOCATION_BUFFER_CREATE_INFO_NV = 1000026001,
	VK_STRUCTURE_TYPE_DEDICATED_ALLOCATION_MEMORY_ALLOCATE_INFO_NV = 1000026002,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TRANSFORM_FEEDBACK_FEATURES_EXT = 1000028000,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TRANSFORM_FEEDBACK_PROPERTIES_EXT = 1000028001,
	VK_STRUCTURE_TYPE_PIPELINE_RASTERIZATION_STATE_STREAM_CREATE_INFO_EXT = 1000028002,
	VK_STRUCTURE_TYPE_IMAGE_VIEW_HANDLE_INFO_NVX = 1000030000,
	VK_STRUCTURE_TYPE_IMAGE_VIEW_ADDRESS_PROPERTIES_NVX = 1000030001,
	VK_STRUCTURE_TYPE_TEXTURE_LOD_GATHER_FORMAT_PROPERTIES_AMD = 1000041000,
	VK_STRUCTURE_TYPE_STREAM_DESCRIPTOR_SURFACE_CREATE_INFO_GGP = 1000049000,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_CORNER_SAMPLED_IMAGE_FEATURES_NV = 1000050000,
	VK_STRUCTURE_TYPE_EXTERNAL_MEMORY_IMAGE_CREATE_INFO_NV = 1000056000,
	VK_STRUCTURE_TYPE_EXPORT_MEMORY_ALLOCATE_INFO_NV = 1000056001,
	VK_STRUCTURE_TYPE_IMPORT_MEMORY_WIN32_HANDLE_INFO_NV = 1000057000,
	VK_STRUCTURE_TYPE_EXPORT_MEMORY_WIN32_HANDLE_INFO_NV = 1000057001,
	VK_STRUCTURE_TYPE_WIN32_KEYED_MUTEX_ACQUIRE_RELEASE_INFO_NV = 1000058000,
	VK_STRUCTURE_TYPE_VALIDATION_FLAGS_EXT = 1000061000,
	VK_STRUCTURE_TYPE_VI_SURFACE_CREATE_INFO_NN = 1000062000,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TEXTURE_COMPRESSION_ASTC_HDR_FEATURES_EXT = 1000066000,
	VK_STRUCTURE_TYPE_IMAGE_VIEW_ASTC_DECODE_MODE_EXT = 1000067000,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ASTC_DECODE_FEATURES_EXT = 1000067001,
	VK_STRUCTURE_TYPE_IMPORT_MEMORY_WIN32_HANDLE_INFO_KHR = 1000073000,
	VK_STRUCTURE_TYPE_EXPORT_MEMORY_WIN32_HANDLE_INFO_KHR = 1000073001,
	VK_STRUCTURE_TYPE_MEMORY_WIN32_HANDLE_PROPERTIES_KHR = 1000073002,
	VK_STRUCTURE_TYPE_MEMORY_GET_WIN32_HANDLE_INFO_KHR = 1000073003,
	VK_STRUCTURE_TYPE_IMPORT_MEMORY_FD_INFO_KHR = 1000074000,
	VK_STRUCTURE_TYPE_MEMORY_FD_PROPERTIES_KHR = 1000074001,
	VK_STRUCTURE_TYPE_MEMORY_GET_FD_INFO_KHR = 1000074002,
	VK_STRUCTURE_TYPE_WIN32_KEYED_MUTEX_ACQUIRE_RELEASE_INFO_KHR = 1000075000,
	VK_STRUCTURE_TYPE_IMPORT_SEMAPHORE_WIN32_HANDLE_INFO_KHR = 1000078000,
	VK_STRUCTURE_TYPE_EXPORT_SEMAPHORE_WIN32_HANDLE_INFO_KHR = 1000078001,
	VK_STRUCTURE_TYPE_D3D12_FENCE_SUBMIT_INFO_KHR = 1000078002,
	VK_STRUCTURE_TYPE_SEMAPHORE_GET_WIN32_HANDLE_INFO_KHR = 1000078003,
	VK_STRUCTURE_TYPE_IMPORT_SEMAPHORE_FD_INFO_KHR = 1000079000,
	VK_STRUCTURE_TYPE_SEMAPHORE_GET_FD_INFO_KHR = 1000079001,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PUSH_DESCRIPTOR_PROPERTIES_KHR = 1000080000,
	VK_STRUCTURE_TYPE_COMMAND_BUFFER_INHERITANCE_CONDITIONAL_RENDERING_INFO_EXT = 1000081000,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_CONDITIONAL_RENDERING_FEATURES_EXT = 1000081001,
	VK_STRUCTURE_TYPE_CONDITIONAL_RENDERING_BEGIN_INFO_EXT = 1000081002,
	VK_STRUCTURE_TYPE_PRESENT_REGIONS_KHR = 1000084000,
	VK_STRUCTURE_TYPE_PIPELINE_VIEWPORT_W_SCALING_STATE_CREATE_INFO_NV = 1000087000,
	VK_STRUCTURE_TYPE_SURFACE_CAPABILITIES_2_EXT = 1000090000,
	VK_STRUCTURE_TYPE_DISPLAY_POWER_INFO_EXT = 1000091000,
	VK_STRUCTURE_TYPE_DEVICE_EVENT_INFO_EXT = 1000091001,
	VK_STRUCTURE_TYPE_DISPLAY_EVENT_INFO_EXT = 1000091002,
	VK_STRUCTURE_TYPE_SWAPCHAIN_COUNTER_CREATE_INFO_EXT = 1000091003,
	VK_STRUCTURE_TYPE_PRESENT_TIMES_INFO_GOOGLE = 1000092000,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MULTIVIEW_PER_VIEW_ATTRIBUTES_PROPERTIES_NVX = 1000097000,
	VK_STRUCTURE_TYPE_PIPELINE_VIEWPORT_SWIZZLE_STATE_CREATE_INFO_NV = 1000098000,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DISCARD_RECTANGLE_PROPERTIES_EXT = 1000099000,
	VK_STRUCTURE_TYPE_PIPELINE_DISCARD_RECTANGLE_STATE_CREATE_INFO_EXT = 1000099001,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_CONSERVATIVE_RASTERIZATION_PROPERTIES_EXT = 1000101000,
	VK_STRUCTURE_TYPE_PIPELINE_RASTERIZATION_CONSERVATIVE_STATE_CREATE_INFO_EXT = 1000101001,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DEPTH_CLIP_ENABLE_FEATURES_EXT = 1000102000,
	VK_STRUCTURE_TYPE_PIPELINE_RASTERIZATION_DEPTH_CLIP_STATE_CREATE_INFO_EXT = 1000102001,
	VK_STRUCTURE_TYPE_HDR_METADATA_EXT = 1000105000,
	VK_STRUCTURE_TYPE_SHARED_PRESENT_SURFACE_CAPABILITIES_KHR = 1000111000,
	VK_STRUCTURE_TYPE_IMPORT_FENCE_WIN32_HANDLE_INFO_KHR = 1000114000,
	VK_STRUCTURE_TYPE_EXPORT_FENCE_WIN32_HANDLE_INFO_KHR = 1000114001,
	VK_STRUCTURE_TYPE_FENCE_GET_WIN32_HANDLE_INFO_KHR = 1000114002,
	VK_STRUCTURE_TYPE_IMPORT_FENCE_FD_INFO_KHR = 1000115000,
	VK_STRUCTURE_TYPE_FENCE_GET_FD_INFO_KHR = 1000115001,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PERFORMANCE_QUERY_FEATURES_KHR = 1000116000,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PERFORMANCE_QUERY_PROPERTIES_KHR = 1000116001,
	VK_STRUCTURE_TYPE_QUERY_POOL_PERFORMANCE_CREATE_INFO_KHR = 1000116002,
	VK_STRUCTURE_TYPE_PERFORMANCE_QUERY_SUBMIT_INFO_KHR = 1000116003,
	VK_STRUCTURE_TYPE_ACQUIRE_PROFILING_LOCK_INFO_KHR = 1000116004,
	VK_STRUCTURE_TYPE_PERFORMANCE_COUNTER_KHR = 1000116005,
	VK_STRUCTURE_TYPE_PERFORMANCE_COUNTER_DESCRIPTION_KHR = 1000116006,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SURFACE_INFO_2_KHR = 1000119000,
	VK_STRUCTURE_TYPE_SURFACE_CAPABILITIES_2_KHR = 1000119001,
	VK_STRUCTURE_TYPE_SURFACE_FORMAT_2_KHR = 1000119002,
	VK_STRUCTURE_TYPE_DISPLAY_PROPERTIES_2_KHR = 1000121000,
	VK_STRUCTURE_TYPE_DISPLAY_PLANE_PROPERTIES_2_KHR = 1000121001,
	VK_STRUCTURE_TYPE_DISPLAY_MODE_PROPERTIES_2_KHR = 1000121002,
	VK_STRUCTURE_TYPE_DISPLAY_PLANE_INFO_2_KHR = 1000121003,
	VK_STRUCTURE_TYPE_DISPLAY_PLANE_CAPABILITIES_2_KHR = 1000121004,
	VK_STRUCTURE_TYPE_IOS_SURFACE_CREATE_INFO_MVK = 1000122000,
	VK_STRUCTURE_TYPE_MACOS_SURFACE_CREATE_INFO_MVK = 1000123000,
	VK_STRUCTURE_TYPE_DEBUG_UTILS_OBJECT_NAME_INFO_EXT = 1000128000,
	VK_STRUCTURE_TYPE_DEBUG_UTILS_OBJECT_TAG_INFO_EXT = 1000128001,
	VK_STRUCTURE_TYPE_DEBUG_UTILS_LABEL_EXT = 1000128002,
	VK_STRUCTURE_TYPE_DEBUG_UTILS_MESSENGER_CALLBACK_DATA_EXT = 1000128003,
	VK_STRUCTURE_TYPE_DEBUG_UTILS_MESSENGER_CREATE_INFO_EXT = 1000128004,
	VK_STRUCTURE_TYPE_ANDROID_HARDWARE_BUFFER_USAGE_ANDROID = 1000129000,
	VK_STRUCTURE_TYPE_ANDROID_HARDWARE_BUFFER_PROPERTIES_ANDROID = 1000129001,
	VK_STRUCTURE_TYPE_ANDROID_HARDWARE_BUFFER_FORMAT_PROPERTIES_ANDROID = 1000129002,
	VK_STRUCTURE_TYPE_IMPORT_ANDROID_HARDWARE_BUFFER_INFO_ANDROID = 1000129003,
	VK_STRUCTURE_TYPE_MEMORY_GET_ANDROID_HARDWARE_BUFFER_INFO_ANDROID = 1000129004,
	VK_STRUCTURE_TYPE_EXTERNAL_FORMAT_ANDROID = 1000129005,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_INLINE_UNIFORM_BLOCK_FEATURES_EXT = 1000138000,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_INLINE_UNIFORM_BLOCK_PROPERTIES_EXT = 1000138001,
	VK_STRUCTURE_TYPE_WRITE_DESCRIPTOR_SET_INLINE_UNIFORM_BLOCK_EXT = 1000138002,
	VK_STRUCTURE_TYPE_DESCRIPTOR_POOL_INLINE_UNIFORM_BLOCK_CREATE_INFO_EXT = 1000138003,
	VK_STRUCTURE_TYPE_SAMPLE_LOCATIONS_INFO_EXT = 1000143000,
	VK_STRUCTURE_TYPE_RENDER_PASS_SAMPLE_LOCATIONS_BEGIN_INFO_EXT = 1000143001,
	VK_STRUCTURE_TYPE_PIPELINE_SAMPLE_LOCATIONS_STATE_CREATE_INFO_EXT = 1000143002,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SAMPLE_LOCATIONS_PROPERTIES_EXT = 1000143003,
	VK_STRUCTURE_TYPE_MULTISAMPLE_PROPERTIES_EXT = 1000143004,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_BLEND_OPERATION_ADVANCED_FEATURES_EXT = 1000148000,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_BLEND_OPERATION_ADVANCED_PROPERTIES_EXT = 1000148001,
	VK_STRUCTURE_TYPE_PIPELINE_COLOR_BLEND_ADVANCED_STATE_CREATE_INFO_EXT = 1000148002,
	VK_STRUCTURE_TYPE_PIPELINE_COVERAGE_TO_COLOR_STATE_CREATE_INFO_NV = 1000149000,
	VK_STRUCTURE_TYPE_BIND_ACCELERATION_STRUCTURE_MEMORY_INFO_KHR = 1000165006,
	VK_STRUCTURE_TYPE_WRITE_DESCRIPTOR_SET_ACCELERATION_STRUCTURE_KHR = 1000165007,
	VK_STRUCTURE_TYPE_ACCELERATION_STRUCTURE_BUILD_GEOMETRY_INFO_KHR = 1000150000,
	VK_STRUCTURE_TYPE_ACCELERATION_STRUCTURE_CREATE_GEOMETRY_TYPE_INFO_KHR = 1000150001,
	VK_STRUCTURE_TYPE_ACCELERATION_STRUCTURE_DEVICE_ADDRESS_INFO_KHR = 1000150002,
	VK_STRUCTURE_TYPE_ACCELERATION_STRUCTURE_GEOMETRY_AABBS_DATA_KHR = 1000150003,
	VK_STRUCTURE_TYPE_ACCELERATION_STRUCTURE_GEOMETRY_INSTANCES_DATA_KHR = 1000150004,
	VK_STRUCTURE_TYPE_ACCELERATION_STRUCTURE_GEOMETRY_TRIANGLES_DATA_KHR = 1000150005,
	VK_STRUCTURE_TYPE_ACCELERATION_STRUCTURE_GEOMETRY_KHR = 1000150006,
	VK_STRUCTURE_TYPE_ACCELERATION_STRUCTURE_MEMORY_REQUIREMENTS_INFO_KHR = 1000150008,
	VK_STRUCTURE_TYPE_ACCELERATION_STRUCTURE_VERSION_KHR = 1000150009,
	VK_STRUCTURE_TYPE_COPY_ACCELERATION_STRUCTURE_INFO_KHR = 1000150010,
	VK_STRUCTURE_TYPE_COPY_ACCELERATION_STRUCTURE_TO_MEMORY_INFO_KHR = 1000150011,
	VK_STRUCTURE_TYPE_COPY_MEMORY_TO_ACCELERATION_STRUCTURE_INFO_KHR = 1000150012,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RAY_TRACING_FEATURES_KHR = 1000150013,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RAY_TRACING_PROPERTIES_KHR = 1000150014,
	VK_STRUCTURE_TYPE_RAY_TRACING_PIPELINE_CREATE_INFO_KHR = 1000150015,
	VK_STRUCTURE_TYPE_RAY_TRACING_SHADER_GROUP_CREATE_INFO_KHR = 1000150016,
	VK_STRUCTURE_TYPE_ACCELERATION_STRUCTURE_CREATE_INFO_KHR = 1000150017,
	VK_STRUCTURE_TYPE_RAY_TRACING_PIPELINE_INTERFACE_CREATE_INFO_KHR = 1000150018,
	VK_STRUCTURE_TYPE_PIPELINE_COVERAGE_MODULATION_STATE_CREATE_INFO_NV = 1000152000,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_SM_BUILTINS_FEATURES_NV = 1000154000,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_SM_BUILTINS_PROPERTIES_NV = 1000154001,
	VK_STRUCTURE_TYPE_DRM_FORMAT_MODIFIER_PROPERTIES_LIST_EXT = 1000158000,
	VK_STRUCTURE_TYPE_DRM_FORMAT_MODIFIER_PROPERTIES_EXT = 1000158001,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_DRM_FORMAT_MODIFIER_INFO_EXT = 1000158002,
	VK_STRUCTURE_TYPE_IMAGE_DRM_FORMAT_MODIFIER_LIST_CREATE_INFO_EXT = 1000158003,
	VK_STRUCTURE_TYPE_IMAGE_DRM_FORMAT_MODIFIER_EXPLICIT_CREATE_INFO_EXT = 1000158004,
	VK_STRUCTURE_TYPE_IMAGE_DRM_FORMAT_MODIFIER_PROPERTIES_EXT = 1000158005,
	VK_STRUCTURE_TYPE_VALIDATION_CACHE_CREATE_INFO_EXT = 1000160000,
	VK_STRUCTURE_TYPE_SHADER_MODULE_VALIDATION_CACHE_CREATE_INFO_EXT = 1000160001,
	VK_STRUCTURE_TYPE_PIPELINE_VIEWPORT_SHADING_RATE_IMAGE_STATE_CREATE_INFO_NV = 1000164000,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADING_RATE_IMAGE_FEATURES_NV = 1000164001,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADING_RATE_IMAGE_PROPERTIES_NV = 1000164002,
	VK_STRUCTURE_TYPE_PIPELINE_VIEWPORT_COARSE_SAMPLE_ORDER_STATE_CREATE_INFO_NV = 1000164005,
	VK_STRUCTURE_TYPE_RAY_TRACING_PIPELINE_CREATE_INFO_NV = 1000165000,
	VK_STRUCTURE_TYPE_ACCELERATION_STRUCTURE_CREATE_INFO_NV = 1000165001,
	VK_STRUCTURE_TYPE_GEOMETRY_NV = 1000165003,
	VK_STRUCTURE_TYPE_GEOMETRY_TRIANGLES_NV = 1000165004,
	VK_STRUCTURE_TYPE_GEOMETRY_AABB_NV = 1000165005,
	VK_STRUCTURE_TYPE_ACCELERATION_STRUCTURE_MEMORY_REQUIREMENTS_INFO_NV = 1000165008,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RAY_TRACING_PROPERTIES_NV = 1000165009,
	VK_STRUCTURE_TYPE_RAY_TRACING_SHADER_GROUP_CREATE_INFO_NV = 1000165011,
	VK_STRUCTURE_TYPE_ACCELERATION_STRUCTURE_INFO_NV = 1000165012,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_REPRESENTATIVE_FRAGMENT_TEST_FEATURES_NV = 1000166000,
	VK_STRUCTURE_TYPE_PIPELINE_REPRESENTATIVE_FRAGMENT_TEST_STATE_CREATE_INFO_NV = 1000166001,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_VIEW_IMAGE_FORMAT_INFO_EXT = 1000170000,
	VK_STRUCTURE_TYPE_FILTER_CUBIC_IMAGE_VIEW_IMAGE_FORMAT_PROPERTIES_EXT = 1000170001,
	VK_STRUCTURE_TYPE_DEVICE_QUEUE_GLOBAL_PRIORITY_CREATE_INFO_EXT = 1000174000,
	VK_STRUCTURE_TYPE_IMPORT_MEMORY_HOST_POINTER_INFO_EXT = 1000178000,
	VK_STRUCTURE_TYPE_MEMORY_HOST_POINTER_PROPERTIES_EXT = 1000178001,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_EXTERNAL_MEMORY_HOST_PROPERTIES_EXT = 1000178002,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_CLOCK_FEATURES_KHR = 1000181000,
	VK_STRUCTURE_TYPE_PIPELINE_COMPILER_CONTROL_CREATE_INFO_AMD = 1000183000,
	VK_STRUCTURE_TYPE_CALIBRATED_TIMESTAMP_INFO_EXT = 1000184000,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_CORE_PROPERTIES_AMD = 1000185000,
	VK_STRUCTURE_TYPE_DEVICE_MEMORY_OVERALLOCATION_CREATE_INFO_AMD = 1000189000,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VERTEX_ATTRIBUTE_DIVISOR_PROPERTIES_EXT = 1000190000,
	VK_STRUCTURE_TYPE_PIPELINE_VERTEX_INPUT_DIVISOR_STATE_CREATE_INFO_EXT = 1000190001,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VERTEX_ATTRIBUTE_DIVISOR_FEATURES_EXT = 1000190002,
	VK_STRUCTURE_TYPE_PRESENT_FRAME_TOKEN_GGP = 1000191000,
	VK_STRUCTURE_TYPE_PIPELINE_CREATION_FEEDBACK_CREATE_INFO_EXT = 1000192000,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_COMPUTE_SHADER_DERIVATIVES_FEATURES_NV = 1000201000,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MESH_SHADER_FEATURES_NV = 1000202000,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MESH_SHADER_PROPERTIES_NV = 1000202001,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_SHADER_BARYCENTRIC_FEATURES_NV = 1000203000,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_IMAGE_FOOTPRINT_FEATURES_NV = 1000204000,
	VK_STRUCTURE_TYPE_PIPELINE_VIEWPORT_EXCLUSIVE_SCISSOR_STATE_CREATE_INFO_NV = 1000205000,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_EXCLUSIVE_SCISSOR_FEATURES_NV = 1000205002,
	VK_STRUCTURE_TYPE_CHECKPOINT_DATA_NV = 1000206000,
	VK_STRUCTURE_TYPE_QUEUE_FAMILY_CHECKPOINT_PROPERTIES_NV = 1000206001,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_INTEGER_FUNCTIONS_2_FEATURES_INTEL = 1000209000,
	VK_STRUCTURE_TYPE_QUERY_POOL_PERFORMANCE_QUERY_CREATE_INFO_INTEL = 1000210000,
	VK_STRUCTURE_TYPE_INITIALIZE_PERFORMANCE_API_INFO_INTEL = 1000210001,
	VK_STRUCTURE_TYPE_PERFORMANCE_MARKER_INFO_INTEL = 1000210002,
	VK_STRUCTURE_TYPE_PERFORMANCE_STREAM_MARKER_INFO_INTEL = 1000210003,
	VK_STRUCTURE_TYPE_PERFORMANCE_OVERRIDE_INFO_INTEL = 1000210004,
	VK_STRUCTURE_TYPE_PERFORMANCE_CONFIGURATION_ACQUIRE_INFO_INTEL = 1000210005,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PCI_BUS_INFO_PROPERTIES_EXT = 1000212000,
	VK_STRUCTURE_TYPE_DISPLAY_NATIVE_HDR_SURFACE_CAPABILITIES_AMD = 1000213000,
	VK_STRUCTURE_TYPE_SWAPCHAIN_DISPLAY_NATIVE_HDR_CREATE_INFO_AMD = 1000213001,
	VK_STRUCTURE_TYPE_IMAGEPIPE_SURFACE_CREATE_INFO_FUCHSIA = 1000214000,
	VK_STRUCTURE_TYPE_METAL_SURFACE_CREATE_INFO_EXT = 1000217000,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_FEATURES_EXT = 1000218000,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_PROPERTIES_EXT = 1000218001,
	VK_STRUCTURE_TYPE_RENDER_PASS_FRAGMENT_DENSITY_MAP_CREATE_INFO_EXT = 1000218002,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SUBGROUP_SIZE_CONTROL_PROPERTIES_EXT = 1000225000,
	VK_STRUCTURE_TYPE_PIPELINE_SHADER_STAGE_REQUIRED_SUBGROUP_SIZE_CREATE_INFO_EXT = 1000225001,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SUBGROUP_SIZE_CONTROL_FEATURES_EXT = 1000225002,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_CORE_PROPERTIES_2_AMD = 1000227000,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_COHERENT_MEMORY_FEATURES_AMD = 1000229000,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MEMORY_BUDGET_PROPERTIES_EXT = 1000237000,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MEMORY_PRIORITY_FEATURES_EXT = 1000238000,
	VK_STRUCTURE_TYPE_MEMORY_PRIORITY_ALLOCATE_INFO_EXT = 1000238001,
	VK_STRUCTURE_TYPE_SURFACE_PROTECTED_CAPABILITIES_KHR = 1000239000,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DEDICATED_ALLOCATION_IMAGE_ALIASING_FEATURES_NV = 1000240000,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_BUFFER_DEVICE_ADDRESS_FEATURES_EXT = 1000244000,
	VK_STRUCTURE_TYPE_BUFFER_DEVICE_ADDRESS_CREATE_INFO_EXT = 1000244002,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TOOL_PROPERTIES_EXT = 1000245000,
	VK_STRUCTURE_TYPE_VALIDATION_FEATURES_EXT = 1000247000,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_COOPERATIVE_MATRIX_FEATURES_NV = 1000249000,
	VK_STRUCTURE_TYPE_COOPERATIVE_MATRIX_PROPERTIES_NV = 1000249001,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_COOPERATIVE_MATRIX_PROPERTIES_NV = 1000249002,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_COVERAGE_REDUCTION_MODE_FEATURES_NV = 1000250000,
	VK_STRUCTURE_TYPE_PIPELINE_COVERAGE_REDUCTION_STATE_CREATE_INFO_NV = 1000250001,
	VK_STRUCTURE_TYPE_FRAMEBUFFER_MIXED_SAMPLES_COMBINATION_NV = 1000250002,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_SHADER_INTERLOCK_FEATURES_EXT = 1000251000,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_YCBCR_IMAGE_ARRAYS_FEATURES_EXT = 1000252000,
	VK_STRUCTURE_TYPE_SURFACE_FULL_SCREEN_EXCLUSIVE_INFO_EXT = 1000255000,
	VK_STRUCTURE_TYPE_SURFACE_CAPABILITIES_FULL_SCREEN_EXCLUSIVE_EXT = 1000255002,
	VK_STRUCTURE_TYPE_SURFACE_FULL_SCREEN_EXCLUSIVE_WIN32_INFO_EXT = 1000255001,
	VK_STRUCTURE_TYPE_HEADLESS_SURFACE_CREATE_INFO_EXT = 1000256000,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LINE_RASTERIZATION_FEATURES_EXT = 1000259000,
	VK_STRUCTURE_TYPE_PIPELINE_RASTERIZATION_LINE_STATE_CREATE_INFO_EXT = 1000259001,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LINE_RASTERIZATION_PROPERTIES_EXT = 1000259002,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_INDEX_TYPE_UINT8_FEATURES_EXT = 1000265000,
	VK_STRUCTURE_TYPE_DEFERRED_OPERATION_INFO_KHR = 1000268000,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PIPELINE_EXECUTABLE_PROPERTIES_FEATURES_KHR = 1000269000,
	VK_STRUCTURE_TYPE_PIPELINE_INFO_KHR = 1000269001,
	VK_STRUCTURE_TYPE_PIPELINE_EXECUTABLE_PROPERTIES_KHR = 1000269002,
	VK_STRUCTURE_TYPE_PIPELINE_EXECUTABLE_INFO_KHR = 1000269003,
	VK_STRUCTURE_TYPE_PIPELINE_EXECUTABLE_STATISTIC_KHR = 1000269004,
	VK_STRUCTURE_TYPE_PIPELINE_EXECUTABLE_INTERNAL_REPRESENTATION_KHR = 1000269005,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_DEMOTE_TO_HELPER_INVOCATION_FEATURES_EXT = 1000276000,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DEVICE_GENERATED_COMMANDS_PROPERTIES_NV = 1000277000,
	VK_STRUCTURE_TYPE_GRAPHICS_SHADER_GROUP_CREATE_INFO_NV = 1000277001,
	VK_STRUCTURE_TYPE_GRAPHICS_PIPELINE_SHADER_GROUPS_CREATE_INFO_NV = 1000277002,
	VK_STRUCTURE_TYPE_INDIRECT_COMMANDS_LAYOUT_TOKEN_NV = 1000277003,
	VK_STRUCTURE_TYPE_INDIRECT_COMMANDS_LAYOUT_CREATE_INFO_NV = 1000277004,
	VK_STRUCTURE_TYPE_GENERATED_COMMANDS_INFO_NV = 1000277005,
	VK_STRUCTURE_TYPE_GENERATED_COMMANDS_MEMORY_REQUIREMENTS_INFO_NV = 1000277006,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DEVICE_GENERATED_COMMANDS_FEATURES_NV = 1000277007,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TEXEL_BUFFER_ALIGNMENT_FEATURES_EXT = 1000281000,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TEXEL_BUFFER_ALIGNMENT_PROPERTIES_EXT = 1000281001,
	VK_STRUCTURE_TYPE_COMMAND_BUFFER_INHERITANCE_RENDER_PASS_TRANSFORM_INFO_QCOM = 1000282000,
	VK_STRUCTURE_TYPE_RENDER_PASS_TRANSFORM_BEGIN_INFO_QCOM = 1000282001,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ROBUSTNESS_2_FEATURES_EXT = 1000286000,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ROBUSTNESS_2_PROPERTIES_EXT = 1000286001,
	VK_STRUCTURE_TYPE_SAMPLER_CUSTOM_BORDER_COLOR_CREATE_INFO_EXT = 1000287000,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_CUSTOM_BORDER_COLOR_PROPERTIES_EXT = 1000287001,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_CUSTOM_BORDER_COLOR_FEATURES_EXT = 1000287002,
	VK_STRUCTURE_TYPE_PIPELINE_LIBRARY_CREATE_INFO_KHR = 1000290000,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PRIVATE_DATA_FEATURES_EXT = 1000295000,
	VK_STRUCTURE_TYPE_DEVICE_PRIVATE_DATA_CREATE_INFO_EXT = 1000295001,
	VK_STRUCTURE_TYPE_PRIVATE_DATA_SLOT_CREATE_INFO_EXT = 1000295002,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PIPELINE_CREATION_CACHE_CONTROL_FEATURES_EXT = 1000297000,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DIAGNOSTICS_CONFIG_FEATURES_NV = 1000300000,
	VK_STRUCTURE_TYPE_DEVICE_DIAGNOSTICS_CONFIG_CREATE_INFO_NV = 1000300001,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VARIABLE_POINTER_FEATURES = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VARIABLE_POINTERS_FEATURES,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_DRAW_PARAMETER_FEATURES = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_DRAW_PARAMETERS_FEATURES,
	VK_STRUCTURE_TYPE_DEBUG_REPORT_CREATE_INFO_EXT = VK_STRUCTURE_TYPE_DEBUG_REPORT_CALLBACK_CREATE_INFO_EXT,
	VK_STRUCTURE_TYPE_RENDER_PASS_MULTIVIEW_CREATE_INFO_KHR = VK_STRUCTURE_TYPE_RENDER_PASS_MULTIVIEW_CREATE_INFO,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MULTIVIEW_FEATURES_KHR = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MULTIVIEW_FEATURES,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MULTIVIEW_PROPERTIES_KHR = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MULTIVIEW_PROPERTIES,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FEATURES_2_KHR = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FEATURES_2,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PROPERTIES_2_KHR = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PROPERTIES_2,
	VK_STRUCTURE_TYPE_FORMAT_PROPERTIES_2_KHR = VK_STRUCTURE_TYPE_FORMAT_PROPERTIES_2,
	VK_STRUCTURE_TYPE_IMAGE_FORMAT_PROPERTIES_2_KHR = VK_STRUCTURE_TYPE_IMAGE_FORMAT_PROPERTIES_2,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_FORMAT_INFO_2_KHR = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_FORMAT_INFO_2,
	VK_STRUCTURE_TYPE_QUEUE_FAMILY_PROPERTIES_2_KHR = VK_STRUCTURE_TYPE_QUEUE_FAMILY_PROPERTIES_2,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MEMORY_PROPERTIES_2_KHR = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MEMORY_PROPERTIES_2,
	VK_STRUCTURE_TYPE_SPARSE_IMAGE_FORMAT_PROPERTIES_2_KHR = VK_STRUCTURE_TYPE_SPARSE_IMAGE_FORMAT_PROPERTIES_2,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SPARSE_IMAGE_FORMAT_INFO_2_KHR = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SPARSE_IMAGE_FORMAT_INFO_2,
	VK_STRUCTURE_TYPE_MEMORY_ALLOCATE_FLAGS_INFO_KHR = VK_STRUCTURE_TYPE_MEMORY_ALLOCATE_FLAGS_INFO,
	VK_STRUCTURE_TYPE_DEVICE_GROUP_RENDER_PASS_BEGIN_INFO_KHR = VK_STRUCTURE_TYPE_DEVICE_GROUP_RENDER_PASS_BEGIN_INFO,
	VK_STRUCTURE_TYPE_DEVICE_GROUP_COMMAND_BUFFER_BEGIN_INFO_KHR = VK_STRUCTURE_TYPE_DEVICE_GROUP_COMMAND_BUFFER_BEGIN_INFO,
	VK_STRUCTURE_TYPE_DEVICE_GROUP_SUBMIT_INFO_KHR = VK_STRUCTURE_TYPE_DEVICE_GROUP_SUBMIT_INFO,
	VK_STRUCTURE_TYPE_DEVICE_GROUP_BIND_SPARSE_INFO_KHR = VK_STRUCTURE_TYPE_DEVICE_GROUP_BIND_SPARSE_INFO,
	VK_STRUCTURE_TYPE_BIND_BUFFER_MEMORY_DEVICE_GROUP_INFO_KHR = VK_STRUCTURE_TYPE_BIND_BUFFER_MEMORY_DEVICE_GROUP_INFO,
	VK_STRUCTURE_TYPE_BIND_IMAGE_MEMORY_DEVICE_GROUP_INFO_KHR = VK_STRUCTURE_TYPE_BIND_IMAGE_MEMORY_DEVICE_GROUP_INFO,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_GROUP_PROPERTIES_KHR = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_GROUP_PROPERTIES,
	VK_STRUCTURE_TYPE_DEVICE_GROUP_DEVICE_CREATE_INFO_KHR = VK_STRUCTURE_TYPE_DEVICE_GROUP_DEVICE_CREATE_INFO,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_EXTERNAL_IMAGE_FORMAT_INFO_KHR = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_EXTERNAL_IMAGE_FORMAT_INFO,
	VK_STRUCTURE_TYPE_EXTERNAL_IMAGE_FORMAT_PROPERTIES_KHR = VK_STRUCTURE_TYPE_EXTERNAL_IMAGE_FORMAT_PROPERTIES,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_EXTERNAL_BUFFER_INFO_KHR = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_EXTERNAL_BUFFER_INFO,
	VK_STRUCTURE_TYPE_EXTERNAL_BUFFER_PROPERTIES_KHR = VK_STRUCTURE_TYPE_EXTERNAL_BUFFER_PROPERTIES,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ID_PROPERTIES_KHR = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ID_PROPERTIES,
	VK_STRUCTURE_TYPE_EXTERNAL_MEMORY_BUFFER_CREATE_INFO_KHR = VK_STRUCTURE_TYPE_EXTERNAL_MEMORY_BUFFER_CREATE_INFO,
	VK_STRUCTURE_TYPE_EXTERNAL_MEMORY_IMAGE_CREATE_INFO_KHR = VK_STRUCTURE_TYPE_EXTERNAL_MEMORY_IMAGE_CREATE_INFO,
	VK_STRUCTURE_TYPE_EXPORT_MEMORY_ALLOCATE_INFO_KHR = VK_STRUCTURE_TYPE_EXPORT_MEMORY_ALLOCATE_INFO,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_EXTERNAL_SEMAPHORE_INFO_KHR = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_EXTERNAL_SEMAPHORE_INFO,
	VK_STRUCTURE_TYPE_EXTERNAL_SEMAPHORE_PROPERTIES_KHR = VK_STRUCTURE_TYPE_EXTERNAL_SEMAPHORE_PROPERTIES,
	VK_STRUCTURE_TYPE_EXPORT_SEMAPHORE_CREATE_INFO_KHR = VK_STRUCTURE_TYPE_EXPORT_SEMAPHORE_CREATE_INFO,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_FLOAT16_INT8_FEATURES_KHR = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_FLOAT16_INT8_FEATURES,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FLOAT16_INT8_FEATURES_KHR = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_FLOAT16_INT8_FEATURES,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_16BIT_STORAGE_FEATURES_KHR = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_16BIT_STORAGE_FEATURES,
	VK_STRUCTURE_TYPE_DESCRIPTOR_UPDATE_TEMPLATE_CREATE_INFO_KHR = VK_STRUCTURE_TYPE_DESCRIPTOR_UPDATE_TEMPLATE_CREATE_INFO,
	VK_STRUCTURE_TYPE_SURFACE_CAPABILITIES2_EXT = VK_STRUCTURE_TYPE_SURFACE_CAPABILITIES_2_EXT,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGELESS_FRAMEBUFFER_FEATURES_KHR = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGELESS_FRAMEBUFFER_FEATURES,
	VK_STRUCTURE_TYPE_FRAMEBUFFER_ATTACHMENTS_CREATE_INFO_KHR = VK_STRUCTURE_TYPE_FRAMEBUFFER_ATTACHMENTS_CREATE_INFO,
	VK_STRUCTURE_TYPE_FRAMEBUFFER_ATTACHMENT_IMAGE_INFO_KHR = VK_STRUCTURE_TYPE_FRAMEBUFFER_ATTACHMENT_IMAGE_INFO,
	VK_STRUCTURE_TYPE_RENDER_PASS_ATTACHMENT_BEGIN_INFO_KHR = VK_STRUCTURE_TYPE_RENDER_PASS_ATTACHMENT_BEGIN_INFO,
	VK_STRUCTURE_TYPE_ATTACHMENT_DESCRIPTION_2_KHR = VK_STRUCTURE_TYPE_ATTACHMENT_DESCRIPTION_2,
	VK_STRUCTURE_TYPE_ATTACHMENT_REFERENCE_2_KHR = VK_STRUCTURE_TYPE_ATTACHMENT_REFERENCE_2,
	VK_STRUCTURE_TYPE_SUBPASS_DESCRIPTION_2_KHR = VK_STRUCTURE_TYPE_SUBPASS_DESCRIPTION_2,
	VK_STRUCTURE_TYPE_SUBPASS_DEPENDENCY_2_KHR = VK_STRUCTURE_TYPE_SUBPASS_DEPENDENCY_2,
	VK_STRUCTURE_TYPE_RENDER_PASS_CREATE_INFO_2_KHR = VK_STRUCTURE_TYPE_RENDER_PASS_CREATE_INFO_2,
	VK_STRUCTURE_TYPE_SUBPASS_BEGIN_INFO_KHR = VK_STRUCTURE_TYPE_SUBPASS_BEGIN_INFO,
	VK_STRUCTURE_TYPE_SUBPASS_END_INFO_KHR = VK_STRUCTURE_TYPE_SUBPASS_END_INFO,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_EXTERNAL_FENCE_INFO_KHR = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_EXTERNAL_FENCE_INFO,
	VK_STRUCTURE_TYPE_EXTERNAL_FENCE_PROPERTIES_KHR = VK_STRUCTURE_TYPE_EXTERNAL_FENCE_PROPERTIES,
	VK_STRUCTURE_TYPE_EXPORT_FENCE_CREATE_INFO_KHR = VK_STRUCTURE_TYPE_EXPORT_FENCE_CREATE_INFO,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_POINT_CLIPPING_PROPERTIES_KHR = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_POINT_CLIPPING_PROPERTIES,
	VK_STRUCTURE_TYPE_RENDER_PASS_INPUT_ATTACHMENT_ASPECT_CREATE_INFO_KHR = VK_STRUCTURE_TYPE_RENDER_PASS_INPUT_ATTACHMENT_ASPECT_CREATE_INFO,
	VK_STRUCTURE_TYPE_IMAGE_VIEW_USAGE_CREATE_INFO_KHR = VK_STRUCTURE_TYPE_IMAGE_VIEW_USAGE_CREATE_INFO,
	VK_STRUCTURE_TYPE_PIPELINE_TESSELLATION_DOMAIN_ORIGIN_STATE_CREATE_INFO_KHR = VK_STRUCTURE_TYPE_PIPELINE_TESSELLATION_DOMAIN_ORIGIN_STATE_CREATE_INFO,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VARIABLE_POINTERS_FEATURES_KHR = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VARIABLE_POINTERS_FEATURES,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VARIABLE_POINTER_FEATURES_KHR = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VARIABLE_POINTERS_FEATURES_KHR,
	VK_STRUCTURE_TYPE_MEMORY_DEDICATED_REQUIREMENTS_KHR = VK_STRUCTURE_TYPE_MEMORY_DEDICATED_REQUIREMENTS,
	VK_STRUCTURE_TYPE_MEMORY_DEDICATED_ALLOCATE_INFO_KHR = VK_STRUCTURE_TYPE_MEMORY_DEDICATED_ALLOCATE_INFO,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SAMPLER_FILTER_MINMAX_PROPERTIES_EXT = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SAMPLER_FILTER_MINMAX_PROPERTIES,
	VK_STRUCTURE_TYPE_SAMPLER_REDUCTION_MODE_CREATE_INFO_EXT = VK_STRUCTURE_TYPE_SAMPLER_REDUCTION_MODE_CREATE_INFO,
	VK_STRUCTURE_TYPE_BUFFER_MEMORY_REQUIREMENTS_INFO_2_KHR = VK_STRUCTURE_TYPE_BUFFER_MEMORY_REQUIREMENTS_INFO_2,
	VK_STRUCTURE_TYPE_IMAGE_MEMORY_REQUIREMENTS_INFO_2_KHR = VK_STRUCTURE_TYPE_IMAGE_MEMORY_REQUIREMENTS_INFO_2,
	VK_STRUCTURE_TYPE_IMAGE_SPARSE_MEMORY_REQUIREMENTS_INFO_2_KHR = VK_STRUCTURE_TYPE_IMAGE_SPARSE_MEMORY_REQUIREMENTS_INFO_2,
	VK_STRUCTURE_TYPE_MEMORY_REQUIREMENTS_2_KHR = VK_STRUCTURE_TYPE_MEMORY_REQUIREMENTS_2,
	VK_STRUCTURE_TYPE_SPARSE_IMAGE_MEMORY_REQUIREMENTS_2_KHR = VK_STRUCTURE_TYPE_SPARSE_IMAGE_MEMORY_REQUIREMENTS_2,
	VK_STRUCTURE_TYPE_IMAGE_FORMAT_LIST_CREATE_INFO_KHR = VK_STRUCTURE_TYPE_IMAGE_FORMAT_LIST_CREATE_INFO,
	VK_STRUCTURE_TYPE_SAMPLER_YCBCR_CONVERSION_CREATE_INFO_KHR = VK_STRUCTURE_TYPE_SAMPLER_YCBCR_CONVERSION_CREATE_INFO,
	VK_STRUCTURE_TYPE_SAMPLER_YCBCR_CONVERSION_INFO_KHR = VK_STRUCTURE_TYPE_SAMPLER_YCBCR_CONVERSION_INFO,
	VK_STRUCTURE_TYPE_BIND_IMAGE_PLANE_MEMORY_INFO_KHR = VK_STRUCTURE_TYPE_BIND_IMAGE_PLANE_MEMORY_INFO,
	VK_STRUCTURE_TYPE_IMAGE_PLANE_MEMORY_REQUIREMENTS_INFO_KHR = VK_STRUCTURE_TYPE_IMAGE_PLANE_MEMORY_REQUIREMENTS_INFO,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SAMPLER_YCBCR_CONVERSION_FEATURES_KHR = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SAMPLER_YCBCR_CONVERSION_FEATURES,
	VK_STRUCTURE_TYPE_SAMPLER_YCBCR_CONVERSION_IMAGE_FORMAT_PROPERTIES_KHR = VK_STRUCTURE_TYPE_SAMPLER_YCBCR_CONVERSION_IMAGE_FORMAT_PROPERTIES,
	VK_STRUCTURE_TYPE_BIND_BUFFER_MEMORY_INFO_KHR = VK_STRUCTURE_TYPE_BIND_BUFFER_MEMORY_INFO,
	VK_STRUCTURE_TYPE_BIND_IMAGE_MEMORY_INFO_KHR = VK_STRUCTURE_TYPE_BIND_IMAGE_MEMORY_INFO,
	VK_STRUCTURE_TYPE_DESCRIPTOR_SET_LAYOUT_BINDING_FLAGS_CREATE_INFO_EXT = VK_STRUCTURE_TYPE_DESCRIPTOR_SET_LAYOUT_BINDING_FLAGS_CREATE_INFO,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DESCRIPTOR_INDEXING_FEATURES_EXT = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DESCRIPTOR_INDEXING_FEATURES,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DESCRIPTOR_INDEXING_PROPERTIES_EXT = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DESCRIPTOR_INDEXING_PROPERTIES,
	VK_STRUCTURE_TYPE_DESCRIPTOR_SET_VARIABLE_DESCRIPTOR_COUNT_ALLOCATE_INFO_EXT = VK_STRUCTURE_TYPE_DESCRIPTOR_SET_VARIABLE_DESCRIPTOR_COUNT_ALLOCATE_INFO,
	VK_STRUCTURE_TYPE_DESCRIPTOR_SET_VARIABLE_DESCRIPTOR_COUNT_LAYOUT_SUPPORT_EXT = VK_STRUCTURE_TYPE_DESCRIPTOR_SET_VARIABLE_DESCRIPTOR_COUNT_LAYOUT_SUPPORT,
	VK_STRUCTURE_TYPE_BIND_ACCELERATION_STRUCTURE_MEMORY_INFO_NV = VK_STRUCTURE_TYPE_BIND_ACCELERATION_STRUCTURE_MEMORY_INFO_KHR,
	VK_STRUCTURE_TYPE_WRITE_DESCRIPTOR_SET_ACCELERATION_STRUCTURE_NV = VK_STRUCTURE_TYPE_WRITE_DESCRIPTOR_SET_ACCELERATION_STRUCTURE_KHR,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_3_PROPERTIES_KHR = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_3_PROPERTIES,
	VK_STRUCTURE_TYPE_DESCRIPTOR_SET_LAYOUT_SUPPORT_KHR = VK_STRUCTURE_TYPE_DESCRIPTOR_SET_LAYOUT_SUPPORT,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_SUBGROUP_EXTENDED_TYPES_FEATURES_KHR = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_SUBGROUP_EXTENDED_TYPES_FEATURES,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_8BIT_STORAGE_FEATURES_KHR = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_8BIT_STORAGE_FEATURES,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_ATOMIC_INT64_FEATURES_KHR = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_ATOMIC_INT64_FEATURES,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DRIVER_PROPERTIES_KHR = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DRIVER_PROPERTIES,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FLOAT_CONTROLS_PROPERTIES_KHR = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FLOAT_CONTROLS_PROPERTIES,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DEPTH_STENCIL_RESOLVE_PROPERTIES_KHR = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DEPTH_STENCIL_RESOLVE_PROPERTIES,
	VK_STRUCTURE_TYPE_SUBPASS_DESCRIPTION_DEPTH_STENCIL_RESOLVE_KHR = VK_STRUCTURE_TYPE_SUBPASS_DESCRIPTION_DEPTH_STENCIL_RESOLVE,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TIMELINE_SEMAPHORE_FEATURES_KHR = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TIMELINE_SEMAPHORE_FEATURES,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TIMELINE_SEMAPHORE_PROPERTIES_KHR = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TIMELINE_SEMAPHORE_PROPERTIES,
	VK_STRUCTURE_TYPE_SEMAPHORE_TYPE_CREATE_INFO_KHR = VK_STRUCTURE_TYPE_SEMAPHORE_TYPE_CREATE_INFO,
	VK_STRUCTURE_TYPE_TIMELINE_SEMAPHORE_SUBMIT_INFO_KHR = VK_STRUCTURE_TYPE_TIMELINE_SEMAPHORE_SUBMIT_INFO,
	VK_STRUCTURE_TYPE_SEMAPHORE_WAIT_INFO_KHR = VK_STRUCTURE_TYPE_SEMAPHORE_WAIT_INFO,
	VK_STRUCTURE_TYPE_SEMAPHORE_SIGNAL_INFO_KHR = VK_STRUCTURE_TYPE_SEMAPHORE_SIGNAL_INFO,
	VK_STRUCTURE_TYPE_QUERY_POOL_CREATE_INFO_INTEL = VK_STRUCTURE_TYPE_QUERY_POOL_PERFORMANCE_QUERY_CREATE_INFO_INTEL,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VULKAN_MEMORY_MODEL_FEATURES_KHR = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VULKAN_MEMORY_MODEL_FEATURES,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SCALAR_BLOCK_LAYOUT_FEATURES_EXT = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SCALAR_BLOCK_LAYOUT_FEATURES,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SEPARATE_DEPTH_STENCIL_LAYOUTS_FEATURES_KHR = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SEPARATE_DEPTH_STENCIL_LAYOUTS_FEATURES,
	VK_STRUCTURE_TYPE_ATTACHMENT_REFERENCE_STENCIL_LAYOUT_KHR = VK_STRUCTURE_TYPE_ATTACHMENT_REFERENCE_STENCIL_LAYOUT,
	VK_STRUCTURE_TYPE_ATTACHMENT_DESCRIPTION_STENCIL_LAYOUT_KHR = VK_STRUCTURE_TYPE_ATTACHMENT_DESCRIPTION_STENCIL_LAYOUT,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_BUFFER_ADDRESS_FEATURES_EXT = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_BUFFER_DEVICE_ADDRESS_FEATURES_EXT,
	VK_STRUCTURE_TYPE_BUFFER_DEVICE_ADDRESS_INFO_EXT = VK_STRUCTURE_TYPE_BUFFER_DEVICE_ADDRESS_INFO,
	VK_STRUCTURE_TYPE_IMAGE_STENCIL_USAGE_CREATE_INFO_EXT = VK_STRUCTURE_TYPE_IMAGE_STENCIL_USAGE_CREATE_INFO,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_UNIFORM_BUFFER_STANDARD_LAYOUT_FEATURES_KHR = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_UNIFORM_BUFFER_STANDARD_LAYOUT_FEATURES,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_BUFFER_DEVICE_ADDRESS_FEATURES_KHR = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_BUFFER_DEVICE_ADDRESS_FEATURES,
	VK_STRUCTURE_TYPE_BUFFER_DEVICE_ADDRESS_INFO_KHR = VK_STRUCTURE_TYPE_BUFFER_DEVICE_ADDRESS_INFO,
	VK_STRUCTURE_TYPE_BUFFER_OPAQUE_CAPTURE_ADDRESS_CREATE_INFO_KHR = VK_STRUCTURE_TYPE_BUFFER_OPAQUE_CAPTURE_ADDRESS_CREATE_INFO,
	VK_STRUCTURE_TYPE_MEMORY_OPAQUE_CAPTURE_ADDRESS_ALLOCATE_INFO_KHR = VK_STRUCTURE_TYPE_MEMORY_OPAQUE_CAPTURE_ADDRESS_ALLOCATE_INFO,
	VK_STRUCTURE_TYPE_DEVICE_MEMORY_OPAQUE_CAPTURE_ADDRESS_INFO_KHR = VK_STRUCTURE_TYPE_DEVICE_MEMORY_OPAQUE_CAPTURE_ADDRESS_INFO,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_HOST_QUERY_RESET_FEATURES_EXT = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_HOST_QUERY_RESET_FEATURES,
	VK_STRUCTURE_TYPE_MAX_ENUM = 0x7FFFFFFF,
}
enum VkImageLayout {
	VK_IMAGE_LAYOUT_UNDEFINED = 0,
	VK_IMAGE_LAYOUT_GENERAL = 1,
	VK_IMAGE_LAYOUT_COLOR_ATTACHMENT_OPTIMAL = 2,
	VK_IMAGE_LAYOUT_DEPTH_STENCIL_ATTACHMENT_OPTIMAL = 3,
	VK_IMAGE_LAYOUT_DEPTH_STENCIL_READ_ONLY_OPTIMAL = 4,
	VK_IMAGE_LAYOUT_SHADER_READ_ONLY_OPTIMAL = 5,
	VK_IMAGE_LAYOUT_TRANSFER_SRC_OPTIMAL = 6,
	VK_IMAGE_LAYOUT_TRANSFER_DST_OPTIMAL = 7,
	VK_IMAGE_LAYOUT_PREINITIALIZED = 8,
	VK_IMAGE_LAYOUT_DEPTH_READ_ONLY_STENCIL_ATTACHMENT_OPTIMAL = 1000117000,
	VK_IMAGE_LAYOUT_DEPTH_ATTACHMENT_STENCIL_READ_ONLY_OPTIMAL = 1000117001,
	VK_IMAGE_LAYOUT_DEPTH_ATTACHMENT_OPTIMAL = 1000241000,
	VK_IMAGE_LAYOUT_DEPTH_READ_ONLY_OPTIMAL = 1000241001,
	VK_IMAGE_LAYOUT_STENCIL_ATTACHMENT_OPTIMAL = 1000241002,
	VK_IMAGE_LAYOUT_STENCIL_READ_ONLY_OPTIMAL = 1000241003,
	VK_IMAGE_LAYOUT_PRESENT_SRC_KHR = 1000001002,
	VK_IMAGE_LAYOUT_SHARED_PRESENT_KHR = 1000111000,
	VK_IMAGE_LAYOUT_SHADING_RATE_OPTIMAL_NV = 1000164003,
	VK_IMAGE_LAYOUT_FRAGMENT_DENSITY_MAP_OPTIMAL_EXT = 1000218000,
	VK_IMAGE_LAYOUT_DEPTH_READ_ONLY_STENCIL_ATTACHMENT_OPTIMAL_KHR = VK_IMAGE_LAYOUT_DEPTH_READ_ONLY_STENCIL_ATTACHMENT_OPTIMAL,
	VK_IMAGE_LAYOUT_DEPTH_ATTACHMENT_STENCIL_READ_ONLY_OPTIMAL_KHR = VK_IMAGE_LAYOUT_DEPTH_ATTACHMENT_STENCIL_READ_ONLY_OPTIMAL,
	VK_IMAGE_LAYOUT_DEPTH_ATTACHMENT_OPTIMAL_KHR = VK_IMAGE_LAYOUT_DEPTH_ATTACHMENT_OPTIMAL,
	VK_IMAGE_LAYOUT_DEPTH_READ_ONLY_OPTIMAL_KHR = VK_IMAGE_LAYOUT_DEPTH_READ_ONLY_OPTIMAL,
	VK_IMAGE_LAYOUT_STENCIL_ATTACHMENT_OPTIMAL_KHR = VK_IMAGE_LAYOUT_STENCIL_ATTACHMENT_OPTIMAL,
	VK_IMAGE_LAYOUT_STENCIL_READ_ONLY_OPTIMAL_KHR = VK_IMAGE_LAYOUT_STENCIL_READ_ONLY_OPTIMAL,
	VK_IMAGE_LAYOUT_MAX_ENUM = 0x7FFFFFFF,
}
enum VkSystemAllocationScope {
	VK_SYSTEM_ALLOCATION_SCOPE_COMMAND = 0,
	VK_SYSTEM_ALLOCATION_SCOPE_OBJECT = 1,
	VK_SYSTEM_ALLOCATION_SCOPE_CACHE = 2,
	VK_SYSTEM_ALLOCATION_SCOPE_DEVICE = 3,
	VK_SYSTEM_ALLOCATION_SCOPE_INSTANCE = 4,
	VK_SYSTEM_ALLOCATION_SCOPE_MAX_ENUM = 0x7FFFFFFF,
}
enum VkAccelerationStructureMemoryRequirementsTypeKHR {
	VK_ACCELERATION_STRUCTURE_MEMORY_REQUIREMENTS_TYPE_OBJECT_KHR = 0,
	VK_ACCELERATION_STRUCTURE_MEMORY_REQUIREMENTS_TYPE_BUILD_SCRATCH_KHR = 1,
	VK_ACCELERATION_STRUCTURE_MEMORY_REQUIREMENTS_TYPE_UPDATE_SCRATCH_KHR = 2,
	VK_ACCELERATION_STRUCTURE_MEMORY_REQUIREMENTS_TYPE_OBJECT_NV = VK_ACCELERATION_STRUCTURE_MEMORY_REQUIREMENTS_TYPE_OBJECT_KHR,
	VK_ACCELERATION_STRUCTURE_MEMORY_REQUIREMENTS_TYPE_BUILD_SCRATCH_NV = VK_ACCELERATION_STRUCTURE_MEMORY_REQUIREMENTS_TYPE_BUILD_SCRATCH_KHR,
	VK_ACCELERATION_STRUCTURE_MEMORY_REQUIREMENTS_TYPE_UPDATE_SCRATCH_NV = VK_ACCELERATION_STRUCTURE_MEMORY_REQUIREMENTS_TYPE_UPDATE_SCRATCH_KHR,
	VK_ACCELERATION_STRUCTURE_MEMORY_REQUIREMENTS_TYPE_MAX_ENUM_KHR = 0x7FFFFFFF,
}
enum VkBlendFactor {
	VK_BLEND_FACTOR_ZERO = 0,
	VK_BLEND_FACTOR_ONE = 1,
	VK_BLEND_FACTOR_SRC_COLOR = 2,
	VK_BLEND_FACTOR_ONE_MINUS_SRC_COLOR = 3,
	VK_BLEND_FACTOR_DST_COLOR = 4,
	VK_BLEND_FACTOR_ONE_MINUS_DST_COLOR = 5,
	VK_BLEND_FACTOR_SRC_ALPHA = 6,
	VK_BLEND_FACTOR_ONE_MINUS_SRC_ALPHA = 7,
	VK_BLEND_FACTOR_DST_ALPHA = 8,
	VK_BLEND_FACTOR_ONE_MINUS_DST_ALPHA = 9,
	VK_BLEND_FACTOR_CONSTANT_COLOR = 10,
	VK_BLEND_FACTOR_ONE_MINUS_CONSTANT_COLOR = 11,
	VK_BLEND_FACTOR_CONSTANT_ALPHA = 12,
	VK_BLEND_FACTOR_ONE_MINUS_CONSTANT_ALPHA = 13,
	VK_BLEND_FACTOR_SRC_ALPHA_SATURATE = 14,
	VK_BLEND_FACTOR_SRC1_COLOR = 15,
	VK_BLEND_FACTOR_ONE_MINUS_SRC1_COLOR = 16,
	VK_BLEND_FACTOR_SRC1_ALPHA = 17,
	VK_BLEND_FACTOR_ONE_MINUS_SRC1_ALPHA = 18,
	VK_BLEND_FACTOR_MAX_ENUM = 0x7FFFFFFF,
}
enum VkVertexInputRate {
	VK_VERTEX_INPUT_RATE_VERTEX = 0,
	VK_VERTEX_INPUT_RATE_INSTANCE = 1,
	VK_VERTEX_INPUT_RATE_MAX_ENUM = 0x7FFFFFFF,
}
enum VkDisplayEventTypeEXT {
	VK_DISPLAY_EVENT_TYPE_FIRST_PIXEL_OUT_EXT = 0,
	VK_DISPLAY_EVENT_TYPE_MAX_ENUM_EXT = 0x7FFFFFFF,
}
enum VkSamplerMipmapMode {
	VK_SAMPLER_MIPMAP_MODE_NEAREST = 0,
	VK_SAMPLER_MIPMAP_MODE_LINEAR = 1,
	VK_SAMPLER_MIPMAP_MODE_MAX_ENUM = 0x7FFFFFFF,
}
enum VkDebugReportObjectTypeEXT {
	VK_DEBUG_REPORT_OBJECT_TYPE_UNKNOWN_EXT = 0,
	VK_DEBUG_REPORT_OBJECT_TYPE_INSTANCE_EXT = 1,
	VK_DEBUG_REPORT_OBJECT_TYPE_PHYSICAL_DEVICE_EXT = 2,
	VK_DEBUG_REPORT_OBJECT_TYPE_DEVICE_EXT = 3,
	VK_DEBUG_REPORT_OBJECT_TYPE_QUEUE_EXT = 4,
	VK_DEBUG_REPORT_OBJECT_TYPE_SEMAPHORE_EXT = 5,
	VK_DEBUG_REPORT_OBJECT_TYPE_COMMAND_BUFFER_EXT = 6,
	VK_DEBUG_REPORT_OBJECT_TYPE_FENCE_EXT = 7,
	VK_DEBUG_REPORT_OBJECT_TYPE_DEVICE_MEMORY_EXT = 8,
	VK_DEBUG_REPORT_OBJECT_TYPE_BUFFER_EXT = 9,
	VK_DEBUG_REPORT_OBJECT_TYPE_IMAGE_EXT = 10,
	VK_DEBUG_REPORT_OBJECT_TYPE_EVENT_EXT = 11,
	VK_DEBUG_REPORT_OBJECT_TYPE_QUERY_POOL_EXT = 12,
	VK_DEBUG_REPORT_OBJECT_TYPE_BUFFER_VIEW_EXT = 13,
	VK_DEBUG_REPORT_OBJECT_TYPE_IMAGE_VIEW_EXT = 14,
	VK_DEBUG_REPORT_OBJECT_TYPE_SHADER_MODULE_EXT = 15,
	VK_DEBUG_REPORT_OBJECT_TYPE_PIPELINE_CACHE_EXT = 16,
	VK_DEBUG_REPORT_OBJECT_TYPE_PIPELINE_LAYOUT_EXT = 17,
	VK_DEBUG_REPORT_OBJECT_TYPE_RENDER_PASS_EXT = 18,
	VK_DEBUG_REPORT_OBJECT_TYPE_PIPELINE_EXT = 19,
	VK_DEBUG_REPORT_OBJECT_TYPE_DESCRIPTOR_SET_LAYOUT_EXT = 20,
	VK_DEBUG_REPORT_OBJECT_TYPE_SAMPLER_EXT = 21,
	VK_DEBUG_REPORT_OBJECT_TYPE_DESCRIPTOR_POOL_EXT = 22,
	VK_DEBUG_REPORT_OBJECT_TYPE_DESCRIPTOR_SET_EXT = 23,
	VK_DEBUG_REPORT_OBJECT_TYPE_FRAMEBUFFER_EXT = 24,
	VK_DEBUG_REPORT_OBJECT_TYPE_COMMAND_POOL_EXT = 25,
	VK_DEBUG_REPORT_OBJECT_TYPE_SURFACE_KHR_EXT = 26,
	VK_DEBUG_REPORT_OBJECT_TYPE_SWAPCHAIN_KHR_EXT = 27,
	VK_DEBUG_REPORT_OBJECT_TYPE_DEBUG_REPORT_CALLBACK_EXT_EXT = 28,
	VK_DEBUG_REPORT_OBJECT_TYPE_DISPLAY_KHR_EXT = 29,
	VK_DEBUG_REPORT_OBJECT_TYPE_DISPLAY_MODE_KHR_EXT = 30,
	VK_DEBUG_REPORT_OBJECT_TYPE_VALIDATION_CACHE_EXT_EXT = 33,
	VK_DEBUG_REPORT_OBJECT_TYPE_SAMPLER_YCBCR_CONVERSION_EXT = 1000156000,
	VK_DEBUG_REPORT_OBJECT_TYPE_DESCRIPTOR_UPDATE_TEMPLATE_EXT = 1000085000,
	VK_DEBUG_REPORT_OBJECT_TYPE_ACCELERATION_STRUCTURE_KHR_EXT = 1000165000,
	VK_DEBUG_REPORT_OBJECT_TYPE_DEBUG_REPORT_EXT = VK_DEBUG_REPORT_OBJECT_TYPE_DEBUG_REPORT_CALLBACK_EXT_EXT,
	VK_DEBUG_REPORT_OBJECT_TYPE_VALIDATION_CACHE_EXT = VK_DEBUG_REPORT_OBJECT_TYPE_VALIDATION_CACHE_EXT_EXT,
	VK_DEBUG_REPORT_OBJECT_TYPE_DESCRIPTOR_UPDATE_TEMPLATE_KHR_EXT = VK_DEBUG_REPORT_OBJECT_TYPE_DESCRIPTOR_UPDATE_TEMPLATE_EXT,
	VK_DEBUG_REPORT_OBJECT_TYPE_SAMPLER_YCBCR_CONVERSION_KHR_EXT = VK_DEBUG_REPORT_OBJECT_TYPE_SAMPLER_YCBCR_CONVERSION_EXT,
	VK_DEBUG_REPORT_OBJECT_TYPE_ACCELERATION_STRUCTURE_NV_EXT = VK_DEBUG_REPORT_OBJECT_TYPE_ACCELERATION_STRUCTURE_KHR_EXT,
	VK_DEBUG_REPORT_OBJECT_TYPE_MAX_ENUM_EXT = 0x7FFFFFFF,
}
enum VkImageTiling {
	VK_IMAGE_TILING_OPTIMAL = 0,
	VK_IMAGE_TILING_LINEAR = 1,
	VK_IMAGE_TILING_DRM_FORMAT_MODIFIER_EXT = 1000158000,
	VK_IMAGE_TILING_MAX_ENUM = 0x7FFFFFFF,
}
enum VkSampleCountFlagBits {
	VK_SAMPLE_COUNT_1_BIT = 0x00000001,
	VK_SAMPLE_COUNT_2_BIT = 0x00000002,
	VK_SAMPLE_COUNT_4_BIT = 0x00000004,
	VK_SAMPLE_COUNT_8_BIT = 0x00000008,
	VK_SAMPLE_COUNT_16_BIT = 0x00000010,
	VK_SAMPLE_COUNT_32_BIT = 0x00000020,
	VK_SAMPLE_COUNT_64_BIT = 0x00000040,
	VK_SAMPLE_COUNT_FLAG_BITS_MAX_ENUM = 0x7FFFFFFF,
}
enum VkBlendOp {
	VK_BLEND_OP_ADD = 0,
	VK_BLEND_OP_SUBTRACT = 1,
	VK_BLEND_OP_REVERSE_SUBTRACT = 2,
	VK_BLEND_OP_MIN = 3,
	VK_BLEND_OP_MAX = 4,
	VK_BLEND_OP_ZERO_EXT = 1000148000,
	VK_BLEND_OP_SRC_EXT = 1000148001,
	VK_BLEND_OP_DST_EXT = 1000148002,
	VK_BLEND_OP_SRC_OVER_EXT = 1000148003,
	VK_BLEND_OP_DST_OVER_EXT = 1000148004,
	VK_BLEND_OP_SRC_IN_EXT = 1000148005,
	VK_BLEND_OP_DST_IN_EXT = 1000148006,
	VK_BLEND_OP_SRC_OUT_EXT = 1000148007,
	VK_BLEND_OP_DST_OUT_EXT = 1000148008,
	VK_BLEND_OP_SRC_ATOP_EXT = 1000148009,
	VK_BLEND_OP_DST_ATOP_EXT = 1000148010,
	VK_BLEND_OP_XOR_EXT = 1000148011,
	VK_BLEND_OP_MULTIPLY_EXT = 1000148012,
	VK_BLEND_OP_SCREEN_EXT = 1000148013,
	VK_BLEND_OP_OVERLAY_EXT = 1000148014,
	VK_BLEND_OP_DARKEN_EXT = 1000148015,
	VK_BLEND_OP_LIGHTEN_EXT = 1000148016,
	VK_BLEND_OP_COLORDODGE_EXT = 1000148017,
	VK_BLEND_OP_COLORBURN_EXT = 1000148018,
	VK_BLEND_OP_HARDLIGHT_EXT = 1000148019,
	VK_BLEND_OP_SOFTLIGHT_EXT = 1000148020,
	VK_BLEND_OP_DIFFERENCE_EXT = 1000148021,
	VK_BLEND_OP_EXCLUSION_EXT = 1000148022,
	VK_BLEND_OP_INVERT_EXT = 1000148023,
	VK_BLEND_OP_INVERT_RGB_EXT = 1000148024,
	VK_BLEND_OP_LINEARDODGE_EXT = 1000148025,
	VK_BLEND_OP_LINEARBURN_EXT = 1000148026,
	VK_BLEND_OP_VIVIDLIGHT_EXT = 1000148027,
	VK_BLEND_OP_LINEARLIGHT_EXT = 1000148028,
	VK_BLEND_OP_PINLIGHT_EXT = 1000148029,
	VK_BLEND_OP_HARDMIX_EXT = 1000148030,
	VK_BLEND_OP_HSL_HUE_EXT = 1000148031,
	VK_BLEND_OP_HSL_SATURATION_EXT = 1000148032,
	VK_BLEND_OP_HSL_COLOR_EXT = 1000148033,
	VK_BLEND_OP_HSL_LUMINOSITY_EXT = 1000148034,
	VK_BLEND_OP_PLUS_EXT = 1000148035,
	VK_BLEND_OP_PLUS_CLAMPED_EXT = 1000148036,
	VK_BLEND_OP_PLUS_CLAMPED_ALPHA_EXT = 1000148037,
	VK_BLEND_OP_PLUS_DARKER_EXT = 1000148038,
	VK_BLEND_OP_MINUS_EXT = 1000148039,
	VK_BLEND_OP_MINUS_CLAMPED_EXT = 1000148040,
	VK_BLEND_OP_CONTRAST_EXT = 1000148041,
	VK_BLEND_OP_INVERT_OVG_EXT = 1000148042,
	VK_BLEND_OP_RED_EXT = 1000148043,
	VK_BLEND_OP_GREEN_EXT = 1000148044,
	VK_BLEND_OP_BLUE_EXT = 1000148045,
	VK_BLEND_OP_MAX_ENUM = 0x7FFFFFFF,
}
enum VkPerformanceConfigurationTypeINTEL {
	VK_PERFORMANCE_CONFIGURATION_TYPE_COMMAND_QUEUE_METRICS_DISCOVERY_ACTIVATED_INTEL = 0,
	VK_PERFORMANCE_CONFIGURATION_TYPE_MAX_ENUM_INTEL = 0x7FFFFFFF,
}
enum VkSurfaceTransformFlagBitsKHR {
	VK_SURFACE_TRANSFORM_IDENTITY_BIT_KHR = 0x00000001,
	VK_SURFACE_TRANSFORM_ROTATE_90_BIT_KHR = 0x00000002,
	VK_SURFACE_TRANSFORM_ROTATE_180_BIT_KHR = 0x00000004,
	VK_SURFACE_TRANSFORM_ROTATE_270_BIT_KHR = 0x00000008,
	VK_SURFACE_TRANSFORM_HORIZONTAL_MIRROR_BIT_KHR = 0x00000010,
	VK_SURFACE_TRANSFORM_HORIZONTAL_MIRROR_ROTATE_90_BIT_KHR = 0x00000020,
	VK_SURFACE_TRANSFORM_HORIZONTAL_MIRROR_ROTATE_180_BIT_KHR = 0x00000040,
	VK_SURFACE_TRANSFORM_HORIZONTAL_MIRROR_ROTATE_270_BIT_KHR = 0x00000080,
	VK_SURFACE_TRANSFORM_INHERIT_BIT_KHR = 0x00000100,
	VK_SURFACE_TRANSFORM_FLAG_BITS_MAX_ENUM_KHR = 0x7FFFFFFF,
}
enum VkPresentModeKHR {
	VK_PRESENT_MODE_IMMEDIATE_KHR = 0,
	VK_PRESENT_MODE_MAILBOX_KHR = 1,
	VK_PRESENT_MODE_FIFO_KHR = 2,
	VK_PRESENT_MODE_FIFO_RELAXED_KHR = 3,
	VK_PRESENT_MODE_SHARED_DEMAND_REFRESH_KHR = 1000111000,
	VK_PRESENT_MODE_SHARED_CONTINUOUS_REFRESH_KHR = 1000111001,
	VK_PRESENT_MODE_MAX_ENUM_KHR = 0x7FFFFFFF,
}
enum VkObjectType {
	VK_OBJECT_TYPE_UNKNOWN = 0,
	VK_OBJECT_TYPE_INSTANCE = 1,
	VK_OBJECT_TYPE_PHYSICAL_DEVICE = 2,
	VK_OBJECT_TYPE_DEVICE = 3,
	VK_OBJECT_TYPE_QUEUE = 4,
	VK_OBJECT_TYPE_SEMAPHORE = 5,
	VK_OBJECT_TYPE_COMMAND_BUFFER = 6,
	VK_OBJECT_TYPE_FENCE = 7,
	VK_OBJECT_TYPE_DEVICE_MEMORY = 8,
	VK_OBJECT_TYPE_BUFFER = 9,
	VK_OBJECT_TYPE_IMAGE = 10,
	VK_OBJECT_TYPE_EVENT = 11,
	VK_OBJECT_TYPE_QUERY_POOL = 12,
	VK_OBJECT_TYPE_BUFFER_VIEW = 13,
	VK_OBJECT_TYPE_IMAGE_VIEW = 14,
	VK_OBJECT_TYPE_SHADER_MODULE = 15,
	VK_OBJECT_TYPE_PIPELINE_CACHE = 16,
	VK_OBJECT_TYPE_PIPELINE_LAYOUT = 17,
	VK_OBJECT_TYPE_RENDER_PASS = 18,
	VK_OBJECT_TYPE_PIPELINE = 19,
	VK_OBJECT_TYPE_DESCRIPTOR_SET_LAYOUT = 20,
	VK_OBJECT_TYPE_SAMPLER = 21,
	VK_OBJECT_TYPE_DESCRIPTOR_POOL = 22,
	VK_OBJECT_TYPE_DESCRIPTOR_SET = 23,
	VK_OBJECT_TYPE_FRAMEBUFFER = 24,
	VK_OBJECT_TYPE_COMMAND_POOL = 25,
	VK_OBJECT_TYPE_SAMPLER_YCBCR_CONVERSION = 1000156000,
	VK_OBJECT_TYPE_DESCRIPTOR_UPDATE_TEMPLATE = 1000085000,
	VK_OBJECT_TYPE_SURFACE_KHR = 1000000000,
	VK_OBJECT_TYPE_SWAPCHAIN_KHR = 1000001000,
	VK_OBJECT_TYPE_DISPLAY_KHR = 1000002000,
	VK_OBJECT_TYPE_DISPLAY_MODE_KHR = 1000002001,
	VK_OBJECT_TYPE_DEBUG_REPORT_CALLBACK_EXT = 1000011000,
	VK_OBJECT_TYPE_DEBUG_UTILS_MESSENGER_EXT = 1000128000,
	VK_OBJECT_TYPE_ACCELERATION_STRUCTURE_KHR = 1000165000,
	VK_OBJECT_TYPE_VALIDATION_CACHE_EXT = 1000160000,
	VK_OBJECT_TYPE_PERFORMANCE_CONFIGURATION_INTEL = 1000210000,
	VK_OBJECT_TYPE_DEFERRED_OPERATION_KHR = 1000268000,
	VK_OBJECT_TYPE_INDIRECT_COMMANDS_LAYOUT_NV = 1000277000,
	VK_OBJECT_TYPE_PRIVATE_DATA_SLOT_EXT = 1000295000,
	VK_OBJECT_TYPE_DESCRIPTOR_UPDATE_TEMPLATE_KHR = VK_OBJECT_TYPE_DESCRIPTOR_UPDATE_TEMPLATE,
	VK_OBJECT_TYPE_SAMPLER_YCBCR_CONVERSION_KHR = VK_OBJECT_TYPE_SAMPLER_YCBCR_CONVERSION,
	VK_OBJECT_TYPE_ACCELERATION_STRUCTURE_NV = VK_OBJECT_TYPE_ACCELERATION_STRUCTURE_KHR,
	VK_OBJECT_TYPE_MAX_ENUM = 0x7FFFFFFF,
}
enum VkShadingRatePaletteEntryNV {
	VK_SHADING_RATE_PALETTE_ENTRY_NO_INVOCATIONS_NV = 0,
	VK_SHADING_RATE_PALETTE_ENTRY_16_INVOCATIONS_PER_PIXEL_NV = 1,
	VK_SHADING_RATE_PALETTE_ENTRY_8_INVOCATIONS_PER_PIXEL_NV = 2,
	VK_SHADING_RATE_PALETTE_ENTRY_4_INVOCATIONS_PER_PIXEL_NV = 3,
	VK_SHADING_RATE_PALETTE_ENTRY_2_INVOCATIONS_PER_PIXEL_NV = 4,
	VK_SHADING_RATE_PALETTE_ENTRY_1_INVOCATION_PER_PIXEL_NV = 5,
	VK_SHADING_RATE_PALETTE_ENTRY_1_INVOCATION_PER_2X1_PIXELS_NV = 6,
	VK_SHADING_RATE_PALETTE_ENTRY_1_INVOCATION_PER_1X2_PIXELS_NV = 7,
	VK_SHADING_RATE_PALETTE_ENTRY_1_INVOCATION_PER_2X2_PIXELS_NV = 8,
	VK_SHADING_RATE_PALETTE_ENTRY_1_INVOCATION_PER_4X2_PIXELS_NV = 9,
	VK_SHADING_RATE_PALETTE_ENTRY_1_INVOCATION_PER_2X4_PIXELS_NV = 10,
	VK_SHADING_RATE_PALETTE_ENTRY_1_INVOCATION_PER_4X4_PIXELS_NV = 11,
	VK_SHADING_RATE_PALETTE_ENTRY_MAX_ENUM_NV = 0x7FFFFFFF,
}
enum VkSubpassContents {
	VK_SUBPASS_CONTENTS_INLINE = 0,
	VK_SUBPASS_CONTENTS_SECONDARY_COMMAND_BUFFERS = 1,
	VK_SUBPASS_CONTENTS_MAX_ENUM = 0x7FFFFFFF,
}
enum VkCompareOp {
	VK_COMPARE_OP_NEVER = 0,
	VK_COMPARE_OP_LESS = 1,
	VK_COMPARE_OP_EQUAL = 2,
	VK_COMPARE_OP_LESS_OR_EQUAL = 3,
	VK_COMPARE_OP_GREATER = 4,
	VK_COMPARE_OP_NOT_EQUAL = 5,
	VK_COMPARE_OP_GREATER_OR_EQUAL = 6,
	VK_COMPARE_OP_ALWAYS = 7,
	VK_COMPARE_OP_MAX_ENUM = 0x7FFFFFFF,
}
enum VkComponentTypeNV {
	VK_COMPONENT_TYPE_FLOAT16_NV = 0,
	VK_COMPONENT_TYPE_FLOAT32_NV = 1,
	VK_COMPONENT_TYPE_FLOAT64_NV = 2,
	VK_COMPONENT_TYPE_SINT8_NV = 3,
	VK_COMPONENT_TYPE_SINT16_NV = 4,
	VK_COMPONENT_TYPE_SINT32_NV = 5,
	VK_COMPONENT_TYPE_SINT64_NV = 6,
	VK_COMPONENT_TYPE_UINT8_NV = 7,
	VK_COMPONENT_TYPE_UINT16_NV = 8,
	VK_COMPONENT_TYPE_UINT32_NV = 9,
	VK_COMPONENT_TYPE_UINT64_NV = 10,
	VK_COMPONENT_TYPE_MAX_ENUM_NV = 0x7FFFFFFF,
}
enum VkPerformanceOverrideTypeINTEL {
	VK_PERFORMANCE_OVERRIDE_TYPE_NULL_HARDWARE_INTEL = 0,
	VK_PERFORMANCE_OVERRIDE_TYPE_FLUSH_GPU_CACHES_INTEL = 1,
	VK_PERFORMANCE_OVERRIDE_TYPE_MAX_ENUM_INTEL = 0x7FFFFFFF,
}
enum VkPolygonMode {
	VK_POLYGON_MODE_FILL = 0,
	VK_POLYGON_MODE_LINE = 1,
	VK_POLYGON_MODE_POINT = 2,
	VK_POLYGON_MODE_FILL_RECTANGLE_NV = 1000153000,
	VK_POLYGON_MODE_MAX_ENUM = 0x7FFFFFFF,
}
enum VkAttachmentLoadOp {
	VK_ATTACHMENT_LOAD_OP_LOAD = 0,
	VK_ATTACHMENT_LOAD_OP_CLEAR = 1,
	VK_ATTACHMENT_LOAD_OP_DONT_CARE = 2,
	VK_ATTACHMENT_LOAD_OP_MAX_ENUM = 0x7FFFFFFF,
}
enum VkDisplayPowerStateEXT {
	VK_DISPLAY_POWER_STATE_OFF_EXT = 0,
	VK_DISPLAY_POWER_STATE_SUSPEND_EXT = 1,
	VK_DISPLAY_POWER_STATE_ON_EXT = 2,
	VK_DISPLAY_POWER_STATE_MAX_ENUM_EXT = 0x7FFFFFFF,
}
enum VkExternalSemaphoreHandleTypeFlagBits {
	VK_EXTERNAL_SEMAPHORE_HANDLE_TYPE_OPAQUE_FD_BIT = 0x00000001,
	VK_EXTERNAL_SEMAPHORE_HANDLE_TYPE_OPAQUE_WIN32_BIT = 0x00000002,
	VK_EXTERNAL_SEMAPHORE_HANDLE_TYPE_OPAQUE_WIN32_KMT_BIT = 0x00000004,
	VK_EXTERNAL_SEMAPHORE_HANDLE_TYPE_D3D12_FENCE_BIT = 0x00000008,
	VK_EXTERNAL_SEMAPHORE_HANDLE_TYPE_SYNC_FD_BIT = 0x00000010,
	VK_EXTERNAL_SEMAPHORE_HANDLE_TYPE_OPAQUE_FD_BIT_KHR = VK_EXTERNAL_SEMAPHORE_HANDLE_TYPE_OPAQUE_FD_BIT,
	VK_EXTERNAL_SEMAPHORE_HANDLE_TYPE_OPAQUE_WIN32_BIT_KHR = VK_EXTERNAL_SEMAPHORE_HANDLE_TYPE_OPAQUE_WIN32_BIT,
	VK_EXTERNAL_SEMAPHORE_HANDLE_TYPE_OPAQUE_WIN32_KMT_BIT_KHR = VK_EXTERNAL_SEMAPHORE_HANDLE_TYPE_OPAQUE_WIN32_KMT_BIT,
	VK_EXTERNAL_SEMAPHORE_HANDLE_TYPE_D3D12_FENCE_BIT_KHR = VK_EXTERNAL_SEMAPHORE_HANDLE_TYPE_D3D12_FENCE_BIT,
	VK_EXTERNAL_SEMAPHORE_HANDLE_TYPE_SYNC_FD_BIT_KHR = VK_EXTERNAL_SEMAPHORE_HANDLE_TYPE_SYNC_FD_BIT,
	VK_EXTERNAL_SEMAPHORE_HANDLE_TYPE_FLAG_BITS_MAX_ENUM = 0x7FFFFFFF,
}
enum VkCompositeAlphaFlagBitsKHR {
	VK_COMPOSITE_ALPHA_OPAQUE_BIT_KHR = 0x00000001,
	VK_COMPOSITE_ALPHA_PRE_MULTIPLIED_BIT_KHR = 0x00000002,
	VK_COMPOSITE_ALPHA_POST_MULTIPLIED_BIT_KHR = 0x00000004,
	VK_COMPOSITE_ALPHA_INHERIT_BIT_KHR = 0x00000008,
	VK_COMPOSITE_ALPHA_FLAG_BITS_MAX_ENUM_KHR = 0x7FFFFFFF,
}
enum VkPipelineBindPoint {
	VK_PIPELINE_BIND_POINT_GRAPHICS = 0,
	VK_PIPELINE_BIND_POINT_COMPUTE = 1,
	VK_PIPELINE_BIND_POINT_RAY_TRACING_KHR = 1000165000,
	VK_PIPELINE_BIND_POINT_RAY_TRACING_NV = VK_PIPELINE_BIND_POINT_RAY_TRACING_KHR,
	VK_PIPELINE_BIND_POINT_MAX_ENUM = 0x7FFFFFFF,
}
enum VkSharingMode {
	VK_SHARING_MODE_EXCLUSIVE = 0,
	VK_SHARING_MODE_CONCURRENT = 1,
	VK_SHARING_MODE_MAX_ENUM = 0x7FFFFFFF,
}
enum VkShaderStageFlagBits {
	VK_SHADER_STAGE_VERTEX_BIT = 0x00000001,
	VK_SHADER_STAGE_TESSELLATION_CONTROL_BIT = 0x00000002,
	VK_SHADER_STAGE_TESSELLATION_EVALUATION_BIT = 0x00000004,
	VK_SHADER_STAGE_GEOMETRY_BIT = 0x00000008,
	VK_SHADER_STAGE_FRAGMENT_BIT = 0x00000010,
	VK_SHADER_STAGE_COMPUTE_BIT = 0x00000020,
	VK_SHADER_STAGE_ALL_GRAPHICS = 0x0000001F,
	VK_SHADER_STAGE_ALL = 0x7FFFFFFF,
	VK_SHADER_STAGE_RAYGEN_BIT_KHR = 0x00000100,
	VK_SHADER_STAGE_ANY_HIT_BIT_KHR = 0x00000200,
	VK_SHADER_STAGE_CLOSEST_HIT_BIT_KHR = 0x00000400,
	VK_SHADER_STAGE_MISS_BIT_KHR = 0x00000800,
	VK_SHADER_STAGE_INTERSECTION_BIT_KHR = 0x00001000,
	VK_SHADER_STAGE_CALLABLE_BIT_KHR = 0x00002000,
	VK_SHADER_STAGE_TASK_BIT_NV = 0x00000040,
	VK_SHADER_STAGE_MESH_BIT_NV = 0x00000080,
	VK_SHADER_STAGE_RAYGEN_BIT_NV = VK_SHADER_STAGE_RAYGEN_BIT_KHR,
	VK_SHADER_STAGE_ANY_HIT_BIT_NV = VK_SHADER_STAGE_ANY_HIT_BIT_KHR,
	VK_SHADER_STAGE_CLOSEST_HIT_BIT_NV = VK_SHADER_STAGE_CLOSEST_HIT_BIT_KHR,
	VK_SHADER_STAGE_MISS_BIT_NV = VK_SHADER_STAGE_MISS_BIT_KHR,
	VK_SHADER_STAGE_INTERSECTION_BIT_NV = VK_SHADER_STAGE_INTERSECTION_BIT_KHR,
	VK_SHADER_STAGE_CALLABLE_BIT_NV = VK_SHADER_STAGE_CALLABLE_BIT_KHR,
	VK_SHADER_STAGE_FLAG_BITS_MAX_ENUM = 0x7FFFFFFF,
}
enum VkPerformanceCounterUnitKHR {
	VK_PERFORMANCE_COUNTER_UNIT_GENERIC_KHR = 0,
	VK_PERFORMANCE_COUNTER_UNIT_PERCENTAGE_KHR = 1,
	VK_PERFORMANCE_COUNTER_UNIT_NANOSECONDS_KHR = 2,
	VK_PERFORMANCE_COUNTER_UNIT_BYTES_KHR = 3,
	VK_PERFORMANCE_COUNTER_UNIT_BYTES_PER_SECOND_KHR = 4,
	VK_PERFORMANCE_COUNTER_UNIT_KELVIN_KHR = 5,
	VK_PERFORMANCE_COUNTER_UNIT_WATTS_KHR = 6,
	VK_PERFORMANCE_COUNTER_UNIT_VOLTS_KHR = 7,
	VK_PERFORMANCE_COUNTER_UNIT_AMPS_KHR = 8,
	VK_PERFORMANCE_COUNTER_UNIT_HERTZ_KHR = 9,
	VK_PERFORMANCE_COUNTER_UNIT_CYCLES_KHR = 10,
	VK_PERFORMANCE_COUNTER_UNIT_MAX_ENUM_KHR = 0x7FFFFFFF,
}
enum VkGeometryTypeKHR {
	VK_GEOMETRY_TYPE_TRIANGLES_KHR = 0,
	VK_GEOMETRY_TYPE_AABBS_KHR = 1,
	VK_GEOMETRY_TYPE_INSTANCES_KHR = 1000150000,
	VK_GEOMETRY_TYPE_TRIANGLES_NV = VK_GEOMETRY_TYPE_TRIANGLES_KHR,
	VK_GEOMETRY_TYPE_AABBS_NV = VK_GEOMETRY_TYPE_AABBS_KHR,
	VK_GEOMETRY_TYPE_MAX_ENUM_KHR = 0x7FFFFFFF,
}
enum VkInternalAllocationType {
	VK_INTERNAL_ALLOCATION_TYPE_EXECUTABLE = 0,
	VK_INTERNAL_ALLOCATION_TYPE_MAX_ENUM = 0x7FFFFFFF,
}
enum VkScopeNV {
	VK_SCOPE_DEVICE_NV = 1,
	VK_SCOPE_WORKGROUP_NV = 2,
	VK_SCOPE_SUBGROUP_NV = 3,
	VK_SCOPE_QUEUE_FAMILY_NV = 5,
	VK_SCOPE_MAX_ENUM_NV = 0x7FFFFFFF,
}
enum VkAttachmentStoreOp {
	VK_ATTACHMENT_STORE_OP_STORE = 0,
	VK_ATTACHMENT_STORE_OP_DONT_CARE = 1,
	VK_ATTACHMENT_STORE_OP_NONE_QCOM = 1000301000,
	VK_ATTACHMENT_STORE_OP_MAX_ENUM = 0x7FFFFFFF,
}
enum VkImageType {
	VK_IMAGE_TYPE_1D = 0,
	VK_IMAGE_TYPE_2D = 1,
	VK_IMAGE_TYPE_3D = 2,
	VK_IMAGE_TYPE_MAX_ENUM = 0x7FFFFFFF,
}
enum VkCommandBufferLevel {
	VK_COMMAND_BUFFER_LEVEL_PRIMARY = 0,
	VK_COMMAND_BUFFER_LEVEL_SECONDARY = 1,
	VK_COMMAND_BUFFER_LEVEL_MAX_ENUM = 0x7FFFFFFF,
}
enum VkTimeDomainEXT {
	VK_TIME_DOMAIN_DEVICE_EXT = 0,
	VK_TIME_DOMAIN_CLOCK_MONOTONIC_EXT = 1,
	VK_TIME_DOMAIN_CLOCK_MONOTONIC_RAW_EXT = 2,
	VK_TIME_DOMAIN_QUERY_PERFORMANCE_COUNTER_EXT = 3,
	VK_TIME_DOMAIN_MAX_ENUM_EXT = 0x7FFFFFFF,
}
enum VkPrimitiveTopology {
	VK_PRIMITIVE_TOPOLOGY_POINT_LIST = 0,
	VK_PRIMITIVE_TOPOLOGY_LINE_LIST = 1,
	VK_PRIMITIVE_TOPOLOGY_LINE_STRIP = 2,
	VK_PRIMITIVE_TOPOLOGY_TRIANGLE_LIST = 3,
	VK_PRIMITIVE_TOPOLOGY_TRIANGLE_STRIP = 4,
	VK_PRIMITIVE_TOPOLOGY_TRIANGLE_FAN = 5,
	VK_PRIMITIVE_TOPOLOGY_LINE_LIST_WITH_ADJACENCY = 6,
	VK_PRIMITIVE_TOPOLOGY_LINE_STRIP_WITH_ADJACENCY = 7,
	VK_PRIMITIVE_TOPOLOGY_TRIANGLE_LIST_WITH_ADJACENCY = 8,
	VK_PRIMITIVE_TOPOLOGY_TRIANGLE_STRIP_WITH_ADJACENCY = 9,
	VK_PRIMITIVE_TOPOLOGY_PATCH_LIST = 10,
	VK_PRIMITIVE_TOPOLOGY_MAX_ENUM = 0x7FFFFFFF,
}
enum VkSamplerAddressMode {
	VK_SAMPLER_ADDRESS_MODE_REPEAT = 0,
	VK_SAMPLER_ADDRESS_MODE_MIRRORED_REPEAT = 1,
	VK_SAMPLER_ADDRESS_MODE_CLAMP_TO_EDGE = 2,
	VK_SAMPLER_ADDRESS_MODE_CLAMP_TO_BORDER = 3,
	VK_SAMPLER_ADDRESS_MODE_MIRROR_CLAMP_TO_EDGE = 4,
	VK_SAMPLER_ADDRESS_MODE_MIRROR_CLAMP_TO_EDGE_KHR = VK_SAMPLER_ADDRESS_MODE_MIRROR_CLAMP_TO_EDGE,
	VK_SAMPLER_ADDRESS_MODE_MAX_ENUM = 0x7FFFFFFF,
}

struct VkPhysicalDeviceGroupProperties {
	VkStructureType sType;
	void* pNext;
	uint32_t physicalDeviceCount;
	VkPhysicalDevice[32] physicalDevices;
	VkBool32 subsetAllocation;
}
struct VkCopyDescriptorSet {
	VkStructureType sType;
	void* pNext;
	VkDescriptorSet srcSet;
	uint32_t srcBinding;
	uint32_t srcArrayElement;
	VkDescriptorSet dstSet;
	uint32_t dstBinding;
	uint32_t dstArrayElement;
	uint32_t descriptorCount;
}
struct VkPipelineExecutableInfoKHR {
	VkStructureType sType;
	void* pNext;
	VkPipeline pipeline;
	uint32_t executableIndex;
}
struct VkDebugUtilsMessengerEXT_T {
}
struct VkSampleLocationsInfoEXT {
	VkStructureType sType;
	void* pNext;
	VkSampleCountFlagBits sampleLocationsPerPixel;
	VkExtent2D sampleLocationGridSize;
	uint32_t sampleLocationsCount;
	VkSampleLocationEXT* pSampleLocations;
}
struct VkDisplayPlaneInfo2KHR {
	VkStructureType sType;
	void* pNext;
	VkDisplayModeKHR mode;
	uint32_t planeIndex;
}
struct VkImageFormatProperties2 {
	VkStructureType sType;
	void* pNext;
	VkImageFormatProperties imageFormatProperties;
}
struct VkMemoryHostPointerPropertiesEXT {
	VkStructureType sType;
	void* pNext;
	uint32_t memoryTypeBits;
}
struct VkImageViewCreateInfo {
	VkStructureType sType;
	void* pNext;
	VkImageViewCreateFlags flags;
	VkImage image;
	VkImageViewType viewType;
	VkFormat format;
	VkComponentMapping components;
	VkImageSubresourceRange subresourceRange;
}
struct VkShaderModule_T {
}
struct VkDisplayPropertiesKHR {
	VkDisplayKHR display;
	byte* displayName;
	VkExtent2D physicalDimensions;
	VkExtent2D physicalResolution;
	VkSurfaceTransformFlagsKHR supportedTransforms;
	VkBool32 planeReorderPossible;
	VkBool32 persistentContent;
}
struct VkImageSparseMemoryRequirementsInfo2 {
	VkStructureType sType;
	void* pNext;
	VkImage image;
}
struct VkDeviceMemory_T {
}
struct VkBuffer_T {
}
struct VkCheckpointDataNV {
	VkStructureType sType;
	void* pNext;
	VkPipelineStageFlagBits stage;
	void* pCheckpointMarker;
}
struct VkPresentInfoKHR {
	VkStructureType sType;
	void* pNext;
	uint32_t waitSemaphoreCount;
	VkSemaphore* pWaitSemaphores;
	uint32_t swapchainCount;
	VkSwapchainKHR* pSwapchains;
	uint32_t* pImageIndices;
	VkResult* pResults;
}
struct VkQueueFamilyProperties {
	VkQueueFlags queueFlags;
	uint32_t queueCount;
	uint32_t timestampValidBits;
	VkExtent3D minImageTransferGranularity;
}
struct VkCommandPool_T {
}
struct VkSampleLocationEXT {
	float x;
	float y;
}
struct VkViewport {
	float x;
	float y;
	float width;
	float height;
	float minDepth;
	float maxDepth;
}
struct VkCooperativeMatrixPropertiesNV {
	VkStructureType sType;
	void* pNext;
	uint32_t MSize;
	uint32_t NSize;
	uint32_t KSize;
	VkComponentTypeNV AType;
	VkComponentTypeNV BType;
	VkComponentTypeNV CType;
	VkComponentTypeNV DType;
	VkScopeNV scope_;
}
struct VkDescriptorUpdateTemplateCreateInfo {
	VkStructureType sType;
	void* pNext;
	VkDescriptorUpdateTemplateCreateFlags flags;
	uint32_t descriptorUpdateEntryCount;
	VkDescriptorUpdateTemplateEntry* pDescriptorUpdateEntries;
	VkDescriptorUpdateTemplateType templateType;
	VkDescriptorSetLayout descriptorSetLayout;
	VkPipelineBindPoint pipelineBindPoint;
	VkPipelineLayout pipelineLayout;
	uint32_t set;
}
struct VkMultisamplePropertiesEXT {
	VkStructureType sType;
	void* pNext;
	VkExtent2D maxSampleLocationGridSize;
}
struct VkDebugUtilsLabelEXT {
	VkStructureType sType;
	void* pNext;
	byte* pLabelName;
	float[4] color;
}
struct VkMemoryBarrier {
	VkStructureType sType;
	void* pNext;
	VkAccessFlags srcAccessMask;
	VkAccessFlags dstAccessMask;
}
struct VkPipelineColorBlendStateCreateInfo {
	VkStructureType sType;
	void* pNext;
	VkPipelineColorBlendStateCreateFlags flags;
	VkBool32 logicOpEnable;
	VkLogicOp logicOp;
	uint32_t attachmentCount;
	VkPipelineColorBlendAttachmentState* pAttachments;
	float[4] blendConstants;
}
struct VkCommandBufferInheritanceInfo {
	VkStructureType sType;
	void* pNext;
	VkRenderPass renderPass;
	uint32_t subpass;
	VkFramebuffer framebuffer;
	VkBool32 occlusionQueryEnable;
	VkQueryControlFlags queryFlags;
	VkQueryPipelineStatisticFlags pipelineStatistics;
}
struct VkSemaphoreGetWin32HandleInfoKHR {
	VkStructureType sType;
	void* pNext;
	VkSemaphore semaphore;
	VkExternalSemaphoreHandleTypeFlagBits handleType;
}
struct VkMemoryGetWin32HandleInfoKHR {
	VkStructureType sType;
	void* pNext;
	VkDeviceMemory memory;
	VkExternalMemoryHandleTypeFlagBits handleType;
}
struct VkDeviceGroupPresentCapabilitiesKHR {
	VkStructureType sType;
	void* pNext;
	uint32_t[32] presentMask;
	VkDeviceGroupPresentModeFlagsKHR modes;
}
struct VkPipeline_T {
}
struct VkSparseImageFormatProperties {
	VkImageAspectFlags aspectMask;
	VkExtent3D imageGranularity;
	VkSparseImageFormatFlags flags;
}
struct VkImageMemoryRequirementsInfo2 {
	VkStructureType sType;
	void* pNext;
	VkImage image;
}
struct VkPhysicalDeviceMemoryProperties2 {
	VkStructureType sType;
	void* pNext;
	VkPhysicalDeviceMemoryProperties memoryProperties;
}
struct VkQueryPoolPerformanceCreateInfoKHR {
	VkStructureType sType;
	void* pNext;
	uint32_t queueFamilyIndex;
	uint32_t counterIndexCount;
	uint32_t* pCounterIndices;
}
struct VkExternalImageFormatPropertiesNV {
	VkImageFormatProperties imageFormatProperties;
	VkExternalMemoryFeatureFlagsNV externalMemoryFeatures;
	VkExternalMemoryHandleTypeFlagsNV exportFromImportedHandleTypes;
	VkExternalMemoryHandleTypeFlagsNV compatibleHandleTypes;
}
struct VkGeometryTrianglesNV {
	VkStructureType sType;
	void* pNext;
	VkBuffer vertexData;
	VkDeviceSize vertexOffset;
	uint32_t vertexCount;
	VkDeviceSize vertexStride;
	VkFormat vertexFormat;
	VkBuffer indexData;
	VkDeviceSize indexOffset;
	uint32_t indexCount;
	VkIndexType indexType;
	VkBuffer transformData;
	VkDeviceSize transformOffset;
}
struct VkDisplayPlaneCapabilitiesKHR {
	VkDisplayPlaneAlphaFlagsKHR supportedAlpha;
	VkOffset2D minSrcPosition;
	VkOffset2D maxSrcPosition;
	VkExtent2D minSrcExtent;
	VkExtent2D maxSrcExtent;
	VkOffset2D minDstPosition;
	VkOffset2D maxDstPosition;
	VkExtent2D minDstExtent;
	VkExtent2D maxDstExtent;
}
struct VkExternalBufferProperties {
	VkStructureType sType;
	void* pNext;
	VkExternalMemoryProperties externalMemoryProperties;
}
struct VkImportFenceFdInfoKHR {
	VkStructureType sType;
	void* pNext;
	VkFence fence;
	VkFenceImportFlags flags;
	VkExternalFenceHandleTypeFlagBits handleType;
	int fd;
}
struct VkFramebufferMixedSamplesCombinationNV {
	VkStructureType sType;
	void* pNext;
	VkCoverageReductionModeNV coverageReductionMode;
	VkSampleCountFlagBits rasterizationSamples;
	VkSampleCountFlags depthStencilSamples;
	VkSampleCountFlags colorSamples;
}
struct VkExternalFenceProperties {
	VkStructureType sType;
	void* pNext;
	VkExternalFenceHandleTypeFlags exportFromImportedHandleTypes;
	VkExternalFenceHandleTypeFlags compatibleHandleTypes;
	VkExternalFenceFeatureFlags externalFenceFeatures;
}
struct VkInstance_T {
}
struct VkSpecializationInfo {
	uint32_t mapEntryCount;
	VkSpecializationMapEntry* pMapEntries;
	size_t dataSize;
	void* pData;
}
struct VkPipelineExecutablePropertiesKHR {
	VkStructureType sType;
	void* pNext;
	VkShaderStageFlags stages;
	byte[256] name;
	byte[256] description;
	uint32_t subgroupSize;
}
struct VkConditionalRenderingBeginInfoEXT {
	VkStructureType sType;
	void* pNext;
	VkBuffer buffer;
	VkDeviceSize offset;
	VkConditionalRenderingFlagsEXT flags;
}
struct VkGraphicsPipelineCreateInfo {
	VkStructureType sType;
	void* pNext;
	VkPipelineCreateFlags flags;
	uint32_t stageCount;
	VkPipelineShaderStageCreateInfo* pStages;
	VkPipelineVertexInputStateCreateInfo* pVertexInputState;
	VkPipelineInputAssemblyStateCreateInfo* pInputAssemblyState;
	VkPipelineTessellationStateCreateInfo* pTessellationState;
	VkPipelineViewportStateCreateInfo* pViewportState;
	VkPipelineRasterizationStateCreateInfo* pRasterizationState;
	VkPipelineMultisampleStateCreateInfo* pMultisampleState;
	VkPipelineDepthStencilStateCreateInfo* pDepthStencilState;
	VkPipelineColorBlendStateCreateInfo* pColorBlendState;
	VkPipelineDynamicStateCreateInfo* pDynamicState;
	VkPipelineLayout layout;
	VkRenderPass renderPass;
	uint32_t subpass;
	VkPipeline basePipelineHandle;
	int32_t basePipelineIndex;
}
struct VkGeometryNV {
	VkStructureType sType;
	void* pNext;
	VkGeometryTypeKHR geometryType;
	VkGeometryDataNV geometry;
	VkGeometryFlagsKHR flags;
}
struct VkPerformanceValueINTEL {
	VkPerformanceValueTypeINTEL type;
	VkPerformanceValueDataINTEL data;
}
struct VkImage_T {
}
struct VkClearRect {
	VkRect2D rect;
	uint32_t baseArrayLayer;
	uint32_t layerCount;
}
struct VkDevice_T {
}
struct VkDebugReportCallbackCreateInfoEXT {
	VkStructureType sType;
	void* pNext;
	VkDebugReportFlagsEXT flags;
	PFN_vkDebugReportCallbackEXT pfnCallback;
	void* pUserData;
}
struct VkSemaphoreGetFdInfoKHR {
	VkStructureType sType;
	void* pNext;
	VkSemaphore semaphore;
	VkExternalSemaphoreHandleTypeFlagBits handleType;
}
struct VkPhysicalDeviceSparseProperties {
	VkBool32 residencyStandard2DBlockShape;
	VkBool32 residencyStandard2DMultisampleBlockShape;
	VkBool32 residencyStandard3DBlockShape;
	VkBool32 residencyAlignedMipSize;
	VkBool32 residencyNonResidentStrict;
}
struct VkPipelineColorBlendAttachmentState {
	VkBool32 blendEnable;
	VkBlendFactor srcColorBlendFactor;
	VkBlendFactor dstColorBlendFactor;
	VkBlendOp colorBlendOp;
	VkBlendFactor srcAlphaBlendFactor;
	VkBlendFactor dstAlphaBlendFactor;
	VkBlendOp alphaBlendOp;
	VkColorComponentFlags colorWriteMask;
}
struct VkPerformanceConfigurationAcquireInfoINTEL {
	VkStructureType sType;
	void* pNext;
	VkPerformanceConfigurationTypeINTEL type;
}
struct VkSubpassDependency {
	uint32_t srcSubpass;
	uint32_t dstSubpass;
	VkPipelineStageFlags srcStageMask;
	VkPipelineStageFlags dstStageMask;
	VkAccessFlags srcAccessMask;
	VkAccessFlags dstAccessMask;
	VkDependencyFlags dependencyFlags;
}
struct VkSparseImageMemoryRequirements2 {
	VkStructureType sType;
	void* pNext;
	VkSparseImageMemoryRequirements memoryRequirements;
}
struct VkDescriptorSetLayoutBinding {
	uint32_t binding;
	VkDescriptorType descriptorType;
	uint32_t descriptorCount;
	VkShaderStageFlags stageFlags;
	VkSampler* pImmutableSamplers;
}
struct VkViewportWScalingNV {
	float xcoeff;
	float ycoeff;
}
struct VkSparseImageMemoryRequirements {
	VkSparseImageFormatProperties formatProperties;
	uint32_t imageMipTailFirstLod;
	VkDeviceSize imageMipTailSize;
	VkDeviceSize imageMipTailOffset;
	VkDeviceSize imageMipTailStride;
}
struct VkDisplayProperties2KHR {
	VkStructureType sType;
	void* pNext;
	VkDisplayPropertiesKHR displayProperties;
}
struct VkDescriptorImageInfo {
	VkSampler sampler;
	VkImageView imageView;
	VkImageLayout imageLayout;
}
struct VkImageFormatProperties {
	VkExtent3D maxExtent;
	uint32_t maxMipLevels;
	uint32_t maxArrayLayers;
	VkSampleCountFlags sampleCounts;
	VkDeviceSize maxResourceSize;
}
struct VkAttachmentReference2 {
	VkStructureType sType;
	void* pNext;
	uint32_t attachment;
	VkImageLayout layout;
	VkImageAspectFlags aspectMask;
}
struct VkBufferView_T {
}
struct VkPipelineInputAssemblyStateCreateInfo {
	VkStructureType sType;
	void* pNext;
	VkPipelineInputAssemblyStateCreateFlags flags;
	VkPrimitiveTopology topology;
	VkBool32 primitiveRestartEnable;
}
struct VkDescriptorSet_T {
}
struct VkAllocationCallbacks {
	void* pUserData;
	PFN_vkAllocationFunction pfnAllocation;
	PFN_vkReallocationFunction pfnReallocation;
	PFN_vkFreeFunction pfnFree;
	PFN_vkInternalAllocationNotification pfnInternalAllocation;
	PFN_vkInternalFreeNotification pfnInternalFree;
}
struct VkPhysicalDeviceMemoryProperties {
	uint32_t memoryTypeCount;
	VkMemoryType[32] memoryTypes;
	uint32_t memoryHeapCount;
	VkMemoryHeap[16] memoryHeaps;
}
struct VkMemoryFdPropertiesKHR {
	VkStructureType sType;
	void* pNext;
	uint32_t memoryTypeBits;
}
struct VkPhysicalDeviceExternalFenceInfo {
	VkStructureType sType;
	void* pNext;
	VkExternalFenceHandleTypeFlagBits handleType;
}
struct VkSemaphoreSignalInfo {
	VkStructureType sType;
	void* pNext;
	VkSemaphore semaphore;
	uint64_t value;
}
struct VkDescriptorPoolCreateInfo {
	VkStructureType sType;
	void* pNext;
	VkDescriptorPoolCreateFlags flags;
	uint32_t maxSets;
	uint32_t poolSizeCount;
	VkDescriptorPoolSize* pPoolSizes;
}
struct VkImportFenceWin32HandleInfoKHR {
	VkStructureType sType;
	void* pNext;
	VkFence fence;
	VkFenceImportFlags flags;
	VkExternalFenceHandleTypeFlagBits handleType;
	HANDLE handle;
	LPCWSTR name;
}
struct VkDisplayModePropertiesKHR {
	VkDisplayModeKHR displayMode;
	VkDisplayModeParametersKHR parameters;
}
struct VkShadingRatePaletteNV {
	uint32_t shadingRatePaletteEntryCount;
	VkShadingRatePaletteEntryNV* pShadingRatePaletteEntries;
}
struct VkPipelineExecutableInternalRepresentationKHR {
	VkStructureType sType;
	void* pNext;
	byte[256] name;
	byte[256] description;
	VkBool32 isText;
	size_t dataSize;
	void* pData;
}
struct VkImageViewHandleInfoNVX {
	VkStructureType sType;
	void* pNext;
	VkImageView imageView;
	VkDescriptorType descriptorType;
	VkSampler sampler;
}
struct VkMemoryWin32HandlePropertiesKHR {
	VkStructureType sType;
	void* pNext;
	uint32_t memoryTypeBits;
}
struct VkSampler_T {
}
struct VkSubmitInfo {
	VkStructureType sType;
	void* pNext;
	uint32_t waitSemaphoreCount;
	VkSemaphore* pWaitSemaphores;
	VkPipelineStageFlags* pWaitDstStageMask;
	uint32_t commandBufferCount;
	VkCommandBuffer* pCommandBuffers;
	uint32_t signalSemaphoreCount;
	VkSemaphore* pSignalSemaphores;
}
struct VkValidationCacheEXT_T {
}
struct VkOffset2D {
	int32_t x;
	int32_t y;
}
struct VkImageViewAddressPropertiesNVX {
	VkStructureType sType;
	void* pNext;
	VkDeviceAddress deviceAddress;
	VkDeviceSize size;
}
struct VkSurfaceCapabilitiesKHR {
	uint32_t minImageCount;
	uint32_t maxImageCount;
	VkExtent2D currentExtent;
	VkExtent2D minImageExtent;
	VkExtent2D maxImageExtent;
	uint32_t maxImageArrayLayers;
	VkSurfaceTransformFlagsKHR supportedTransforms;
	VkSurfaceTransformFlagBitsKHR currentTransform;
	VkCompositeAlphaFlagsKHR supportedCompositeAlpha;
	VkImageUsageFlags supportedUsageFlags;
}
struct VkShaderModuleCreateInfo {
	VkStructureType sType;
	void* pNext;
	VkShaderModuleCreateFlags flags;
	size_t codeSize;
	uint32_t* pCode;
}
struct VkSparseImageOpaqueMemoryBindInfo {
	VkImage image;
	uint32_t bindCount;
	VkSparseMemoryBind* pBinds;
}
struct VkPerformanceStreamMarkerInfoINTEL {
	VkStructureType sType;
	void* pNext;
	uint32_t marker;
}
struct VkInitializePerformanceApiInfoINTEL {
	VkStructureType sType;
	void* pNext;
	void* pUserData;
}
struct VkSpecializationMapEntry {
	uint32_t constantID;
	uint32_t offset;
	size_t size;
}
struct VkDeviceEventInfoEXT {
	VkStructureType sType;
	void* pNext;
	VkDeviceEventTypeEXT deviceEvent;
}
struct VkSemaphoreCreateInfo {
	VkStructureType sType;
	void* pNext;
	VkSemaphoreCreateFlags flags;
}
struct VkAccelerationStructureInfoNV {
	VkStructureType sType;
	void* pNext;
	VkAccelerationStructureTypeNV type;
	VkBuildAccelerationStructureFlagsNV flags;
	uint32_t instanceCount;
	uint32_t geometryCount;
	VkGeometryNV* pGeometries;
}
struct VkIndirectCommandsLayoutNV_T {
}
struct VkAcquireProfilingLockInfoKHR {
	VkStructureType sType;
	void* pNext;
	VkAcquireProfilingLockFlagsKHR flags;
	uint64_t timeout;
}
struct VkBufferMemoryRequirementsInfo2 {
	VkStructureType sType;
	void* pNext;
	VkBuffer buffer;
}
struct VkGeometryAABBNV {
	VkStructureType sType;
	void* pNext;
	VkBuffer aabbData;
	uint32_t numAABBs;
	uint32_t stride;
	VkDeviceSize offset;
}
struct VkApplicationInfo {
	VkStructureType sType;
	void* pNext;
	byte* pApplicationName;
	uint32_t applicationVersion;
	byte* pEngineName;
	uint32_t engineVersion;
	uint32_t apiVersion;
}
struct VkBindSparseInfo {
	VkStructureType sType;
	void* pNext;
	uint32_t waitSemaphoreCount;
	VkSemaphore* pWaitSemaphores;
	uint32_t bufferBindCount;
	VkSparseBufferMemoryBindInfo* pBufferBinds;
	uint32_t imageOpaqueBindCount;
	VkSparseImageOpaqueMemoryBindInfo* pImageOpaqueBinds;
	uint32_t imageBindCount;
	VkSparseImageMemoryBindInfo* pImageBinds;
	uint32_t signalSemaphoreCount;
	VkSemaphore* pSignalSemaphores;
}
struct VkPipelineCache_T {
}
struct VkSubresourceLayout {
	VkDeviceSize offset;
	VkDeviceSize size;
	VkDeviceSize rowPitch;
	VkDeviceSize arrayPitch;
	VkDeviceSize depthPitch;
}
struct VkDescriptorPoolSize {
	VkDescriptorType type;
	uint32_t descriptorCount;
}
struct VkBufferViewCreateInfo {
	VkStructureType sType;
	void* pNext;
	VkBufferViewCreateFlags flags;
	VkBuffer buffer;
	VkFormat format;
	VkDeviceSize offset;
	VkDeviceSize range;
}
struct VkDebugReportCallbackEXT_T {
}
struct VkPipelineInfoKHR {
	VkStructureType sType;
	void* pNext;
	VkPipeline pipeline;
}
struct VkPipelineShaderStageCreateInfo {
	VkStructureType sType;
	void* pNext;
	VkPipelineShaderStageCreateFlags flags;
	VkShaderStageFlagBits stage;
	VkShaderModule module_;
	byte* pName;
	VkSpecializationInfo* pSpecializationInfo;
}
struct VkVertexInputBindingDescription {
	uint32_t binding;
	uint32_t stride;
	VkVertexInputRate inputRate;
}
struct VkPhysicalDeviceFeatures2 {
	VkStructureType sType;
	void* pNext;
	VkPhysicalDeviceFeatures features;
}
struct VkImageDrmFormatModifierPropertiesEXT {
	VkStructureType sType;
	void* pNext;
	uint64_t drmFormatModifier;
}
struct HWND__ {
	int unused;
}
struct VkImageMemoryBarrier {
	VkStructureType sType;
	void* pNext;
	VkAccessFlags srcAccessMask;
	VkAccessFlags dstAccessMask;
	VkImageLayout oldLayout;
	VkImageLayout newLayout;
	uint32_t srcQueueFamilyIndex;
	uint32_t dstQueueFamilyIndex;
	VkImage image;
	VkImageSubresourceRange subresourceRange;
}
struct VkPipelineLayout_T {
}
struct VkDisplayPlaneProperties2KHR {
	VkStructureType sType;
	void* pNext;
	VkDisplayPlanePropertiesKHR displayPlaneProperties;
}
struct VkBindBufferMemoryInfo {
	VkStructureType sType;
	void* pNext;
	VkBuffer buffer;
	VkDeviceMemory memory;
	VkDeviceSize memoryOffset;
}
struct VkDeviceQueueCreateInfo {
	VkStructureType sType;
	void* pNext;
	VkDeviceQueueCreateFlags flags;
	uint32_t queueFamilyIndex;
	uint32_t queueCount;
	float* pQueuePriorities;
}
struct VkRenderPassCreateInfo {
	VkStructureType sType;
	void* pNext;
	VkRenderPassCreateFlags flags;
	uint32_t attachmentCount;
	VkAttachmentDescription* pAttachments;
	uint32_t subpassCount;
	VkSubpassDescription* pSubpasses;
	uint32_t dependencyCount;
	VkSubpassDependency* pDependencies;
}
struct VkSurfaceKHR_T {
}
struct VkImageSubresourceRange {
	VkImageAspectFlags aspectMask;
	uint32_t baseMipLevel;
	uint32_t levelCount;
	uint32_t baseArrayLayer;
	uint32_t layerCount;
}
struct VkDescriptorBufferInfo {
	VkBuffer buffer;
	VkDeviceSize offset;
	VkDeviceSize range;
}
struct VkFramebuffer_T {
}
struct VkSparseImageMemoryBindInfo {
	VkImage image;
	uint32_t bindCount;
	VkSparseImageMemoryBind* pBinds;
}
struct VkWin32SurfaceCreateInfoKHR {
	VkStructureType sType;
	void* pNext;
	VkWin32SurfaceCreateFlagsKHR flags;
	HINSTANCE hinstance;
	HWND hwnd;
}
struct VkCalibratedTimestampInfoEXT {
	VkStructureType sType;
	void* pNext;
	VkTimeDomainEXT timeDomain;
}
struct VkImageBlit {
	VkImageSubresourceLayers srcSubresource;
	VkOffset3D[2] srcOffsets;
	VkImageSubresourceLayers dstSubresource;
	VkOffset3D[2] dstOffsets;
}
struct VkPhysicalDeviceImageFormatInfo2 {
	VkStructureType sType;
	void* pNext;
	VkFormat format;
	VkImageType type;
	VkImageTiling tiling;
	VkImageUsageFlags usage;
	VkImageCreateFlags flags;
}
struct VkVertexInputAttributeDescription {
	uint32_t location;
	uint32_t binding;
	VkFormat format;
	uint32_t offset;
}
struct VkImportSemaphoreFdInfoKHR {
	VkStructureType sType;
	void* pNext;
	VkSemaphore semaphore;
	VkSemaphoreImportFlags flags;
	VkExternalSemaphoreHandleTypeFlagBits handleType;
	int fd;
}
struct VkIndirectCommandsStreamNV {
	VkBuffer buffer;
	VkDeviceSize offset;
}
struct VkDisplayKHR_T {
}
struct VkPipelineTessellationStateCreateInfo {
	VkStructureType sType;
	void* pNext;
	VkPipelineTessellationStateCreateFlags flags;
	uint32_t patchControlPoints;
}
struct VkXYColorEXT {
	float x;
	float y;
}
struct VkBufferCopy {
	VkDeviceSize srcOffset;
	VkDeviceSize dstOffset;
	VkDeviceSize size;
}
struct VkPhysicalDeviceToolPropertiesEXT {
	VkStructureType sType;
	void* pNext;
	byte[256] name;
	byte[256] version_;
	VkToolPurposeFlagsEXT purposes;
	byte[256] description;
	byte[256] layer;
}
struct VkPipelineLayoutCreateInfo {
	VkStructureType sType;
	void* pNext;
	VkPipelineLayoutCreateFlags flags;
	uint32_t setLayoutCount;
	VkDescriptorSetLayout* pSetLayouts;
	uint32_t pushConstantRangeCount;
	VkPushConstantRange* pPushConstantRanges;
}
struct VkInstanceCreateInfo {
	VkStructureType sType;
	void* pNext;
	VkInstanceCreateFlags flags;
	VkApplicationInfo* pApplicationInfo;
	uint32_t enabledLayerCount;
	byte** ppEnabledLayerNames;
	uint32_t enabledExtensionCount;
	byte** ppEnabledExtensionNames;
}
struct VkDisplayEventInfoEXT {
	VkStructureType sType;
	void* pNext;
	VkDisplayEventTypeEXT displayEvent;
}
struct VkBufferMemoryBarrier {
	VkStructureType sType;
	void* pNext;
	VkAccessFlags srcAccessMask;
	VkAccessFlags dstAccessMask;
	uint32_t srcQueueFamilyIndex;
	uint32_t dstQueueFamilyIndex;
	VkBuffer buffer;
	VkDeviceSize offset;
	VkDeviceSize size;
}
struct VkMappedMemoryRange {
	VkStructureType sType;
	void* pNext;
	VkDeviceMemory memory;
	VkDeviceSize offset;
	VkDeviceSize size;
}
struct VkRefreshCycleDurationGOOGLE {
	uint64_t refreshDuration;
}
struct VkAccelerationStructureKHR_T {
}
struct VkSparseImageMemoryBind {
	VkImageSubresource subresource;
	VkOffset3D offset;
	VkExtent3D extent;
	VkDeviceMemory memory;
	VkDeviceSize memoryOffset;
	VkSparseMemoryBindFlags flags;
}
struct VkClearAttachment {
	VkImageAspectFlags aspectMask;
	uint32_t colorAttachment;
	VkClearValue clearValue;
}
struct VkImageSubresource {
	VkImageAspectFlags aspectMask;
	uint32_t mipLevel;
	uint32_t arrayLayer;
}
struct VkRenderPassBeginInfo {
	VkStructureType sType;
	void* pNext;
	VkRenderPass renderPass;
	VkFramebuffer framebuffer;
	VkRect2D renderArea;
	uint32_t clearValueCount;
	VkClearValue* pClearValues;
}
struct VkSwapchainCreateInfoKHR {
	VkStructureType sType;
	void* pNext;
	VkSwapchainCreateFlagsKHR flags;
	VkSurfaceKHR surface;
	uint32_t minImageCount;
	VkFormat imageFormat;
	VkColorSpaceKHR imageColorSpace;
	VkExtent2D imageExtent;
	uint32_t imageArrayLayers;
	VkImageUsageFlags imageUsage;
	VkSharingMode imageSharingMode;
	uint32_t queueFamilyIndexCount;
	uint32_t* pQueueFamilyIndices;
	VkSurfaceTransformFlagBitsKHR preTransform;
	VkCompositeAlphaFlagBitsKHR compositeAlpha;
	VkPresentModeKHR presentMode;
	VkBool32 clipped;
	VkSwapchainKHR oldSwapchain;
}
struct VkSurfaceFormat2KHR {
	VkStructureType sType;
	void* pNext;
	VkSurfaceFormatKHR surfaceFormat;
}
struct VkSamplerYcbcrConversionCreateInfo {
	VkStructureType sType;
	void* pNext;
	VkFormat format;
	VkSamplerYcbcrModelConversion ycbcrModel;
	VkSamplerYcbcrRange ycbcrRange;
	VkComponentMapping components;
	VkChromaLocation xChromaOffset;
	VkChromaLocation yChromaOffset;
	VkFilter chromaFilter;
	VkBool32 forceExplicitReconstruction;
}
struct VkDisplayPlanePropertiesKHR {
	VkDisplayKHR currentDisplay;
	uint32_t currentStackIndex;
}
struct VkPipelineDepthStencilStateCreateInfo {
	VkStructureType sType;
	void* pNext;
	VkPipelineDepthStencilStateCreateFlags flags;
	VkBool32 depthTestEnable;
	VkBool32 depthWriteEnable;
	VkCompareOp depthCompareOp;
	VkBool32 depthBoundsTestEnable;
	VkBool32 stencilTestEnable;
	VkStencilOpState front;
	VkStencilOpState back;
	float minDepthBounds;
	float maxDepthBounds;
}
struct VkSwapchainKHR_T {
}
struct VkPerformanceCounterKHR {
	VkStructureType sType;
	void* pNext;
	VkPerformanceCounterUnitKHR unit;
	VkPerformanceCounterScopeKHR scope_;
	VkPerformanceCounterStorageKHR storage;
	uint8_t[16] uuid;
}
struct VkFenceGetWin32HandleInfoKHR {
	VkStructureType sType;
	void* pNext;
	VkFence fence;
	VkExternalFenceHandleTypeFlagBits handleType;
}
struct VkPrivateDataSlotCreateInfoEXT {
	VkStructureType sType;
	void* pNext;
	VkPrivateDataSlotCreateFlagsEXT flags;
}
struct VkComputePipelineCreateInfo {
	VkStructureType sType;
	void* pNext;
	VkPipelineCreateFlags flags;
	VkPipelineShaderStageCreateInfo stage;
	VkPipelineLayout layout;
	VkPipeline basePipelineHandle;
	int32_t basePipelineIndex;
}
struct VkHdrMetadataEXT {
	VkStructureType sType;
	void* pNext;
	VkXYColorEXT displayPrimaryRed;
	VkXYColorEXT displayPrimaryGreen;
	VkXYColorEXT displayPrimaryBlue;
	VkXYColorEXT whitePoint;
	float maxLuminance;
	float minLuminance;
	float maxContentLightLevel;
	float maxFrameAverageLightLevel;
}
struct VkDeviceQueueInfo2 {
	VkStructureType sType;
	void* pNext;
	VkDeviceQueueCreateFlags flags;
	uint32_t queueFamilyIndex;
	uint32_t queueIndex;
}
struct VkPerformanceCounterDescriptionKHR {
	VkStructureType sType;
	void* pNext;
	VkPerformanceCounterDescriptionFlagsKHR flags;
	byte[256] name;
	byte[256] category;
	byte[256] description;
}
struct VkCoarseSampleOrderCustomNV {
	VkShadingRatePaletteEntryNV shadingRate;
	uint32_t sampleCount;
	uint32_t sampleLocationCount;
	VkCoarseSampleLocationNV* pSampleLocations;
}
struct VkSparseBufferMemoryBindInfo {
	VkBuffer buffer;
	uint32_t bindCount;
	VkSparseMemoryBind* pBinds;
}
struct VkLayerProperties {
	byte[256] layerName;
	uint32_t specVersion;
	uint32_t implementationVersion;
	byte[256] description;
}
struct VkFormatProperties {
	VkFormatFeatureFlags linearTilingFeatures;
	VkFormatFeatureFlags optimalTilingFeatures;
	VkFormatFeatureFlags bufferFeatures;
}
struct VkDebugUtilsObjectNameInfoEXT {
	VkStructureType sType;
	void* pNext;
	VkObjectType objectType;
	uint64_t objectHandle;
	byte* pObjectName;
}
struct VkAttachmentDescription {
	VkAttachmentDescriptionFlags flags;
	VkFormat format;
	VkSampleCountFlagBits samples;
	VkAttachmentLoadOp loadOp;
	VkAttachmentStoreOp storeOp;
	VkAttachmentLoadOp stencilLoadOp;
	VkAttachmentStoreOp stencilStoreOp;
	VkImageLayout initialLayout;
	VkImageLayout finalLayout;
}
struct VkCommandPoolCreateInfo {
	VkStructureType sType;
	void* pNext;
	VkCommandPoolCreateFlags flags;
	uint32_t queueFamilyIndex;
}
struct VkPhysicalDeviceProperties2 {
	VkStructureType sType;
	void* pNext;
	VkPhysicalDeviceProperties properties;
}
struct VkBufferCreateInfo {
	VkStructureType sType;
	void* pNext;
	VkBufferCreateFlags flags;
	VkDeviceSize size;
	VkBufferUsageFlags usage;
	VkSharingMode sharingMode;
	uint32_t queueFamilyIndexCount;
	uint32_t* pQueueFamilyIndices;
}
struct VkDescriptorSetAllocateInfo {
	VkStructureType sType;
	void* pNext;
	VkDescriptorPool descriptorPool;
	uint32_t descriptorSetCount;
	VkDescriptorSetLayout* pSetLayouts;
}
struct VkAttachmentDescription2 {
	VkStructureType sType;
	void* pNext;
	VkAttachmentDescriptionFlags flags;
	VkFormat format;
	VkSampleCountFlagBits samples;
	VkAttachmentLoadOp loadOp;
	VkAttachmentStoreOp storeOp;
	VkAttachmentLoadOp stencilLoadOp;
	VkAttachmentStoreOp stencilStoreOp;
	VkImageLayout initialLayout;
	VkImageLayout finalLayout;
}
struct VkDescriptorSetLayout_T {
}
struct VkPipelineMultisampleStateCreateInfo {
	VkStructureType sType;
	void* pNext;
	VkPipelineMultisampleStateCreateFlags flags;
	VkSampleCountFlagBits rasterizationSamples;
	VkBool32 sampleShadingEnable;
	float minSampleShading;
	VkSampleMask* pSampleMask;
	VkBool32 alphaToCoverageEnable;
	VkBool32 alphaToOneEnable;
}
struct VkPhysicalDeviceSparseImageFormatInfo2 {
	VkStructureType sType;
	void* pNext;
	VkFormat format;
	VkImageType type;
	VkSampleCountFlagBits samples;
	VkImageUsageFlags usage;
	VkImageTiling tiling;
}
struct VkEventCreateInfo {
	VkStructureType sType;
	void* pNext;
	VkEventCreateFlags flags;
}
struct VkQueryPool_T {
}
struct VkBindAccelerationStructureMemoryInfoKHR {
	VkStructureType sType;
	void* pNext;
	VkAccelerationStructureKHR accelerationStructure;
	VkDeviceMemory memory;
	VkDeviceSize memoryOffset;
	uint32_t deviceIndexCount;
	uint32_t* pDeviceIndices;
}
struct VkPipelineVertexInputStateCreateInfo {
	VkStructureType sType;
	void* pNext;
	VkPipelineVertexInputStateCreateFlags flags;
	uint32_t vertexBindingDescriptionCount;
	VkVertexInputBindingDescription* pVertexBindingDescriptions;
	uint32_t vertexAttributeDescriptionCount;
	VkVertexInputAttributeDescription* pVertexAttributeDescriptions;
}
struct VkDisplayPlaneCapabilities2KHR {
	VkStructureType sType;
	void* pNext;
	VkDisplayPlaneCapabilitiesKHR capabilities;
}
struct VkIndirectCommandsLayoutCreateInfoNV {
	VkStructureType sType;
	void* pNext;
	VkIndirectCommandsLayoutUsageFlagsNV flags;
	VkPipelineBindPoint pipelineBindPoint;
	uint32_t tokenCount;
	VkIndirectCommandsLayoutTokenNV* pTokens;
	uint32_t streamCount;
	uint32_t* pStreamStrides;
}
struct VkDescriptorPool_T {
}
struct VkGeneratedCommandsInfoNV {
	VkStructureType sType;
	void* pNext;
	VkPipelineBindPoint pipelineBindPoint;
	VkPipeline pipeline;
	VkIndirectCommandsLayoutNV indirectCommandsLayout;
	uint32_t streamCount;
	VkIndirectCommandsStreamNV* pStreams;
	uint32_t sequencesCount;
	VkBuffer preprocessBuffer;
	VkDeviceSize preprocessOffset;
	VkDeviceSize preprocessSize;
	VkBuffer sequencesCountBuffer;
	VkDeviceSize sequencesCountOffset;
	VkBuffer sequencesIndexBuffer;
	VkDeviceSize sequencesIndexOffset;
}
struct VkPipelineRasterizationStateCreateInfo {
	VkStructureType sType;
	void* pNext;
	VkPipelineRasterizationStateCreateFlags flags;
	VkBool32 depthClampEnable;
	VkBool32 rasterizerDiscardEnable;
	VkPolygonMode polygonMode;
	VkCullModeFlags cullMode;
	VkFrontFace frontFace;
	VkBool32 depthBiasEnable;
	float depthBiasConstantFactor;
	float depthBiasClamp;
	float depthBiasSlopeFactor;
	float lineWidth;
}
struct VkDisplayModeCreateInfoKHR {
	VkStructureType sType;
	void* pNext;
	VkDisplayModeCreateFlagsKHR flags;
	VkDisplayModeParametersKHR parameters;
}
struct VkImageSubresourceLayers {
	VkImageAspectFlags aspectMask;
	uint32_t mipLevel;
	uint32_t baseArrayLayer;
	uint32_t layerCount;
}
struct VkDebugUtilsMessengerCallbackDataEXT {
	VkStructureType sType;
	void* pNext;
	VkDebugUtilsMessengerCallbackDataFlagsEXT flags;
	byte* pMessageIdName;
	int32_t messageIdNumber;
	byte* pMessage;
	uint32_t queueLabelCount;
	VkDebugUtilsLabelEXT* pQueueLabels;
	uint32_t cmdBufLabelCount;
	VkDebugUtilsLabelEXT* pCmdBufLabels;
	uint32_t objectCount;
	VkDebugUtilsObjectNameInfoEXT* pObjects;
}
struct VkMemoryAllocateInfo {
	VkStructureType sType;
	void* pNext;
	VkDeviceSize allocationSize;
	uint32_t memoryTypeIndex;
}
struct VkCoarseSampleLocationNV {
	uint32_t pixelX;
	uint32_t pixelY;
	uint32_t sample;
}
struct VkBufferDeviceAddressInfo {
	VkStructureType sType;
	void* pNext;
	VkBuffer buffer;
}
struct VkDescriptorUpdateTemplateEntry {
	uint32_t dstBinding;
	uint32_t dstArrayElement;
	uint32_t descriptorCount;
	VkDescriptorType descriptorType;
	size_t offset;
	size_t stride;
}
struct VkMemoryRequirements2 {
	VkStructureType sType;
	void* pNext;
	VkMemoryRequirements memoryRequirements;
}
struct VkIndirectCommandsLayoutTokenNV {
	VkStructureType sType;
	void* pNext;
	VkIndirectCommandsTokenTypeNV tokenType;
	uint32_t stream;
	uint32_t offset;
	uint32_t vertexBindingUnit;
	VkBool32 vertexDynamicStride;
	VkPipelineLayout pushconstantPipelineLayout;
	VkShaderStageFlags pushconstantShaderStageFlags;
	uint32_t pushconstantOffset;
	uint32_t pushconstantSize;
	VkIndirectStateFlagsNV indirectStateFlags;
	uint32_t indexTypeCount;
	VkIndexType* pIndexTypes;
	uint32_t* pIndexTypeValues;
}
struct VkExternalMemoryProperties {
	VkExternalMemoryFeatureFlags externalMemoryFeatures;
	VkExternalMemoryHandleTypeFlags exportFromImportedHandleTypes;
	VkExternalMemoryHandleTypeFlags compatibleHandleTypes;
}
struct VkSurfaceFormatKHR {
	VkFormat format;
	VkColorSpaceKHR colorSpace;
}
struct VkGeneratedCommandsMemoryRequirementsInfoNV {
	VkStructureType sType;
	void* pNext;
	VkPipelineBindPoint pipelineBindPoint;
	VkPipeline pipeline;
	VkIndirectCommandsLayoutNV indirectCommandsLayout;
	uint32_t maxSequencesCount;
}
struct VkPhysicalDeviceProperties {
	uint32_t apiVersion;
	uint32_t driverVersion;
	uint32_t vendorID;
	uint32_t deviceID;
	VkPhysicalDeviceType deviceType;
	byte[256] deviceName;
	uint8_t[16] pipelineCacheUUID;
	VkPhysicalDeviceLimits limits;
	VkPhysicalDeviceSparseProperties sparseProperties;
}
struct VkRenderPass_T {
}
struct VkClearDepthStencilValue {
	float depth;
	uint32_t stencil;
}
struct VkExtensionProperties {
	byte[256] extensionName;
	uint32_t specVersion;
}
struct VkPerformanceConfigurationINTEL_T {
}
struct VkCommandBufferAllocateInfo {
	VkStructureType sType;
	void* pNext;
	VkCommandPool commandPool;
	VkCommandBufferLevel level;
	uint32_t commandBufferCount;
}
struct VkDeviceMemoryOpaqueCaptureAddressInfo {
	VkStructureType sType;
	void* pNext;
	VkDeviceMemory memory;
}
struct VkDisplayPowerInfoEXT {
	VkStructureType sType;
	void* pNext;
	VkDisplayPowerStateEXT powerState;
}
struct VkDisplayModeKHR_T {
}
struct VkPerformanceMarkerInfoINTEL {
	VkStructureType sType;
	void* pNext;
	uint64_t marker;
}
struct VkCommandBuffer_T {
}
struct VkFramebufferCreateInfo {
	VkStructureType sType;
	void* pNext;
	VkFramebufferCreateFlags flags;
	VkRenderPass renderPass;
	uint32_t attachmentCount;
	VkImageView* pAttachments;
	uint32_t width;
	uint32_t height;
	uint32_t layers;
}
struct VkComponentMapping {
	VkComponentSwizzle r;
	VkComponentSwizzle g;
	VkComponentSwizzle b;
	VkComponentSwizzle a;
}
struct VkOffset3D {
	int32_t x;
	int32_t y;
	int32_t z;
}
struct VkSubpassDescription2 {
	VkStructureType sType;
	void* pNext;
	VkSubpassDescriptionFlags flags;
	VkPipelineBindPoint pipelineBindPoint;
	uint32_t viewMask;
	uint32_t inputAttachmentCount;
	VkAttachmentReference2* pInputAttachments;
	uint32_t colorAttachmentCount;
	VkAttachmentReference2* pColorAttachments;
	VkAttachmentReference2* pResolveAttachments;
	VkAttachmentReference2* pDepthStencilAttachment;
	uint32_t preserveAttachmentCount;
	uint32_t* pPreserveAttachments;
}
struct VkAcquireNextImageInfoKHR {
	VkStructureType sType;
	void* pNext;
	VkSwapchainKHR swapchain;
	uint64_t timeout;
	VkSemaphore semaphore;
	VkFence fence;
	uint32_t deviceMask;
}
struct VkSemaphore_T {
}
struct VkGeometryDataNV {
	VkGeometryTrianglesNV triangles;
	VkGeometryAABBNV aabbs;
}
struct VkDebugUtilsObjectTagInfoEXT {
	VkStructureType sType;
	void* pNext;
	VkObjectType objectType;
	uint64_t objectHandle;
	uint64_t tagName;
	size_t tagSize;
	void* pTag;
}
struct VkImageView_T {
}
struct VkPhysicalDeviceExternalSemaphoreInfo {
	VkStructureType sType;
	void* pNext;
	VkExternalSemaphoreHandleTypeFlagBits handleType;
}
struct VkBindImageMemoryInfo {
	VkStructureType sType;
	void* pNext;
	VkImage image;
	VkDeviceMemory memory;
	VkDeviceSize memoryOffset;
}
struct VkDescriptorSetLayoutSupport {
	VkStructureType sType;
	void* pNext;
	VkBool32 supported;
}
struct VkPhysicalDeviceLimits {
	uint32_t maxImageDimension1D;
	uint32_t maxImageDimension2D;
	uint32_t maxImageDimension3D;
	uint32_t maxImageDimensionCube;
	uint32_t maxImageArrayLayers;
	uint32_t maxTexelBufferElements;
	uint32_t maxUniformBufferRange;
	uint32_t maxStorageBufferRange;
	uint32_t maxPushConstantsSize;
	uint32_t maxMemoryAllocationCount;
	uint32_t maxSamplerAllocationCount;
	VkDeviceSize bufferImageGranularity;
	VkDeviceSize sparseAddressSpaceSize;
	uint32_t maxBoundDescriptorSets;
	uint32_t maxPerStageDescriptorSamplers;
	uint32_t maxPerStageDescriptorUniformBuffers;
	uint32_t maxPerStageDescriptorStorageBuffers;
	uint32_t maxPerStageDescriptorSampledImages;
	uint32_t maxPerStageDescriptorStorageImages;
	uint32_t maxPerStageDescriptorInputAttachments;
	uint32_t maxPerStageResources;
	uint32_t maxDescriptorSetSamplers;
	uint32_t maxDescriptorSetUniformBuffers;
	uint32_t maxDescriptorSetUniformBuffersDynamic;
	uint32_t maxDescriptorSetStorageBuffers;
	uint32_t maxDescriptorSetStorageBuffersDynamic;
	uint32_t maxDescriptorSetSampledImages;
	uint32_t maxDescriptorSetStorageImages;
	uint32_t maxDescriptorSetInputAttachments;
	uint32_t maxVertexInputAttributes;
	uint32_t maxVertexInputBindings;
	uint32_t maxVertexInputAttributeOffset;
	uint32_t maxVertexInputBindingStride;
	uint32_t maxVertexOutputComponents;
	uint32_t maxTessellationGenerationLevel;
	uint32_t maxTessellationPatchSize;
	uint32_t maxTessellationControlPerVertexInputComponents;
	uint32_t maxTessellationControlPerVertexOutputComponents;
	uint32_t maxTessellationControlPerPatchOutputComponents;
	uint32_t maxTessellationControlTotalOutputComponents;
	uint32_t maxTessellationEvaluationInputComponents;
	uint32_t maxTessellationEvaluationOutputComponents;
	uint32_t maxGeometryShaderInvocations;
	uint32_t maxGeometryInputComponents;
	uint32_t maxGeometryOutputComponents;
	uint32_t maxGeometryOutputVertices;
	uint32_t maxGeometryTotalOutputComponents;
	uint32_t maxFragmentInputComponents;
	uint32_t maxFragmentOutputAttachments;
	uint32_t maxFragmentDualSrcAttachments;
	uint32_t maxFragmentCombinedOutputResources;
	uint32_t maxComputeSharedMemorySize;
	uint32_t[3] maxComputeWorkGroupCount;
	uint32_t maxComputeWorkGroupInvocations;
	uint32_t[3] maxComputeWorkGroupSize;
	uint32_t subPixelPrecisionBits;
	uint32_t subTexelPrecisionBits;
	uint32_t mipmapPrecisionBits;
	uint32_t maxDrawIndexedIndexValue;
	uint32_t maxDrawIndirectCount;
	float maxSamplerLodBias;
	float maxSamplerAnisotropy;
	uint32_t maxViewports;
	uint32_t[2] maxViewportDimensions;
	float[2] viewportBoundsRange;
	uint32_t viewportSubPixelBits;
	size_t minMemoryMapAlignment;
	VkDeviceSize minTexelBufferOffsetAlignment;
	VkDeviceSize minUniformBufferOffsetAlignment;
	VkDeviceSize minStorageBufferOffsetAlignment;
	int32_t minTexelOffset;
	uint32_t maxTexelOffset;
	int32_t minTexelGatherOffset;
	uint32_t maxTexelGatherOffset;
	float minInterpolationOffset;
	float maxInterpolationOffset;
	uint32_t subPixelInterpolationOffsetBits;
	uint32_t maxFramebufferWidth;
	uint32_t maxFramebufferHeight;
	uint32_t maxFramebufferLayers;
	VkSampleCountFlags framebufferColorSampleCounts;
	VkSampleCountFlags framebufferDepthSampleCounts;
	VkSampleCountFlags framebufferStencilSampleCounts;
	VkSampleCountFlags framebufferNoAttachmentsSampleCounts;
	uint32_t maxColorAttachments;
	VkSampleCountFlags sampledImageColorSampleCounts;
	VkSampleCountFlags sampledImageIntegerSampleCounts;
	VkSampleCountFlags sampledImageDepthSampleCounts;
	VkSampleCountFlags sampledImageStencilSampleCounts;
	VkSampleCountFlags storageImageSampleCounts;
	uint32_t maxSampleMaskWords;
	VkBool32 timestampComputeAndGraphics;
	float timestampPeriod;
	uint32_t maxClipDistances;
	uint32_t maxCullDistances;
	uint32_t maxCombinedClipAndCullDistances;
	uint32_t discreteQueuePriorities;
	float[2] pointSizeRange;
	float[2] lineWidthRange;
	float pointSizeGranularity;
	float lineWidthGranularity;
	VkBool32 strictLines;
	VkBool32 standardSampleLocations;
	VkDeviceSize optimalBufferCopyOffsetAlignment;
	VkDeviceSize optimalBufferCopyRowPitchAlignment;
	VkDeviceSize nonCoherentAtomSize;
}
struct VkFormatProperties2 {
	VkStructureType sType;
	void* pNext;
	VkFormatProperties formatProperties;
}
struct VkDescriptorUpdateTemplate_T {
}
struct VkPhysicalDevice_T {
}
struct VkQueueFamilyProperties2 {
	VkStructureType sType;
	void* pNext;
	VkQueueFamilyProperties queueFamilyProperties;
}
struct VkQueryPoolCreateInfo {
	VkStructureType sType;
	void* pNext;
	VkQueryPoolCreateFlags flags;
	VkQueryType queryType;
	uint32_t queryCount;
	VkQueryPipelineStatisticFlags pipelineStatistics;
}
struct VkImageResolve {
	VkImageSubresourceLayers srcSubresource;
	VkOffset3D srcOffset;
	VkImageSubresourceLayers dstSubresource;
	VkOffset3D dstOffset;
	VkExtent3D extent;
}
struct VkPastPresentationTimingGOOGLE {
	uint32_t presentID;
	uint64_t desiredPresentTime;
	uint64_t actualPresentTime;
	uint64_t earliestPresentTime;
	uint64_t presentMargin;
}
struct VkImageCreateInfo {
	VkStructureType sType;
	void* pNext;
	VkImageCreateFlags flags;
	VkImageType imageType;
	VkFormat format;
	VkExtent3D extent;
	uint32_t mipLevels;
	uint32_t arrayLayers;
	VkSampleCountFlagBits samples;
	VkImageTiling tiling;
	VkImageUsageFlags usage;
	VkSharingMode sharingMode;
	uint32_t queueFamilyIndexCount;
	uint32_t* pQueueFamilyIndices;
	VkImageLayout initialLayout;
}
struct VkPushConstantRange {
	VkShaderStageFlags stageFlags;
	uint32_t offset;
	uint32_t size;
}
struct VkPhysicalDeviceExternalBufferInfo {
	VkStructureType sType;
	void* pNext;
	VkBufferCreateFlags flags;
	VkBufferUsageFlags usage;
	VkExternalMemoryHandleTypeFlagBits handleType;
}
struct VkDebugMarkerObjectTagInfoEXT {
	VkStructureType sType;
	void* pNext;
	VkDebugReportObjectTypeEXT objectType;
	uint64_t object;
	uint64_t tagName;
	size_t tagSize;
	void* pTag;
}
struct VkSparseMemoryBind {
	VkDeviceSize resourceOffset;
	VkDeviceSize size;
	VkDeviceMemory memory;
	VkDeviceSize memoryOffset;
	VkSparseMemoryBindFlags flags;
}
struct VkDebugMarkerMarkerInfoEXT {
	VkStructureType sType;
	void* pNext;
	byte* pMarkerName;
	float[4] color;
}
struct VkRayTracingPipelineCreateInfoNV {
	VkStructureType sType;
	void* pNext;
	VkPipelineCreateFlags flags;
	uint32_t stageCount;
	VkPipelineShaderStageCreateInfo* pStages;
	uint32_t groupCount;
	VkRayTracingShaderGroupCreateInfoNV* pGroups;
	uint32_t maxRecursionDepth;
	VkPipelineLayout layout;
	VkPipeline basePipelineHandle;
	int32_t basePipelineIndex;
}
struct VkFenceCreateInfo {
	VkStructureType sType;
	void* pNext;
	VkFenceCreateFlags flags;
}
struct VkCommandBufferBeginInfo {
	VkStructureType sType;
	void* pNext;
	VkCommandBufferUsageFlags flags;
	VkCommandBufferInheritanceInfo* pInheritanceInfo;
}
struct VkPipelineViewportStateCreateInfo {
	VkStructureType sType;
	void* pNext;
	VkPipelineViewportStateCreateFlags flags;
	uint32_t viewportCount;
	VkViewport* pViewports;
	uint32_t scissorCount;
	VkRect2D* pScissors;
}
struct VkEvent_T {
}
struct VkSemaphoreWaitInfo {
	VkStructureType sType;
	void* pNext;
	VkSemaphoreWaitFlags flags;
	uint32_t semaphoreCount;
	VkSemaphore* pSemaphores;
	uint64_t* pValues;
}
struct VkMemoryGetFdInfoKHR {
	VkStructureType sType;
	void* pNext;
	VkDeviceMemory memory;
	VkExternalMemoryHandleTypeFlagBits handleType;
}
struct VkDebugUtilsMessengerCreateInfoEXT {
	VkStructureType sType;
	void* pNext;
	VkDebugUtilsMessengerCreateFlagsEXT flags;
	VkDebugUtilsMessageSeverityFlagsEXT messageSeverity;
	VkDebugUtilsMessageTypeFlagsEXT messageType;
	PFN_vkDebugUtilsMessengerCallbackEXT pfnUserCallback;
	void* pUserData;
}
struct VkRect2D {
	VkOffset2D offset;
	VkExtent2D extent;
}
struct VkExtent3D {
	uint32_t width;
	uint32_t height;
	uint32_t depth;
}
struct VkDisplaySurfaceCreateInfoKHR {
	VkStructureType sType;
	void* pNext;
	VkDisplaySurfaceCreateFlagsKHR flags;
	VkDisplayModeKHR displayMode;
	uint32_t planeIndex;
	uint32_t planeStackIndex;
	VkSurfaceTransformFlagBitsKHR transform;
	float globalAlpha;
	VkDisplayPlaneAlphaFlagBitsKHR alphaMode;
	VkExtent2D imageExtent;
}
struct VkPhysicalDeviceFeatures {
	VkBool32 robustBufferAccess;
	VkBool32 fullDrawIndexUint32;
	VkBool32 imageCubeArray;
	VkBool32 independentBlend;
	VkBool32 geometryShader;
	VkBool32 tessellationShader;
	VkBool32 sampleRateShading;
	VkBool32 dualSrcBlend;
	VkBool32 logicOp;
	VkBool32 multiDrawIndirect;
	VkBool32 drawIndirectFirstInstance;
	VkBool32 depthClamp;
	VkBool32 depthBiasClamp;
	VkBool32 fillModeNonSolid;
	VkBool32 depthBounds;
	VkBool32 wideLines;
	VkBool32 largePoints;
	VkBool32 alphaToOne;
	VkBool32 multiViewport;
	VkBool32 samplerAnisotropy;
	VkBool32 textureCompressionETC2;
	VkBool32 textureCompressionASTC_LDR;
	VkBool32 textureCompressionBC;
	VkBool32 occlusionQueryPrecise;
	VkBool32 pipelineStatisticsQuery;
	VkBool32 vertexPipelineStoresAndAtomics;
	VkBool32 fragmentStoresAndAtomics;
	VkBool32 shaderTessellationAndGeometryPointSize;
	VkBool32 shaderImageGatherExtended;
	VkBool32 shaderStorageImageExtendedFormats;
	VkBool32 shaderStorageImageMultisample;
	VkBool32 shaderStorageImageReadWithoutFormat;
	VkBool32 shaderStorageImageWriteWithoutFormat;
	VkBool32 shaderUniformBufferArrayDynamicIndexing;
	VkBool32 shaderSampledImageArrayDynamicIndexing;
	VkBool32 shaderStorageBufferArrayDynamicIndexing;
	VkBool32 shaderStorageImageArrayDynamicIndexing;
	VkBool32 shaderClipDistance;
	VkBool32 shaderCullDistance;
	VkBool32 shaderFloat64;
	VkBool32 shaderInt64;
	VkBool32 shaderInt16;
	VkBool32 shaderResourceResidency;
	VkBool32 shaderResourceMinLod;
	VkBool32 sparseBinding;
	VkBool32 sparseResidencyBuffer;
	VkBool32 sparseResidencyImage2D;
	VkBool32 sparseResidencyImage3D;
	VkBool32 sparseResidency2Samples;
	VkBool32 sparseResidency4Samples;
	VkBool32 sparseResidency8Samples;
	VkBool32 sparseResidency16Samples;
	VkBool32 sparseResidencyAliased;
	VkBool32 variableMultisampleRate;
	VkBool32 inheritedQueries;
}
struct VkPipelineExecutableStatisticKHR {
	VkStructureType sType;
	void* pNext;
	byte[256] name;
	byte[256] description;
	VkPipelineExecutableStatisticFormatKHR format;
	VkPipelineExecutableStatisticValueKHR value;
}
struct VkMemoryRequirements {
	VkDeviceSize size;
	VkDeviceSize alignment;
	uint32_t memoryTypeBits;
}
struct VkPipelineDynamicStateCreateInfo {
	VkStructureType sType;
	void* pNext;
	VkPipelineDynamicStateCreateFlags flags;
	uint32_t dynamicStateCount;
	VkDynamicState* pDynamicStates;
}
struct VkAccelerationStructureCreateInfoNV {
	VkStructureType sType;
	void* pNext;
	VkDeviceSize compactedSize;
	VkAccelerationStructureInfoNV info;
}
struct VkSubpassDescription {
	VkSubpassDescriptionFlags flags;
	VkPipelineBindPoint pipelineBindPoint;
	uint32_t inputAttachmentCount;
	VkAttachmentReference* pInputAttachments;
	uint32_t colorAttachmentCount;
	VkAttachmentReference* pColorAttachments;
	VkAttachmentReference* pResolveAttachments;
	VkAttachmentReference* pDepthStencilAttachment;
	uint32_t preserveAttachmentCount;
	uint32_t* pPreserveAttachments;
}
struct VkValidationCacheCreateInfoEXT {
	VkStructureType sType;
	void* pNext;
	VkValidationCacheCreateFlagsEXT flags;
	size_t initialDataSize;
	void* pInitialData;
}
struct VkPerformanceOverrideInfoINTEL {
	VkStructureType sType;
	void* pNext;
	VkPerformanceOverrideTypeINTEL type;
	VkBool32 enable;
	uint64_t parameter;
}
struct VkFence_T {
}
struct VkDisplayModeParametersKHR {
	VkExtent2D visibleRegion;
	uint32_t refreshRate;
}
struct VkSamplerCreateInfo {
	VkStructureType sType;
	void* pNext;
	VkSamplerCreateFlags flags;
	VkFilter magFilter;
	VkFilter minFilter;
	VkSamplerMipmapMode mipmapMode;
	VkSamplerAddressMode addressModeU;
	VkSamplerAddressMode addressModeV;
	VkSamplerAddressMode addressModeW;
	float mipLodBias;
	VkBool32 anisotropyEnable;
	float maxAnisotropy;
	VkBool32 compareEnable;
	VkCompareOp compareOp;
	float minLod;
	float maxLod;
	VkBorderColor borderColor;
	VkBool32 unnormalizedCoordinates;
}
struct VkExtent2D {
	uint32_t width;
	uint32_t height;
}
struct VkSparseImageFormatProperties2 {
	VkStructureType sType;
	void* pNext;
	VkSparseImageFormatProperties properties;
}
struct VkImageCopy {
	VkImageSubresourceLayers srcSubresource;
	VkOffset3D srcOffset;
	VkImageSubresourceLayers dstSubresource;
	VkOffset3D dstOffset;
	VkExtent3D extent;
}
struct VkSamplerYcbcrConversion_T {
}
struct VkWriteDescriptorSet {
	VkStructureType sType;
	void* pNext;
	VkDescriptorSet dstSet;
	uint32_t dstBinding;
	uint32_t dstArrayElement;
	uint32_t descriptorCount;
	VkDescriptorType descriptorType;
	VkDescriptorImageInfo* pImageInfo;
	VkDescriptorBufferInfo* pBufferInfo;
	VkBufferView* pTexelBufferView;
}
struct VkExternalSemaphoreProperties {
	VkStructureType sType;
	void* pNext;
	VkExternalSemaphoreHandleTypeFlags exportFromImportedHandleTypes;
	VkExternalSemaphoreHandleTypeFlags compatibleHandleTypes;
	VkExternalSemaphoreFeatureFlags externalSemaphoreFeatures;
}
struct VkSurfaceCapabilities2KHR {
	VkStructureType sType;
	void* pNext;
	VkSurfaceCapabilitiesKHR surfaceCapabilities;
}
struct VkDisplayModeProperties2KHR {
	VkStructureType sType;
	void* pNext;
	VkDisplayModePropertiesKHR displayModeProperties;
}
struct VkFenceGetFdInfoKHR {
	VkStructureType sType;
	void* pNext;
	VkFence fence;
	VkExternalFenceHandleTypeFlagBits handleType;
}
struct VkQueue_T {
}
struct VkDebugMarkerObjectNameInfoEXT {
	VkStructureType sType;
	void* pNext;
	VkDebugReportObjectTypeEXT objectType;
	uint64_t object;
	byte* pObjectName;
}
struct VkStencilOpState {
	VkStencilOp failOp;
	VkStencilOp passOp;
	VkStencilOp depthFailOp;
	VkCompareOp compareOp;
	uint32_t compareMask;
	uint32_t writeMask;
	uint32_t reference;
}
struct VkRayTracingShaderGroupCreateInfoNV {
	VkStructureType sType;
	void* pNext;
	VkRayTracingShaderGroupTypeKHR type;
	uint32_t generalShader;
	uint32_t closestHitShader;
	uint32_t anyHitShader;
	uint32_t intersectionShader;
}
struct VkPrivateDataSlotEXT_T {
}
struct VkSurfaceCapabilities2EXT {
	VkStructureType sType;
	void* pNext;
	uint32_t minImageCount;
	uint32_t maxImageCount;
	VkExtent2D currentExtent;
	VkExtent2D minImageExtent;
	VkExtent2D maxImageExtent;
	uint32_t maxImageArrayLayers;
	VkSurfaceTransformFlagsKHR supportedTransforms;
	VkSurfaceTransformFlagBitsKHR currentTransform;
	VkCompositeAlphaFlagsKHR supportedCompositeAlpha;
	VkImageUsageFlags supportedUsageFlags;
	VkSurfaceCounterFlagsEXT supportedSurfaceCounters;
}
struct VkAccelerationStructureMemoryRequirementsInfoNV {
	VkStructureType sType;
	void* pNext;
	VkAccelerationStructureMemoryRequirementsTypeNV type;
	VkAccelerationStructureNV accelerationStructure;
}
struct VkAttachmentReference {
	uint32_t attachment;
	VkImageLayout layout;
}
struct VkImportSemaphoreWin32HandleInfoKHR {
	VkStructureType sType;
	void* pNext;
	VkSemaphore semaphore;
	VkSemaphoreImportFlags flags;
	VkExternalSemaphoreHandleTypeFlagBits handleType;
	HANDLE handle;
	LPCWSTR name;
}
struct HINSTANCE__ {
	int unused;
}
struct VkBufferImageCopy {
	VkDeviceSize bufferOffset;
	uint32_t bufferRowLength;
	uint32_t bufferImageHeight;
	VkImageSubresourceLayers imageSubresource;
	VkOffset3D imageOffset;
	VkExtent3D imageExtent;
}
struct VkDeviceCreateInfo {
	VkStructureType sType;
	void* pNext;
	VkDeviceCreateFlags flags;
	uint32_t queueCreateInfoCount;
	VkDeviceQueueCreateInfo* pQueueCreateInfos;
	uint32_t enabledLayerCount;
	byte** ppEnabledLayerNames;
	uint32_t enabledExtensionCount;
	byte** ppEnabledExtensionNames;
	VkPhysicalDeviceFeatures* pEnabledFeatures;
}
struct VkRenderPassCreateInfo2 {
	VkStructureType sType;
	void* pNext;
	VkRenderPassCreateFlags flags;
	uint32_t attachmentCount;
	VkAttachmentDescription2* pAttachments;
	uint32_t subpassCount;
	VkSubpassDescription2* pSubpasses;
	uint32_t dependencyCount;
	VkSubpassDependency2* pDependencies;
	uint32_t correlatedViewMaskCount;
	uint32_t* pCorrelatedViewMasks;
}
struct VkHeadlessSurfaceCreateInfoEXT {
	VkStructureType sType;
	void* pNext;
	VkHeadlessSurfaceCreateFlagsEXT flags;
}
struct VkSubpassDependency2 {
	VkStructureType sType;
	void* pNext;
	uint32_t srcSubpass;
	uint32_t dstSubpass;
	VkPipelineStageFlags srcStageMask;
	VkPipelineStageFlags dstStageMask;
	VkAccessFlags srcAccessMask;
	VkAccessFlags dstAccessMask;
	VkDependencyFlags dependencyFlags;
	int32_t viewOffset;
}
struct VkPipelineCacheCreateInfo {
	VkStructureType sType;
	void* pNext;
	VkPipelineCacheCreateFlags flags;
	size_t initialDataSize;
	void* pInitialData;
}
struct VkPhysicalDeviceSurfaceInfo2KHR {
	VkStructureType sType;
	void* pNext;
	VkSurfaceKHR surface;
}
struct VkSubpassBeginInfo {
	VkStructureType sType;
	void* pNext;
	VkSubpassContents contents;
}
struct VkDescriptorSetLayoutCreateInfo {
	VkStructureType sType;
	void* pNext;
	VkDescriptorSetLayoutCreateFlags flags;
	uint32_t bindingCount;
	VkDescriptorSetLayoutBinding* pBindings;
}
struct VkSubpassEndInfo {
	VkStructureType sType;
	void* pNext;
}


extern(Windows) { __gshared {
void function(VkDevice device, VkImage image, VkAllocationCallbacks* pAllocator) PFN_vkDestroyImage;
void function(VkDevice device, VkDeviceQueueInfo2* pQueueInfo, VkQueue* pQueue) vkGetDeviceQueue2;
VkResult function(VkDevice device, uint32_t memoryRangeCount, VkMappedMemoryRange* pMemoryRanges) vkInvalidateMappedMemoryRanges;
void function(VkDevice device, VkDescriptorUpdateTemplate descriptorUpdateTemplate, VkAllocationCallbacks* pAllocator) PFN_vkDestroyDescriptorUpdateTemplate;
VkResult function(VkDevice device, VkSemaphoreGetFdInfoKHR* pGetFdInfo, int* pFd) vkGetSemaphoreFdKHR;
VkResult function(VkPhysicalDevice physicalDevice, uint32_t* pPropertyCount, VkCooperativeMatrixPropertiesNV* pProperties) vkGetPhysicalDeviceCooperativeMatrixPropertiesNV;
void function(VkCommandBuffer commandBuffer, VkQueryPool queryPool, uint32_t query, VkQueryControlFlags flags, uint32_t index) PFN_vkCmdBeginQueryIndexedEXT;
void function(VkCommandBuffer commandBuffer, VkImage image, VkImageLayout imageLayout, VkClearDepthStencilValue* pDepthStencil, uint32_t rangeCount, VkImageSubresourceRange* pRanges) PFN_vkCmdClearDepthStencilImage;
VkResult function(VkDevice device, VkSemaphoreGetWin32HandleInfoKHR* pGetWin32HandleInfo, HANDLE* pHandle) vkGetSemaphoreWin32HandleKHR;
VkResult function(VkDevice device, VkDebugMarkerObjectNameInfoEXT* pNameInfo) PFN_vkDebugMarkerSetObjectNameEXT;
VkResult function(VkPhysicalDevice physicalDevice, VkPhysicalDeviceSurfaceInfo2KHR* pSurfaceInfo, uint32_t* pSurfaceFormatCount, VkSurfaceFormat2KHR* pSurfaceFormats) vkGetPhysicalDeviceSurfaceFormats2KHR;
void function(VkPhysicalDevice physicalDevice, VkPhysicalDeviceProperties2* pProperties) PFN_vkGetPhysicalDeviceProperties2;
void function(VkPhysicalDevice physicalDevice, VkPhysicalDeviceExternalBufferInfo* pExternalBufferInfo, VkExternalBufferProperties* pExternalBufferProperties) PFN_vkGetPhysicalDeviceExternalBufferProperties;
void function(VkCommandBuffer commandBuffer, VkPipelineStageFlagBits pipelineStage, VkBuffer dstBuffer, VkDeviceSize dstOffset, uint32_t marker) vkCmdWriteBufferMarkerAMD;
VkResult function(VkDevice device, VkEvent event) vkSetEvent;
VkResult function(VkPhysicalDevice physicalDevice, uint32_t queueFamilyIndex, VkSurfaceKHR surface, VkBool32* pSupported) PFN_vkGetPhysicalDeviceSurfaceSupportKHR;
void function(VkCommandBuffer commandBuffer, VkQueryPool queryPool, uint32_t firstQuery, uint32_t queryCount) PFN_vkCmdResetQueryPool;
void function(VkDevice device, VkDeviceMemory memory, VkAllocationCallbacks* pAllocator) PFN_vkFreeMemory;
void function(VkCommandBuffer commandBuffer, VkSubpassBeginInfo* pSubpassBeginInfo, VkSubpassEndInfo* pSubpassEndInfo) PFN_vkCmdNextSubpass2KHR;
void function(VkCommandBuffer commandBuffer, uint32_t commandBufferCount, VkCommandBuffer* pCommandBuffers) vkCmdExecuteCommands;
void function(VkCommandBuffer commandBuffer, float minDepthBounds, float maxDepthBounds) PFN_vkCmdSetDepthBounds;
void function(VkPhysicalDevice physicalDevice, VkPhysicalDeviceProperties2* pProperties) vkGetPhysicalDeviceProperties2;
VkResult function(VkDevice device, VkQueryPool queryPool, uint32_t firstQuery, uint32_t queryCount, size_t dataSize, void* pData, VkDeviceSize stride, VkQueryResultFlags flags) PFN_vkGetQueryPoolResults;
VkResult function(VkDevice device, VkImage image, VkImageDrmFormatModifierPropertiesEXT* pProperties) vkGetImageDrmFormatModifierPropertiesEXT;
VkResult function(VkDevice device, VkImageView imageView, VkImageViewAddressPropertiesNVX* pProperties) PFN_vkGetImageViewAddressNVX;
void function(VkPhysicalDevice physicalDevice, VkPhysicalDeviceMemoryProperties2* pMemoryProperties) PFN_vkGetPhysicalDeviceMemoryProperties2KHR;
VkResult function(VkDevice device, VkPerformanceConfigurationINTEL configuration) PFN_vkReleasePerformanceConfigurationINTEL;
VkResult function(VkDevice device, VkMemoryAllocateInfo* pAllocateInfo, VkAllocationCallbacks* pAllocator, VkDeviceMemory* pMemory) PFN_vkAllocateMemory;
VkResult function(VkDevice device, VkDebugMarkerObjectTagInfoEXT* pTagInfo) vkDebugMarkerSetObjectTagEXT;
VkResult function(VkDevice device, VkDescriptorPool descriptorPool, uint32_t descriptorSetCount, VkDescriptorSet* pDescriptorSets) vkFreeDescriptorSets;
VkResult function(VkDevice device, VkDeviceGroupPresentCapabilitiesKHR* pDeviceGroupPresentCapabilities) vkGetDeviceGroupPresentCapabilitiesKHR;
VkResult function(VkDevice device, VkFenceGetWin32HandleInfoKHR* pGetWin32HandleInfo, HANDLE* pHandle) PFN_vkGetFenceWin32HandleKHR;
VkResult function(VkDevice device, VkPipeline pipeline, uint32_t shader) vkCompileDeferredNV;
VkResult function(VkDevice device, VkValidationCacheEXT validationCache, size_t* pDataSize, void* pData) vkGetValidationCacheDataEXT;
void function(VkCommandBuffer commandBuffer, VkBuffer buffer, VkDeviceSize offset, uint32_t drawCount, uint32_t stride) vkCmdDrawIndirect;
VkResult function(VkPhysicalDevice physicalDevice, VkFormat format, VkImageType type, VkImageTiling tiling, VkImageUsageFlags usage, VkImageCreateFlags flags, VkImageFormatProperties* pImageFormatProperties) vkGetPhysicalDeviceImageFormatProperties;
void function(VkDevice device, VkImageMemoryRequirementsInfo2* pInfo, VkMemoryRequirements2* pMemoryRequirements) vkGetImageMemoryRequirements2KHR;
VkResult function(VkDevice device, VkPrivateDataSlotCreateInfoEXT* pCreateInfo, VkAllocationCallbacks* pAllocator, VkPrivateDataSlotEXT* pPrivateDataSlot) PFN_vkCreatePrivateDataSlotEXT;
VkResult function(VkDevice device, uint32_t fenceCount, VkFence* pFences, VkBool32 waitAll, uint64_t timeout) PFN_vkWaitForFences;
VkDeviceAddress function(VkDevice device, VkBufferDeviceAddressInfo* pInfo) vkGetBufferDeviceAddress;
VkResult function(uint32_t* pApiVersion) PFN_vkEnumerateInstanceVersion;
void function(VkCommandBuffer commandBuffer, VkBuffer buffer, VkDeviceSize offset) vkCmdDispatchIndirect;
VkResult function(VkPhysicalDevice physicalDevice, uint32_t queueFamilyIndex, VkSurfaceKHR surface, VkBool32* pSupported) vkGetPhysicalDeviceSurfaceSupportKHR;
void function(VkCommandBuffer commandBuffer, VkCoarseSampleOrderTypeNV sampleOrderType, uint32_t customSampleOrderCount, VkCoarseSampleOrderCustomNV* pCustomSampleOrders) PFN_vkCmdSetCoarseSampleOrderNV;
void function(VkDevice device, VkSamplerYcbcrConversion ycbcrConversion, VkAllocationCallbacks* pAllocator) PFN_vkDestroySamplerYcbcrConversion;
void function(VkPhysicalDevice physicalDevice, VkPhysicalDeviceExternalSemaphoreInfo* pExternalSemaphoreInfo, VkExternalSemaphoreProperties* pExternalSemaphoreProperties) vkGetPhysicalDeviceExternalSemaphoreProperties;
uint64_t function(VkDevice device, VkDeviceMemoryOpaqueCaptureAddressInfo* pInfo) PFN_vkGetDeviceMemoryOpaqueCaptureAddressKHR;
void function(VkDevice device, uint32_t swapchainCount, VkSwapchainKHR* pSwapchains, VkHdrMetadataEXT* pMetadata) PFN_vkSetHdrMetadataEXT;
VkResult function(VkDevice device, VkDescriptorUpdateTemplateCreateInfo* pCreateInfo, VkAllocationCallbacks* pAllocator, VkDescriptorUpdateTemplate* pDescriptorUpdateTemplate) vkCreateDescriptorUpdateTemplate;
VkResult function(VkPhysicalDevice physicalDevice, VkSurfaceKHR surface, uint32_t* pRectCount, VkRect2D* pRects) vkGetPhysicalDevicePresentRectanglesKHR;
VkResult function(VkDevice device, VkPipelineExecutableInfoKHR* pExecutableInfo, uint32_t* pInternalRepresentationCount, VkPipelineExecutableInternalRepresentationKHR* pInternalRepresentations) vkGetPipelineExecutableInternalRepresentationsKHR;
void function(VkDevice device, VkSwapchainKHR swapchain, VkAllocationCallbacks* pAllocator) vkDestroySwapchainKHR;
VkResult function(VkPhysicalDevice physicalDevice, uint32_t planeIndex, uint32_t* pDisplayCount, VkDisplayKHR* pDisplays) PFN_vkGetDisplayPlaneSupportedDisplaysKHR;
void function(VkDevice device, uint32_t heapIndex, uint32_t localDeviceIndex, uint32_t remoteDeviceIndex, VkPeerMemoryFeatureFlags* pPeerMemoryFeatures) vkGetDeviceGroupPeerMemoryFeaturesKHR;
void function(VkInstance instance, VkDebugUtilsMessageSeverityFlagBitsEXT messageSeverity, VkDebugUtilsMessageTypeFlagsEXT messageTypes, VkDebugUtilsMessengerCallbackDataEXT* pCallbackData) PFN_vkSubmitDebugUtilsMessageEXT;
VkResult function(VkDevice device, VkPipelineCache dstCache, uint32_t srcCacheCount, VkPipelineCache* pSrcCaches) vkMergePipelineCaches;
VkResult function(VkPhysicalDevice physicalDevice, VkDisplayKHR display, VkDisplayModeCreateInfoKHR* pCreateInfo, VkAllocationCallbacks* pAllocator, VkDisplayModeKHR* pMode) vkCreateDisplayModeKHR;
void function(VkCommandBuffer commandBuffer, float lineWidth) PFN_vkCmdSetLineWidth;
void function(VkPhysicalDevice physicalDevice, VkPhysicalDeviceExternalFenceInfo* pExternalFenceInfo, VkExternalFenceProperties* pExternalFenceProperties) vkGetPhysicalDeviceExternalFencePropertiesKHR;
VkResult function(VkDevice device, VkPipelineExecutableInfoKHR* pExecutableInfo, uint32_t* pStatisticCount, VkPipelineExecutableStatisticKHR* pStatistics) PFN_vkGetPipelineExecutableStatisticsKHR;
VkResult function(VkDevice device, VkCommandPool commandPool, VkCommandPoolResetFlags flags) PFN_vkResetCommandPool;
VkResult function(VkDevice device, VkCommandPoolCreateInfo* pCreateInfo, VkAllocationCallbacks* pAllocator, VkCommandPool* pCommandPool) vkCreateCommandPool;
void function(VkCommandBuffer commandBuffer, uint32_t instanceCount, uint32_t firstInstance, VkBuffer counterBuffer, VkDeviceSize counterBufferOffset, uint32_t counterOffset, uint32_t vertexStride) vkCmdDrawIndirectByteCountEXT;
void function(VkCommandBuffer commandBuffer, uint32_t commandBufferCount, VkCommandBuffer* pCommandBuffers) PFN_vkCmdExecuteCommands;
void function(VkCommandBuffer commandBuffer, uint32_t firstBinding, uint32_t bindingCount, VkBuffer* pBuffers, VkDeviceSize* pOffsets) vkCmdBindVertexBuffers;
void function(VkCommandBuffer commandBuffer, uint32_t taskCount, uint32_t firstTask) PFN_vkCmdDrawMeshTasksNV;
VkResult function(VkQueue queue, VkPerformanceConfigurationINTEL configuration) vkQueueSetPerformanceConfigurationINTEL;
uint64_t function(VkDevice device, VkBufferDeviceAddressInfo* pInfo) PFN_vkGetBufferOpaqueCaptureAddressKHR;
void function(VkCommandBuffer commandBuffer, VkBuffer dstBuffer, VkDeviceSize dstOffset, VkDeviceSize size, uint32_t data) PFN_vkCmdFillBuffer;
void function(VkCommandBuffer commandBuffer, VkBuffer buffer, VkDeviceSize offset, uint32_t drawCount, uint32_t stride) PFN_vkCmdDrawMeshTasksIndirectNV;
void function(VkCommandBuffer commandBuffer, VkQueryPool queryPool, uint32_t query, VkQueryControlFlags flags, uint32_t index) vkCmdBeginQueryIndexedEXT;
VkResult function(VkQueue queue, uint32_t bindInfoCount, VkBindSparseInfo* pBindInfo, VkFence fence) vkQueueBindSparse;
VkResult function(VkDevice device, VkDebugUtilsObjectNameInfoEXT* pNameInfo) PFN_vkSetDebugUtilsObjectNameEXT;
VkResult function(VkDevice device, uint32_t bindInfoCount, VkBindImageMemoryInfo* pBindInfos) vkBindImageMemory2KHR;
void function(VkCommandBuffer commandBuffer, VkPipelineBindPoint pipelineBindPoint, VkPipeline pipeline, uint32_t groupIndex) PFN_vkCmdBindPipelineShaderGroupNV;
VkResult function(VkDevice device, VkSurfaceKHR surface, VkDeviceGroupPresentModeFlagsKHR* pModes) PFN_vkGetDeviceGroupSurfacePresentModesKHR;
void function(VkCommandBuffer commandBuffer, VkQueryPool queryPool, uint32_t query) vkCmdEndQuery;
void function(VkDevice device, VkBuffer buffer, VkAllocationCallbacks* pAllocator) PFN_vkDestroyBuffer;
VkResult function(VkQueue queue, uint32_t submitCount, VkSubmitInfo* pSubmits, VkFence fence) PFN_vkQueueSubmit;
VkResult function(VkDevice device, VkDisplayKHR display, VkDisplayPowerInfoEXT* pDisplayPowerInfo) PFN_vkDisplayPowerControlEXT;
void function(VkDevice device, VkCommandPool commandPool, VkAllocationCallbacks* pAllocator) PFN_vkDestroyCommandPool;
void function(VkDevice device, VkValidationCacheEXT validationCache, VkAllocationCallbacks* pAllocator) PFN_vkDestroyValidationCacheEXT;
VkResult function(VkDevice device) vkDeviceWaitIdle;
void function(VkCommandBuffer commandBuffer, VkQueryPool queryPool, uint32_t query, uint32_t index) vkCmdEndQueryIndexedEXT;
void function(VkCommandBuffer commandBuffer, VkBuffer raygenShaderBindingTableBuffer, VkDeviceSize raygenShaderBindingOffset, VkBuffer missShaderBindingTableBuffer, VkDeviceSize missShaderBindingOffset, VkDeviceSize missShaderBindingStride, VkBuffer hitShaderBindingTableBuffer, VkDeviceSize hitShaderBindingOffset, VkDeviceSize hitShaderBindingStride, VkBuffer callableShaderBindingTableBuffer, VkDeviceSize callableShaderBindingOffset, VkDeviceSize callableShaderBindingStride, uint32_t width, uint32_t height, uint32_t depth) vkCmdTraceRaysNV;
void function(VkCommandBuffer commandBuffer, VkQueryPool queryPool, uint32_t firstQuery, uint32_t queryCount, VkBuffer dstBuffer, VkDeviceSize dstOffset, VkDeviceSize stride, VkQueryResultFlags flags) vkCmdCopyQueryPoolResults;
void function(VkCommandBuffer commandBuffer, VkSubpassContents contents) PFN_vkCmdNextSubpass;
void function(VkDevice device) PFN_vkReleaseProfilingLockKHR;
VkResult function(VkDevice device, VkDescriptorSetLayoutCreateInfo* pCreateInfo, VkAllocationCallbacks* pAllocator, VkDescriptorSetLayout* pSetLayout) vkCreateDescriptorSetLayout;
void function(VkPhysicalDevice physicalDevice, uint32_t* pQueueFamilyPropertyCount, VkQueueFamilyProperties2* pQueueFamilyProperties) PFN_vkGetPhysicalDeviceQueueFamilyProperties2;
void function(VkCommandBuffer commandBuffer, uint32_t deviceMask) PFN_vkCmdSetDeviceMaskKHR;
VkResult function(VkDevice device, VkDescriptorUpdateTemplateCreateInfo* pCreateInfo, VkAllocationCallbacks* pAllocator, VkDescriptorUpdateTemplate* pDescriptorUpdateTemplate) PFN_vkCreateDescriptorUpdateTemplate;
VkResult function(VkDevice device, VkImportSemaphoreFdInfoKHR* pImportSemaphoreFdInfo) vkImportSemaphoreFdKHR;
VkResult function(VkDevice device, VkExternalMemoryHandleTypeFlagBits handleType, HANDLE handle, VkMemoryWin32HandlePropertiesKHR* pMemoryWin32HandleProperties) PFN_vkGetMemoryWin32HandlePropertiesKHR;
void function(VkDevice device, VkImageSparseMemoryRequirementsInfo2* pInfo, uint32_t* pSparseMemoryRequirementCount, VkSparseImageMemoryRequirements2* pSparseMemoryRequirements) PFN_vkGetImageSparseMemoryRequirements2;
void function(VkDevice device, VkCommandPool commandPool, VkCommandPoolTrimFlags flags) PFN_vkTrimCommandPool;
void function(VkDevice device, VkIndirectCommandsLayoutNV indirectCommandsLayout, VkAllocationCallbacks* pAllocator) PFN_vkDestroyIndirectCommandsLayoutNV;
void function(VkPhysicalDevice physicalDevice, VkPhysicalDeviceProperties* pProperties) vkGetPhysicalDeviceProperties;
VkResult function(VkDevice device, VkAcquireProfilingLockInfoKHR* pInfo) vkAcquireProfilingLockKHR;
void function(VkPhysicalDevice physicalDevice, VkSampleCountFlagBits samples, VkMultisamplePropertiesEXT* pMultisampleProperties) PFN_vkGetPhysicalDeviceMultisamplePropertiesEXT;
void function(VkCommandBuffer commandBuffer, float lineWidth) vkCmdSetLineWidth;
void function(VkCommandBuffer commandBuffer, VkBuffer buffer, VkDeviceSize offset, VkBuffer countBuffer, VkDeviceSize countBufferOffset, uint32_t maxDrawCount, uint32_t stride) vkCmdDrawIndexedIndirectCountKHR;
VkResult function(VkPhysicalDevice physicalDevice, VkSurfaceKHR surface, VkSurfaceCapabilities2EXT* pSurfaceCapabilities) vkGetPhysicalDeviceSurfaceCapabilities2EXT;
void function(VkDevice device, VkSemaphore semaphore, VkAllocationCallbacks* pAllocator) PFN_vkDestroySemaphore;
void function(VkPhysicalDevice physicalDevice, VkPhysicalDeviceExternalFenceInfo* pExternalFenceInfo, VkExternalFenceProperties* pExternalFenceProperties) PFN_vkGetPhysicalDeviceExternalFenceProperties;
VkResult function(VkDevice device, VkDescriptorPool descriptorPool, VkDescriptorPoolResetFlags flags) PFN_vkResetDescriptorPool;
VkResult function(VkDevice device, uint32_t bindInfoCount, VkBindImageMemoryInfo* pBindInfos) PFN_vkBindImageMemory2KHR;
VkResult function(VkQueue queue, uint32_t submitCount, VkSubmitInfo* pSubmits, VkFence fence) vkQueueSubmit;
void function(VkDevice device, VkRenderPass renderPass, VkExtent2D* pGranularity) PFN_vkGetRenderAreaGranularity;
VkResult function(VkDevice device, VkAcquireNextImageInfoKHR* pAcquireInfo, uint32_t* pImageIndex) vkAcquireNextImage2KHR;
PFN_vkVoidFunction function(VkInstance instance, byte* pName) vkGetInstanceProcAddr;
void function(VkDevice device, uint32_t swapchainCount, VkSwapchainKHR* pSwapchains, VkHdrMetadataEXT* pMetadata) vkSetHdrMetadataEXT;
void function(VkPhysicalDevice physicalDevice, VkPhysicalDeviceMemoryProperties2* pMemoryProperties) vkGetPhysicalDeviceMemoryProperties2KHR;
VkResult function(VkDevice device, VkPipelineLayoutCreateInfo* pCreateInfo, VkAllocationCallbacks* pAllocator, VkPipelineLayout* pPipelineLayout) vkCreatePipelineLayout;
VkResult function(VkInstance instance, VkDisplaySurfaceCreateInfoKHR* pCreateInfo, VkAllocationCallbacks* pAllocator, VkSurfaceKHR* pSurface) PFN_vkCreateDisplayPlaneSurfaceKHR;
uint32_t function(VkDevice device, VkImageViewHandleInfoNVX* pInfo) vkGetImageViewHandleNVX;
void function(VkPhysicalDevice physicalDevice, uint32_t* pQueueFamilyPropertyCount, VkQueueFamilyProperties2* pQueueFamilyProperties) PFN_vkGetPhysicalDeviceQueueFamilyProperties2KHR;
VkResult function(VkDevice device, VkSwapchainKHR swapchain) PFN_vkAcquireFullScreenExclusiveModeEXT;
void function(VkDevice device, VkImage image, uint32_t* pSparseMemoryRequirementCount, VkSparseImageMemoryRequirements* pSparseMemoryRequirements) vkGetImageSparseMemoryRequirements;
VkResult function(VkDevice device, VkImageCreateInfo* pCreateInfo, VkAllocationCallbacks* pAllocator, VkImage* pImage) PFN_vkCreateImage;
VkResult function(VkDevice device, VkImageView imageView, VkImageViewAddressPropertiesNVX* pProperties) vkGetImageViewAddressNVX;
VkResult function(VkDevice device, VkDeviceMemory memory, VkExternalMemoryHandleTypeFlagsNV handleType, HANDLE* pHandle) PFN_vkGetMemoryWin32HandleNV;
void function(VkCommandBuffer commandBuffer, VkAccelerationStructureInfoNV* pInfo, VkBuffer instanceData, VkDeviceSize instanceOffset, VkBool32 update, VkAccelerationStructureKHR dst, VkAccelerationStructureKHR src, VkBuffer scratch, VkDeviceSize scratchOffset) vkCmdBuildAccelerationStructureNV;
VkBool32 function(VkDebugReportFlagsEXT flags, VkDebugReportObjectTypeEXT objectType, uint64_t object, size_t location, int32_t messageCode, byte* pLayerPrefix, byte* pMessage, void* pUserData) PFN_vkDebugReportCallbackEXT;
void function(VkDevice device, VkBufferMemoryRequirementsInfo2* pInfo, VkMemoryRequirements2* pMemoryRequirements) vkGetBufferMemoryRequirements2KHR;
VkResult function(VkPhysicalDevice physicalDevice, VkDeviceCreateInfo* pCreateInfo, VkAllocationCallbacks* pAllocator, VkDevice* pDevice) PFN_vkCreateDevice;
void function(VkCommandBuffer commandBuffer, VkBuffer raygenShaderBindingTableBuffer, VkDeviceSize raygenShaderBindingOffset, VkBuffer missShaderBindingTableBuffer, VkDeviceSize missShaderBindingOffset, VkDeviceSize missShaderBindingStride, VkBuffer hitShaderBindingTableBuffer, VkDeviceSize hitShaderBindingOffset, VkDeviceSize hitShaderBindingStride, VkBuffer callableShaderBindingTableBuffer, VkDeviceSize callableShaderBindingOffset, VkDeviceSize callableShaderBindingStride, uint32_t width, uint32_t height, uint32_t depth) PFN_vkCmdTraceRaysNV;
void function(VkCommandBuffer commandBuffer, VkImage srcImage, VkImageLayout srcImageLayout, VkImage dstImage, VkImageLayout dstImageLayout, uint32_t regionCount, VkImageCopy* pRegions) vkCmdCopyImage;
void function(VkDevice device, VkDescriptorSetLayoutCreateInfo* pCreateInfo, VkDescriptorSetLayoutSupport* pSupport) vkGetDescriptorSetLayoutSupport;
VkResult function(VkDevice device, VkShaderModuleCreateInfo* pCreateInfo, VkAllocationCallbacks* pAllocator, VkShaderModule* pShaderModule) PFN_vkCreateShaderModule;
VkResult function(VkCommandBuffer commandBuffer) vkEndCommandBuffer;
void function(VkDevice device, VkDescriptorSetLayout descriptorSetLayout, VkAllocationCallbacks* pAllocator) vkDestroyDescriptorSetLayout;
void function(VkDevice device, VkDescriptorUpdateTemplate descriptorUpdateTemplate, VkAllocationCallbacks* pAllocator) PFN_vkDestroyDescriptorUpdateTemplateKHR;
VkResult function(byte* pLayerName, uint32_t* pPropertyCount, VkExtensionProperties* pProperties) vkEnumerateInstanceExtensionProperties;
VkResult function(VkDevice device, VkSwapchainKHR swapchain, uint64_t timeout, VkSemaphore semaphore, VkFence fence, uint32_t* pImageIndex) PFN_vkAcquireNextImageKHR;
void function(VkCommandBuffer commandBuffer, VkBuffer buffer, VkDeviceSize offset, VkBuffer countBuffer, VkDeviceSize countBufferOffset, uint32_t maxDrawCount, uint32_t stride) PFN_vkCmdDrawIndexedIndirectCount;
void function(VkDevice device, VkBuffer buffer, VkMemoryRequirements* pMemoryRequirements) vkGetBufferMemoryRequirements;
void function(VkDevice device, VkPipelineLayout pipelineLayout, VkAllocationCallbacks* pAllocator) vkDestroyPipelineLayout;
void function(VkCommandBuffer commandBuffer, uint32_t deviceMask) vkCmdSetDeviceMaskKHR;
VkResult function(VkDevice device, VkValidationCacheEXT dstCache, uint32_t srcCacheCount, VkValidationCacheEXT* pSrcCaches) PFN_vkMergeValidationCachesEXT;
void function(VkCommandBuffer commandBuffer, uint32_t firstExclusiveScissor, uint32_t exclusiveScissorCount, VkRect2D* pExclusiveScissors) PFN_vkCmdSetExclusiveScissorNV;
void function(VkCommandBuffer commandBuffer, VkDebugUtilsLabelEXT* pLabelInfo) PFN_vkCmdBeginDebugUtilsLabelEXT;
void function(VkDevice device, VkDeviceMemory memory, VkDeviceSize* pCommittedMemoryInBytes) vkGetDeviceMemoryCommitment;
void function(VkDevice device, VkObjectType objectType, uint64_t objectHandle, VkPrivateDataSlotEXT privateDataSlot, uint64_t* pData) vkGetPrivateDataEXT;
VkResult function(VkDevice device, uint32_t bindInfoCount, VkBindAccelerationStructureMemoryInfoKHR* pBindInfos) PFN_vkBindAccelerationStructureMemoryNV;
VkResult function(VkDevice device, VkPipelineCache pipelineCache, uint32_t createInfoCount, VkGraphicsPipelineCreateInfo* pCreateInfos, VkAllocationCallbacks* pAllocator, VkPipeline* pPipelines) PFN_vkCreateGraphicsPipelines;
void function(VkCommandBuffer commandBuffer, VkDescriptorUpdateTemplate descriptorUpdateTemplate, VkPipelineLayout layout, uint32_t set, void* pData) vkCmdPushDescriptorSetWithTemplateKHR;
VkResult function(VkDevice device, VkMemoryGetWin32HandleInfoKHR* pGetWin32HandleInfo, HANDLE* pHandle) PFN_vkGetMemoryWin32HandleKHR;
VkResult function(VkPhysicalDevice physicalDevice, VkDisplayModeKHR mode, uint32_t planeIndex, VkDisplayPlaneCapabilitiesKHR* pCapabilities) vkGetDisplayPlaneCapabilitiesKHR;
VkResult function(VkDevice device, VkSemaphoreSignalInfo* pSignalInfo) PFN_vkSignalSemaphoreKHR;
void function(VkDevice device, VkSwapchainKHR swapChain, VkBool32 localDimmingEnable) vkSetLocalDimmingAMD;
VkResult function(VkCommandBuffer commandBuffer, VkPerformanceOverrideInfoINTEL* pOverrideInfo) PFN_vkCmdSetPerformanceOverrideINTEL;
VkResult function(VkDevice device, VkSwapchainKHR swapchain) vkReleaseFullScreenExclusiveModeEXT;
void function(VkPhysicalDevice physicalDevice, VkPhysicalDeviceSparseImageFormatInfo2* pFormatInfo, uint32_t* pPropertyCount, VkSparseImageFormatProperties2* pProperties) PFN_vkGetPhysicalDeviceSparseImageFormatProperties2;
VkResult function(VkInstance instance, uint32_t* pPhysicalDeviceCount, VkPhysicalDevice* pPhysicalDevices) PFN_vkEnumeratePhysicalDevices;
void function(VkCommandBuffer commandBuffer, VkPipelineBindPoint pipelineBindPoint, VkPipelineLayout layout, uint32_t set, uint32_t descriptorWriteCount, VkWriteDescriptorSet* pDescriptorWrites) vkCmdPushDescriptorSetKHR;
void function(VkCommandBuffer commandBuffer, VkImageView imageView, VkImageLayout imageLayout) vkCmdBindShadingRateImageNV;
VkResult function(VkDevice device, VkAccelerationStructureCreateInfoNV* pCreateInfo, VkAllocationCallbacks* pAllocator, VkAccelerationStructureNV* pAccelerationStructure) vkCreateAccelerationStructureNV;
VkResult function(VkPhysicalDevice physicalDevice, uint32_t* pPropertyCount, VkDisplayPlaneProperties2KHR* pProperties) vkGetPhysicalDeviceDisplayPlaneProperties2KHR;
VkResult function(VkDevice device, VkDebugUtilsObjectNameInfoEXT* pNameInfo) vkSetDebugUtilsObjectNameEXT;
void function(VkCommandBuffer commandBuffer, VkBuffer buffer, VkDeviceSize offset, VkBuffer countBuffer, VkDeviceSize countBufferOffset, uint32_t maxDrawCount, uint32_t stride) PFN_vkCmdDrawIndexedIndirectCountKHR;
void function(VkPhysicalDevice physicalDevice, uint32_t* pQueueFamilyPropertyCount, VkQueueFamilyProperties* pQueueFamilyProperties) PFN_vkGetPhysicalDeviceQueueFamilyProperties;
void function(VkDevice device, VkAccelerationStructureMemoryRequirementsInfoNV* pInfo, VkMemoryRequirements2KHR* pMemoryRequirements) PFN_vkGetAccelerationStructureMemoryRequirementsNV;
void function(VkCommandBuffer commandBuffer, VkSampleLocationsInfoEXT* pSampleLocationsInfo) vkCmdSetSampleLocationsEXT;
VkResult function(VkDevice device, VkEvent event) vkResetEvent;
void function(VkCommandBuffer commandBuffer, VkBuffer buffer, VkDeviceSize offset, VkBuffer countBuffer, VkDeviceSize countBufferOffset, uint32_t maxDrawCount, uint32_t stride) vkCmdDrawIndexedIndirectCount;
VkResult function(VkDevice device, VkSemaphoreWaitInfo* pWaitInfo, uint64_t timeout) vkWaitSemaphores;
void function(VkCommandBuffer commandBuffer, uint32_t attachmentCount, VkClearAttachment* pAttachments, uint32_t rectCount, VkClearRect* pRects) PFN_vkCmdClearAttachments;
VkResult function(VkPhysicalDevice physicalDevice, VkDisplayKHR display, uint32_t* pPropertyCount, VkDisplayModeProperties2KHR* pProperties) vkGetDisplayModeProperties2KHR;
VkResult function(VkDevice device, VkDescriptorSetAllocateInfo* pAllocateInfo, VkDescriptorSet* pDescriptorSets) PFN_vkAllocateDescriptorSets;
void function(VkCommandBuffer commandBuffer, VkQueryPool queryPool, uint32_t firstQuery, uint32_t queryCount) vkCmdResetQueryPool;
void function(VkCommandBuffer commandBuffer, uint32_t baseGroupX, uint32_t baseGroupY, uint32_t baseGroupZ, uint32_t groupCountX, uint32_t groupCountY, uint32_t groupCountZ) PFN_vkCmdDispatchBaseKHR;
void function(VkCommandBuffer commandBuffer, VkSubpassEndInfo* pSubpassEndInfo) PFN_vkCmdEndRenderPass2;
VkResult function(VkDevice device, VkBufferViewCreateInfo* pCreateInfo, VkAllocationCallbacks* pAllocator, VkBufferView* pView) PFN_vkCreateBufferView;
void function(VkDevice device, uint32_t heapIndex, uint32_t localDeviceIndex, uint32_t remoteDeviceIndex, VkPeerMemoryFeatureFlags* pPeerMemoryFeatures) PFN_vkGetDeviceGroupPeerMemoryFeatures;
VkResult function(VkPhysicalDevice physicalDevice, VkPhysicalDeviceImageFormatInfo2* pImageFormatInfo, VkImageFormatProperties2* pImageFormatProperties) PFN_vkGetPhysicalDeviceImageFormatProperties2;
void function(VkPhysicalDevice physicalDevice, VkPhysicalDeviceExternalFenceInfo* pExternalFenceInfo, VkExternalFenceProperties* pExternalFenceProperties) PFN_vkGetPhysicalDeviceExternalFencePropertiesKHR;
VkResult function(VkDevice device, VkSemaphoreGetWin32HandleInfoKHR* pGetWin32HandleInfo, HANDLE* pHandle) PFN_vkGetSemaphoreWin32HandleKHR;
void function(VkCommandBuffer commandBuffer, uint32_t accelerationStructureCount, VkAccelerationStructureKHR* pAccelerationStructures, VkQueryType queryType, VkQueryPool queryPool, uint32_t firstQuery) vkCmdWriteAccelerationStructuresPropertiesKHR;
void function(VkDevice device, VkImage image, VkMemoryRequirements* pMemoryRequirements) PFN_vkGetImageMemoryRequirements;
void function(VkDevice device, uint32_t queueFamilyIndex, uint32_t queueIndex, VkQueue* pQueue) vkGetDeviceQueue;
VkResult function(VkDevice device, VkImage image, VkDeviceMemory memory, VkDeviceSize memoryOffset) PFN_vkBindImageMemory;
VkResult function(uint32_t* pApiVersion) vkEnumerateInstanceVersion;
void function(VkDevice device, VkDescriptorSet descriptorSet, VkDescriptorUpdateTemplate descriptorUpdateTemplate, void* pData) PFN_vkUpdateDescriptorSetWithTemplateKHR;
void function(VkPhysicalDevice physicalDevice, VkPhysicalDeviceMemoryProperties* pMemoryProperties) PFN_vkGetPhysicalDeviceMemoryProperties;
void function(VkCommandBuffer commandBuffer, VkGeneratedCommandsInfoNV* pGeneratedCommandsInfo) PFN_vkCmdPreprocessGeneratedCommandsNV;
void function(VkCommandBuffer commandBuffer, VkGeneratedCommandsInfoNV* pGeneratedCommandsInfo) vkCmdPreprocessGeneratedCommandsNV;
VkResult function(VkPhysicalDevice physicalDevice, uint32_t* pPropertyCount, VkDisplayPropertiesKHR* pProperties) PFN_vkGetPhysicalDeviceDisplayPropertiesKHR;
VkResult function(VkDevice device, VkPipeline pipeline, VkShaderStageFlagBits shaderStage, VkShaderInfoTypeAMD infoType, size_t* pInfoSize, void* pInfo) PFN_vkGetShaderInfoAMD;
void function(VkCommandBuffer commandBuffer, VkDebugMarkerMarkerInfoEXT* pMarkerInfo) PFN_vkCmdDebugMarkerBeginEXT;
VkResult function(VkDevice device, VkFenceGetFdInfoKHR* pGetFdInfo, int* pFd) vkGetFenceFdKHR;
VkResult function(VkDevice device, VkSemaphoreGetFdInfoKHR* pGetFdInfo, int* pFd) PFN_vkGetSemaphoreFdKHR;
void function(VkCommandBuffer commandBuffer, uint32_t firstExclusiveScissor, uint32_t exclusiveScissorCount, VkRect2D* pExclusiveScissors) vkCmdSetExclusiveScissorNV;
void function(VkCommandBuffer commandBuffer, VkBuffer buffer, VkDeviceSize offset, VkBuffer countBuffer, VkDeviceSize countBufferOffset, uint32_t maxDrawCount, uint32_t stride) PFN_vkCmdDrawIndirectCountAMD;
VkResult function(VkPhysicalDevice physicalDevice, VkDisplayKHR display, uint32_t* pPropertyCount, VkDisplayModePropertiesKHR* pProperties) PFN_vkGetDisplayModePropertiesKHR;
VkResult function(VkDevice device, VkImportFenceWin32HandleInfoKHR* pImportFenceWin32HandleInfo) PFN_vkImportFenceWin32HandleKHR;
void function(VkCommandBuffer commandBuffer, VkStencilFaceFlags faceMask, uint32_t compareMask) vkCmdSetStencilCompareMask;
VkResult function(VkPhysicalDevice physicalDevice, VkDisplayKHR display, uint32_t* pPropertyCount, VkDisplayModeProperties2KHR* pProperties) PFN_vkGetDisplayModeProperties2KHR;
VkResult function(VkDevice device, VkSwapchainKHR swapchain, VkRefreshCycleDurationGOOGLE* pDisplayTimingProperties) vkGetRefreshCycleDurationGOOGLE;
VkBool32 function(VkPhysicalDevice physicalDevice, uint32_t queueFamilyIndex) vkGetPhysicalDeviceWin32PresentationSupportKHR;
void function(VkInstance instance, VkDebugReportCallbackEXT callback, VkAllocationCallbacks* pAllocator) vkDestroyDebugReportCallbackEXT;
VkResult function(VkDevice device, VkPipelineCache pipelineCache, uint32_t createInfoCount, VkRayTracingPipelineCreateInfoNV* pCreateInfos, VkAllocationCallbacks* pAllocator, VkPipeline* pPipelines) vkCreateRayTracingPipelinesNV;
VkResult function(VkDevice device, VkRenderPassCreateInfo2* pCreateInfo, VkAllocationCallbacks* pAllocator, VkRenderPass* pRenderPass) PFN_vkCreateRenderPass2KHR;
void function(VkCommandBuffer commandBuffer, VkStencilFaceFlags faceMask, uint32_t writeMask) PFN_vkCmdSetStencilWriteMask;
VkResult function(VkDevice device, VkSwapchainKHR swapchain, uint32_t* pSwapchainImageCount, VkImage* pSwapchainImages) PFN_vkGetSwapchainImagesKHR;
void function(VkCommandBuffer commandBuffer, uint32_t accelerationStructureCount, VkAccelerationStructureKHR* pAccelerationStructures, VkQueryType queryType, VkQueryPool queryPool, uint32_t firstQuery) vkCmdWriteAccelerationStructuresPropertiesNV;
void function(VkPhysicalDevice physicalDevice, VkQueryPoolPerformanceCreateInfoKHR* pPerformanceQueryCreateInfo, uint32_t* pNumPasses) vkGetPhysicalDeviceQueueFamilyPerformanceQueryPassesKHR;
void function(VkDevice device, VkAllocationCallbacks* pAllocator) vkDestroyDevice;
void function(VkPhysicalDevice physicalDevice, VkFormat format, VkFormatProperties2* pFormatProperties) vkGetPhysicalDeviceFormatProperties2;
void function(VkPhysicalDevice physicalDevice, VkPhysicalDeviceFeatures* pFeatures) vkGetPhysicalDeviceFeatures;
VkResult function(VkPhysicalDevice physicalDevice, VkPhysicalDeviceImageFormatInfo2* pImageFormatInfo, VkImageFormatProperties2* pImageFormatProperties) vkGetPhysicalDeviceImageFormatProperties2KHR;
VkResult function(VkDevice device, VkBufferCreateInfo* pCreateInfo, VkAllocationCallbacks* pAllocator, VkBuffer* pBuffer) vkCreateBuffer;
VkResult function(VkDevice device, VkPhysicalDeviceSurfaceInfo2KHR* pSurfaceInfo, VkDeviceGroupPresentModeFlagsKHR* pModes) vkGetDeviceGroupSurfacePresentModes2EXT;
VkResult function(VkDevice device, VkEventCreateInfo* pCreateInfo, VkAllocationCallbacks* pAllocator, VkEvent* pEvent) PFN_vkCreateEvent;
VkResult function(VkDevice device, VkFenceCreateInfo* pCreateInfo, VkAllocationCallbacks* pAllocator, VkFence* pFence) PFN_vkCreateFence;
VkResult function(VkPhysicalDevice physicalDevice, uint32_t* pPropertyCount, VkDisplayPlaneProperties2KHR* pProperties) PFN_vkGetPhysicalDeviceDisplayPlaneProperties2KHR;
VkDeviceAddress function(VkDevice device, VkBufferDeviceAddressInfo* pInfo) vkGetBufferDeviceAddressKHR;
VkResult function(VkDevice device, uint32_t swapchainCount, VkSwapchainCreateInfoKHR* pCreateInfos, VkAllocationCallbacks* pAllocator, VkSwapchainKHR* pSwapchains) PFN_vkCreateSharedSwapchainsKHR;
VkResult function(VkDevice device, VkPipelineCache dstCache, uint32_t srcCacheCount, VkPipelineCache* pSrcCaches) PFN_vkMergePipelineCaches;
void function(VkCommandBuffer commandBuffer, VkSubpassBeginInfo* pSubpassBeginInfo, VkSubpassEndInfo* pSubpassEndInfo) vkCmdNextSubpass2;
void function(VkDevice device, VkQueryPool queryPool, uint32_t firstQuery, uint32_t queryCount) vkResetQueryPool;
VkResult function(VkDevice device, VkDescriptorUpdateTemplateCreateInfo* pCreateInfo, VkAllocationCallbacks* pAllocator, VkDescriptorUpdateTemplate* pDescriptorUpdateTemplate) PFN_vkCreateDescriptorUpdateTemplateKHR;
void function(VkInstance instance, VkAllocationCallbacks* pAllocator) vkDestroyInstance;
void function(VkDevice device, VkFence fence, VkAllocationCallbacks* pAllocator) vkDestroyFence;
VkResult function(VkDevice device, VkSwapchainKHR swapchain) vkAcquireFullScreenExclusiveModeEXT;
void function(VkDevice device, VkDescriptorSet descriptorSet, VkDescriptorUpdateTemplate descriptorUpdateTemplate, void* pData) vkUpdateDescriptorSetWithTemplateKHR;
VkResult function(VkDevice device, VkSamplerCreateInfo* pCreateInfo, VkAllocationCallbacks* pAllocator, VkSampler* pSampler) PFN_vkCreateSampler;
void function(VkCommandBuffer commandBuffer, VkSubpassContents contents) vkCmdNextSubpass;
void function(VkCommandBuffer commandBuffer, VkSubpassEndInfo* pSubpassEndInfo) vkCmdEndRenderPass2;
void function(VkInstance instance, VkDebugUtilsMessengerEXT messenger, VkAllocationCallbacks* pAllocator) PFN_vkDestroyDebugUtilsMessengerEXT;
void function(VkDevice device, VkAccelerationStructureKHR accelerationStructure, VkAllocationCallbacks* pAllocator) vkDestroyAccelerationStructureNV;
void function(VkDevice device, VkQueryPool queryPool, uint32_t firstQuery, uint32_t queryCount) PFN_vkResetQueryPool;
void function(VkCommandBuffer commandBuffer, VkBuffer buffer, VkDeviceSize offset, VkBuffer countBuffer, VkDeviceSize countBufferOffset, uint32_t maxDrawCount, uint32_t stride) vkCmdDrawIndirectCountAMD;
VkResult function(VkInstance instance, VkWin32SurfaceCreateInfoKHR* pCreateInfo, VkAllocationCallbacks* pAllocator, VkSurfaceKHR* pSurface) PFN_vkCreateWin32SurfaceKHR;
VkResult function(VkDevice device, VkBufferCreateInfo* pCreateInfo, VkAllocationCallbacks* pAllocator, VkBuffer* pBuffer) PFN_vkCreateBuffer;
void function(VkCommandBuffer commandBuffer, VkDebugUtilsLabelEXT* pLabelInfo) vkCmdInsertDebugUtilsLabelEXT;
void function(VkCommandBuffer commandBuffer, VkBuffer dstBuffer, VkDeviceSize dstOffset, VkDeviceSize dataSize, void* pData) PFN_vkCmdUpdateBuffer;
VkResult function(VkDevice device, VkSwapchainKHR swapchain, uint32_t* pSwapchainImageCount, VkImage* pSwapchainImages) vkGetSwapchainImagesKHR;
VkResult function(VkDevice device, VkCommandPoolCreateInfo* pCreateInfo, VkAllocationCallbacks* pAllocator, VkCommandPool* pCommandPool) PFN_vkCreateCommandPool;
VkResult function(VkDevice device, VkSamplerYcbcrConversionCreateInfo* pCreateInfo, VkAllocationCallbacks* pAllocator, VkSamplerYcbcrConversion* pYcbcrConversion) vkCreateSamplerYcbcrConversionKHR;
void function(VkCommandBuffer commandBuffer, VkBuffer srcBuffer, VkImage dstImage, VkImageLayout dstImageLayout, uint32_t regionCount, VkBufferImageCopy* pRegions) vkCmdCopyBufferToImage;
VkResult function(VkDevice device, VkBuffer buffer, VkDeviceMemory memory, VkDeviceSize memoryOffset) PFN_vkBindBufferMemory;
VkResult function(VkDevice device, uint32_t bindInfoCount, VkBindBufferMemoryInfo* pBindInfos) PFN_vkBindBufferMemory2KHR;
void function(VkDevice device, VkImageView imageView, VkAllocationCallbacks* pAllocator) PFN_vkDestroyImageView;
VkResult function(VkDevice device, VkImageViewCreateInfo* pCreateInfo, VkAllocationCallbacks* pAllocator, VkImageView* pView) PFN_vkCreateImageView;
void function(VkCommandBuffer commandBuffer, uint32_t accelerationStructureCount, VkAccelerationStructureKHR* pAccelerationStructures, VkQueryType queryType, VkQueryPool queryPool, uint32_t firstQuery) PFN_vkCmdWriteAccelerationStructuresPropertiesNV;
VkResult function(VkInstance instance, VkDebugReportCallbackCreateInfoEXT* pCreateInfo, VkAllocationCallbacks* pAllocator, VkDebugReportCallbackEXT* pCallback) vkCreateDebugReportCallbackEXT;
VkResult function(VkCommandBuffer commandBuffer, VkPerformanceStreamMarkerInfoINTEL* pMarkerInfo) PFN_vkCmdSetPerformanceStreamMarkerINTEL;
void function(VkQueue queue, VkDebugUtilsLabelEXT* pLabelInfo) PFN_vkQueueInsertDebugUtilsLabelEXT;
VkResult function(VkDevice device, VkFramebufferCreateInfo* pCreateInfo, VkAllocationCallbacks* pAllocator, VkFramebuffer* pFramebuffer) PFN_vkCreateFramebuffer;
void function(VkDevice device, VkPipelineCache pipelineCache, VkAllocationCallbacks* pAllocator) PFN_vkDestroyPipelineCache;
VkResult function(VkPhysicalDevice physicalDevice, byte* pLayerName, uint32_t* pPropertyCount, VkExtensionProperties* pProperties) vkEnumerateDeviceExtensionProperties;
void function(VkCommandBuffer commandBuffer, VkRenderPassBeginInfo* pRenderPassBegin, VkSubpassBeginInfo* pSubpassBeginInfo) vkCmdBeginRenderPass2KHR;
VkResult function(VkDevice device, VkSemaphore semaphore, uint64_t* pValue) PFN_vkGetSemaphoreCounterValue;
VkResult function(VkDevice device, VkAcquireNextImageInfoKHR* pAcquireInfo, uint32_t* pImageIndex) PFN_vkAcquireNextImage2KHR;
VkResult function(VkDevice device, VkDeviceEventInfoEXT* pDeviceEventInfo, VkAllocationCallbacks* pAllocator, VkFence* pFence) PFN_vkRegisterDeviceEventEXT;
void function(VkCommandBuffer commandBuffer, uint32_t firstViewport, uint32_t viewportCount, VkViewport* pViewports) PFN_vkCmdSetViewport;
void function(VkCommandBuffer commandBuffer, float depthBiasConstantFactor, float depthBiasClamp, float depthBiasSlopeFactor) PFN_vkCmdSetDepthBias;
VkResult function(VkInstance instance, VkHeadlessSurfaceCreateInfoEXT* pCreateInfo, VkAllocationCallbacks* pAllocator, VkSurfaceKHR* pSurface) vkCreateHeadlessSurfaceEXT;
VkResult function(VkDevice device, VkBufferViewCreateInfo* pCreateInfo, VkAllocationCallbacks* pAllocator, VkBufferView* pView) vkCreateBufferView;
VkResult function(VkDevice device, VkPipelineCache pipelineCache, size_t* pDataSize, void* pData) vkGetPipelineCacheData;
VkResult function(VkDevice device, uint32_t memoryRangeCount, VkMappedMemoryRange* pMemoryRanges) PFN_vkInvalidateMappedMemoryRanges;
void function(VkCommandBuffer commandBuffer, uint32_t taskCount, uint32_t firstTask) vkCmdDrawMeshTasksNV;
VkResult function(VkPhysicalDevice physicalDevice, uint32_t* pPropertyCount, VkDisplayProperties2KHR* pProperties) PFN_vkGetPhysicalDeviceDisplayProperties2KHR;
void function(VkDevice device, uint32_t queueFamilyIndex, uint32_t queueIndex, VkQueue* pQueue) PFN_vkGetDeviceQueue;
void function(VkCommandBuffer commandBuffer, VkImage srcImage, VkImageLayout srcImageLayout, VkBuffer dstBuffer, uint32_t regionCount, VkBufferImageCopy* pRegions) PFN_vkCmdCopyImageToBuffer;
void function(VkCommandBuffer commandBuffer, VkAccelerationStructureKHR dst, VkAccelerationStructureKHR src, VkCopyAccelerationStructureModeKHR mode) vkCmdCopyAccelerationStructureNV;
void function(VkDevice device, VkRenderPass renderPass, VkAllocationCallbacks* pAllocator) vkDestroyRenderPass;
VkResult function(VkDevice device, VkImage image, VkDeviceMemory memory, VkDeviceSize memoryOffset) vkBindImageMemory;
VkDeviceAddress function(VkDevice device, VkBufferDeviceAddressInfo* pInfo) PFN_vkGetBufferDeviceAddressKHR;
VkResult function(VkInstance instance, VkWin32SurfaceCreateInfoKHR* pCreateInfo, VkAllocationCallbacks* pAllocator, VkSurfaceKHR* pSurface) vkCreateWin32SurfaceKHR;
VkResult function(VkDevice device, VkValidationCacheEXT dstCache, uint32_t srcCacheCount, VkValidationCacheEXT* pSrcCaches) vkMergeValidationCachesEXT;
VkResult function(VkPhysicalDevice physicalDevice, uint32_t* pToolCount, VkPhysicalDeviceToolPropertiesEXT* pToolProperties) vkGetPhysicalDeviceToolPropertiesEXT;
void function(VkCommandBuffer commandBuffer, VkBuffer dstBuffer, VkDeviceSize dstOffset, VkDeviceSize dataSize, void* pData) vkCmdUpdateBuffer;
VkResult function(VkDevice device, VkSwapchainKHR swapchain, uint32_t* pPresentationTimingCount, VkPastPresentationTimingGOOGLE* pPresentationTimings) vkGetPastPresentationTimingGOOGLE;
void function(VkCommandBuffer commandBuffer, VkPipelineStageFlagBits pipelineStage, VkQueryPool queryPool, uint32_t query) PFN_vkCmdWriteTimestamp;
void function(VkCommandBuffer commandBuffer, VkBuffer buffer, VkDeviceSize offset, uint32_t drawCount, uint32_t stride) PFN_vkCmdDrawIndirect;
void function(VkDevice device, VkDescriptorUpdateTemplate descriptorUpdateTemplate, VkAllocationCallbacks* pAllocator) vkDestroyDescriptorUpdateTemplate;
uint64_t function(VkDevice device, VkBufferDeviceAddressInfo* pInfo) vkGetBufferOpaqueCaptureAddress;
void function(VkCommandBuffer commandBuffer) vkCmdDebugMarkerEndEXT;
VkResult function(VkPhysicalDevice physicalDevice, VkDisplayKHR display, VkDisplayModeCreateInfoKHR* pCreateInfo, VkAllocationCallbacks* pAllocator, VkDisplayModeKHR* pMode) PFN_vkCreateDisplayModeKHR;
void function(VkPhysicalDevice physicalDevice, VkQueryPoolPerformanceCreateInfoKHR* pPerformanceQueryCreateInfo, uint32_t* pNumPasses) PFN_vkGetPhysicalDeviceQueueFamilyPerformanceQueryPassesKHR;
VkResult function(VkDevice device, VkDisplayKHR display, VkDisplayPowerInfoEXT* pDisplayPowerInfo) vkDisplayPowerControlEXT;
void function(VkDevice device, VkQueryPool queryPool, uint32_t firstQuery, uint32_t queryCount) PFN_vkResetQueryPoolEXT;
void function(VkCommandBuffer commandBuffer, VkBuffer srcBuffer, VkImage dstImage, VkImageLayout dstImageLayout, uint32_t regionCount, VkBufferImageCopy* pRegions) PFN_vkCmdCopyBufferToImage;
VkResult function(VkDevice device, VkPipelineExecutableInfoKHR* pExecutableInfo, uint32_t* pInternalRepresentationCount, VkPipelineExecutableInternalRepresentationKHR* pInternalRepresentations) PFN_vkGetPipelineExecutableInternalRepresentationsKHR;
VkResult function(VkDevice device, VkSemaphoreWaitInfo* pWaitInfo, uint64_t timeout) vkWaitSemaphoresKHR;
void function(VkDevice device, VkImageView imageView, VkAllocationCallbacks* pAllocator) vkDestroyImageView;
void function(VkCommandBuffer commandBuffer, uint32_t lineStippleFactor, uint16_t lineStipplePattern) vkCmdSetLineStippleEXT;
void function(VkCommandBuffer commandBuffer, float[4] blendConstants) PFN_vkCmdSetBlendConstants;
void function(VkCommandBuffer commandBuffer, uint32_t baseGroupX, uint32_t baseGroupY, uint32_t baseGroupZ, uint32_t groupCountX, uint32_t groupCountY, uint32_t groupCountZ) vkCmdDispatchBase;
VkResult function(VkDevice device, VkSwapchainKHR swapchain) PFN_vkReleaseFullScreenExclusiveModeEXT;
void function(VkCommandBuffer commandBuffer, VkImage srcImage, VkImageLayout srcImageLayout, VkImage dstImage, VkImageLayout dstImageLayout, uint32_t regionCount, VkImageBlit* pRegions, VkFilter filter) vkCmdBlitImage;
void function(VkDevice device, VkIndirectCommandsLayoutNV indirectCommandsLayout, VkAllocationCallbacks* pAllocator) vkDestroyIndirectCommandsLayoutNV;
void function(VkCommandBuffer commandBuffer, VkQueryPool queryPool, uint32_t query) PFN_vkCmdEndQuery;
VkResult function(VkInstanceCreateInfo* pCreateInfo, VkAllocationCallbacks* pAllocator, VkInstance* pInstance) PFN_vkCreateInstance;
VkResult function(VkPhysicalDevice physicalDevice, VkDeviceCreateInfo* pCreateInfo, VkAllocationCallbacks* pAllocator, VkDevice* pDevice) vkCreateDevice;
void function(VkCommandBuffer commandBuffer, uint32_t firstScissor, uint32_t scissorCount, VkRect2D* pScissors) PFN_vkCmdSetScissor;
void function(VkPhysicalDevice physicalDevice, VkSampleCountFlagBits samples, VkMultisamplePropertiesEXT* pMultisampleProperties) vkGetPhysicalDeviceMultisamplePropertiesEXT;
VkResult function(VkDevice device, uint32_t bindInfoCount, VkBindBufferMemoryInfo* pBindInfos) PFN_vkBindBufferMemory2;
VkResult function(VkDevice device, VkInitializePerformanceApiInfoINTEL* pInitializeInfo) PFN_vkInitializePerformanceApiINTEL;
void function(VkInstance instance, VkDebugUtilsMessageSeverityFlagBitsEXT messageSeverity, VkDebugUtilsMessageTypeFlagsEXT messageTypes, VkDebugUtilsMessengerCallbackDataEXT* pCallbackData) vkSubmitDebugUtilsMessageEXT;
void function(VkDevice device, VkDescriptorSetLayout descriptorSetLayout, VkAllocationCallbacks* pAllocator) PFN_vkDestroyDescriptorSetLayout;
VkResult function(VkPhysicalDevice physicalDevice, VkDisplayModeKHR mode, uint32_t planeIndex, VkDisplayPlaneCapabilitiesKHR* pCapabilities) PFN_vkGetDisplayPlaneCapabilitiesKHR;
void function(VkDevice device, VkFramebuffer framebuffer, VkAllocationCallbacks* pAllocator) PFN_vkDestroyFramebuffer;
VkResult function(VkCommandBuffer commandBuffer, VkPerformanceMarkerInfoINTEL* pMarkerInfo) vkCmdSetPerformanceMarkerINTEL;
VkResult function(VkDevice device, VkSemaphore semaphore, uint64_t* pValue) vkGetSemaphoreCounterValueKHR;
void function(VkDevice device, VkQueryPool queryPool, VkAllocationCallbacks* pAllocator) PFN_vkDestroyQueryPool;
void function(VkPhysicalDevice physicalDevice, VkPhysicalDeviceMemoryProperties2* pMemoryProperties) vkGetPhysicalDeviceMemoryProperties2;
VkResult function(VkInstance instance, uint32_t* pPhysicalDeviceGroupCount, VkPhysicalDeviceGroupProperties* pPhysicalDeviceGroupProperties) vkEnumeratePhysicalDeviceGroupsKHR;
VkResult function(VkDevice device, VkDebugMarkerObjectNameInfoEXT* pNameInfo) vkDebugMarkerSetObjectNameEXT;
VkResult function(VkDevice device, VkSemaphoreWaitInfo* pWaitInfo, uint64_t timeout) PFN_vkWaitSemaphoresKHR;
void function(VkCommandBuffer commandBuffer, VkBuffer buffer, VkDeviceSize offset, VkIndexType indexType) vkCmdBindIndexBuffer;
void function(VkCommandBuffer commandBuffer, uint32_t indexCount, uint32_t instanceCount, uint32_t firstIndex, int32_t vertexOffset, uint32_t firstInstance) PFN_vkCmdDrawIndexed;
VkResult function(VkDevice device, uint32_t bindInfoCount, VkBindAccelerationStructureMemoryInfoKHR* pBindInfos) vkBindAccelerationStructureMemoryKHR;
VkResult function(VkInstance instance, uint32_t* pPhysicalDeviceGroupCount, VkPhysicalDeviceGroupProperties* pPhysicalDeviceGroupProperties) PFN_vkEnumeratePhysicalDeviceGroupsKHR;
void function(VkPhysicalDevice physicalDevice, VkPhysicalDeviceSparseImageFormatInfo2* pFormatInfo, uint32_t* pPropertyCount, VkSparseImageFormatProperties2* pProperties) vkGetPhysicalDeviceSparseImageFormatProperties2;
VkResult function(VkPhysicalDevice physicalDevice, uint32_t* pPropertyCount, VkDisplayPlanePropertiesKHR* pProperties) PFN_vkGetPhysicalDeviceDisplayPlanePropertiesKHR;
void function(VkCommandBuffer commandBuffer, uint32_t vertexCount, uint32_t instanceCount, uint32_t firstVertex, uint32_t firstInstance) vkCmdDraw;
VkResult function(VkDevice device, VkPipelineInfoKHR* pPipelineInfo, uint32_t* pExecutableCount, VkPipelineExecutablePropertiesKHR* pProperties) vkGetPipelineExecutablePropertiesKHR;
void function(VkCommandBuffer commandBuffer, VkCoarseSampleOrderTypeNV sampleOrderType, uint32_t customSampleOrderCount, VkCoarseSampleOrderCustomNV* pCustomSampleOrders) vkCmdSetCoarseSampleOrderNV;
VkResult function(VkDevice device, VkMemoryGetFdInfoKHR* pGetFdInfo, int* pFd) vkGetMemoryFdKHR;
void function() PFN_vkVoidFunction;
VkResult function(VkQueue queue, VkPresentInfoKHR* pPresentInfo) vkQueuePresentKHR;
VkResult function(VkPhysicalDevice physicalDevice, uint32_t* pPropertyCount, VkLayerProperties* pProperties) vkEnumerateDeviceLayerProperties;
void function(VkCommandBuffer commandBuffer, VkBuffer buffer, VkDeviceSize offset) PFN_vkCmdDispatchIndirect;
VkResult function(VkDevice device, VkPipelineCache pipelineCache, uint32_t createInfoCount, VkGraphicsPipelineCreateInfo* pCreateInfos, VkAllocationCallbacks* pAllocator, VkPipeline* pPipelines) vkCreateGraphicsPipelines;
void function(VkCommandBuffer commandBuffer, VkStencilFaceFlags faceMask, uint32_t writeMask) vkCmdSetStencilWriteMask;
void function(VkCommandBuffer commandBuffer, VkImage srcImage, VkImageLayout srcImageLayout, VkBuffer dstBuffer, uint32_t regionCount, VkBufferImageCopy* pRegions) vkCmdCopyImageToBuffer;
VkResult function(VkPhysicalDevice physicalDevice, VkDisplayKHR display) vkReleaseDisplayEXT;
void function(VkPhysicalDevice physicalDevice, VkPhysicalDeviceExternalBufferInfo* pExternalBufferInfo, VkExternalBufferProperties* pExternalBufferProperties) PFN_vkGetPhysicalDeviceExternalBufferPropertiesKHR;
void function(VkPhysicalDevice physicalDevice, VkFormat format, VkImageType type, VkSampleCountFlagBits samples, VkImageUsageFlags usage, VkImageTiling tiling, uint32_t* pPropertyCount, VkSparseImageFormatProperties* pProperties) PFN_vkGetPhysicalDeviceSparseImageFormatProperties;
void function(VkDevice device, VkDescriptorSet descriptorSet, VkDescriptorUpdateTemplate descriptorUpdateTemplate, void* pData) PFN_vkUpdateDescriptorSetWithTemplate;
VkResult function(VkDevice device, VkExternalMemoryHandleTypeFlagBits handleType, void* pHostPointer, VkMemoryHostPointerPropertiesEXT* pMemoryHostPointerProperties) vkGetMemoryHostPointerPropertiesEXT;
VkResult function(VkInstance instance, uint32_t* pPhysicalDeviceGroupCount, VkPhysicalDeviceGroupProperties* pPhysicalDeviceGroupProperties) vkEnumeratePhysicalDeviceGroups;
void function(VkCommandBuffer commandBuffer, VkBuffer dstBuffer, VkDeviceSize dstOffset, VkDeviceSize size, uint32_t data) vkCmdFillBuffer;
VkResult function(VkDevice device, VkPipelineCache pipelineCache, uint32_t createInfoCount, VkComputePipelineCreateInfo* pCreateInfos, VkAllocationCallbacks* pAllocator, VkPipeline* pPipelines) PFN_vkCreateComputePipelines;
void function(VkCommandBuffer commandBuffer, VkBuffer buffer, VkDeviceSize offset, VkIndexType indexType) PFN_vkCmdBindIndexBuffer;
void function(VkCommandBuffer commandBuffer, uint32_t deviceMask) vkCmdSetDeviceMask;
VkResult function(VkDevice device, VkExternalMemoryHandleTypeFlagBits handleType, void* pHostPointer, VkMemoryHostPointerPropertiesEXT* pMemoryHostPointerProperties) PFN_vkGetMemoryHostPointerPropertiesEXT;
VkResult function(VkDevice device, VkSamplerYcbcrConversionCreateInfo* pCreateInfo, VkAllocationCallbacks* pAllocator, VkSamplerYcbcrConversion* pYcbcrConversion) vkCreateSamplerYcbcrConversion;
void function(VkPhysicalDevice physicalDevice, VkPhysicalDeviceFeatures2* pFeatures) PFN_vkGetPhysicalDeviceFeatures2;
VkResult function(VkCommandBuffer commandBuffer, VkCommandBufferBeginInfo* pBeginInfo) vkBeginCommandBuffer;
void function(VkInstance instance, VkAllocationCallbacks* pAllocator) PFN_vkDestroyInstance;
void function(VkCommandBuffer commandBuffer, VkBuffer buffer, VkDeviceSize offset, VkBuffer countBuffer, VkDeviceSize countBufferOffset, uint32_t maxDrawCount, uint32_t stride) vkCmdDrawMeshTasksIndirectCountNV;
void function(VkPhysicalDevice physicalDevice, VkFormat format, VkFormatProperties* pFormatProperties) PFN_vkGetPhysicalDeviceFormatProperties;
VkResult function(VkInstance instance, VkDebugUtilsMessengerCreateInfoEXT* pCreateInfo, VkAllocationCallbacks* pAllocator, VkDebugUtilsMessengerEXT* pMessenger) vkCreateDebugUtilsMessengerEXT;
void function(VkCommandBuffer commandBuffer, uint32_t firstCounterBuffer, uint32_t counterBufferCount, VkBuffer* pCounterBuffers, VkDeviceSize* pCounterBufferOffsets) vkCmdBeginTransformFeedbackEXT;
VkResult function(VkDevice device, VkRenderPassCreateInfo* pCreateInfo, VkAllocationCallbacks* pAllocator, VkRenderPass* pRenderPass) PFN_vkCreateRenderPass;
void function(VkDevice device, VkBufferMemoryRequirementsInfo2* pInfo, VkMemoryRequirements2* pMemoryRequirements) vkGetBufferMemoryRequirements2;
VkResult function(VkDevice device, VkImportFenceFdInfoKHR* pImportFenceFdInfo) vkImportFenceFdKHR;
void function(VkDevice device, VkDeviceMemory memory) vkUnmapMemory;
VkResult function(VkPhysicalDevice physicalDevice, uint32_t* pCombinationCount, VkFramebufferMixedSamplesCombinationNV* pCombinations) vkGetPhysicalDeviceSupportedFramebufferMixedSamplesCombinationsNV;
void function(VkCommandBuffer commandBuffer, VkImage image, VkImageLayout imageLayout, VkClearDepthStencilValue* pDepthStencil, uint32_t rangeCount, VkImageSubresourceRange* pRanges) vkCmdClearDepthStencilImage;
void function(VkDevice device, VkPrivateDataSlotEXT privateDataSlot, VkAllocationCallbacks* pAllocator) vkDestroyPrivateDataSlotEXT;
VkResult function(VkDevice device, VkSemaphore semaphore, uint64_t* pValue) vkGetSemaphoreCounterValue;
VkResult function(VkPhysicalDevice physicalDevice, uint32_t planeIndex, uint32_t* pDisplayCount, VkDisplayKHR* pDisplays) vkGetDisplayPlaneSupportedDisplaysKHR;
void function(VkPhysicalDevice physicalDevice, VkFormat format, VkFormatProperties2* pFormatProperties) PFN_vkGetPhysicalDeviceFormatProperties2KHR;
void function(VkCommandBuffer commandBuffer, VkConditionalRenderingBeginInfoEXT* pConditionalRenderingBegin) PFN_vkCmdBeginConditionalRenderingEXT;
void function(VkDevice device, VkImageSparseMemoryRequirementsInfo2* pInfo, uint32_t* pSparseMemoryRequirementCount, VkSparseImageMemoryRequirements2* pSparseMemoryRequirements) vkGetImageSparseMemoryRequirements2KHR;
void function(VkCommandBuffer commandBuffer, uint32_t instanceCount, uint32_t firstInstance, VkBuffer counterBuffer, VkDeviceSize counterBufferOffset, uint32_t counterOffset, uint32_t vertexStride) PFN_vkCmdDrawIndirectByteCountEXT;
void function(VkCommandBuffer commandBuffer, uint32_t firstCounterBuffer, uint32_t counterBufferCount, VkBuffer* pCounterBuffers, VkDeviceSize* pCounterBufferOffsets) vkCmdEndTransformFeedbackEXT;
void function(VkDevice device, VkQueryPool queryPool, uint32_t firstQuery, uint32_t queryCount) vkResetQueryPoolEXT;
VkResult function(VkDevice device, VkPipelineCache pipelineCache, uint32_t createInfoCount, VkComputePipelineCreateInfo* pCreateInfos, VkAllocationCallbacks* pAllocator, VkPipeline* pPipelines) vkCreateComputePipelines;
void function(VkDevice device, VkDescriptorPool descriptorPool, VkAllocationCallbacks* pAllocator) PFN_vkDestroyDescriptorPool;
void function(VkInstance instance, VkDebugUtilsMessengerEXT messenger, VkAllocationCallbacks* pAllocator) vkDestroyDebugUtilsMessengerEXT;
void function(VkCommandBuffer commandBuffer, uint32_t firstViewport, uint32_t viewportCount, VkViewportWScalingNV* pViewportWScalings) vkCmdSetViewportWScalingNV;
void function(VkDevice device, VkDescriptorSetLayoutCreateInfo* pCreateInfo, VkDescriptorSetLayoutSupport* pSupport) PFN_vkGetDescriptorSetLayoutSupportKHR;
void function(VkCommandBuffer commandBuffer, uint32_t firstCounterBuffer, uint32_t counterBufferCount, VkBuffer* pCounterBuffers, VkDeviceSize* pCounterBufferOffsets) PFN_vkCmdBeginTransformFeedbackEXT;
void function(VkCommandBuffer commandBuffer, VkImage image, VkImageLayout imageLayout, VkClearColorValue* pColor, uint32_t rangeCount, VkImageSubresourceRange* pRanges) vkCmdClearColorImage;
void function(VkCommandBuffer commandBuffer, VkEvent event, VkPipelineStageFlags stageMask) vkCmdSetEvent;
void function(VkDevice device, VkSampler sampler, VkAllocationCallbacks* pAllocator) PFN_vkDestroySampler;
void function(VkPhysicalDevice physicalDevice, VkFormat format, VkImageType type, VkSampleCountFlagBits samples, VkImageUsageFlags usage, VkImageTiling tiling, uint32_t* pPropertyCount, VkSparseImageFormatProperties* pProperties) vkGetPhysicalDeviceSparseImageFormatProperties;
VkResult function(VkDevice device, VkDescriptorPool descriptorPool, uint32_t descriptorSetCount, VkDescriptorSet* pDescriptorSets) PFN_vkFreeDescriptorSets;
void function(VkInstance instance, VkDebugReportFlagsEXT flags, VkDebugReportObjectTypeEXT objectType, uint64_t object, size_t location, int32_t messageCode, byte* pLayerPrefix, byte* pMessage) PFN_vkDebugReportMessageEXT;
void function(VkCommandBuffer commandBuffer, VkSubpassEndInfo* pSubpassEndInfo) PFN_vkCmdEndRenderPass2KHR;
VkResult function(VkPhysicalDevice physicalDevice, VkPhysicalDeviceImageFormatInfo2* pImageFormatInfo, VkImageFormatProperties2* pImageFormatProperties) vkGetPhysicalDeviceImageFormatProperties2;
VkResult function(VkDevice device, VkCommandBufferAllocateInfo* pAllocateInfo, VkCommandBuffer* pCommandBuffers) PFN_vkAllocateCommandBuffers;
VkResult function(VkDevice device, uint32_t bindInfoCount, VkBindImageMemoryInfo* pBindInfos) vkBindImageMemory2;
void function(VkCommandBuffer commandBuffer, uint32_t eventCount, VkEvent* pEvents, VkPipelineStageFlags srcStageMask, VkPipelineStageFlags dstStageMask, uint32_t memoryBarrierCount, VkMemoryBarrier* pMemoryBarriers, uint32_t bufferMemoryBarrierCount, VkBufferMemoryBarrier* pBufferMemoryBarriers, uint32_t imageMemoryBarrierCount, VkImageMemoryBarrier* pImageMemoryBarriers) PFN_vkCmdWaitEvents;
void function(VkPhysicalDevice physicalDevice, VkPhysicalDeviceExternalSemaphoreInfo* pExternalSemaphoreInfo, VkExternalSemaphoreProperties* pExternalSemaphoreProperties) vkGetPhysicalDeviceExternalSemaphorePropertiesKHR;
VkResult function(VkDevice device, VkDeviceEventInfoEXT* pDeviceEventInfo, VkAllocationCallbacks* pAllocator, VkFence* pFence) vkRegisterDeviceEventEXT;
void function(VkCommandBuffer commandBuffer, uint32_t firstViewport, uint32_t viewportCount, VkViewport* pViewports) vkCmdSetViewport;
void function(VkCommandBuffer commandBuffer, VkQueryPool queryPool, uint32_t query, VkQueryControlFlags flags) vkCmdBeginQuery;
void function(VkCommandBuffer commandBuffer, VkBool32 isPreprocessed, VkGeneratedCommandsInfoNV* pGeneratedCommandsInfo) vkCmdExecuteGeneratedCommandsNV;
void function(VkQueue queue, VkDebugUtilsLabelEXT* pLabelInfo) vkQueueInsertDebugUtilsLabelEXT;
void function(VkDevice device, VkImage image, VkImageSubresource* pSubresource, VkSubresourceLayout* pLayout) PFN_vkGetImageSubresourceLayout;
VkResult function(VkDevice device, VkPerformanceConfigurationINTEL configuration) vkReleasePerformanceConfigurationINTEL;
void function(VkDevice device, VkAccelerationStructureMemoryRequirementsInfoNV* pInfo, VkMemoryRequirements2KHR* pMemoryRequirements) vkGetAccelerationStructureMemoryRequirementsNV;
VkResult function(VkDevice device, VkPerformanceParameterTypeINTEL parameter, VkPerformanceValueINTEL* pValue) PFN_vkGetPerformanceParameterINTEL;
VkResult function(VkDevice device, VkSwapchainKHR swapchain) PFN_vkGetSwapchainStatusKHR;
PFN_vkVoidFunction function(VkDevice device, byte* pName) vkGetDeviceProcAddr;
void function(VkDevice device, VkQueryPool queryPool, VkAllocationCallbacks* pAllocator) vkDestroyQueryPool;
VkResult function(VkDevice device, VkImportSemaphoreFdInfoKHR* pImportSemaphoreFdInfo) PFN_vkImportSemaphoreFdKHR;
void function(VkPhysicalDevice physicalDevice, VkPhysicalDeviceProperties2* pProperties) PFN_vkGetPhysicalDeviceProperties2KHR;
void function(VkCommandBuffer commandBuffer) PFN_vkCmdEndDebugUtilsLabelEXT;
void function(VkDevice device, VkSwapchainKHR swapChain, VkBool32 localDimmingEnable) PFN_vkSetLocalDimmingAMD;
VkResult function(VkDevice device, VkPipeline pipeline, VkShaderStageFlagBits shaderStage, VkShaderInfoTypeAMD infoType, size_t* pInfoSize, void* pInfo) vkGetShaderInfoAMD;
void function(VkDevice device, VkPipeline pipeline, VkAllocationCallbacks* pAllocator) PFN_vkDestroyPipeline;
void function(VkDevice device, VkDeviceMemory memory, VkAllocationCallbacks* pAllocator) vkFreeMemory;
void function(VkDevice device, VkGeneratedCommandsMemoryRequirementsInfoNV* pInfo, VkMemoryRequirements2* pMemoryRequirements) PFN_vkGetGeneratedCommandsMemoryRequirementsNV;
VkResult function(VkDevice device, uint32_t bindInfoCount, VkBindBufferMemoryInfo* pBindInfos) vkBindBufferMemory2;
VkResult function(VkPhysicalDevice physicalDevice, uint32_t queueFamilyIndex, uint32_t* pCounterCount, VkPerformanceCounterKHR* pCounters, VkPerformanceCounterDescriptionKHR* pCounterDescriptions) vkEnumeratePhysicalDeviceQueueFamilyPerformanceQueryCountersKHR;
VkResult function(VkPhysicalDevice physicalDevice, VkPhysicalDeviceImageFormatInfo2* pImageFormatInfo, VkImageFormatProperties2* pImageFormatProperties) PFN_vkGetPhysicalDeviceImageFormatProperties2KHR;
void function(VkDevice device, VkDescriptorUpdateTemplate descriptorUpdateTemplate, VkAllocationCallbacks* pAllocator) vkDestroyDescriptorUpdateTemplateKHR;
VkResult function(VkPhysicalDevice physicalDevice, VkSurfaceKHR surface, uint32_t* pSurfaceFormatCount, VkSurfaceFormatKHR* pSurfaceFormats) vkGetPhysicalDeviceSurfaceFormatsKHR;
void function(VkCommandBuffer commandBuffer, VkPipelineLayout layout, VkShaderStageFlags stageFlags, uint32_t offset, uint32_t size, void* pValues) vkCmdPushConstants;
void function(VkCommandBuffer commandBuffer, VkDebugMarkerMarkerInfoEXT* pMarkerInfo) vkCmdDebugMarkerBeginEXT;
void function(VkDevice device, VkSamplerYcbcrConversion ycbcrConversion, VkAllocationCallbacks* pAllocator) vkDestroySamplerYcbcrConversionKHR;
VkResult function(VkDevice device, VkDeviceMemory memory, VkExternalMemoryHandleTypeFlagsNV handleType, HANDLE* pHandle) vkGetMemoryWin32HandleNV;
VkResult function(VkDevice device, VkEvent event) PFN_vkResetEvent;
VkResult function(VkDevice device, uint32_t timestampCount, VkCalibratedTimestampInfoEXT* pTimestampInfos, uint64_t* pTimestamps, uint64_t* pMaxDeviation) vkGetCalibratedTimestampsEXT;
uint64_t function(VkDevice device, VkBufferDeviceAddressInfo* pInfo) vkGetBufferOpaqueCaptureAddressKHR;
VkResult function(VkDevice device, uint32_t bindInfoCount, VkBindAccelerationStructureMemoryInfoKHR* pBindInfos) PFN_vkBindAccelerationStructureMemoryKHR;
VkResult function(VkPhysicalDevice physicalDevice, VkPhysicalDeviceSurfaceInfo2KHR* pSurfaceInfo, uint32_t* pPresentModeCount, VkPresentModeKHR* pPresentModes) PFN_vkGetPhysicalDeviceSurfacePresentModes2EXT;
VkResult function(VkPhysicalDevice physicalDevice, VkFormat format, VkImageType type, VkImageTiling tiling, VkImageUsageFlags usage, VkImageCreateFlags flags, VkExternalMemoryHandleTypeFlagsNV externalHandleType, VkExternalImageFormatPropertiesNV* pExternalImageFormatProperties) vkGetPhysicalDeviceExternalImageFormatPropertiesNV;
VkResult function(VkPhysicalDevice physicalDevice, VkFormat format, VkImageType type, VkImageTiling tiling, VkImageUsageFlags usage, VkImageCreateFlags flags, VkImageFormatProperties* pImageFormatProperties) PFN_vkGetPhysicalDeviceImageFormatProperties;
VkResult function(VkPhysicalDevice physicalDevice, uint32_t* pPropertyCount, VkDisplayPropertiesKHR* pProperties) vkGetPhysicalDeviceDisplayPropertiesKHR;
VkResult function(VkDevice device, VkExternalMemoryHandleTypeFlagBits handleType, int fd, VkMemoryFdPropertiesKHR* pMemoryFdProperties) vkGetMemoryFdPropertiesKHR;
VkResult function(VkInstance instance, VkDebugUtilsMessengerCreateInfoEXT* pCreateInfo, VkAllocationCallbacks* pAllocator, VkDebugUtilsMessengerEXT* pMessenger) PFN_vkCreateDebugUtilsMessengerEXT;
void function(VkDevice device, VkShaderModule shaderModule, VkAllocationCallbacks* pAllocator) vkDestroyShaderModule;
VkResult function(VkDevice device, VkSwapchainKHR swapchain, uint32_t* pPresentationTimingCount, VkPastPresentationTimingGOOGLE* pPresentationTimings) PFN_vkGetPastPresentationTimingGOOGLE;
VkResult function(VkDevice device, VkPipelineLayoutCreateInfo* pCreateInfo, VkAllocationCallbacks* pAllocator, VkPipelineLayout* pPipelineLayout) PFN_vkCreatePipelineLayout;
void function(VkCommandBuffer commandBuffer, VkImage srcImage, VkImageLayout srcImageLayout, VkImage dstImage, VkImageLayout dstImageLayout, uint32_t regionCount, VkImageCopy* pRegions) PFN_vkCmdCopyImage;
void function(VkDevice device, VkImageSparseMemoryRequirementsInfo2* pInfo, uint32_t* pSparseMemoryRequirementCount, VkSparseImageMemoryRequirements2* pSparseMemoryRequirements) PFN_vkGetImageSparseMemoryRequirements2KHR;
void function(VkDevice device, VkImage image, VkAllocationCallbacks* pAllocator) vkDestroyImage;
VkResult function(VkDevice device, VkSamplerCreateInfo* pCreateInfo, VkAllocationCallbacks* pAllocator, VkSampler* pSampler) vkCreateSampler;
void function(VkDevice device) PFN_vkUninitializePerformanceApiINTEL;
void function(VkDevice device, VkDescriptorSet descriptorSet, VkDescriptorUpdateTemplate descriptorUpdateTemplate, void* pData) vkUpdateDescriptorSetWithTemplate;
void function(VkCommandBuffer commandBuffer, float depthBiasConstantFactor, float depthBiasClamp, float depthBiasSlopeFactor) vkCmdSetDepthBias;
void function(VkInstance instance, VkDebugReportFlagsEXT flags, VkDebugReportObjectTypeEXT objectType, uint64_t object, size_t location, int32_t messageCode, byte* pLayerPrefix, byte* pMessage) vkDebugReportMessageEXT;
VkResult function(VkDevice device, VkMemoryGetWin32HandleInfoKHR* pGetWin32HandleInfo, HANDLE* pHandle) vkGetMemoryWin32HandleKHR;
VkResult function(VkInstance instance, uint32_t* pPhysicalDeviceCount, VkPhysicalDevice* pPhysicalDevices) vkEnumeratePhysicalDevices;
void function(VkCommandBuffer commandBuffer, VkBuffer buffer, VkDeviceSize offset, VkBuffer countBuffer, VkDeviceSize countBufferOffset, uint32_t maxDrawCount, uint32_t stride) PFN_vkCmdDrawIndexedIndirectCountAMD;
void function(VkCommandBuffer commandBuffer, VkAccelerationStructureInfoNV* pInfo, VkBuffer instanceData, VkDeviceSize instanceOffset, VkBool32 update, VkAccelerationStructureKHR dst, VkAccelerationStructureKHR src, VkBuffer scratch, VkDeviceSize scratchOffset) PFN_vkCmdBuildAccelerationStructureNV;
void function(VkCommandBuffer commandBuffer, uint32_t firstDiscardRectangle, uint32_t discardRectangleCount, VkRect2D* pDiscardRectangles) PFN_vkCmdSetDiscardRectangleEXT;
void function(VkCommandBuffer commandBuffer, VkImage image, VkImageLayout imageLayout, VkClearColorValue* pColor, uint32_t rangeCount, VkImageSubresourceRange* pRanges) PFN_vkCmdClearColorImage;
VkResult function(VkDevice device, VkDebugUtilsObjectTagInfoEXT* pTagInfo) PFN_vkSetDebugUtilsObjectTagEXT;
void function(VkCommandBuffer commandBuffer, VkEvent event, VkPipelineStageFlags stageMask) PFN_vkCmdSetEvent;
void function(VkPhysicalDevice physicalDevice, uint32_t* pQueueFamilyPropertyCount, VkQueueFamilyProperties2* pQueueFamilyProperties) vkGetPhysicalDeviceQueueFamilyProperties2;
void function(VkDevice device, VkDescriptorSetLayoutCreateInfo* pCreateInfo, VkDescriptorSetLayoutSupport* pSupport) PFN_vkGetDescriptorSetLayoutSupport;
VkResult function(VkDevice device, VkSwapchainKHR swapchain, VkSurfaceCounterFlagBitsEXT counter, uint64_t* pCounterValue) vkGetSwapchainCounterEXT;
void function(VkCommandBuffer commandBuffer, VkSubpassBeginInfo* pSubpassBeginInfo, VkSubpassEndInfo* pSubpassEndInfo) vkCmdNextSubpass2KHR;
void function(VkCommandBuffer commandBuffer, uint32_t firstBinding, uint32_t bindingCount, VkBuffer* pBuffers, VkDeviceSize* pOffsets) PFN_vkCmdBindVertexBuffers;
void function(VkDevice device, VkEvent event, VkAllocationCallbacks* pAllocator) PFN_vkDestroyEvent;
VkResult function(VkDevice device, VkSwapchainKHR swapchain, VkSurfaceCounterFlagBitsEXT counter, uint64_t* pCounterValue) PFN_vkGetSwapchainCounterEXT;
VkResult function(VkDevice device, VkCommandBufferAllocateInfo* pAllocateInfo, VkCommandBuffer* pCommandBuffers) vkAllocateCommandBuffers;
VkResult function(VkInstance instance, uint32_t* pPhysicalDeviceGroupCount, VkPhysicalDeviceGroupProperties* pPhysicalDeviceGroupProperties) PFN_vkEnumeratePhysicalDeviceGroups;
VkResult function(VkDevice device, VkSemaphoreCreateInfo* pCreateInfo, VkAllocationCallbacks* pAllocator, VkSemaphore* pSemaphore) PFN_vkCreateSemaphore;
VkResult function(VkDevice device, uint32_t fenceCount, VkFence* pFences) vkResetFences;
void function(VkCommandBuffer commandBuffer, void* pCheckpointMarker) vkCmdSetCheckpointNV;
void function(VkDevice device, VkDescriptorSetLayoutCreateInfo* pCreateInfo, VkDescriptorSetLayoutSupport* pSupport) vkGetDescriptorSetLayoutSupportKHR;
void function(VkDevice device, VkCommandPool commandPool, VkCommandPoolTrimFlags flags) vkTrimCommandPoolKHR;
void function(VkCommandBuffer commandBuffer, VkBuffer buffer, VkDeviceSize offset, VkBuffer countBuffer, VkDeviceSize countBufferOffset, uint32_t maxDrawCount, uint32_t stride) PFN_vkCmdDrawIndirectCountKHR;
VkResult function(VkDevice device, VkAccelerationStructureKHR accelerationStructure, size_t dataSize, void* pData) PFN_vkGetAccelerationStructureHandleNV;
VkResult function(VkDevice device, VkEventCreateInfo* pCreateInfo, VkAllocationCallbacks* pAllocator, VkEvent* pEvent) vkCreateEvent;
VkResult function(VkDevice device, VkValidationCacheEXT validationCache, size_t* pDataSize, void* pData) PFN_vkGetValidationCacheDataEXT;
VkResult function(VkDevice device, VkImage image, VkImageDrmFormatModifierPropertiesEXT* pProperties) PFN_vkGetImageDrmFormatModifierPropertiesEXT;
void function(VkCommandBuffer commandBuffer, VkSubpassEndInfo* pSubpassEndInfo) vkCmdEndRenderPass2KHR;
VkResult function(VkDevice device, VkPipeline pipeline, uint32_t firstGroup, uint32_t groupCount, size_t dataSize, void* pData) vkGetRayTracingShaderGroupHandlesKHR;
void function(VkDevice device, uint32_t descriptorWriteCount, VkWriteDescriptorSet* pDescriptorWrites, uint32_t descriptorCopyCount, VkCopyDescriptorSet* pDescriptorCopies) vkUpdateDescriptorSets;
VkResult function(VkDevice device, uint32_t bindInfoCount, VkBindAccelerationStructureMemoryInfoKHR* pBindInfos) vkBindAccelerationStructureMemoryNV;
void function(VkCommandBuffer commandBuffer, VkBuffer buffer, VkDeviceSize offset, VkBuffer countBuffer, VkDeviceSize countBufferOffset, uint32_t maxDrawCount, uint32_t stride) PFN_vkCmdDrawMeshTasksIndirectCountNV;
void function(VkCommandBuffer commandBuffer, VkBool32 isPreprocessed, VkGeneratedCommandsInfoNV* pGeneratedCommandsInfo) PFN_vkCmdExecuteGeneratedCommandsNV;
void function(VkCommandBuffer commandBuffer, VkSubpassBeginInfo* pSubpassBeginInfo, VkSubpassEndInfo* pSubpassEndInfo) PFN_vkCmdNextSubpass2;
void function(VkCommandBuffer commandBuffer) vkCmdEndRenderPass;
void function(VkCommandBuffer commandBuffer, uint32_t firstBinding, uint32_t bindingCount, VkBuffer* pBuffers, VkDeviceSize* pOffsets, VkDeviceSize* pSizes) PFN_vkCmdBindTransformFeedbackBuffersEXT;
void function(VkCommandBuffer commandBuffer, VkQueryPool queryPool, uint32_t query, uint32_t index) PFN_vkCmdEndQueryIndexedEXT;
void function(VkCommandBuffer commandBuffer, float minDepthBounds, float maxDepthBounds) vkCmdSetDepthBounds;
void function(VkCommandBuffer commandBuffer, VkBuffer srcBuffer, VkBuffer dstBuffer, uint32_t regionCount, VkBufferCopy* pRegions) vkCmdCopyBuffer;
void function(VkCommandBuffer commandBuffer, uint32_t deviceMask) PFN_vkCmdSetDeviceMask;
void function(VkCommandBuffer commandBuffer, VkBuffer buffer, VkDeviceSize offset, VkBuffer countBuffer, VkDeviceSize countBufferOffset, uint32_t maxDrawCount, uint32_t stride) vkCmdDrawIndexedIndirectCountAMD;
VkResult function(VkDevice device) PFN_vkDeviceWaitIdle;
VkResult function(VkDevice device, VkRenderPassCreateInfo2* pCreateInfo, VkAllocationCallbacks* pAllocator, VkRenderPass* pRenderPass) vkCreateRenderPass2KHR;
VkResult function(VkDevice device, VkSwapchainKHR swapchain, uint64_t timeout, VkSemaphore semaphore, VkFence fence, uint32_t* pImageIndex) vkAcquireNextImageKHR;
VkResult function(VkDevice device, VkPipelineCache pipelineCache, size_t* pDataSize, void* pData) PFN_vkGetPipelineCacheData;
VkResult function(VkDevice device, VkDebugUtilsObjectTagInfoEXT* pTagInfo) vkSetDebugUtilsObjectTagEXT;
void function(VkCommandBuffer commandBuffer, VkDebugUtilsLabelEXT* pLabelInfo) vkCmdBeginDebugUtilsLabelEXT;
VkResult function(VkQueue queue, VkPresentInfoKHR* pPresentInfo) PFN_vkQueuePresentKHR;
void function(VkCommandBuffer commandBuffer, VkPipelineBindPoint pipelineBindPoint, VkPipeline pipeline, uint32_t groupIndex) vkCmdBindPipelineShaderGroupNV;
void function(VkCommandBuffer commandBuffer, VkStencilFaceFlags faceMask, uint32_t compareMask) PFN_vkCmdSetStencilCompareMask;
VkResult function(VkDevice device, uint32_t bindInfoCount, VkBindImageMemoryInfo* pBindInfos) PFN_vkBindImageMemory2;
void function(VkQueue queue, VkDebugUtilsLabelEXT* pLabelInfo) PFN_vkQueueBeginDebugUtilsLabelEXT;
VkResult function(VkPhysicalDevice physicalDevice, VkSurfaceKHR surface, uint32_t* pPresentModeCount, VkPresentModeKHR* pPresentModes) vkGetPhysicalDeviceSurfacePresentModesKHR;
VkResult function(VkInstance instance, VkDisplaySurfaceCreateInfoKHR* pCreateInfo, VkAllocationCallbacks* pAllocator, VkSurfaceKHR* pSurface) vkCreateDisplayPlaneSurfaceKHR;
uint64_t function(VkDevice device, VkDeviceMemoryOpaqueCaptureAddressInfo* pInfo) vkGetDeviceMemoryOpaqueCaptureAddress;
VkResult function(VkDevice device, VkMemoryGetFdInfoKHR* pGetFdInfo, int* pFd) PFN_vkGetMemoryFdKHR;
void function(VkCommandBuffer commandBuffer, VkStencilFaceFlags faceMask, uint32_t reference) PFN_vkCmdSetStencilReference;
void function(VkCommandBuffer commandBuffer, VkEvent event, VkPipelineStageFlags stageMask) vkCmdResetEvent;
PFN_vkVoidFunction function(VkDevice device, byte* pName) PFN_vkGetDeviceProcAddr;
VkResult function(VkDevice device, VkSamplerYcbcrConversionCreateInfo* pCreateInfo, VkAllocationCallbacks* pAllocator, VkSamplerYcbcrConversion* pYcbcrConversion) PFN_vkCreateSamplerYcbcrConversionKHR;
void function(VkDevice device, VkBufferMemoryRequirementsInfo2* pInfo, VkMemoryRequirements2* pMemoryRequirements) PFN_vkGetBufferMemoryRequirements2KHR;
VkResult function(VkDevice device, VkRenderPassCreateInfo2* pCreateInfo, VkAllocationCallbacks* pAllocator, VkRenderPass* pRenderPass) vkCreateRenderPass2;
VkResult function(VkDevice device, VkDescriptorPoolCreateInfo* pCreateInfo, VkAllocationCallbacks* pAllocator, VkDescriptorPool* pDescriptorPool) vkCreateDescriptorPool;
void function(VkCommandBuffer commandBuffer, uint32_t accelerationStructureCount, VkAccelerationStructureKHR* pAccelerationStructures, VkQueryType queryType, VkQueryPool queryPool, uint32_t firstQuery) PFN_vkCmdWriteAccelerationStructuresPropertiesKHR;
VkBool32 function(VkPhysicalDevice physicalDevice, uint32_t queueFamilyIndex) PFN_vkGetPhysicalDeviceWin32PresentationSupportKHR;
VkResult function(VkDevice device, VkDisplayKHR display, VkDisplayEventInfoEXT* pDisplayEventInfo, VkAllocationCallbacks* pAllocator, VkFence* pFence) PFN_vkRegisterDisplayEventEXT;
void function(VkCommandBuffer commandBuffer, VkImageView imageView, VkImageLayout imageLayout) PFN_vkCmdBindShadingRateImageNV;
void function(VkPhysicalDevice physicalDevice, uint32_t* pQueueFamilyPropertyCount, VkQueueFamilyProperties2* pQueueFamilyProperties) vkGetPhysicalDeviceQueueFamilyProperties2KHR;
VkResult function(VkPhysicalDevice physicalDevice, VkSurfaceKHR surface, VkSurfaceCapabilitiesKHR* pSurfaceCapabilities) vkGetPhysicalDeviceSurfaceCapabilitiesKHR;
VkResult function(VkDevice device, VkRenderPassCreateInfo2* pCreateInfo, VkAllocationCallbacks* pAllocator, VkRenderPass* pRenderPass) PFN_vkCreateRenderPass2;
VkResult function(VkPhysicalDevice physicalDevice, VkPhysicalDeviceSurfaceInfo2KHR* pSurfaceInfo, VkSurfaceCapabilities2KHR* pSurfaceCapabilities) PFN_vkGetPhysicalDeviceSurfaceCapabilities2KHR;
VkResult function(VkPhysicalDevice physicalDevice, VkPhysicalDeviceSurfaceInfo2KHR* pSurfaceInfo, uint32_t* pSurfaceFormatCount, VkSurfaceFormat2KHR* pSurfaceFormats) PFN_vkGetPhysicalDeviceSurfaceFormats2KHR;
void function(VkPhysicalDevice physicalDevice, VkFormat format, VkFormatProperties* pFormatProperties) vkGetPhysicalDeviceFormatProperties;
void function(VkCommandBuffer commandBuffer, VkImage srcImage, VkImageLayout srcImageLayout, VkImage dstImage, VkImageLayout dstImageLayout, uint32_t regionCount, VkImageBlit* pRegions, VkFilter filter) PFN_vkCmdBlitImage;
VkResult function(VkDevice device, VkEvent event) PFN_vkSetEvent;
void function(VkInstance instance, VkDebugReportCallbackEXT callback, VkAllocationCallbacks* pAllocator) PFN_vkDestroyDebugReportCallbackEXT;
void function(VkDevice device, VkAccelerationStructureKHR accelerationStructure, VkAllocationCallbacks* pAllocator) PFN_vkDestroyAccelerationStructureKHR;
VkResult function(VkPhysicalDevice physicalDevice, byte* pLayerName, uint32_t* pPropertyCount, VkExtensionProperties* pProperties) PFN_vkEnumerateDeviceExtensionProperties;
void function(VkDevice device, VkImage image, VkMemoryRequirements* pMemoryRequirements) vkGetImageMemoryRequirements;
void function(VkCommandBuffer commandBuffer, VkPipelineBindPoint pipelineBindPoint, VkPipeline pipeline) vkCmdBindPipeline;
VkResult function(VkInstance instance, VkDebugReportCallbackCreateInfoEXT* pCreateInfo, VkAllocationCallbacks* pAllocator, VkDebugReportCallbackEXT* pCallback) PFN_vkCreateDebugReportCallbackEXT;
void function(VkDevice device, VkAllocationCallbacks* pAllocator) PFN_vkDestroyDevice;
VkResult function(VkDevice device, VkValidationCacheCreateInfoEXT* pCreateInfo, VkAllocationCallbacks* pAllocator, VkValidationCacheEXT* pValidationCache) vkCreateValidationCacheEXT;
VkResult function(VkDevice device, VkDisplayKHR display, VkDisplayEventInfoEXT* pDisplayEventInfo, VkAllocationCallbacks* pAllocator, VkFence* pFence) vkRegisterDisplayEventEXT;
void function(VkCommandBuffer commandBuffer) PFN_vkCmdEndConditionalRenderingEXT;
void function(VkDevice device, VkEvent event, VkAllocationCallbacks* pAllocator) vkDestroyEvent;
void function(VkDevice device, VkCommandPool commandPool, VkCommandPoolTrimFlags flags) vkTrimCommandPool;
VkResult function(VkDevice device, VkEvent event) PFN_vkGetEventStatus;
VkDeviceAddress function(VkDevice device, VkBufferDeviceAddressInfo* pInfo) PFN_vkGetBufferDeviceAddress;
VkResult function(VkDevice device, VkObjectType objectType, uint64_t objectHandle, VkPrivateDataSlotEXT privateDataSlot, uint64_t data) vkSetPrivateDataEXT;
void function(VkCommandBuffer commandBuffer, uint32_t eventCount, VkEvent* pEvents, VkPipelineStageFlags srcStageMask, VkPipelineStageFlags dstStageMask, uint32_t memoryBarrierCount, VkMemoryBarrier* pMemoryBarriers, uint32_t bufferMemoryBarrierCount, VkBufferMemoryBarrier* pBufferMemoryBarriers, uint32_t imageMemoryBarrierCount, VkImageMemoryBarrier* pImageMemoryBarriers) vkCmdWaitEvents;
VkResult function(VkDevice device, VkMemoryAllocateInfo* pAllocateInfo, VkAllocationCallbacks* pAllocator, VkDeviceMemory* pMemory) vkAllocateMemory;
void function(VkDevice device, VkSamplerYcbcrConversion ycbcrConversion, VkAllocationCallbacks* pAllocator) PFN_vkDestroySamplerYcbcrConversionKHR;
void function(VkCommandBuffer commandBuffer, uint32_t attachmentCount, VkClearAttachment* pAttachments, uint32_t rectCount, VkClearRect* pRects) vkCmdClearAttachments;
void function(VkCommandBuffer commandBuffer, VkBuffer buffer, VkDeviceSize offset, VkBuffer countBuffer, VkDeviceSize countBufferOffset, uint32_t maxDrawCount, uint32_t stride) vkCmdDrawIndirectCount;
VkResult function(VkDevice device, uint32_t fenceCount, VkFence* pFences) PFN_vkResetFences;
void function(VkCommandBuffer commandBuffer, VkBuffer buffer, VkDeviceSize offset, VkBuffer countBuffer, VkDeviceSize countBufferOffset, uint32_t maxDrawCount, uint32_t stride) PFN_vkCmdDrawIndirectCount;
void function(VkCommandBuffer commandBuffer, uint32_t firstCounterBuffer, uint32_t counterBufferCount, VkBuffer* pCounterBuffers, VkDeviceSize* pCounterBufferOffsets) PFN_vkCmdEndTransformFeedbackEXT;
void function(VkCommandBuffer commandBuffer, uint32_t firstViewport, uint32_t viewportCount, VkViewportWScalingNV* pViewportWScalings) PFN_vkCmdSetViewportWScalingNV;
VkResult function(VkPhysicalDevice physicalDevice, uint32_t* pPropertyCount, VkDisplayProperties2KHR* pProperties) vkGetPhysicalDeviceDisplayProperties2KHR;
VkResult function(VkDevice device, VkSwapchainKHR swapchain, VkRefreshCycleDurationGOOGLE* pDisplayTimingProperties) PFN_vkGetRefreshCycleDurationGOOGLE;
VkResult function(VkDevice device, VkAccelerationStructureKHR accelerationStructure, size_t dataSize, void* pData) vkGetAccelerationStructureHandleNV;
VkResult function(VkDevice device, VkPerformanceParameterTypeINTEL parameter, VkPerformanceValueINTEL* pValue) vkGetPerformanceParameterINTEL;
VkResult function(VkDevice device, VkFenceGetWin32HandleInfoKHR* pGetWin32HandleInfo, HANDLE* pHandle) vkGetFenceWin32HandleKHR;
void function(VkCommandBuffer commandBuffer, VkPipelineBindPoint pipelineBindPoint, VkPipelineLayout layout, uint32_t set, uint32_t descriptorWriteCount, VkWriteDescriptorSet* pDescriptorWrites) PFN_vkCmdPushDescriptorSetKHR;
VkResult function(VkDevice device, VkPipelineCache pipelineCache, uint32_t createInfoCount, VkRayTracingPipelineCreateInfoNV* pCreateInfos, VkAllocationCallbacks* pAllocator, VkPipeline* pPipelines) PFN_vkCreateRayTracingPipelinesNV;
void function(VkCommandBuffer commandBuffer, uint32_t firstBinding, uint32_t bindingCount, VkBuffer* pBuffers, VkDeviceSize* pOffsets, VkDeviceSize* pSizes) vkCmdBindTransformFeedbackBuffersEXT;
void function(VkPhysicalDevice physicalDevice, VkPhysicalDeviceFeatures2* pFeatures) PFN_vkGetPhysicalDeviceFeatures2KHR;
VkResult function(VkDevice device, VkSemaphoreCreateInfo* pCreateInfo, VkAllocationCallbacks* pAllocator, VkSemaphore* pSemaphore) vkCreateSemaphore;
void function(VkDevice device, VkObjectType objectType, uint64_t objectHandle, VkPrivateDataSlotEXT privateDataSlot, uint64_t* pData) PFN_vkGetPrivateDataEXT;
VkResult function(VkPhysicalDevice physicalDevice, uint32_t* pCombinationCount, VkFramebufferMixedSamplesCombinationNV* pCombinations) PFN_vkGetPhysicalDeviceSupportedFramebufferMixedSamplesCombinationsNV;
uint64_t function(VkDevice device, VkDeviceMemoryOpaqueCaptureAddressInfo* pInfo) vkGetDeviceMemoryOpaqueCaptureAddressKHR;
void function(VkCommandBuffer commandBuffer, VkRenderPassBeginInfo* pRenderPassBegin, VkSubpassContents contents) vkCmdBeginRenderPass;
VkResult function(VkPhysicalDevice physicalDevice, VkDisplayKHR display) PFN_vkReleaseDisplayEXT;
void function(VkCommandBuffer commandBuffer, uint32_t firstScissor, uint32_t scissorCount, VkRect2D* pScissors) vkCmdSetScissor;
VkResult function(VkDevice device, VkSemaphoreSignalInfo* pSignalInfo) vkSignalSemaphore;
void function(VkDevice device, VkImage image, uint32_t* pSparseMemoryRequirementCount, VkSparseImageMemoryRequirements* pSparseMemoryRequirements) PFN_vkGetImageSparseMemoryRequirements;
void function(void* pUserData, void* pMemory) PFN_vkFreeFunction;
void function(VkCommandBuffer commandBuffer, VkPipelineBindPoint pipelineBindPoint, VkPipelineLayout layout, uint32_t firstSet, uint32_t descriptorSetCount, VkDescriptorSet* pDescriptorSets, uint32_t dynamicOffsetCount, uint32_t* pDynamicOffsets) vkCmdBindDescriptorSets;
VkResult function(VkPhysicalDevice physicalDevice, VkSurfaceKHR surface, uint32_t* pRectCount, VkRect2D* pRects) PFN_vkGetPhysicalDevicePresentRectanglesKHR;
void function(VkDevice device, uint32_t heapIndex, uint32_t localDeviceIndex, uint32_t remoteDeviceIndex, VkPeerMemoryFeatureFlags* pPeerMemoryFeatures) vkGetDeviceGroupPeerMemoryFeatures;
VkResult function(VkDevice device, VkEvent event) vkGetEventStatus;
VkResult function(VkDevice device, VkRenderPassCreateInfo* pCreateInfo, VkAllocationCallbacks* pAllocator, VkRenderPass* pRenderPass) vkCreateRenderPass;
void function(VkDevice device, VkSamplerYcbcrConversion ycbcrConversion, VkAllocationCallbacks* pAllocator) vkDestroySamplerYcbcrConversion;
void function(VkCommandBuffer commandBuffer, VkPipelineStageFlagBits pipelineStage, VkBuffer dstBuffer, VkDeviceSize dstOffset, uint32_t marker) PFN_vkCmdWriteBufferMarkerAMD;
void function(VkPhysicalDevice physicalDevice, VkPhysicalDeviceFeatures* pFeatures) PFN_vkGetPhysicalDeviceFeatures;
void function(VkCommandBuffer commandBuffer, VkBuffer srcBuffer, VkBuffer dstBuffer, uint32_t regionCount, VkBufferCopy* pRegions) PFN_vkCmdCopyBuffer;
VkResult function(VkCommandBuffer commandBuffer, VkPerformanceStreamMarkerInfoINTEL* pMarkerInfo) vkCmdSetPerformanceStreamMarkerINTEL;
void function(VkQueue queue) vkQueueEndDebugUtilsLabelEXT;
void function(VkInstance instance, VkSurfaceKHR surface, VkAllocationCallbacks* pAllocator) vkDestroySurfaceKHR;
VkResult function(VkPhysicalDevice physicalDevice, VkPhysicalDeviceSurfaceInfo2KHR* pSurfaceInfo, uint32_t* pPresentModeCount, VkPresentModeKHR* pPresentModes) vkGetPhysicalDeviceSurfacePresentModes2EXT;
VkResult function(VkDevice device, VkFence fence) vkGetFenceStatus;
void function(VkPhysicalDevice physicalDevice, VkPhysicalDeviceProperties* pProperties) PFN_vkGetPhysicalDeviceProperties;
void function(VkCommandBuffer commandBuffer) PFN_vkCmdEndRenderPass;
void function(VkCommandBuffer commandBuffer, VkPipelineLayout layout, VkShaderStageFlags stageFlags, uint32_t offset, uint32_t size, void* pValues) PFN_vkCmdPushConstants;
VkResult function(VkDevice device, VkDebugMarkerObjectTagInfoEXT* pTagInfo) PFN_vkDebugMarkerSetObjectTagEXT;
VkResult function(VkDevice device, VkImportSemaphoreWin32HandleInfoKHR* pImportSemaphoreWin32HandleInfo) PFN_vkImportSemaphoreWin32HandleKHR;
VkResult function(VkPhysicalDevice physicalDevice, uint32_t* pTimeDomainCount, VkTimeDomainEXT* pTimeDomains) vkGetPhysicalDeviceCalibrateableTimeDomainsEXT;
void function(VkDevice device, VkDeviceQueueInfo2* pQueueInfo, VkQueue* pQueue) PFN_vkGetDeviceQueue2;
void function(VkCommandBuffer commandBuffer, VkPipelineBindPoint pipelineBindPoint, VkPipelineLayout layout, uint32_t firstSet, uint32_t descriptorSetCount, VkDescriptorSet* pDescriptorSets, uint32_t dynamicOffsetCount, uint32_t* pDynamicOffsets) PFN_vkCmdBindDescriptorSets;
VkResult function(VkDevice device, VkAccelerationStructureCreateInfoNV* pCreateInfo, VkAllocationCallbacks* pAllocator, VkAccelerationStructureNV* pAccelerationStructure) PFN_vkCreateAccelerationStructureNV;
VkResult function(VkDevice device, VkPrivateDataSlotCreateInfoEXT* pCreateInfo, VkAllocationCallbacks* pAllocator, VkPrivateDataSlotEXT* pPrivateDataSlot) vkCreatePrivateDataSlotEXT;
VkResult function(VkQueue queue, VkPerformanceConfigurationINTEL configuration) PFN_vkQueueSetPerformanceConfigurationINTEL;
VkResult function(VkDevice device, uint32_t memoryRangeCount, VkMappedMemoryRange* pMemoryRanges) vkFlushMappedMemoryRanges;
void function(VkCommandBuffer commandBuffer, VkRenderPassBeginInfo* pRenderPassBegin, VkSubpassBeginInfo* pSubpassBeginInfo) PFN_vkCmdBeginRenderPass2;
void function(VkCommandBuffer commandBuffer, VkBuffer buffer, VkDeviceSize offset, uint32_t drawCount, uint32_t stride) PFN_vkCmdDrawIndexedIndirect;
void function(VkDevice device, VkSampler sampler, VkAllocationCallbacks* pAllocator) vkDestroySampler;
void function(VkCommandBuffer commandBuffer, VkRenderPassBeginInfo* pRenderPassBegin, VkSubpassBeginInfo* pSubpassBeginInfo) vkCmdBeginRenderPass2;
VkResult function(VkQueue queue) PFN_vkQueueWaitIdle;
void function(VkCommandBuffer commandBuffer) PFN_vkCmdDebugMarkerEndEXT;
VkResult function(VkDevice device, VkPipeline pipeline, uint32_t firstGroup, uint32_t groupCount, size_t dataSize, void* pData) PFN_vkGetRayTracingShaderGroupHandlesKHR;
void function(VkCommandBuffer commandBuffer, void* pCheckpointMarker) PFN_vkCmdSetCheckpointNV;
void function(VkDevice device, VkBufferMemoryRequirementsInfo2* pInfo, VkMemoryRequirements2* pMemoryRequirements) PFN_vkGetBufferMemoryRequirements2;
VkResult function(VkDevice device, VkValidationCacheCreateInfoEXT* pCreateInfo, VkAllocationCallbacks* pAllocator, VkValidationCacheEXT* pValidationCache) PFN_vkCreateValidationCacheEXT;
void function(VkCommandBuffer commandBuffer) vkCmdEndDebugUtilsLabelEXT;
void function(VkCommandBuffer commandBuffer) vkCmdEndConditionalRenderingEXT;
VkDeviceAddress function(VkDevice device, VkBufferDeviceAddressInfo* pInfo) PFN_vkGetBufferDeviceAddressEXT;
VkResult function(VkCommandBuffer commandBuffer, VkPerformanceOverrideInfoINTEL* pOverrideInfo) vkCmdSetPerformanceOverrideINTEL;
VkResult function(byte* pLayerName, uint32_t* pPropertyCount, VkExtensionProperties* pProperties) PFN_vkEnumerateInstanceExtensionProperties;
void function(VkDevice device, VkCommandPool commandPool, uint32_t commandBufferCount, VkCommandBuffer* pCommandBuffers) vkFreeCommandBuffers;
void function(VkDevice device) vkReleaseProfilingLockKHR;
void function(VkCommandBuffer commandBuffer, VkDebugMarkerMarkerInfoEXT* pMarkerInfo) vkCmdDebugMarkerInsertEXT;
VkResult function(VkPhysicalDevice physicalDevice, VkPhysicalDeviceSurfaceInfo2KHR* pSurfaceInfo, VkSurfaceCapabilities2KHR* pSurfaceCapabilities) vkGetPhysicalDeviceSurfaceCapabilities2KHR;
VkResult function(VkQueue queue, uint32_t bindInfoCount, VkBindSparseInfo* pBindInfo, VkFence fence) PFN_vkQueueBindSparse;
VkResult function(VkDevice device, VkImportSemaphoreWin32HandleInfoKHR* pImportSemaphoreWin32HandleInfo) vkImportSemaphoreWin32HandleKHR;
VkResult function(VkDevice device, VkDescriptorSetLayoutCreateInfo* pCreateInfo, VkAllocationCallbacks* pAllocator, VkDescriptorSetLayout* pSetLayout) PFN_vkCreateDescriptorSetLayout;
void function(VkCommandBuffer commandBuffer, VkConditionalRenderingBeginInfoEXT* pConditionalRenderingBegin) vkCmdBeginConditionalRenderingEXT;
void function(VkCommandBuffer commandBuffer, uint32_t firstDiscardRectangle, uint32_t discardRectangleCount, VkRect2D* pDiscardRectangles) vkCmdSetDiscardRectangleEXT;
VkResult function(VkPhysicalDevice physicalDevice, VkDisplayPlaneInfo2KHR* pDisplayPlaneInfo, VkDisplayPlaneCapabilities2KHR* pCapabilities) vkGetDisplayPlaneCapabilities2KHR;
VkResult function(VkDevice device, uint32_t memoryRangeCount, VkMappedMemoryRange* pMemoryRanges) PFN_vkFlushMappedMemoryRanges;
VkResult function(VkDevice device, VkPipelineCacheCreateInfo* pCreateInfo, VkAllocationCallbacks* pAllocator, VkPipelineCache* pPipelineCache) vkCreatePipelineCache;
void function(VkCommandBuffer commandBuffer, VkDescriptorUpdateTemplate descriptorUpdateTemplate, VkPipelineLayout layout, uint32_t set, void* pData) PFN_vkCmdPushDescriptorSetWithTemplateKHR;
VkResult function(VkDevice device, VkSemaphoreSignalInfo* pSignalInfo) vkSignalSemaphoreKHR;
VkResult function(VkDevice device, uint32_t fenceCount, VkFence* pFences, VkBool32 waitAll, uint64_t timeout) vkWaitForFences;
void function(VkCommandBuffer commandBuffer, VkSampleLocationsInfoEXT* pSampleLocationsInfo) PFN_vkCmdSetSampleLocationsEXT;
void function(VkDevice device, VkFence fence, VkAllocationCallbacks* pAllocator) PFN_vkDestroyFence;
VkResult function(VkDevice device, VkPipeline pipeline, uint32_t shader) PFN_vkCompileDeferredNV;
void function(VkDevice device, VkAccelerationStructureKHR accelerationStructure, VkAllocationCallbacks* pAllocator) PFN_vkDestroyAccelerationStructureNV;
VkResult function(VkDevice device, VkPerformanceConfigurationAcquireInfoINTEL* pAcquireInfo, VkPerformanceConfigurationINTEL* pConfiguration) vkAcquirePerformanceConfigurationINTEL;
VkResult function(VkDevice device, VkImportFenceWin32HandleInfoKHR* pImportFenceWin32HandleInfo) vkImportFenceWin32HandleKHR;
VkResult function(VkDevice device, VkFenceGetFdInfoKHR* pGetFdInfo, int* pFd) PFN_vkGetFenceFdKHR;
void function(VkDevice device, VkRenderPass renderPass, VkAllocationCallbacks* pAllocator) PFN_vkDestroyRenderPass;
VkResult function(VkDevice device, VkCommandPool commandPool, VkCommandPoolResetFlags flags) vkResetCommandPool;
VkResult function(VkQueue queue) vkQueueWaitIdle;
VkResult function(VkDevice device, VkQueryPool queryPool, uint32_t firstQuery, uint32_t queryCount, size_t dataSize, void* pData, VkDeviceSize stride, VkQueryResultFlags flags) vkGetQueryPoolResults;
void function(VkCommandBuffer commandBuffer, VkBuffer buffer, VkDeviceSize offset, uint32_t drawCount, uint32_t stride) vkCmdDrawIndexedIndirect;
void function(VkCommandBuffer commandBuffer, VkPipelineBindPoint pipelineBindPoint, VkPipeline pipeline) PFN_vkCmdBindPipeline;
VkResult function(VkDevice device, VkSamplerYcbcrConversionCreateInfo* pCreateInfo, VkAllocationCallbacks* pAllocator, VkSamplerYcbcrConversion* pYcbcrConversion) PFN_vkCreateSamplerYcbcrConversion;
VkResult function(VkDevice device, VkIndirectCommandsLayoutCreateInfoNV* pCreateInfo, VkAllocationCallbacks* pAllocator, VkIndirectCommandsLayoutNV* pIndirectCommandsLayout) vkCreateIndirectCommandsLayoutNV;
void function(VkCommandBuffer commandBuffer, uint32_t firstViewport, uint32_t viewportCount, VkShadingRatePaletteNV* pShadingRatePalettes) PFN_vkCmdSetViewportShadingRatePaletteNV;
VkResult function(VkCommandBuffer commandBuffer) PFN_vkEndCommandBuffer;
VkResult function(VkDevice device, VkSurfaceKHR surface, VkDeviceGroupPresentModeFlagsKHR* pModes) vkGetDeviceGroupSurfacePresentModesKHR;
VkResult function(VkDevice device, VkBuffer buffer, VkDeviceMemory memory, VkDeviceSize memoryOffset) vkBindBufferMemory;
void function(VkCommandBuffer commandBuffer, VkDebugUtilsLabelEXT* pLabelInfo) PFN_vkCmdInsertDebugUtilsLabelEXT;
VkResult function(VkInstance instance, VkHeadlessSurfaceCreateInfoEXT* pCreateInfo, VkAllocationCallbacks* pAllocator, VkSurfaceKHR* pSurface) PFN_vkCreateHeadlessSurfaceEXT;
void function(VkCommandBuffer commandBuffer, uint32_t baseGroupX, uint32_t baseGroupY, uint32_t baseGroupZ, uint32_t groupCountX, uint32_t groupCountY, uint32_t groupCountZ) PFN_vkCmdDispatchBase;
void function(VkPhysicalDevice physicalDevice, VkFormat format, VkFormatProperties2* pFormatProperties) vkGetPhysicalDeviceFormatProperties2KHR;
void function(VkCommandBuffer commandBuffer, uint32_t vertexCount, uint32_t instanceCount, uint32_t firstVertex, uint32_t firstInstance) PFN_vkCmdDraw;
void function(VkDevice device, VkSwapchainKHR swapchain, VkAllocationCallbacks* pAllocator) PFN_vkDestroySwapchainKHR;
VkResult function(VkDevice device, VkPipelineInfoKHR* pPipelineInfo, uint32_t* pExecutableCount, VkPipelineExecutablePropertiesKHR* pProperties) PFN_vkGetPipelineExecutablePropertiesKHR;
void function(void* pUserData, size_t size, VkInternalAllocationType allocationType, VkSystemAllocationScope allocationScope) PFN_vkInternalAllocationNotification;
void function(VkDevice device, VkCommandPool commandPool, uint32_t commandBufferCount, VkCommandBuffer* pCommandBuffers) PFN_vkFreeCommandBuffers;
PFN_vkVoidFunction function(VkInstance instance, byte* pName) PFN_vkGetInstanceProcAddr;
void function(VkPhysicalDevice physicalDevice, VkPhysicalDeviceMemoryProperties* pMemoryProperties) vkGetPhysicalDeviceMemoryProperties;
VkResult function(uint32_t* pPropertyCount, VkLayerProperties* pProperties) vkEnumerateInstanceLayerProperties;
VkResult function(VkPhysicalDevice physicalDevice, VkSurfaceKHR surface, uint32_t* pSurfaceFormatCount, VkSurfaceFormatKHR* pSurfaceFormats) PFN_vkGetPhysicalDeviceSurfaceFormatsKHR;
void function(VkDevice device, VkDeviceMemory memory) PFN_vkUnmapMemory;
VkResult function(VkPhysicalDevice physicalDevice, VkFormat format, VkImageType type, VkImageTiling tiling, VkImageUsageFlags usage, VkImageCreateFlags flags, VkExternalMemoryHandleTypeFlagsNV externalHandleType, VkExternalImageFormatPropertiesNV* pExternalImageFormatProperties) PFN_vkGetPhysicalDeviceExternalImageFormatPropertiesNV;
void function(VkDevice device, VkBuffer buffer, VkAllocationCallbacks* pAllocator) vkDestroyBuffer;
void function(VkCommandBuffer commandBuffer, VkQueryPool queryPool, uint32_t query, VkQueryControlFlags flags) PFN_vkCmdBeginQuery;
void function(VkCommandBuffer commandBuffer, uint32_t baseGroupX, uint32_t baseGroupY, uint32_t baseGroupZ, uint32_t groupCountX, uint32_t groupCountY, uint32_t groupCountZ) vkCmdDispatchBaseKHR;
void function(VkCommandBuffer commandBuffer, uint32_t groupCountX, uint32_t groupCountY, uint32_t groupCountZ) PFN_vkCmdDispatch;
void function(VkPhysicalDevice physicalDevice, VkPhysicalDeviceExternalBufferInfo* pExternalBufferInfo, VkExternalBufferProperties* pExternalBufferProperties) vkGetPhysicalDeviceExternalBufferProperties;
VkResult function(VkPhysicalDevice physicalDevice, VkDisplayPlaneInfo2KHR* pDisplayPlaneInfo, VkDisplayPlaneCapabilities2KHR* pCapabilities) PFN_vkGetDisplayPlaneCapabilities2KHR;
void function(VkPhysicalDevice physicalDevice, VkPhysicalDeviceExternalFenceInfo* pExternalFenceInfo, VkExternalFenceProperties* pExternalFenceProperties) vkGetPhysicalDeviceExternalFenceProperties;
VkResult function(VkPhysicalDevice physicalDevice, uint32_t* pToolCount, VkPhysicalDeviceToolPropertiesEXT* pToolProperties) PFN_vkGetPhysicalDeviceToolPropertiesEXT;
VkResult function(VkDevice device, VkSwapchainKHR swapchain) vkGetSwapchainStatusKHR;
VkResult function(VkDevice device, VkDeviceGroupPresentCapabilitiesKHR* pDeviceGroupPresentCapabilities) PFN_vkGetDeviceGroupPresentCapabilitiesKHR;
void function(VkCommandBuffer commandBuffer, VkImage srcImage, VkImageLayout srcImageLayout, VkImage dstImage, VkImageLayout dstImageLayout, uint32_t regionCount, VkImageResolve* pRegions) vkCmdResolveImage;
void function(VkInstance instance, VkSurfaceKHR surface, VkAllocationCallbacks* pAllocator) PFN_vkDestroySurfaceKHR;
uint32_t function(VkDevice device, VkImageViewHandleInfoNVX* pInfo) PFN_vkGetImageViewHandleNVX;
void function(VkDevice device, VkDescriptorPool descriptorPool, VkAllocationCallbacks* pAllocator) vkDestroyDescriptorPool;
void function(VkPhysicalDevice physicalDevice, VkPhysicalDeviceFeatures2* pFeatures) vkGetPhysicalDeviceFeatures2;
void function(VkCommandBuffer commandBuffer, uint32_t lineStippleFactor, uint16_t lineStipplePattern) PFN_vkCmdSetLineStippleEXT;
VkResult function(VkDevice device, VkIndirectCommandsLayoutCreateInfoNV* pCreateInfo, VkAllocationCallbacks* pAllocator, VkIndirectCommandsLayoutNV* pIndirectCommandsLayout) PFN_vkCreateIndirectCommandsLayoutNV;
VkDeviceAddress function(VkDevice device, VkBufferDeviceAddressInfo* pInfo) vkGetBufferDeviceAddressEXT;
VkResult function(VkDevice device, VkExternalMemoryHandleTypeFlagBits handleType, HANDLE handle, VkMemoryWin32HandlePropertiesKHR* pMemoryWin32HandleProperties) vkGetMemoryWin32HandlePropertiesKHR;
void function(VkCommandBuffer commandBuffer, VkRenderPassBeginInfo* pRenderPassBegin, VkSubpassContents contents) PFN_vkCmdBeginRenderPass;
VkResult function(VkDevice device, VkImageCreateInfo* pCreateInfo, VkAllocationCallbacks* pAllocator, VkImage* pImage) vkCreateImage;
VkResult function(VkDevice device, VkImageViewCreateInfo* pCreateInfo, VkAllocationCallbacks* pAllocator, VkImageView* pView) vkCreateImageView;
void function(VkCommandBuffer commandBuffer, uint32_t firstViewport, uint32_t viewportCount, VkShadingRatePaletteNV* pShadingRatePalettes) vkCmdSetViewportShadingRatePaletteNV;
void function(VkCommandBuffer commandBuffer, VkPipelineStageFlags srcStageMask, VkPipelineStageFlags dstStageMask, VkDependencyFlags dependencyFlags, uint32_t memoryBarrierCount, VkMemoryBarrier* pMemoryBarriers, uint32_t bufferMemoryBarrierCount, VkBufferMemoryBarrier* pBufferMemoryBarriers, uint32_t imageMemoryBarrierCount, VkImageMemoryBarrier* pImageMemoryBarriers) vkCmdPipelineBarrier;
void function(VkDevice device, VkBufferView bufferView, VkAllocationCallbacks* pAllocator) vkDestroyBufferView;
VkResult function(VkPhysicalDevice physicalDevice, VkSurfaceKHR surface, VkSurfaceCapabilitiesKHR* pSurfaceCapabilities) PFN_vkGetPhysicalDeviceSurfaceCapabilitiesKHR;
void function(VkDevice device, VkImageSparseMemoryRequirementsInfo2* pInfo, uint32_t* pSparseMemoryRequirementCount, VkSparseImageMemoryRequirements2* pSparseMemoryRequirements) vkGetImageSparseMemoryRequirements2;
void function(VkPhysicalDevice physicalDevice, uint32_t* pQueueFamilyPropertyCount, VkQueueFamilyProperties* pQueueFamilyProperties) vkGetPhysicalDeviceQueueFamilyProperties;
void function(VkCommandBuffer commandBuffer, VkPipelineStageFlags srcStageMask, VkPipelineStageFlags dstStageMask, VkDependencyFlags dependencyFlags, uint32_t memoryBarrierCount, VkMemoryBarrier* pMemoryBarriers, uint32_t bufferMemoryBarrierCount, VkBufferMemoryBarrier* pBufferMemoryBarriers, uint32_t imageMemoryBarrierCount, VkImageMemoryBarrier* pImageMemoryBarriers) PFN_vkCmdPipelineBarrier;
VkResult function(VkDevice device, VkSemaphore semaphore, uint64_t* pValue) PFN_vkGetSemaphoreCounterValueKHR;
void function(VkCommandBuffer commandBuffer, VkDebugMarkerMarkerInfoEXT* pMarkerInfo) PFN_vkCmdDebugMarkerInsertEXT;
VkResult function(VkDevice device, VkDescriptorSetAllocateInfo* pAllocateInfo, VkDescriptorSet* pDescriptorSets) vkAllocateDescriptorSets;
void* function(void* pUserData, void* pOriginal, size_t size, size_t alignment, VkSystemAllocationScope allocationScope) PFN_vkReallocationFunction;
VkResult function(VkDevice device, uint32_t bindInfoCount, VkBindBufferMemoryInfo* pBindInfos) vkBindBufferMemory2KHR;
void function(VkDevice device, VkPipelineCache pipelineCache, VkAllocationCallbacks* pAllocator) vkDestroyPipelineCache;
void function(VkDevice device, VkBuffer buffer, VkMemoryRequirements* pMemoryRequirements) PFN_vkGetBufferMemoryRequirements;
void function(VkPhysicalDevice physicalDevice, VkFormat format, VkFormatProperties2* pFormatProperties) PFN_vkGetPhysicalDeviceFormatProperties2;
VkResult function(uint32_t* pPropertyCount, VkLayerProperties* pProperties) PFN_vkEnumerateInstanceLayerProperties;
void function(VkPhysicalDevice physicalDevice, VkPhysicalDeviceExternalBufferInfo* pExternalBufferInfo, VkExternalBufferProperties* pExternalBufferProperties) vkGetPhysicalDeviceExternalBufferPropertiesKHR;
void function(VkDevice device, VkImage image, VkImageSubresource* pSubresource, VkSubresourceLayout* pLayout) vkGetImageSubresourceLayout;
void function(VkDevice device, VkFramebuffer framebuffer, VkAllocationCallbacks* pAllocator) vkDestroyFramebuffer;
VkResult function(VkDevice device, VkShaderModuleCreateInfo* pCreateInfo, VkAllocationCallbacks* pAllocator, VkShaderModule* pShaderModule) vkCreateShaderModule;
void function(VkCommandBuffer commandBuffer, float[4] blendConstants) vkCmdSetBlendConstants;
void function(VkPhysicalDevice physicalDevice, VkPhysicalDeviceProperties2* pProperties) vkGetPhysicalDeviceProperties2KHR;
VkResult function(VkDevice device, VkDescriptorPool descriptorPool, VkDescriptorPoolResetFlags flags) vkResetDescriptorPool;
VkResult function(VkDevice device, VkQueryPoolCreateInfo* pCreateInfo, VkAllocationCallbacks* pAllocator, VkQueryPool* pQueryPool) vkCreateQueryPool;
void function(VkCommandBuffer commandBuffer, VkImage srcImage, VkImageLayout srcImageLayout, VkImage dstImage, VkImageLayout dstImageLayout, uint32_t regionCount, VkImageResolve* pRegions) PFN_vkCmdResolveImage;
void function(VkDevice device, uint32_t heapIndex, uint32_t localDeviceIndex, uint32_t remoteDeviceIndex, VkPeerMemoryFeatureFlags* pPeerMemoryFeatures) PFN_vkGetDeviceGroupPeerMemoryFeaturesKHR;
void function(VkCommandBuffer commandBuffer, VkQueryPool queryPool, uint32_t firstQuery, uint32_t queryCount, VkBuffer dstBuffer, VkDeviceSize dstOffset, VkDeviceSize stride, VkQueryResultFlags flags) PFN_vkCmdCopyQueryPoolResults;
VkResult function(VkDevice device, VkPipelineExecutableInfoKHR* pExecutableInfo, uint32_t* pStatisticCount, VkPipelineExecutableStatisticKHR* pStatistics) vkGetPipelineExecutableStatisticsKHR;
VkResult function(VkDevice device, VkObjectType objectType, uint64_t objectHandle, VkPrivateDataSlotEXT privateDataSlot, uint64_t data) PFN_vkSetPrivateDataEXT;
VkResult function(VkPhysicalDevice physicalDevice, uint32_t* pPropertyCount, VkCooperativeMatrixPropertiesNV* pProperties) PFN_vkGetPhysicalDeviceCooperativeMatrixPropertiesNV;
VkResult function(VkDevice device, VkDeviceMemory memory, VkDeviceSize offset, VkDeviceSize size, VkMemoryMapFlags flags, void** ppData) PFN_vkMapMemory;
VkResult function(VkDevice device, VkFramebufferCreateInfo* pCreateInfo, VkAllocationCallbacks* pAllocator, VkFramebuffer* pFramebuffer) vkCreateFramebuffer;
VkResult function(VkPhysicalDevice physicalDevice, uint32_t* pTimeDomainCount, VkTimeDomainEXT* pTimeDomains) PFN_vkGetPhysicalDeviceCalibrateableTimeDomainsEXT;
void function(VkDevice device, VkGeneratedCommandsMemoryRequirementsInfoNV* pInfo, VkMemoryRequirements2* pMemoryRequirements) vkGetGeneratedCommandsMemoryRequirementsNV;
VkResult function(VkPhysicalDevice physicalDevice, VkSurfaceKHR surface, VkSurfaceCapabilities2EXT* pSurfaceCapabilities) PFN_vkGetPhysicalDeviceSurfaceCapabilities2EXT;
void function(VkQueue queue) PFN_vkQueueEndDebugUtilsLabelEXT;
VkResult function(VkCommandBuffer commandBuffer, VkCommandBufferResetFlags flags) PFN_vkResetCommandBuffer;
void function(VkCommandBuffer commandBuffer, VkPipelineStageFlagBits pipelineStage, VkQueryPool queryPool, uint32_t query) vkCmdWriteTimestamp;
void function(VkDevice device, VkImageMemoryRequirementsInfo2* pInfo, VkMemoryRequirements2* pMemoryRequirements) PFN_vkGetImageMemoryRequirements2KHR;
VkResult function(VkPhysicalDevice physicalDevice, uint32_t queueFamilyIndex, uint32_t* pCounterCount, VkPerformanceCounterKHR* pCounters, VkPerformanceCounterDescriptionKHR* pCounterDescriptions) PFN_vkEnumeratePhysicalDeviceQueueFamilyPerformanceQueryCountersKHR;
VkResult function(VkDevice device, VkSwapchainCreateInfoKHR* pCreateInfo, VkAllocationCallbacks* pAllocator, VkSwapchainKHR* pSwapchain) PFN_vkCreateSwapchainKHR;
void function(VkCommandBuffer commandBuffer, VkBuffer buffer, VkDeviceSize offset, VkBuffer countBuffer, VkDeviceSize countBufferOffset, uint32_t maxDrawCount, uint32_t stride) vkCmdDrawIndirectCountKHR;
void function(VkCommandBuffer commandBuffer, uint32_t groupCountX, uint32_t groupCountY, uint32_t groupCountZ) vkCmdDispatch;
VkResult function(VkDevice device, VkPhysicalDeviceSurfaceInfo2KHR* pSurfaceInfo, VkDeviceGroupPresentModeFlagsKHR* pModes) PFN_vkGetDeviceGroupSurfacePresentModes2EXT;
void function(VkPhysicalDevice physicalDevice, VkPhysicalDeviceFeatures2* pFeatures) vkGetPhysicalDeviceFeatures2KHR;
void function(VkCommandBuffer commandBuffer, VkEvent event, VkPipelineStageFlags stageMask) PFN_vkCmdResetEvent;
void function(VkCommandBuffer commandBuffer, VkRenderPassBeginInfo* pRenderPassBegin, VkSubpassBeginInfo* pSubpassBeginInfo) PFN_vkCmdBeginRenderPass2KHR;
VkResult function(VkPhysicalDevice physicalDevice, VkDisplayKHR display, uint32_t* pPropertyCount, VkDisplayModePropertiesKHR* pProperties) vkGetDisplayModePropertiesKHR;
VkResult function(VkDevice device, VkDeviceMemory memory, VkDeviceSize offset, VkDeviceSize size, VkMemoryMapFlags flags, void** ppData) vkMapMemory;
VkResult function(VkDevice device, VkDescriptorPoolCreateInfo* pCreateInfo, VkAllocationCallbacks* pAllocator, VkDescriptorPool* pDescriptorPool) PFN_vkCreateDescriptorPool;
void function(VkPhysicalDevice physicalDevice, VkPhysicalDeviceExternalSemaphoreInfo* pExternalSemaphoreInfo, VkExternalSemaphoreProperties* pExternalSemaphoreProperties) PFN_vkGetPhysicalDeviceExternalSemaphoreProperties;
VkResult function(VkDevice device, uint32_t timestampCount, VkCalibratedTimestampInfoEXT* pTimestampInfos, uint64_t* pTimestamps, uint64_t* pMaxDeviation) PFN_vkGetCalibratedTimestampsEXT;
VkResult function(VkDevice device, VkPipeline pipeline, uint32_t firstGroup, uint32_t groupCount, size_t dataSize, void* pData) vkGetRayTracingShaderGroupHandlesNV;
void function(VkDevice device, VkShaderModule shaderModule, VkAllocationCallbacks* pAllocator) PFN_vkDestroyShaderModule;
VkResult function(VkDevice device, VkFenceCreateInfo* pCreateInfo, VkAllocationCallbacks* pAllocator, VkFence* pFence) vkCreateFence;
VkResult function(VkDevice device, VkSemaphoreSignalInfo* pSignalInfo) PFN_vkSignalSemaphore;
VkResult function(VkDevice device, VkFence fence) PFN_vkGetFenceStatus;
void function(VkDevice device, VkCommandPool commandPool, VkCommandPoolTrimFlags flags) PFN_vkTrimCommandPoolKHR;
void function(VkDevice device, VkBufferView bufferView, VkAllocationCallbacks* pAllocator) PFN_vkDestroyBufferView;
VkResult function(VkDevice device, VkPipeline pipeline, uint32_t firstGroup, uint32_t groupCount, size_t dataSize, void* pData) PFN_vkGetRayTracingShaderGroupHandlesNV;
VkResult function(VkDevice device, VkPerformanceConfigurationAcquireInfoINTEL* pAcquireInfo, VkPerformanceConfigurationINTEL* pConfiguration) PFN_vkAcquirePerformanceConfigurationINTEL;
VkResult function(VkDevice device, VkPipelineCacheCreateInfo* pCreateInfo, VkAllocationCallbacks* pAllocator, VkPipelineCache* pPipelineCache) PFN_vkCreatePipelineCache;
VkResult function(VkDevice device, VkSwapchainCreateInfoKHR* pCreateInfo, VkAllocationCallbacks* pAllocator, VkSwapchainKHR* pSwapchain) vkCreateSwapchainKHR;
VkResult function(VkDevice device, VkAcquireProfilingLockInfoKHR* pInfo) PFN_vkAcquireProfilingLockKHR;
void function(VkDevice device, VkAccelerationStructureKHR accelerationStructure, VkAllocationCallbacks* pAllocator) vkDestroyAccelerationStructureKHR;
void function(VkDevice device, uint32_t descriptorWriteCount, VkWriteDescriptorSet* pDescriptorWrites, uint32_t descriptorCopyCount, VkCopyDescriptorSet* pDescriptorCopies) PFN_vkUpdateDescriptorSets;
void function(VkDevice device, VkSemaphore semaphore, VkAllocationCallbacks* pAllocator) vkDestroySemaphore;
void function(VkDevice device, VkPrivateDataSlotEXT privateDataSlot, VkAllocationCallbacks* pAllocator) PFN_vkDestroyPrivateDataSlotEXT;
uint64_t function(VkDevice device, VkBufferDeviceAddressInfo* pInfo) PFN_vkGetBufferOpaqueCaptureAddress;
void function(VkCommandBuffer commandBuffer, uint32_t indexCount, uint32_t instanceCount, uint32_t firstIndex, int32_t vertexOffset, uint32_t firstInstance) vkCmdDrawIndexed;
uint64_t function(VkDevice device, VkDeviceMemoryOpaqueCaptureAddressInfo* pInfo) PFN_vkGetDeviceMemoryOpaqueCaptureAddress;
void function(VkDevice device, VkImageMemoryRequirementsInfo2* pInfo, VkMemoryRequirements2* pMemoryRequirements) vkGetImageMemoryRequirements2;
VkResult function(VkDevice device, VkInitializePerformanceApiInfoINTEL* pInitializeInfo) vkInitializePerformanceApiINTEL;
VkResult function(VkCommandBuffer commandBuffer, VkCommandBufferBeginInfo* pBeginInfo) PFN_vkBeginCommandBuffer;
void function(VkPhysicalDevice physicalDevice, VkPhysicalDeviceMemoryProperties2* pMemoryProperties) PFN_vkGetPhysicalDeviceMemoryProperties2;
VkResult function(VkDevice device, VkExternalMemoryHandleTypeFlagBits handleType, int fd, VkMemoryFdPropertiesKHR* pMemoryFdProperties) PFN_vkGetMemoryFdPropertiesKHR;
void function(VkDevice device, VkImageMemoryRequirementsInfo2* pInfo, VkMemoryRequirements2* pMemoryRequirements) PFN_vkGetImageMemoryRequirements2;
VkResult function(VkDevice device, VkImportFenceFdInfoKHR* pImportFenceFdInfo) PFN_vkImportFenceFdKHR;
VkResult function(VkDevice device, VkDescriptorUpdateTemplateCreateInfo* pCreateInfo, VkAllocationCallbacks* pAllocator, VkDescriptorUpdateTemplate* pDescriptorUpdateTemplate) vkCreateDescriptorUpdateTemplateKHR;
VkResult function(VkPhysicalDevice physicalDevice, uint32_t* pPropertyCount, VkLayerProperties* pProperties) PFN_vkEnumerateDeviceLayerProperties;
VkResult function(VkPhysicalDevice physicalDevice, uint32_t* pPropertyCount, VkDisplayPlanePropertiesKHR* pProperties) vkGetPhysicalDeviceDisplayPlanePropertiesKHR;
void function(VkDevice device, VkValidationCacheEXT validationCache, VkAllocationCallbacks* pAllocator) vkDestroyValidationCacheEXT;
void function(VkDevice device) vkUninitializePerformanceApiINTEL;
VkResult function(VkCommandBuffer commandBuffer, VkPerformanceMarkerInfoINTEL* pMarkerInfo) PFN_vkCmdSetPerformanceMarkerINTEL;
void function(VkCommandBuffer commandBuffer, VkAccelerationStructureKHR dst, VkAccelerationStructureKHR src, VkCopyAccelerationStructureModeKHR mode) PFN_vkCmdCopyAccelerationStructureNV;
VkResult function(VkInstanceCreateInfo* pCreateInfo, VkAllocationCallbacks* pAllocator, VkInstance* pInstance) vkCreateInstance;
VkResult function(VkDevice device, VkSemaphoreWaitInfo* pWaitInfo, uint64_t timeout) PFN_vkWaitSemaphores;
void function(VkDevice device, VkRenderPass renderPass, VkExtent2D* pGranularity) vkGetRenderAreaGranularity;
void function(VkPhysicalDevice physicalDevice, VkPhysicalDeviceSparseImageFormatInfo2* pFormatInfo, uint32_t* pPropertyCount, VkSparseImageFormatProperties2* pProperties) vkGetPhysicalDeviceSparseImageFormatProperties2KHR;
VkBool32 function(VkDebugUtilsMessageSeverityFlagBitsEXT messageSeverity, VkDebugUtilsMessageTypeFlagsEXT messageTypes, VkDebugUtilsMessengerCallbackDataEXT* pCallbackData, void* pUserData) PFN_vkDebugUtilsMessengerCallbackEXT;
VkResult function(VkPhysicalDevice physicalDevice, VkSurfaceKHR surface, uint32_t* pPresentModeCount, VkPresentModeKHR* pPresentModes) PFN_vkGetPhysicalDeviceSurfacePresentModesKHR;
void function(VkPhysicalDevice physicalDevice, VkPhysicalDeviceSparseImageFormatInfo2* pFormatInfo, uint32_t* pPropertyCount, VkSparseImageFormatProperties2* pProperties) PFN_vkGetPhysicalDeviceSparseImageFormatProperties2KHR;
void function(VkDevice device, VkCommandPool commandPool, VkAllocationCallbacks* pAllocator) vkDestroyCommandPool;
void function(VkDevice device, VkPipeline pipeline, VkAllocationCallbacks* pAllocator) vkDestroyPipeline;
void function(VkQueue queue, VkDebugUtilsLabelEXT* pLabelInfo) vkQueueBeginDebugUtilsLabelEXT;
void function(VkQueue queue, uint32_t* pCheckpointDataCount, VkCheckpointDataNV* pCheckpointData) PFN_vkGetQueueCheckpointDataNV;
VkResult function(VkCommandBuffer commandBuffer, VkCommandBufferResetFlags flags) vkResetCommandBuffer;
void* function(void* pUserData, size_t size, size_t alignment, VkSystemAllocationScope allocationScope) PFN_vkAllocationFunction;
void function(VkPhysicalDevice physicalDevice, VkPhysicalDeviceExternalSemaphoreInfo* pExternalSemaphoreInfo, VkExternalSemaphoreProperties* pExternalSemaphoreProperties) PFN_vkGetPhysicalDeviceExternalSemaphorePropertiesKHR;
void function(VkCommandBuffer commandBuffer, VkStencilFaceFlags faceMask, uint32_t reference) vkCmdSetStencilReference;
void function(void* pUserData, size_t size, VkInternalAllocationType allocationType, VkSystemAllocationScope allocationScope) PFN_vkInternalFreeNotification;
void function(VkDevice device, VkDeviceMemory memory, VkDeviceSize* pCommittedMemoryInBytes) PFN_vkGetDeviceMemoryCommitment;
void function(VkCommandBuffer commandBuffer, VkBuffer buffer, VkDeviceSize offset, uint32_t drawCount, uint32_t stride) vkCmdDrawMeshTasksIndirectNV;
VkResult function(VkDevice device, VkQueryPoolCreateInfo* pCreateInfo, VkAllocationCallbacks* pAllocator, VkQueryPool* pQueryPool) PFN_vkCreateQueryPool;
void function(VkDevice device, VkPipelineLayout pipelineLayout, VkAllocationCallbacks* pAllocator) PFN_vkDestroyPipelineLayout;
void function(VkQueue queue, uint32_t* pCheckpointDataCount, VkCheckpointDataNV* pCheckpointData) vkGetQueueCheckpointDataNV;
VkResult function(VkDevice device, uint32_t swapchainCount, VkSwapchainCreateInfoKHR* pCreateInfos, VkAllocationCallbacks* pAllocator, VkSwapchainKHR* pSwapchains) vkCreateSharedSwapchainsKHR;
}}


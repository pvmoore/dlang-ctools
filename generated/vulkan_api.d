module vulkan_api;

private:

import core.sys.windows.windows;

public:

// Vulkan 1.3.211.0 Include files converted to D (This is a generated file)
// 
// Usage:
//   ** Start program
//   VulkanLoader.load();
//   vkLoadGlobalCommandFunctions();
//   ** Create your VkInstance here
//   vkLoadInstanceFunctions(instance);
//   ** 
//   VulkanLoader.unload();
//   ** Exit program

// VulkanLoader
private struct _VulkanLoader {
	import core.sys.windows.windows;
	import common : throwIf;
	HANDLE handle;
	void load() {
		this.handle = LoadLibraryA("vulkan-1.dll");
		if(!handle) throw new Exception("Unable to load 'vulkan-1.dll'");
		
		*(cast(void**)&vkGetInstanceProcAddr) = GetProcAddress(handle, "vkGetInstanceProcAddr"); throwIf(!vkGetInstanceProcAddr);
	}
	void unload() {
		if(handle) FreeLibrary(handle);
	}
}
__gshared _VulkanLoader VulkanLoader;
// End of VulkanLoader

// Load Global Command Functions
void vkLoadGlobalCommandFunctions() {
	import std.string : toStringz;
	import common : throwIf;
	*(cast(void**)&vkCreateInstance) = vkGetInstanceProcAddr(null, toStringz("vkCreateInstance")); throwIf(!vkCreateInstance);
	*(cast(void**)&vkEnumerateInstanceExtensionProperties) = vkGetInstanceProcAddr(null, toStringz("vkEnumerateInstanceExtensionProperties")); throwIf(!vkEnumerateInstanceExtensionProperties);
	*(cast(void**)&vkEnumerateInstanceLayerProperties) = vkGetInstanceProcAddr(null, toStringz("vkEnumerateInstanceLayerProperties")); throwIf(!vkEnumerateInstanceLayerProperties);
	*(cast(void**)&vkEnumerateInstanceVersion) = vkGetInstanceProcAddr(null, toStringz("vkEnumerateInstanceVersion")); throwIf(!vkEnumerateInstanceVersion);
}
// Load Instance Functions
void vkLoadInstanceFunctions(VkInstance instance) {
	import std.string : toStringz;
	import common : throwIf;
	*(cast(void**)&vkAcquireDrmDisplayEXT) = vkGetInstanceProcAddr(instance, toStringz("vkAcquireDrmDisplayEXT"));	*(cast(void**)&vkAcquireFullScreenExclusiveModeEXT) = vkGetInstanceProcAddr(instance, toStringz("vkAcquireFullScreenExclusiveModeEXT"));	*(cast(void**)&vkAcquireNextImage2KHR) = vkGetInstanceProcAddr(instance, toStringz("vkAcquireNextImage2KHR"));	*(cast(void**)&vkAcquireNextImageKHR) = vkGetInstanceProcAddr(instance, toStringz("vkAcquireNextImageKHR"));	*(cast(void**)&vkAcquirePerformanceConfigurationINTEL) = vkGetInstanceProcAddr(instance, toStringz("vkAcquirePerformanceConfigurationINTEL"));	*(cast(void**)&vkAcquireProfilingLockKHR) = vkGetInstanceProcAddr(instance, toStringz("vkAcquireProfilingLockKHR"));	*(cast(void**)&vkAcquireWinrtDisplayNV) = vkGetInstanceProcAddr(instance, toStringz("vkAcquireWinrtDisplayNV"));	*(cast(void**)&vkAllocateCommandBuffers) = vkGetInstanceProcAddr(instance, toStringz("vkAllocateCommandBuffers"));	*(cast(void**)&vkAllocateDescriptorSets) = vkGetInstanceProcAddr(instance, toStringz("vkAllocateDescriptorSets"));	*(cast(void**)&vkAllocateMemory) = vkGetInstanceProcAddr(instance, toStringz("vkAllocateMemory"));	*(cast(void**)&vkBeginCommandBuffer) = vkGetInstanceProcAddr(instance, toStringz("vkBeginCommandBuffer"));	*(cast(void**)&vkBindAccelerationStructureMemoryNV) = vkGetInstanceProcAddr(instance, toStringz("vkBindAccelerationStructureMemoryNV"));	*(cast(void**)&vkBindBufferMemory) = vkGetInstanceProcAddr(instance, toStringz("vkBindBufferMemory"));	*(cast(void**)&vkBindBufferMemory2) = vkGetInstanceProcAddr(instance, toStringz("vkBindBufferMemory2"));	*(cast(void**)&vkBindBufferMemory2KHR) = vkGetInstanceProcAddr(instance, toStringz("vkBindBufferMemory2KHR"));	*(cast(void**)&vkBindImageMemory) = vkGetInstanceProcAddr(instance, toStringz("vkBindImageMemory"));	*(cast(void**)&vkBindImageMemory2) = vkGetInstanceProcAddr(instance, toStringz("vkBindImageMemory2"));	*(cast(void**)&vkBindImageMemory2KHR) = vkGetInstanceProcAddr(instance, toStringz("vkBindImageMemory2KHR"));	*(cast(void**)&vkBuildAccelerationStructuresKHR) = vkGetInstanceProcAddr(instance, toStringz("vkBuildAccelerationStructuresKHR"));	*(cast(void**)&vkCmdBeginConditionalRenderingEXT) = vkGetInstanceProcAddr(instance, toStringz("vkCmdBeginConditionalRenderingEXT"));	*(cast(void**)&vkCmdBeginDebugUtilsLabelEXT) = vkGetInstanceProcAddr(instance, toStringz("vkCmdBeginDebugUtilsLabelEXT"));	*(cast(void**)&vkCmdBeginQuery) = vkGetInstanceProcAddr(instance, toStringz("vkCmdBeginQuery"));	*(cast(void**)&vkCmdBeginQueryIndexedEXT) = vkGetInstanceProcAddr(instance, toStringz("vkCmdBeginQueryIndexedEXT"));	*(cast(void**)&vkCmdBeginRenderPass) = vkGetInstanceProcAddr(instance, toStringz("vkCmdBeginRenderPass"));	*(cast(void**)&vkCmdBeginRenderPass2) = vkGetInstanceProcAddr(instance, toStringz("vkCmdBeginRenderPass2"));	*(cast(void**)&vkCmdBeginRenderPass2KHR) = vkGetInstanceProcAddr(instance, toStringz("vkCmdBeginRenderPass2KHR"));	*(cast(void**)&vkCmdBeginRendering) = vkGetInstanceProcAddr(instance, toStringz("vkCmdBeginRendering"));	*(cast(void**)&vkCmdBeginRenderingKHR) = vkGetInstanceProcAddr(instance, toStringz("vkCmdBeginRenderingKHR"));	*(cast(void**)&vkCmdBeginTransformFeedbackEXT) = vkGetInstanceProcAddr(instance, toStringz("vkCmdBeginTransformFeedbackEXT"));	*(cast(void**)&vkCmdBindDescriptorSets) = vkGetInstanceProcAddr(instance, toStringz("vkCmdBindDescriptorSets"));	*(cast(void**)&vkCmdBindIndexBuffer) = vkGetInstanceProcAddr(instance, toStringz("vkCmdBindIndexBuffer"));	*(cast(void**)&vkCmdBindInvocationMaskHUAWEI) = vkGetInstanceProcAddr(instance, toStringz("vkCmdBindInvocationMaskHUAWEI"));	*(cast(void**)&vkCmdBindPipeline) = vkGetInstanceProcAddr(instance, toStringz("vkCmdBindPipeline"));	*(cast(void**)&vkCmdBindPipelineShaderGroupNV) = vkGetInstanceProcAddr(instance, toStringz("vkCmdBindPipelineShaderGroupNV"));	*(cast(void**)&vkCmdBindShadingRateImageNV) = vkGetInstanceProcAddr(instance, toStringz("vkCmdBindShadingRateImageNV"));	*(cast(void**)&vkCmdBindTransformFeedbackBuffersEXT) = vkGetInstanceProcAddr(instance, toStringz("vkCmdBindTransformFeedbackBuffersEXT"));	*(cast(void**)&vkCmdBindVertexBuffers) = vkGetInstanceProcAddr(instance, toStringz("vkCmdBindVertexBuffers"));	*(cast(void**)&vkCmdBindVertexBuffers2) = vkGetInstanceProcAddr(instance, toStringz("vkCmdBindVertexBuffers2"));	*(cast(void**)&vkCmdBindVertexBuffers2EXT) = vkGetInstanceProcAddr(instance, toStringz("vkCmdBindVertexBuffers2EXT"));	*(cast(void**)&vkCmdBlitImage) = vkGetInstanceProcAddr(instance, toStringz("vkCmdBlitImage"));	*(cast(void**)&vkCmdBlitImage2) = vkGetInstanceProcAddr(instance, toStringz("vkCmdBlitImage2"));	*(cast(void**)&vkCmdBlitImage2KHR) = vkGetInstanceProcAddr(instance, toStringz("vkCmdBlitImage2KHR"));	*(cast(void**)&vkCmdBuildAccelerationStructureNV) = vkGetInstanceProcAddr(instance, toStringz("vkCmdBuildAccelerationStructureNV"));	*(cast(void**)&vkCmdBuildAccelerationStructuresIndirectKHR) = vkGetInstanceProcAddr(instance, toStringz("vkCmdBuildAccelerationStructuresIndirectKHR"));	*(cast(void**)&vkCmdBuildAccelerationStructuresKHR) = vkGetInstanceProcAddr(instance, toStringz("vkCmdBuildAccelerationStructuresKHR"));	*(cast(void**)&vkCmdClearAttachments) = vkGetInstanceProcAddr(instance, toStringz("vkCmdClearAttachments"));	*(cast(void**)&vkCmdClearColorImage) = vkGetInstanceProcAddr(instance, toStringz("vkCmdClearColorImage"));	*(cast(void**)&vkCmdClearDepthStencilImage) = vkGetInstanceProcAddr(instance, toStringz("vkCmdClearDepthStencilImage"));	*(cast(void**)&vkCmdCopyAccelerationStructureKHR) = vkGetInstanceProcAddr(instance, toStringz("vkCmdCopyAccelerationStructureKHR"));	*(cast(void**)&vkCmdCopyAccelerationStructureNV) = vkGetInstanceProcAddr(instance, toStringz("vkCmdCopyAccelerationStructureNV"));	*(cast(void**)&vkCmdCopyAccelerationStructureToMemoryKHR) = vkGetInstanceProcAddr(instance, toStringz("vkCmdCopyAccelerationStructureToMemoryKHR"));	*(cast(void**)&vkCmdCopyBuffer) = vkGetInstanceProcAddr(instance, toStringz("vkCmdCopyBuffer"));	*(cast(void**)&vkCmdCopyBuffer2) = vkGetInstanceProcAddr(instance, toStringz("vkCmdCopyBuffer2"));	*(cast(void**)&vkCmdCopyBuffer2KHR) = vkGetInstanceProcAddr(instance, toStringz("vkCmdCopyBuffer2KHR"));	*(cast(void**)&vkCmdCopyBufferToImage) = vkGetInstanceProcAddr(instance, toStringz("vkCmdCopyBufferToImage"));	*(cast(void**)&vkCmdCopyBufferToImage2) = vkGetInstanceProcAddr(instance, toStringz("vkCmdCopyBufferToImage2"));	*(cast(void**)&vkCmdCopyBufferToImage2KHR) = vkGetInstanceProcAddr(instance, toStringz("vkCmdCopyBufferToImage2KHR"));	*(cast(void**)&vkCmdCopyImage) = vkGetInstanceProcAddr(instance, toStringz("vkCmdCopyImage"));	*(cast(void**)&vkCmdCopyImage2) = vkGetInstanceProcAddr(instance, toStringz("vkCmdCopyImage2"));	*(cast(void**)&vkCmdCopyImage2KHR) = vkGetInstanceProcAddr(instance, toStringz("vkCmdCopyImage2KHR"));	*(cast(void**)&vkCmdCopyImageToBuffer) = vkGetInstanceProcAddr(instance, toStringz("vkCmdCopyImageToBuffer"));	*(cast(void**)&vkCmdCopyImageToBuffer2) = vkGetInstanceProcAddr(instance, toStringz("vkCmdCopyImageToBuffer2"));	*(cast(void**)&vkCmdCopyImageToBuffer2KHR) = vkGetInstanceProcAddr(instance, toStringz("vkCmdCopyImageToBuffer2KHR"));	*(cast(void**)&vkCmdCopyMemoryToAccelerationStructureKHR) = vkGetInstanceProcAddr(instance, toStringz("vkCmdCopyMemoryToAccelerationStructureKHR"));	*(cast(void**)&vkCmdCopyQueryPoolResults) = vkGetInstanceProcAddr(instance, toStringz("vkCmdCopyQueryPoolResults"));	*(cast(void**)&vkCmdCuLaunchKernelNVX) = vkGetInstanceProcAddr(instance, toStringz("vkCmdCuLaunchKernelNVX"));	*(cast(void**)&vkCmdDebugMarkerBeginEXT) = vkGetInstanceProcAddr(instance, toStringz("vkCmdDebugMarkerBeginEXT"));	*(cast(void**)&vkCmdDebugMarkerEndEXT) = vkGetInstanceProcAddr(instance, toStringz("vkCmdDebugMarkerEndEXT"));	*(cast(void**)&vkCmdDebugMarkerInsertEXT) = vkGetInstanceProcAddr(instance, toStringz("vkCmdDebugMarkerInsertEXT"));	*(cast(void**)&vkCmdDispatch) = vkGetInstanceProcAddr(instance, toStringz("vkCmdDispatch"));	*(cast(void**)&vkCmdDispatchBase) = vkGetInstanceProcAddr(instance, toStringz("vkCmdDispatchBase"));	*(cast(void**)&vkCmdDispatchBaseKHR) = vkGetInstanceProcAddr(instance, toStringz("vkCmdDispatchBaseKHR"));	*(cast(void**)&vkCmdDispatchIndirect) = vkGetInstanceProcAddr(instance, toStringz("vkCmdDispatchIndirect"));	*(cast(void**)&vkCmdDraw) = vkGetInstanceProcAddr(instance, toStringz("vkCmdDraw"));	*(cast(void**)&vkCmdDrawIndexed) = vkGetInstanceProcAddr(instance, toStringz("vkCmdDrawIndexed"));	*(cast(void**)&vkCmdDrawIndexedIndirect) = vkGetInstanceProcAddr(instance, toStringz("vkCmdDrawIndexedIndirect"));	*(cast(void**)&vkCmdDrawIndexedIndirectCount) = vkGetInstanceProcAddr(instance, toStringz("vkCmdDrawIndexedIndirectCount"));	*(cast(void**)&vkCmdDrawIndexedIndirectCountAMD) = vkGetInstanceProcAddr(instance, toStringz("vkCmdDrawIndexedIndirectCountAMD"));	*(cast(void**)&vkCmdDrawIndexedIndirectCountKHR) = vkGetInstanceProcAddr(instance, toStringz("vkCmdDrawIndexedIndirectCountKHR"));	*(cast(void**)&vkCmdDrawIndirect) = vkGetInstanceProcAddr(instance, toStringz("vkCmdDrawIndirect"));	*(cast(void**)&vkCmdDrawIndirectByteCountEXT) = vkGetInstanceProcAddr(instance, toStringz("vkCmdDrawIndirectByteCountEXT"));	*(cast(void**)&vkCmdDrawIndirectCount) = vkGetInstanceProcAddr(instance, toStringz("vkCmdDrawIndirectCount"));	*(cast(void**)&vkCmdDrawIndirectCountAMD) = vkGetInstanceProcAddr(instance, toStringz("vkCmdDrawIndirectCountAMD"));	*(cast(void**)&vkCmdDrawIndirectCountKHR) = vkGetInstanceProcAddr(instance, toStringz("vkCmdDrawIndirectCountKHR"));	*(cast(void**)&vkCmdDrawMeshTasksIndirectCountNV) = vkGetInstanceProcAddr(instance, toStringz("vkCmdDrawMeshTasksIndirectCountNV"));	*(cast(void**)&vkCmdDrawMeshTasksIndirectNV) = vkGetInstanceProcAddr(instance, toStringz("vkCmdDrawMeshTasksIndirectNV"));	*(cast(void**)&vkCmdDrawMeshTasksNV) = vkGetInstanceProcAddr(instance, toStringz("vkCmdDrawMeshTasksNV"));	*(cast(void**)&vkCmdDrawMultiEXT) = vkGetInstanceProcAddr(instance, toStringz("vkCmdDrawMultiEXT"));	*(cast(void**)&vkCmdDrawMultiIndexedEXT) = vkGetInstanceProcAddr(instance, toStringz("vkCmdDrawMultiIndexedEXT"));	*(cast(void**)&vkCmdEndConditionalRenderingEXT) = vkGetInstanceProcAddr(instance, toStringz("vkCmdEndConditionalRenderingEXT"));	*(cast(void**)&vkCmdEndDebugUtilsLabelEXT) = vkGetInstanceProcAddr(instance, toStringz("vkCmdEndDebugUtilsLabelEXT"));	*(cast(void**)&vkCmdEndQuery) = vkGetInstanceProcAddr(instance, toStringz("vkCmdEndQuery"));	*(cast(void**)&vkCmdEndQueryIndexedEXT) = vkGetInstanceProcAddr(instance, toStringz("vkCmdEndQueryIndexedEXT"));	*(cast(void**)&vkCmdEndRenderPass) = vkGetInstanceProcAddr(instance, toStringz("vkCmdEndRenderPass"));	*(cast(void**)&vkCmdEndRenderPass2) = vkGetInstanceProcAddr(instance, toStringz("vkCmdEndRenderPass2"));	*(cast(void**)&vkCmdEndRenderPass2KHR) = vkGetInstanceProcAddr(instance, toStringz("vkCmdEndRenderPass2KHR"));	*(cast(void**)&vkCmdEndRendering) = vkGetInstanceProcAddr(instance, toStringz("vkCmdEndRendering"));	*(cast(void**)&vkCmdEndRenderingKHR) = vkGetInstanceProcAddr(instance, toStringz("vkCmdEndRenderingKHR"));	*(cast(void**)&vkCmdEndTransformFeedbackEXT) = vkGetInstanceProcAddr(instance, toStringz("vkCmdEndTransformFeedbackEXT"));	*(cast(void**)&vkCmdExecuteCommands) = vkGetInstanceProcAddr(instance, toStringz("vkCmdExecuteCommands"));	*(cast(void**)&vkCmdExecuteGeneratedCommandsNV) = vkGetInstanceProcAddr(instance, toStringz("vkCmdExecuteGeneratedCommandsNV"));	*(cast(void**)&vkCmdFillBuffer) = vkGetInstanceProcAddr(instance, toStringz("vkCmdFillBuffer"));	*(cast(void**)&vkCmdInsertDebugUtilsLabelEXT) = vkGetInstanceProcAddr(instance, toStringz("vkCmdInsertDebugUtilsLabelEXT"));	*(cast(void**)&vkCmdNextSubpass) = vkGetInstanceProcAddr(instance, toStringz("vkCmdNextSubpass"));	*(cast(void**)&vkCmdNextSubpass2) = vkGetInstanceProcAddr(instance, toStringz("vkCmdNextSubpass2"));	*(cast(void**)&vkCmdNextSubpass2KHR) = vkGetInstanceProcAddr(instance, toStringz("vkCmdNextSubpass2KHR"));	*(cast(void**)&vkCmdPipelineBarrier) = vkGetInstanceProcAddr(instance, toStringz("vkCmdPipelineBarrier"));	*(cast(void**)&vkCmdPipelineBarrier2) = vkGetInstanceProcAddr(instance, toStringz("vkCmdPipelineBarrier2"));	*(cast(void**)&vkCmdPipelineBarrier2KHR) = vkGetInstanceProcAddr(instance, toStringz("vkCmdPipelineBarrier2KHR"));	*(cast(void**)&vkCmdPreprocessGeneratedCommandsNV) = vkGetInstanceProcAddr(instance, toStringz("vkCmdPreprocessGeneratedCommandsNV"));	*(cast(void**)&vkCmdPushConstants) = vkGetInstanceProcAddr(instance, toStringz("vkCmdPushConstants"));	*(cast(void**)&vkCmdPushDescriptorSetKHR) = vkGetInstanceProcAddr(instance, toStringz("vkCmdPushDescriptorSetKHR"));	*(cast(void**)&vkCmdPushDescriptorSetWithTemplateKHR) = vkGetInstanceProcAddr(instance, toStringz("vkCmdPushDescriptorSetWithTemplateKHR"));	*(cast(void**)&vkCmdResetEvent) = vkGetInstanceProcAddr(instance, toStringz("vkCmdResetEvent"));	*(cast(void**)&vkCmdResetEvent2) = vkGetInstanceProcAddr(instance, toStringz("vkCmdResetEvent2"));	*(cast(void**)&vkCmdResetEvent2KHR) = vkGetInstanceProcAddr(instance, toStringz("vkCmdResetEvent2KHR"));	*(cast(void**)&vkCmdResetQueryPool) = vkGetInstanceProcAddr(instance, toStringz("vkCmdResetQueryPool"));	*(cast(void**)&vkCmdResolveImage) = vkGetInstanceProcAddr(instance, toStringz("vkCmdResolveImage"));	*(cast(void**)&vkCmdResolveImage2) = vkGetInstanceProcAddr(instance, toStringz("vkCmdResolveImage2"));	*(cast(void**)&vkCmdResolveImage2KHR) = vkGetInstanceProcAddr(instance, toStringz("vkCmdResolveImage2KHR"));	*(cast(void**)&vkCmdSetBlendConstants) = vkGetInstanceProcAddr(instance, toStringz("vkCmdSetBlendConstants"));	*(cast(void**)&vkCmdSetCheckpointNV) = vkGetInstanceProcAddr(instance, toStringz("vkCmdSetCheckpointNV"));	*(cast(void**)&vkCmdSetCoarseSampleOrderNV) = vkGetInstanceProcAddr(instance, toStringz("vkCmdSetCoarseSampleOrderNV"));	*(cast(void**)&vkCmdSetColorWriteEnableEXT) = vkGetInstanceProcAddr(instance, toStringz("vkCmdSetColorWriteEnableEXT"));	*(cast(void**)&vkCmdSetCullMode) = vkGetInstanceProcAddr(instance, toStringz("vkCmdSetCullMode"));	*(cast(void**)&vkCmdSetCullModeEXT) = vkGetInstanceProcAddr(instance, toStringz("vkCmdSetCullModeEXT"));	*(cast(void**)&vkCmdSetDepthBias) = vkGetInstanceProcAddr(instance, toStringz("vkCmdSetDepthBias"));	*(cast(void**)&vkCmdSetDepthBiasEnable) = vkGetInstanceProcAddr(instance, toStringz("vkCmdSetDepthBiasEnable"));	*(cast(void**)&vkCmdSetDepthBiasEnableEXT) = vkGetInstanceProcAddr(instance, toStringz("vkCmdSetDepthBiasEnableEXT"));	*(cast(void**)&vkCmdSetDepthBounds) = vkGetInstanceProcAddr(instance, toStringz("vkCmdSetDepthBounds"));	*(cast(void**)&vkCmdSetDepthBoundsTestEnable) = vkGetInstanceProcAddr(instance, toStringz("vkCmdSetDepthBoundsTestEnable"));	*(cast(void**)&vkCmdSetDepthBoundsTestEnableEXT) = vkGetInstanceProcAddr(instance, toStringz("vkCmdSetDepthBoundsTestEnableEXT"));	*(cast(void**)&vkCmdSetDepthCompareOp) = vkGetInstanceProcAddr(instance, toStringz("vkCmdSetDepthCompareOp"));	*(cast(void**)&vkCmdSetDepthCompareOpEXT) = vkGetInstanceProcAddr(instance, toStringz("vkCmdSetDepthCompareOpEXT"));	*(cast(void**)&vkCmdSetDepthTestEnable) = vkGetInstanceProcAddr(instance, toStringz("vkCmdSetDepthTestEnable"));	*(cast(void**)&vkCmdSetDepthTestEnableEXT) = vkGetInstanceProcAddr(instance, toStringz("vkCmdSetDepthTestEnableEXT"));	*(cast(void**)&vkCmdSetDepthWriteEnable) = vkGetInstanceProcAddr(instance, toStringz("vkCmdSetDepthWriteEnable"));	*(cast(void**)&vkCmdSetDepthWriteEnableEXT) = vkGetInstanceProcAddr(instance, toStringz("vkCmdSetDepthWriteEnableEXT"));	*(cast(void**)&vkCmdSetDeviceMask) = vkGetInstanceProcAddr(instance, toStringz("vkCmdSetDeviceMask"));	*(cast(void**)&vkCmdSetDeviceMaskKHR) = vkGetInstanceProcAddr(instance, toStringz("vkCmdSetDeviceMaskKHR"));	*(cast(void**)&vkCmdSetDiscardRectangleEXT) = vkGetInstanceProcAddr(instance, toStringz("vkCmdSetDiscardRectangleEXT"));	*(cast(void**)&vkCmdSetEvent) = vkGetInstanceProcAddr(instance, toStringz("vkCmdSetEvent"));	*(cast(void**)&vkCmdSetEvent2) = vkGetInstanceProcAddr(instance, toStringz("vkCmdSetEvent2"));	*(cast(void**)&vkCmdSetEvent2KHR) = vkGetInstanceProcAddr(instance, toStringz("vkCmdSetEvent2KHR"));	*(cast(void**)&vkCmdSetExclusiveScissorNV) = vkGetInstanceProcAddr(instance, toStringz("vkCmdSetExclusiveScissorNV"));	*(cast(void**)&vkCmdSetFragmentShadingRateEnumNV) = vkGetInstanceProcAddr(instance, toStringz("vkCmdSetFragmentShadingRateEnumNV"));	*(cast(void**)&vkCmdSetFragmentShadingRateKHR) = vkGetInstanceProcAddr(instance, toStringz("vkCmdSetFragmentShadingRateKHR"));	*(cast(void**)&vkCmdSetFrontFace) = vkGetInstanceProcAddr(instance, toStringz("vkCmdSetFrontFace"));	*(cast(void**)&vkCmdSetFrontFaceEXT) = vkGetInstanceProcAddr(instance, toStringz("vkCmdSetFrontFaceEXT"));	*(cast(void**)&vkCmdSetLineStippleEXT) = vkGetInstanceProcAddr(instance, toStringz("vkCmdSetLineStippleEXT"));	*(cast(void**)&vkCmdSetLineWidth) = vkGetInstanceProcAddr(instance, toStringz("vkCmdSetLineWidth"));	*(cast(void**)&vkCmdSetLogicOpEXT) = vkGetInstanceProcAddr(instance, toStringz("vkCmdSetLogicOpEXT"));	*(cast(void**)&vkCmdSetPatchControlPointsEXT) = vkGetInstanceProcAddr(instance, toStringz("vkCmdSetPatchControlPointsEXT"));	*(cast(void**)&vkCmdSetPerformanceMarkerINTEL) = vkGetInstanceProcAddr(instance, toStringz("vkCmdSetPerformanceMarkerINTEL"));	*(cast(void**)&vkCmdSetPerformanceOverrideINTEL) = vkGetInstanceProcAddr(instance, toStringz("vkCmdSetPerformanceOverrideINTEL"));	*(cast(void**)&vkCmdSetPerformanceStreamMarkerINTEL) = vkGetInstanceProcAddr(instance, toStringz("vkCmdSetPerformanceStreamMarkerINTEL"));	*(cast(void**)&vkCmdSetPrimitiveRestartEnable) = vkGetInstanceProcAddr(instance, toStringz("vkCmdSetPrimitiveRestartEnable"));	*(cast(void**)&vkCmdSetPrimitiveRestartEnableEXT) = vkGetInstanceProcAddr(instance, toStringz("vkCmdSetPrimitiveRestartEnableEXT"));	*(cast(void**)&vkCmdSetPrimitiveTopology) = vkGetInstanceProcAddr(instance, toStringz("vkCmdSetPrimitiveTopology"));	*(cast(void**)&vkCmdSetPrimitiveTopologyEXT) = vkGetInstanceProcAddr(instance, toStringz("vkCmdSetPrimitiveTopologyEXT"));	*(cast(void**)&vkCmdSetRasterizerDiscardEnable) = vkGetInstanceProcAddr(instance, toStringz("vkCmdSetRasterizerDiscardEnable"));	*(cast(void**)&vkCmdSetRasterizerDiscardEnableEXT) = vkGetInstanceProcAddr(instance, toStringz("vkCmdSetRasterizerDiscardEnableEXT"));	*(cast(void**)&vkCmdSetRayTracingPipelineStackSizeKHR) = vkGetInstanceProcAddr(instance, toStringz("vkCmdSetRayTracingPipelineStackSizeKHR"));	*(cast(void**)&vkCmdSetSampleLocationsEXT) = vkGetInstanceProcAddr(instance, toStringz("vkCmdSetSampleLocationsEXT"));	*(cast(void**)&vkCmdSetScissor) = vkGetInstanceProcAddr(instance, toStringz("vkCmdSetScissor"));	*(cast(void**)&vkCmdSetScissorWithCount) = vkGetInstanceProcAddr(instance, toStringz("vkCmdSetScissorWithCount"));	*(cast(void**)&vkCmdSetScissorWithCountEXT) = vkGetInstanceProcAddr(instance, toStringz("vkCmdSetScissorWithCountEXT"));	*(cast(void**)&vkCmdSetStencilCompareMask) = vkGetInstanceProcAddr(instance, toStringz("vkCmdSetStencilCompareMask"));	*(cast(void**)&vkCmdSetStencilOp) = vkGetInstanceProcAddr(instance, toStringz("vkCmdSetStencilOp"));	*(cast(void**)&vkCmdSetStencilOpEXT) = vkGetInstanceProcAddr(instance, toStringz("vkCmdSetStencilOpEXT"));	*(cast(void**)&vkCmdSetStencilReference) = vkGetInstanceProcAddr(instance, toStringz("vkCmdSetStencilReference"));	*(cast(void**)&vkCmdSetStencilTestEnable) = vkGetInstanceProcAddr(instance, toStringz("vkCmdSetStencilTestEnable"));	*(cast(void**)&vkCmdSetStencilTestEnableEXT) = vkGetInstanceProcAddr(instance, toStringz("vkCmdSetStencilTestEnableEXT"));	*(cast(void**)&vkCmdSetStencilWriteMask) = vkGetInstanceProcAddr(instance, toStringz("vkCmdSetStencilWriteMask"));	*(cast(void**)&vkCmdSetVertexInputEXT) = vkGetInstanceProcAddr(instance, toStringz("vkCmdSetVertexInputEXT"));	*(cast(void**)&vkCmdSetViewport) = vkGetInstanceProcAddr(instance, toStringz("vkCmdSetViewport"));	*(cast(void**)&vkCmdSetViewportShadingRatePaletteNV) = vkGetInstanceProcAddr(instance, toStringz("vkCmdSetViewportShadingRatePaletteNV"));	*(cast(void**)&vkCmdSetViewportWScalingNV) = vkGetInstanceProcAddr(instance, toStringz("vkCmdSetViewportWScalingNV"));	*(cast(void**)&vkCmdSetViewportWithCount) = vkGetInstanceProcAddr(instance, toStringz("vkCmdSetViewportWithCount"));	*(cast(void**)&vkCmdSetViewportWithCountEXT) = vkGetInstanceProcAddr(instance, toStringz("vkCmdSetViewportWithCountEXT"));	*(cast(void**)&vkCmdSubpassShadingHUAWEI) = vkGetInstanceProcAddr(instance, toStringz("vkCmdSubpassShadingHUAWEI"));	*(cast(void**)&vkCmdTraceRaysIndirectKHR) = vkGetInstanceProcAddr(instance, toStringz("vkCmdTraceRaysIndirectKHR"));	*(cast(void**)&vkCmdTraceRaysKHR) = vkGetInstanceProcAddr(instance, toStringz("vkCmdTraceRaysKHR"));	*(cast(void**)&vkCmdTraceRaysNV) = vkGetInstanceProcAddr(instance, toStringz("vkCmdTraceRaysNV"));	*(cast(void**)&vkCmdUpdateBuffer) = vkGetInstanceProcAddr(instance, toStringz("vkCmdUpdateBuffer"));	*(cast(void**)&vkCmdWaitEvents) = vkGetInstanceProcAddr(instance, toStringz("vkCmdWaitEvents"));	*(cast(void**)&vkCmdWaitEvents2) = vkGetInstanceProcAddr(instance, toStringz("vkCmdWaitEvents2"));	*(cast(void**)&vkCmdWaitEvents2KHR) = vkGetInstanceProcAddr(instance, toStringz("vkCmdWaitEvents2KHR"));	*(cast(void**)&vkCmdWriteAccelerationStructuresPropertiesKHR) = vkGetInstanceProcAddr(instance, toStringz("vkCmdWriteAccelerationStructuresPropertiesKHR"));	*(cast(void**)&vkCmdWriteAccelerationStructuresPropertiesNV) = vkGetInstanceProcAddr(instance, toStringz("vkCmdWriteAccelerationStructuresPropertiesNV"));	*(cast(void**)&vkCmdWriteBufferMarker2AMD) = vkGetInstanceProcAddr(instance, toStringz("vkCmdWriteBufferMarker2AMD"));	*(cast(void**)&vkCmdWriteBufferMarkerAMD) = vkGetInstanceProcAddr(instance, toStringz("vkCmdWriteBufferMarkerAMD"));	*(cast(void**)&vkCmdWriteTimestamp) = vkGetInstanceProcAddr(instance, toStringz("vkCmdWriteTimestamp"));	*(cast(void**)&vkCmdWriteTimestamp2) = vkGetInstanceProcAddr(instance, toStringz("vkCmdWriteTimestamp2"));	*(cast(void**)&vkCmdWriteTimestamp2KHR) = vkGetInstanceProcAddr(instance, toStringz("vkCmdWriteTimestamp2KHR"));	*(cast(void**)&vkCompileDeferredNV) = vkGetInstanceProcAddr(instance, toStringz("vkCompileDeferredNV"));	*(cast(void**)&vkCopyAccelerationStructureKHR) = vkGetInstanceProcAddr(instance, toStringz("vkCopyAccelerationStructureKHR"));	*(cast(void**)&vkCopyAccelerationStructureToMemoryKHR) = vkGetInstanceProcAddr(instance, toStringz("vkCopyAccelerationStructureToMemoryKHR"));	*(cast(void**)&vkCopyMemoryToAccelerationStructureKHR) = vkGetInstanceProcAddr(instance, toStringz("vkCopyMemoryToAccelerationStructureKHR"));	*(cast(void**)&vkCreateAccelerationStructureKHR) = vkGetInstanceProcAddr(instance, toStringz("vkCreateAccelerationStructureKHR"));	*(cast(void**)&vkCreateAccelerationStructureNV) = vkGetInstanceProcAddr(instance, toStringz("vkCreateAccelerationStructureNV"));	*(cast(void**)&vkCreateBuffer) = vkGetInstanceProcAddr(instance, toStringz("vkCreateBuffer"));	*(cast(void**)&vkCreateBufferView) = vkGetInstanceProcAddr(instance, toStringz("vkCreateBufferView"));	*(cast(void**)&vkCreateCommandPool) = vkGetInstanceProcAddr(instance, toStringz("vkCreateCommandPool"));	*(cast(void**)&vkCreateComputePipelines) = vkGetInstanceProcAddr(instance, toStringz("vkCreateComputePipelines"));	*(cast(void**)&vkCreateCuFunctionNVX) = vkGetInstanceProcAddr(instance, toStringz("vkCreateCuFunctionNVX"));	*(cast(void**)&vkCreateCuModuleNVX) = vkGetInstanceProcAddr(instance, toStringz("vkCreateCuModuleNVX"));	*(cast(void**)&vkCreateDebugReportCallbackEXT) = vkGetInstanceProcAddr(instance, toStringz("vkCreateDebugReportCallbackEXT"));	*(cast(void**)&vkCreateDebugUtilsMessengerEXT) = vkGetInstanceProcAddr(instance, toStringz("vkCreateDebugUtilsMessengerEXT"));	*(cast(void**)&vkCreateDeferredOperationKHR) = vkGetInstanceProcAddr(instance, toStringz("vkCreateDeferredOperationKHR"));	*(cast(void**)&vkCreateDescriptorPool) = vkGetInstanceProcAddr(instance, toStringz("vkCreateDescriptorPool"));	*(cast(void**)&vkCreateDescriptorSetLayout) = vkGetInstanceProcAddr(instance, toStringz("vkCreateDescriptorSetLayout"));	*(cast(void**)&vkCreateDescriptorUpdateTemplate) = vkGetInstanceProcAddr(instance, toStringz("vkCreateDescriptorUpdateTemplate"));	*(cast(void**)&vkCreateDescriptorUpdateTemplateKHR) = vkGetInstanceProcAddr(instance, toStringz("vkCreateDescriptorUpdateTemplateKHR"));	*(cast(void**)&vkCreateDevice) = vkGetInstanceProcAddr(instance, toStringz("vkCreateDevice"));	*(cast(void**)&vkCreateDisplayModeKHR) = vkGetInstanceProcAddr(instance, toStringz("vkCreateDisplayModeKHR"));	*(cast(void**)&vkCreateDisplayPlaneSurfaceKHR) = vkGetInstanceProcAddr(instance, toStringz("vkCreateDisplayPlaneSurfaceKHR"));	*(cast(void**)&vkCreateEvent) = vkGetInstanceProcAddr(instance, toStringz("vkCreateEvent"));	*(cast(void**)&vkCreateFence) = vkGetInstanceProcAddr(instance, toStringz("vkCreateFence"));	*(cast(void**)&vkCreateFramebuffer) = vkGetInstanceProcAddr(instance, toStringz("vkCreateFramebuffer"));	*(cast(void**)&vkCreateGraphicsPipelines) = vkGetInstanceProcAddr(instance, toStringz("vkCreateGraphicsPipelines"));	*(cast(void**)&vkCreateHeadlessSurfaceEXT) = vkGetInstanceProcAddr(instance, toStringz("vkCreateHeadlessSurfaceEXT"));	*(cast(void**)&vkCreateImage) = vkGetInstanceProcAddr(instance, toStringz("vkCreateImage"));	*(cast(void**)&vkCreateImageView) = vkGetInstanceProcAddr(instance, toStringz("vkCreateImageView"));	*(cast(void**)&vkCreateIndirectCommandsLayoutNV) = vkGetInstanceProcAddr(instance, toStringz("vkCreateIndirectCommandsLayoutNV"));	*(cast(void**)&vkCreatePipelineCache) = vkGetInstanceProcAddr(instance, toStringz("vkCreatePipelineCache"));	*(cast(void**)&vkCreatePipelineLayout) = vkGetInstanceProcAddr(instance, toStringz("vkCreatePipelineLayout"));	*(cast(void**)&vkCreatePrivateDataSlot) = vkGetInstanceProcAddr(instance, toStringz("vkCreatePrivateDataSlot"));	*(cast(void**)&vkCreatePrivateDataSlotEXT) = vkGetInstanceProcAddr(instance, toStringz("vkCreatePrivateDataSlotEXT"));	*(cast(void**)&vkCreateQueryPool) = vkGetInstanceProcAddr(instance, toStringz("vkCreateQueryPool"));	*(cast(void**)&vkCreateRayTracingPipelinesKHR) = vkGetInstanceProcAddr(instance, toStringz("vkCreateRayTracingPipelinesKHR"));	*(cast(void**)&vkCreateRayTracingPipelinesNV) = vkGetInstanceProcAddr(instance, toStringz("vkCreateRayTracingPipelinesNV"));	*(cast(void**)&vkCreateRenderPass) = vkGetInstanceProcAddr(instance, toStringz("vkCreateRenderPass"));	*(cast(void**)&vkCreateRenderPass2) = vkGetInstanceProcAddr(instance, toStringz("vkCreateRenderPass2"));	*(cast(void**)&vkCreateRenderPass2KHR) = vkGetInstanceProcAddr(instance, toStringz("vkCreateRenderPass2KHR"));	*(cast(void**)&vkCreateSampler) = vkGetInstanceProcAddr(instance, toStringz("vkCreateSampler"));	*(cast(void**)&vkCreateSamplerYcbcrConversion) = vkGetInstanceProcAddr(instance, toStringz("vkCreateSamplerYcbcrConversion"));	*(cast(void**)&vkCreateSamplerYcbcrConversionKHR) = vkGetInstanceProcAddr(instance, toStringz("vkCreateSamplerYcbcrConversionKHR"));	*(cast(void**)&vkCreateSemaphore) = vkGetInstanceProcAddr(instance, toStringz("vkCreateSemaphore"));	*(cast(void**)&vkCreateShaderModule) = vkGetInstanceProcAddr(instance, toStringz("vkCreateShaderModule"));	*(cast(void**)&vkCreateSharedSwapchainsKHR) = vkGetInstanceProcAddr(instance, toStringz("vkCreateSharedSwapchainsKHR"));	*(cast(void**)&vkCreateSwapchainKHR) = vkGetInstanceProcAddr(instance, toStringz("vkCreateSwapchainKHR"));	*(cast(void**)&vkCreateValidationCacheEXT) = vkGetInstanceProcAddr(instance, toStringz("vkCreateValidationCacheEXT"));	*(cast(void**)&vkCreateWin32SurfaceKHR) = vkGetInstanceProcAddr(instance, toStringz("vkCreateWin32SurfaceKHR"));	*(cast(void**)&vkDebugMarkerSetObjectNameEXT) = vkGetInstanceProcAddr(instance, toStringz("vkDebugMarkerSetObjectNameEXT"));	*(cast(void**)&vkDebugMarkerSetObjectTagEXT) = vkGetInstanceProcAddr(instance, toStringz("vkDebugMarkerSetObjectTagEXT"));	*(cast(void**)&vkDebugReportMessageEXT) = vkGetInstanceProcAddr(instance, toStringz("vkDebugReportMessageEXT"));	*(cast(void**)&vkDeferredOperationJoinKHR) = vkGetInstanceProcAddr(instance, toStringz("vkDeferredOperationJoinKHR"));	*(cast(void**)&vkDestroyAccelerationStructureKHR) = vkGetInstanceProcAddr(instance, toStringz("vkDestroyAccelerationStructureKHR"));	*(cast(void**)&vkDestroyAccelerationStructureNV) = vkGetInstanceProcAddr(instance, toStringz("vkDestroyAccelerationStructureNV"));	*(cast(void**)&vkDestroyBuffer) = vkGetInstanceProcAddr(instance, toStringz("vkDestroyBuffer"));	*(cast(void**)&vkDestroyBufferView) = vkGetInstanceProcAddr(instance, toStringz("vkDestroyBufferView"));	*(cast(void**)&vkDestroyCommandPool) = vkGetInstanceProcAddr(instance, toStringz("vkDestroyCommandPool"));	*(cast(void**)&vkDestroyCuFunctionNVX) = vkGetInstanceProcAddr(instance, toStringz("vkDestroyCuFunctionNVX"));	*(cast(void**)&vkDestroyCuModuleNVX) = vkGetInstanceProcAddr(instance, toStringz("vkDestroyCuModuleNVX"));	*(cast(void**)&vkDestroyDebugReportCallbackEXT) = vkGetInstanceProcAddr(instance, toStringz("vkDestroyDebugReportCallbackEXT"));	*(cast(void**)&vkDestroyDebugUtilsMessengerEXT) = vkGetInstanceProcAddr(instance, toStringz("vkDestroyDebugUtilsMessengerEXT"));	*(cast(void**)&vkDestroyDeferredOperationKHR) = vkGetInstanceProcAddr(instance, toStringz("vkDestroyDeferredOperationKHR"));	*(cast(void**)&vkDestroyDescriptorPool) = vkGetInstanceProcAddr(instance, toStringz("vkDestroyDescriptorPool"));	*(cast(void**)&vkDestroyDescriptorSetLayout) = vkGetInstanceProcAddr(instance, toStringz("vkDestroyDescriptorSetLayout"));	*(cast(void**)&vkDestroyDescriptorUpdateTemplate) = vkGetInstanceProcAddr(instance, toStringz("vkDestroyDescriptorUpdateTemplate"));	*(cast(void**)&vkDestroyDescriptorUpdateTemplateKHR) = vkGetInstanceProcAddr(instance, toStringz("vkDestroyDescriptorUpdateTemplateKHR"));	*(cast(void**)&vkDestroyDevice) = vkGetInstanceProcAddr(instance, toStringz("vkDestroyDevice"));	*(cast(void**)&vkDestroyEvent) = vkGetInstanceProcAddr(instance, toStringz("vkDestroyEvent"));	*(cast(void**)&vkDestroyFence) = vkGetInstanceProcAddr(instance, toStringz("vkDestroyFence"));	*(cast(void**)&vkDestroyFramebuffer) = vkGetInstanceProcAddr(instance, toStringz("vkDestroyFramebuffer"));	*(cast(void**)&vkDestroyImage) = vkGetInstanceProcAddr(instance, toStringz("vkDestroyImage"));	*(cast(void**)&vkDestroyImageView) = vkGetInstanceProcAddr(instance, toStringz("vkDestroyImageView"));	*(cast(void**)&vkDestroyIndirectCommandsLayoutNV) = vkGetInstanceProcAddr(instance, toStringz("vkDestroyIndirectCommandsLayoutNV"));	*(cast(void**)&vkDestroyInstance) = vkGetInstanceProcAddr(instance, toStringz("vkDestroyInstance"));	*(cast(void**)&vkDestroyPipeline) = vkGetInstanceProcAddr(instance, toStringz("vkDestroyPipeline"));	*(cast(void**)&vkDestroyPipelineCache) = vkGetInstanceProcAddr(instance, toStringz("vkDestroyPipelineCache"));	*(cast(void**)&vkDestroyPipelineLayout) = vkGetInstanceProcAddr(instance, toStringz("vkDestroyPipelineLayout"));	*(cast(void**)&vkDestroyPrivateDataSlot) = vkGetInstanceProcAddr(instance, toStringz("vkDestroyPrivateDataSlot"));	*(cast(void**)&vkDestroyPrivateDataSlotEXT) = vkGetInstanceProcAddr(instance, toStringz("vkDestroyPrivateDataSlotEXT"));	*(cast(void**)&vkDestroyQueryPool) = vkGetInstanceProcAddr(instance, toStringz("vkDestroyQueryPool"));	*(cast(void**)&vkDestroyRenderPass) = vkGetInstanceProcAddr(instance, toStringz("vkDestroyRenderPass"));	*(cast(void**)&vkDestroySampler) = vkGetInstanceProcAddr(instance, toStringz("vkDestroySampler"));	*(cast(void**)&vkDestroySamplerYcbcrConversion) = vkGetInstanceProcAddr(instance, toStringz("vkDestroySamplerYcbcrConversion"));	*(cast(void**)&vkDestroySamplerYcbcrConversionKHR) = vkGetInstanceProcAddr(instance, toStringz("vkDestroySamplerYcbcrConversionKHR"));	*(cast(void**)&vkDestroySemaphore) = vkGetInstanceProcAddr(instance, toStringz("vkDestroySemaphore"));	*(cast(void**)&vkDestroyShaderModule) = vkGetInstanceProcAddr(instance, toStringz("vkDestroyShaderModule"));	*(cast(void**)&vkDestroySurfaceKHR) = vkGetInstanceProcAddr(instance, toStringz("vkDestroySurfaceKHR"));	*(cast(void**)&vkDestroySwapchainKHR) = vkGetInstanceProcAddr(instance, toStringz("vkDestroySwapchainKHR"));	*(cast(void**)&vkDestroyValidationCacheEXT) = vkGetInstanceProcAddr(instance, toStringz("vkDestroyValidationCacheEXT"));	*(cast(void**)&vkDeviceWaitIdle) = vkGetInstanceProcAddr(instance, toStringz("vkDeviceWaitIdle"));	*(cast(void**)&vkDisplayPowerControlEXT) = vkGetInstanceProcAddr(instance, toStringz("vkDisplayPowerControlEXT"));	*(cast(void**)&vkEndCommandBuffer) = vkGetInstanceProcAddr(instance, toStringz("vkEndCommandBuffer"));	*(cast(void**)&vkEnumerateDeviceExtensionProperties) = vkGetInstanceProcAddr(instance, toStringz("vkEnumerateDeviceExtensionProperties"));	*(cast(void**)&vkEnumerateDeviceLayerProperties) = vkGetInstanceProcAddr(instance, toStringz("vkEnumerateDeviceLayerProperties"));	*(cast(void**)&vkEnumeratePhysicalDeviceGroups) = vkGetInstanceProcAddr(instance, toStringz("vkEnumeratePhysicalDeviceGroups"));	*(cast(void**)&vkEnumeratePhysicalDeviceGroupsKHR) = vkGetInstanceProcAddr(instance, toStringz("vkEnumeratePhysicalDeviceGroupsKHR"));	*(cast(void**)&vkEnumeratePhysicalDeviceQueueFamilyPerformanceQueryCountersKHR) = vkGetInstanceProcAddr(instance, toStringz("vkEnumeratePhysicalDeviceQueueFamilyPerformanceQueryCountersKHR"));	*(cast(void**)&vkEnumeratePhysicalDevices) = vkGetInstanceProcAddr(instance, toStringz("vkEnumeratePhysicalDevices"));	*(cast(void**)&vkFlushMappedMemoryRanges) = vkGetInstanceProcAddr(instance, toStringz("vkFlushMappedMemoryRanges"));	*(cast(void**)&vkFreeCommandBuffers) = vkGetInstanceProcAddr(instance, toStringz("vkFreeCommandBuffers"));	*(cast(void**)&vkFreeDescriptorSets) = vkGetInstanceProcAddr(instance, toStringz("vkFreeDescriptorSets"));	*(cast(void**)&vkFreeMemory) = vkGetInstanceProcAddr(instance, toStringz("vkFreeMemory"));	*(cast(void**)&vkGetAccelerationStructureBuildSizesKHR) = vkGetInstanceProcAddr(instance, toStringz("vkGetAccelerationStructureBuildSizesKHR"));	*(cast(void**)&vkGetAccelerationStructureDeviceAddressKHR) = vkGetInstanceProcAddr(instance, toStringz("vkGetAccelerationStructureDeviceAddressKHR"));	*(cast(void**)&vkGetAccelerationStructureHandleNV) = vkGetInstanceProcAddr(instance, toStringz("vkGetAccelerationStructureHandleNV"));	*(cast(void**)&vkGetAccelerationStructureMemoryRequirementsNV) = vkGetInstanceProcAddr(instance, toStringz("vkGetAccelerationStructureMemoryRequirementsNV"));	*(cast(void**)&vkGetBufferDeviceAddress) = vkGetInstanceProcAddr(instance, toStringz("vkGetBufferDeviceAddress"));	*(cast(void**)&vkGetBufferDeviceAddressEXT) = vkGetInstanceProcAddr(instance, toStringz("vkGetBufferDeviceAddressEXT"));	*(cast(void**)&vkGetBufferDeviceAddressKHR) = vkGetInstanceProcAddr(instance, toStringz("vkGetBufferDeviceAddressKHR"));	*(cast(void**)&vkGetBufferMemoryRequirements) = vkGetInstanceProcAddr(instance, toStringz("vkGetBufferMemoryRequirements"));	*(cast(void**)&vkGetBufferMemoryRequirements2) = vkGetInstanceProcAddr(instance, toStringz("vkGetBufferMemoryRequirements2"));	*(cast(void**)&vkGetBufferMemoryRequirements2KHR) = vkGetInstanceProcAddr(instance, toStringz("vkGetBufferMemoryRequirements2KHR"));	*(cast(void**)&vkGetBufferOpaqueCaptureAddress) = vkGetInstanceProcAddr(instance, toStringz("vkGetBufferOpaqueCaptureAddress"));	*(cast(void**)&vkGetBufferOpaqueCaptureAddressKHR) = vkGetInstanceProcAddr(instance, toStringz("vkGetBufferOpaqueCaptureAddressKHR"));	*(cast(void**)&vkGetCalibratedTimestampsEXT) = vkGetInstanceProcAddr(instance, toStringz("vkGetCalibratedTimestampsEXT"));	*(cast(void**)&vkGetDeferredOperationMaxConcurrencyKHR) = vkGetInstanceProcAddr(instance, toStringz("vkGetDeferredOperationMaxConcurrencyKHR"));	*(cast(void**)&vkGetDeferredOperationResultKHR) = vkGetInstanceProcAddr(instance, toStringz("vkGetDeferredOperationResultKHR"));	*(cast(void**)&vkGetDescriptorSetHostMappingVALVE) = vkGetInstanceProcAddr(instance, toStringz("vkGetDescriptorSetHostMappingVALVE"));	*(cast(void**)&vkGetDescriptorSetLayoutHostMappingInfoVALVE) = vkGetInstanceProcAddr(instance, toStringz("vkGetDescriptorSetLayoutHostMappingInfoVALVE"));	*(cast(void**)&vkGetDescriptorSetLayoutSupport) = vkGetInstanceProcAddr(instance, toStringz("vkGetDescriptorSetLayoutSupport"));	*(cast(void**)&vkGetDescriptorSetLayoutSupportKHR) = vkGetInstanceProcAddr(instance, toStringz("vkGetDescriptorSetLayoutSupportKHR"));	*(cast(void**)&vkGetDeviceAccelerationStructureCompatibilityKHR) = vkGetInstanceProcAddr(instance, toStringz("vkGetDeviceAccelerationStructureCompatibilityKHR"));	*(cast(void**)&vkGetDeviceBufferMemoryRequirements) = vkGetInstanceProcAddr(instance, toStringz("vkGetDeviceBufferMemoryRequirements"));	*(cast(void**)&vkGetDeviceBufferMemoryRequirementsKHR) = vkGetInstanceProcAddr(instance, toStringz("vkGetDeviceBufferMemoryRequirementsKHR"));	*(cast(void**)&vkGetDeviceGroupPeerMemoryFeatures) = vkGetInstanceProcAddr(instance, toStringz("vkGetDeviceGroupPeerMemoryFeatures"));	*(cast(void**)&vkGetDeviceGroupPeerMemoryFeaturesKHR) = vkGetInstanceProcAddr(instance, toStringz("vkGetDeviceGroupPeerMemoryFeaturesKHR"));	*(cast(void**)&vkGetDeviceGroupPresentCapabilitiesKHR) = vkGetInstanceProcAddr(instance, toStringz("vkGetDeviceGroupPresentCapabilitiesKHR"));	*(cast(void**)&vkGetDeviceGroupSurfacePresentModes2EXT) = vkGetInstanceProcAddr(instance, toStringz("vkGetDeviceGroupSurfacePresentModes2EXT"));	*(cast(void**)&vkGetDeviceGroupSurfacePresentModesKHR) = vkGetInstanceProcAddr(instance, toStringz("vkGetDeviceGroupSurfacePresentModesKHR"));	*(cast(void**)&vkGetDeviceImageMemoryRequirements) = vkGetInstanceProcAddr(instance, toStringz("vkGetDeviceImageMemoryRequirements"));	*(cast(void**)&vkGetDeviceImageMemoryRequirementsKHR) = vkGetInstanceProcAddr(instance, toStringz("vkGetDeviceImageMemoryRequirementsKHR"));	*(cast(void**)&vkGetDeviceImageSparseMemoryRequirements) = vkGetInstanceProcAddr(instance, toStringz("vkGetDeviceImageSparseMemoryRequirements"));	*(cast(void**)&vkGetDeviceImageSparseMemoryRequirementsKHR) = vkGetInstanceProcAddr(instance, toStringz("vkGetDeviceImageSparseMemoryRequirementsKHR"));	*(cast(void**)&vkGetDeviceMemoryCommitment) = vkGetInstanceProcAddr(instance, toStringz("vkGetDeviceMemoryCommitment"));	*(cast(void**)&vkGetDeviceMemoryOpaqueCaptureAddress) = vkGetInstanceProcAddr(instance, toStringz("vkGetDeviceMemoryOpaqueCaptureAddress"));	*(cast(void**)&vkGetDeviceMemoryOpaqueCaptureAddressKHR) = vkGetInstanceProcAddr(instance, toStringz("vkGetDeviceMemoryOpaqueCaptureAddressKHR"));	*(cast(void**)&vkGetDeviceProcAddr) = vkGetInstanceProcAddr(instance, toStringz("vkGetDeviceProcAddr"));	*(cast(void**)&vkGetDeviceQueue) = vkGetInstanceProcAddr(instance, toStringz("vkGetDeviceQueue"));	*(cast(void**)&vkGetDeviceQueue2) = vkGetInstanceProcAddr(instance, toStringz("vkGetDeviceQueue2"));	*(cast(void**)&vkGetDeviceSubpassShadingMaxWorkgroupSizeHUAWEI) = vkGetInstanceProcAddr(instance, toStringz("vkGetDeviceSubpassShadingMaxWorkgroupSizeHUAWEI"));	*(cast(void**)&vkGetDisplayModeProperties2KHR) = vkGetInstanceProcAddr(instance, toStringz("vkGetDisplayModeProperties2KHR"));	*(cast(void**)&vkGetDisplayModePropertiesKHR) = vkGetInstanceProcAddr(instance, toStringz("vkGetDisplayModePropertiesKHR"));	*(cast(void**)&vkGetDisplayPlaneCapabilities2KHR) = vkGetInstanceProcAddr(instance, toStringz("vkGetDisplayPlaneCapabilities2KHR"));	*(cast(void**)&vkGetDisplayPlaneCapabilitiesKHR) = vkGetInstanceProcAddr(instance, toStringz("vkGetDisplayPlaneCapabilitiesKHR"));	*(cast(void**)&vkGetDisplayPlaneSupportedDisplaysKHR) = vkGetInstanceProcAddr(instance, toStringz("vkGetDisplayPlaneSupportedDisplaysKHR"));	*(cast(void**)&vkGetDrmDisplayEXT) = vkGetInstanceProcAddr(instance, toStringz("vkGetDrmDisplayEXT"));	*(cast(void**)&vkGetEventStatus) = vkGetInstanceProcAddr(instance, toStringz("vkGetEventStatus"));	*(cast(void**)&vkGetFenceFdKHR) = vkGetInstanceProcAddr(instance, toStringz("vkGetFenceFdKHR"));	*(cast(void**)&vkGetFenceStatus) = vkGetInstanceProcAddr(instance, toStringz("vkGetFenceStatus"));	*(cast(void**)&vkGetFenceWin32HandleKHR) = vkGetInstanceProcAddr(instance, toStringz("vkGetFenceWin32HandleKHR"));	*(cast(void**)&vkGetGeneratedCommandsMemoryRequirementsNV) = vkGetInstanceProcAddr(instance, toStringz("vkGetGeneratedCommandsMemoryRequirementsNV"));	*(cast(void**)&vkGetImageDrmFormatModifierPropertiesEXT) = vkGetInstanceProcAddr(instance, toStringz("vkGetImageDrmFormatModifierPropertiesEXT"));	*(cast(void**)&vkGetImageMemoryRequirements) = vkGetInstanceProcAddr(instance, toStringz("vkGetImageMemoryRequirements"));	*(cast(void**)&vkGetImageMemoryRequirements2) = vkGetInstanceProcAddr(instance, toStringz("vkGetImageMemoryRequirements2"));	*(cast(void**)&vkGetImageMemoryRequirements2KHR) = vkGetInstanceProcAddr(instance, toStringz("vkGetImageMemoryRequirements2KHR"));	*(cast(void**)&vkGetImageSparseMemoryRequirements) = vkGetInstanceProcAddr(instance, toStringz("vkGetImageSparseMemoryRequirements"));	*(cast(void**)&vkGetImageSparseMemoryRequirements2) = vkGetInstanceProcAddr(instance, toStringz("vkGetImageSparseMemoryRequirements2"));	*(cast(void**)&vkGetImageSparseMemoryRequirements2KHR) = vkGetInstanceProcAddr(instance, toStringz("vkGetImageSparseMemoryRequirements2KHR"));	*(cast(void**)&vkGetImageSubresourceLayout) = vkGetInstanceProcAddr(instance, toStringz("vkGetImageSubresourceLayout"));	*(cast(void**)&vkGetImageViewAddressNVX) = vkGetInstanceProcAddr(instance, toStringz("vkGetImageViewAddressNVX"));	*(cast(void**)&vkGetImageViewHandleNVX) = vkGetInstanceProcAddr(instance, toStringz("vkGetImageViewHandleNVX"));	*(cast(void**)&vkGetMemoryFdKHR) = vkGetInstanceProcAddr(instance, toStringz("vkGetMemoryFdKHR"));	*(cast(void**)&vkGetMemoryFdPropertiesKHR) = vkGetInstanceProcAddr(instance, toStringz("vkGetMemoryFdPropertiesKHR"));	*(cast(void**)&vkGetMemoryHostPointerPropertiesEXT) = vkGetInstanceProcAddr(instance, toStringz("vkGetMemoryHostPointerPropertiesEXT"));	*(cast(void**)&vkGetMemoryRemoteAddressNV) = vkGetInstanceProcAddr(instance, toStringz("vkGetMemoryRemoteAddressNV"));	*(cast(void**)&vkGetMemoryWin32HandleKHR) = vkGetInstanceProcAddr(instance, toStringz("vkGetMemoryWin32HandleKHR"));	*(cast(void**)&vkGetMemoryWin32HandleNV) = vkGetInstanceProcAddr(instance, toStringz("vkGetMemoryWin32HandleNV"));	*(cast(void**)&vkGetMemoryWin32HandlePropertiesKHR) = vkGetInstanceProcAddr(instance, toStringz("vkGetMemoryWin32HandlePropertiesKHR"));	*(cast(void**)&vkGetPastPresentationTimingGOOGLE) = vkGetInstanceProcAddr(instance, toStringz("vkGetPastPresentationTimingGOOGLE"));	*(cast(void**)&vkGetPerformanceParameterINTEL) = vkGetInstanceProcAddr(instance, toStringz("vkGetPerformanceParameterINTEL"));	*(cast(void**)&vkGetPhysicalDeviceCalibrateableTimeDomainsEXT) = vkGetInstanceProcAddr(instance, toStringz("vkGetPhysicalDeviceCalibrateableTimeDomainsEXT"));	*(cast(void**)&vkGetPhysicalDeviceCooperativeMatrixPropertiesNV) = vkGetInstanceProcAddr(instance, toStringz("vkGetPhysicalDeviceCooperativeMatrixPropertiesNV"));	*(cast(void**)&vkGetPhysicalDeviceDisplayPlaneProperties2KHR) = vkGetInstanceProcAddr(instance, toStringz("vkGetPhysicalDeviceDisplayPlaneProperties2KHR"));	*(cast(void**)&vkGetPhysicalDeviceDisplayPlanePropertiesKHR) = vkGetInstanceProcAddr(instance, toStringz("vkGetPhysicalDeviceDisplayPlanePropertiesKHR"));	*(cast(void**)&vkGetPhysicalDeviceDisplayProperties2KHR) = vkGetInstanceProcAddr(instance, toStringz("vkGetPhysicalDeviceDisplayProperties2KHR"));	*(cast(void**)&vkGetPhysicalDeviceDisplayPropertiesKHR) = vkGetInstanceProcAddr(instance, toStringz("vkGetPhysicalDeviceDisplayPropertiesKHR"));	*(cast(void**)&vkGetPhysicalDeviceExternalBufferProperties) = vkGetInstanceProcAddr(instance, toStringz("vkGetPhysicalDeviceExternalBufferProperties"));	*(cast(void**)&vkGetPhysicalDeviceExternalBufferPropertiesKHR) = vkGetInstanceProcAddr(instance, toStringz("vkGetPhysicalDeviceExternalBufferPropertiesKHR"));	*(cast(void**)&vkGetPhysicalDeviceExternalFenceProperties) = vkGetInstanceProcAddr(instance, toStringz("vkGetPhysicalDeviceExternalFenceProperties"));	*(cast(void**)&vkGetPhysicalDeviceExternalFencePropertiesKHR) = vkGetInstanceProcAddr(instance, toStringz("vkGetPhysicalDeviceExternalFencePropertiesKHR"));	*(cast(void**)&vkGetPhysicalDeviceExternalImageFormatPropertiesNV) = vkGetInstanceProcAddr(instance, toStringz("vkGetPhysicalDeviceExternalImageFormatPropertiesNV"));	*(cast(void**)&vkGetPhysicalDeviceExternalSemaphoreProperties) = vkGetInstanceProcAddr(instance, toStringz("vkGetPhysicalDeviceExternalSemaphoreProperties"));	*(cast(void**)&vkGetPhysicalDeviceExternalSemaphorePropertiesKHR) = vkGetInstanceProcAddr(instance, toStringz("vkGetPhysicalDeviceExternalSemaphorePropertiesKHR"));	*(cast(void**)&vkGetPhysicalDeviceFeatures) = vkGetInstanceProcAddr(instance, toStringz("vkGetPhysicalDeviceFeatures"));	*(cast(void**)&vkGetPhysicalDeviceFeatures2) = vkGetInstanceProcAddr(instance, toStringz("vkGetPhysicalDeviceFeatures2"));	*(cast(void**)&vkGetPhysicalDeviceFeatures2KHR) = vkGetInstanceProcAddr(instance, toStringz("vkGetPhysicalDeviceFeatures2KHR"));	*(cast(void**)&vkGetPhysicalDeviceFormatProperties) = vkGetInstanceProcAddr(instance, toStringz("vkGetPhysicalDeviceFormatProperties"));	*(cast(void**)&vkGetPhysicalDeviceFormatProperties2) = vkGetInstanceProcAddr(instance, toStringz("vkGetPhysicalDeviceFormatProperties2"));	*(cast(void**)&vkGetPhysicalDeviceFormatProperties2KHR) = vkGetInstanceProcAddr(instance, toStringz("vkGetPhysicalDeviceFormatProperties2KHR"));	*(cast(void**)&vkGetPhysicalDeviceFragmentShadingRatesKHR) = vkGetInstanceProcAddr(instance, toStringz("vkGetPhysicalDeviceFragmentShadingRatesKHR"));	*(cast(void**)&vkGetPhysicalDeviceImageFormatProperties) = vkGetInstanceProcAddr(instance, toStringz("vkGetPhysicalDeviceImageFormatProperties"));	*(cast(void**)&vkGetPhysicalDeviceImageFormatProperties2) = vkGetInstanceProcAddr(instance, toStringz("vkGetPhysicalDeviceImageFormatProperties2"));	*(cast(void**)&vkGetPhysicalDeviceImageFormatProperties2KHR) = vkGetInstanceProcAddr(instance, toStringz("vkGetPhysicalDeviceImageFormatProperties2KHR"));	*(cast(void**)&vkGetPhysicalDeviceMemoryProperties) = vkGetInstanceProcAddr(instance, toStringz("vkGetPhysicalDeviceMemoryProperties"));	*(cast(void**)&vkGetPhysicalDeviceMemoryProperties2) = vkGetInstanceProcAddr(instance, toStringz("vkGetPhysicalDeviceMemoryProperties2"));	*(cast(void**)&vkGetPhysicalDeviceMemoryProperties2KHR) = vkGetInstanceProcAddr(instance, toStringz("vkGetPhysicalDeviceMemoryProperties2KHR"));	*(cast(void**)&vkGetPhysicalDeviceMultisamplePropertiesEXT) = vkGetInstanceProcAddr(instance, toStringz("vkGetPhysicalDeviceMultisamplePropertiesEXT"));	*(cast(void**)&vkGetPhysicalDevicePresentRectanglesKHR) = vkGetInstanceProcAddr(instance, toStringz("vkGetPhysicalDevicePresentRectanglesKHR"));	*(cast(void**)&vkGetPhysicalDeviceProperties) = vkGetInstanceProcAddr(instance, toStringz("vkGetPhysicalDeviceProperties"));	*(cast(void**)&vkGetPhysicalDeviceProperties2) = vkGetInstanceProcAddr(instance, toStringz("vkGetPhysicalDeviceProperties2"));	*(cast(void**)&vkGetPhysicalDeviceProperties2KHR) = vkGetInstanceProcAddr(instance, toStringz("vkGetPhysicalDeviceProperties2KHR"));	*(cast(void**)&vkGetPhysicalDeviceQueueFamilyPerformanceQueryPassesKHR) = vkGetInstanceProcAddr(instance, toStringz("vkGetPhysicalDeviceQueueFamilyPerformanceQueryPassesKHR"));	*(cast(void**)&vkGetPhysicalDeviceQueueFamilyProperties) = vkGetInstanceProcAddr(instance, toStringz("vkGetPhysicalDeviceQueueFamilyProperties"));	*(cast(void**)&vkGetPhysicalDeviceQueueFamilyProperties2) = vkGetInstanceProcAddr(instance, toStringz("vkGetPhysicalDeviceQueueFamilyProperties2"));	*(cast(void**)&vkGetPhysicalDeviceQueueFamilyProperties2KHR) = vkGetInstanceProcAddr(instance, toStringz("vkGetPhysicalDeviceQueueFamilyProperties2KHR"));	*(cast(void**)&vkGetPhysicalDeviceSparseImageFormatProperties) = vkGetInstanceProcAddr(instance, toStringz("vkGetPhysicalDeviceSparseImageFormatProperties"));	*(cast(void**)&vkGetPhysicalDeviceSparseImageFormatProperties2) = vkGetInstanceProcAddr(instance, toStringz("vkGetPhysicalDeviceSparseImageFormatProperties2"));	*(cast(void**)&vkGetPhysicalDeviceSparseImageFormatProperties2KHR) = vkGetInstanceProcAddr(instance, toStringz("vkGetPhysicalDeviceSparseImageFormatProperties2KHR"));	*(cast(void**)&vkGetPhysicalDeviceSupportedFramebufferMixedSamplesCombinationsNV) = vkGetInstanceProcAddr(instance, toStringz("vkGetPhysicalDeviceSupportedFramebufferMixedSamplesCombinationsNV"));	*(cast(void**)&vkGetPhysicalDeviceSurfaceCapabilities2EXT) = vkGetInstanceProcAddr(instance, toStringz("vkGetPhysicalDeviceSurfaceCapabilities2EXT"));	*(cast(void**)&vkGetPhysicalDeviceSurfaceCapabilities2KHR) = vkGetInstanceProcAddr(instance, toStringz("vkGetPhysicalDeviceSurfaceCapabilities2KHR"));	*(cast(void**)&vkGetPhysicalDeviceSurfaceCapabilitiesKHR) = vkGetInstanceProcAddr(instance, toStringz("vkGetPhysicalDeviceSurfaceCapabilitiesKHR"));	*(cast(void**)&vkGetPhysicalDeviceSurfaceFormats2KHR) = vkGetInstanceProcAddr(instance, toStringz("vkGetPhysicalDeviceSurfaceFormats2KHR"));	*(cast(void**)&vkGetPhysicalDeviceSurfaceFormatsKHR) = vkGetInstanceProcAddr(instance, toStringz("vkGetPhysicalDeviceSurfaceFormatsKHR"));	*(cast(void**)&vkGetPhysicalDeviceSurfacePresentModes2EXT) = vkGetInstanceProcAddr(instance, toStringz("vkGetPhysicalDeviceSurfacePresentModes2EXT"));	*(cast(void**)&vkGetPhysicalDeviceSurfacePresentModesKHR) = vkGetInstanceProcAddr(instance, toStringz("vkGetPhysicalDeviceSurfacePresentModesKHR"));	*(cast(void**)&vkGetPhysicalDeviceSurfaceSupportKHR) = vkGetInstanceProcAddr(instance, toStringz("vkGetPhysicalDeviceSurfaceSupportKHR"));	*(cast(void**)&vkGetPhysicalDeviceToolProperties) = vkGetInstanceProcAddr(instance, toStringz("vkGetPhysicalDeviceToolProperties"));	*(cast(void**)&vkGetPhysicalDeviceToolPropertiesEXT) = vkGetInstanceProcAddr(instance, toStringz("vkGetPhysicalDeviceToolPropertiesEXT"));	*(cast(void**)&vkGetPhysicalDeviceWin32PresentationSupportKHR) = vkGetInstanceProcAddr(instance, toStringz("vkGetPhysicalDeviceWin32PresentationSupportKHR"));	*(cast(void**)&vkGetPipelineCacheData) = vkGetInstanceProcAddr(instance, toStringz("vkGetPipelineCacheData"));	*(cast(void**)&vkGetPipelineExecutableInternalRepresentationsKHR) = vkGetInstanceProcAddr(instance, toStringz("vkGetPipelineExecutableInternalRepresentationsKHR"));	*(cast(void**)&vkGetPipelineExecutablePropertiesKHR) = vkGetInstanceProcAddr(instance, toStringz("vkGetPipelineExecutablePropertiesKHR"));	*(cast(void**)&vkGetPipelineExecutableStatisticsKHR) = vkGetInstanceProcAddr(instance, toStringz("vkGetPipelineExecutableStatisticsKHR"));	*(cast(void**)&vkGetPrivateData) = vkGetInstanceProcAddr(instance, toStringz("vkGetPrivateData"));	*(cast(void**)&vkGetPrivateDataEXT) = vkGetInstanceProcAddr(instance, toStringz("vkGetPrivateDataEXT"));	*(cast(void**)&vkGetQueryPoolResults) = vkGetInstanceProcAddr(instance, toStringz("vkGetQueryPoolResults"));	*(cast(void**)&vkGetQueueCheckpointData2NV) = vkGetInstanceProcAddr(instance, toStringz("vkGetQueueCheckpointData2NV"));	*(cast(void**)&vkGetQueueCheckpointDataNV) = vkGetInstanceProcAddr(instance, toStringz("vkGetQueueCheckpointDataNV"));	*(cast(void**)&vkGetRayTracingCaptureReplayShaderGroupHandlesKHR) = vkGetInstanceProcAddr(instance, toStringz("vkGetRayTracingCaptureReplayShaderGroupHandlesKHR"));	*(cast(void**)&vkGetRayTracingShaderGroupHandlesKHR) = vkGetInstanceProcAddr(instance, toStringz("vkGetRayTracingShaderGroupHandlesKHR"));	*(cast(void**)&vkGetRayTracingShaderGroupHandlesNV) = vkGetInstanceProcAddr(instance, toStringz("vkGetRayTracingShaderGroupHandlesNV"));	*(cast(void**)&vkGetRayTracingShaderGroupStackSizeKHR) = vkGetInstanceProcAddr(instance, toStringz("vkGetRayTracingShaderGroupStackSizeKHR"));	*(cast(void**)&vkGetRefreshCycleDurationGOOGLE) = vkGetInstanceProcAddr(instance, toStringz("vkGetRefreshCycleDurationGOOGLE"));	*(cast(void**)&vkGetRenderAreaGranularity) = vkGetInstanceProcAddr(instance, toStringz("vkGetRenderAreaGranularity"));	*(cast(void**)&vkGetSemaphoreCounterValue) = vkGetInstanceProcAddr(instance, toStringz("vkGetSemaphoreCounterValue"));	*(cast(void**)&vkGetSemaphoreCounterValueKHR) = vkGetInstanceProcAddr(instance, toStringz("vkGetSemaphoreCounterValueKHR"));	*(cast(void**)&vkGetSemaphoreFdKHR) = vkGetInstanceProcAddr(instance, toStringz("vkGetSemaphoreFdKHR"));	*(cast(void**)&vkGetSemaphoreWin32HandleKHR) = vkGetInstanceProcAddr(instance, toStringz("vkGetSemaphoreWin32HandleKHR"));	*(cast(void**)&vkGetShaderInfoAMD) = vkGetInstanceProcAddr(instance, toStringz("vkGetShaderInfoAMD"));	*(cast(void**)&vkGetSwapchainCounterEXT) = vkGetInstanceProcAddr(instance, toStringz("vkGetSwapchainCounterEXT"));	*(cast(void**)&vkGetSwapchainImagesKHR) = vkGetInstanceProcAddr(instance, toStringz("vkGetSwapchainImagesKHR"));	*(cast(void**)&vkGetSwapchainStatusKHR) = vkGetInstanceProcAddr(instance, toStringz("vkGetSwapchainStatusKHR"));	*(cast(void**)&vkGetValidationCacheDataEXT) = vkGetInstanceProcAddr(instance, toStringz("vkGetValidationCacheDataEXT"));	*(cast(void**)&vkGetWinrtDisplayNV) = vkGetInstanceProcAddr(instance, toStringz("vkGetWinrtDisplayNV"));	*(cast(void**)&vkImportFenceFdKHR) = vkGetInstanceProcAddr(instance, toStringz("vkImportFenceFdKHR"));	*(cast(void**)&vkImportFenceWin32HandleKHR) = vkGetInstanceProcAddr(instance, toStringz("vkImportFenceWin32HandleKHR"));	*(cast(void**)&vkImportSemaphoreFdKHR) = vkGetInstanceProcAddr(instance, toStringz("vkImportSemaphoreFdKHR"));	*(cast(void**)&vkImportSemaphoreWin32HandleKHR) = vkGetInstanceProcAddr(instance, toStringz("vkImportSemaphoreWin32HandleKHR"));	*(cast(void**)&vkInitializePerformanceApiINTEL) = vkGetInstanceProcAddr(instance, toStringz("vkInitializePerformanceApiINTEL"));	*(cast(void**)&vkInvalidateMappedMemoryRanges) = vkGetInstanceProcAddr(instance, toStringz("vkInvalidateMappedMemoryRanges"));	*(cast(void**)&vkMapMemory) = vkGetInstanceProcAddr(instance, toStringz("vkMapMemory"));	*(cast(void**)&vkMergePipelineCaches) = vkGetInstanceProcAddr(instance, toStringz("vkMergePipelineCaches"));	*(cast(void**)&vkMergeValidationCachesEXT) = vkGetInstanceProcAddr(instance, toStringz("vkMergeValidationCachesEXT"));	*(cast(void**)&vkQueueBeginDebugUtilsLabelEXT) = vkGetInstanceProcAddr(instance, toStringz("vkQueueBeginDebugUtilsLabelEXT"));	*(cast(void**)&vkQueueBindSparse) = vkGetInstanceProcAddr(instance, toStringz("vkQueueBindSparse"));	*(cast(void**)&vkQueueEndDebugUtilsLabelEXT) = vkGetInstanceProcAddr(instance, toStringz("vkQueueEndDebugUtilsLabelEXT"));	*(cast(void**)&vkQueueInsertDebugUtilsLabelEXT) = vkGetInstanceProcAddr(instance, toStringz("vkQueueInsertDebugUtilsLabelEXT"));	*(cast(void**)&vkQueuePresentKHR) = vkGetInstanceProcAddr(instance, toStringz("vkQueuePresentKHR"));	*(cast(void**)&vkQueueSetPerformanceConfigurationINTEL) = vkGetInstanceProcAddr(instance, toStringz("vkQueueSetPerformanceConfigurationINTEL"));	*(cast(void**)&vkQueueSubmit) = vkGetInstanceProcAddr(instance, toStringz("vkQueueSubmit"));	*(cast(void**)&vkQueueSubmit2) = vkGetInstanceProcAddr(instance, toStringz("vkQueueSubmit2"));	*(cast(void**)&vkQueueSubmit2KHR) = vkGetInstanceProcAddr(instance, toStringz("vkQueueSubmit2KHR"));	*(cast(void**)&vkQueueWaitIdle) = vkGetInstanceProcAddr(instance, toStringz("vkQueueWaitIdle"));	*(cast(void**)&vkRegisterDeviceEventEXT) = vkGetInstanceProcAddr(instance, toStringz("vkRegisterDeviceEventEXT"));	*(cast(void**)&vkRegisterDisplayEventEXT) = vkGetInstanceProcAddr(instance, toStringz("vkRegisterDisplayEventEXT"));	*(cast(void**)&vkReleaseDisplayEXT) = vkGetInstanceProcAddr(instance, toStringz("vkReleaseDisplayEXT"));	*(cast(void**)&vkReleaseFullScreenExclusiveModeEXT) = vkGetInstanceProcAddr(instance, toStringz("vkReleaseFullScreenExclusiveModeEXT"));	*(cast(void**)&vkReleasePerformanceConfigurationINTEL) = vkGetInstanceProcAddr(instance, toStringz("vkReleasePerformanceConfigurationINTEL"));	*(cast(void**)&vkReleaseProfilingLockKHR) = vkGetInstanceProcAddr(instance, toStringz("vkReleaseProfilingLockKHR"));	*(cast(void**)&vkResetCommandBuffer) = vkGetInstanceProcAddr(instance, toStringz("vkResetCommandBuffer"));	*(cast(void**)&vkResetCommandPool) = vkGetInstanceProcAddr(instance, toStringz("vkResetCommandPool"));	*(cast(void**)&vkResetDescriptorPool) = vkGetInstanceProcAddr(instance, toStringz("vkResetDescriptorPool"));	*(cast(void**)&vkResetEvent) = vkGetInstanceProcAddr(instance, toStringz("vkResetEvent"));	*(cast(void**)&vkResetFences) = vkGetInstanceProcAddr(instance, toStringz("vkResetFences"));	*(cast(void**)&vkResetQueryPool) = vkGetInstanceProcAddr(instance, toStringz("vkResetQueryPool"));	*(cast(void**)&vkResetQueryPoolEXT) = vkGetInstanceProcAddr(instance, toStringz("vkResetQueryPoolEXT"));	*(cast(void**)&vkSetDebugUtilsObjectNameEXT) = vkGetInstanceProcAddr(instance, toStringz("vkSetDebugUtilsObjectNameEXT"));	*(cast(void**)&vkSetDebugUtilsObjectTagEXT) = vkGetInstanceProcAddr(instance, toStringz("vkSetDebugUtilsObjectTagEXT"));	*(cast(void**)&vkSetDeviceMemoryPriorityEXT) = vkGetInstanceProcAddr(instance, toStringz("vkSetDeviceMemoryPriorityEXT"));	*(cast(void**)&vkSetEvent) = vkGetInstanceProcAddr(instance, toStringz("vkSetEvent"));	*(cast(void**)&vkSetHdrMetadataEXT) = vkGetInstanceProcAddr(instance, toStringz("vkSetHdrMetadataEXT"));	*(cast(void**)&vkSetLocalDimmingAMD) = vkGetInstanceProcAddr(instance, toStringz("vkSetLocalDimmingAMD"));	*(cast(void**)&vkSetPrivateData) = vkGetInstanceProcAddr(instance, toStringz("vkSetPrivateData"));	*(cast(void**)&vkSetPrivateDataEXT) = vkGetInstanceProcAddr(instance, toStringz("vkSetPrivateDataEXT"));	*(cast(void**)&vkSignalSemaphore) = vkGetInstanceProcAddr(instance, toStringz("vkSignalSemaphore"));	*(cast(void**)&vkSignalSemaphoreKHR) = vkGetInstanceProcAddr(instance, toStringz("vkSignalSemaphoreKHR"));	*(cast(void**)&vkSubmitDebugUtilsMessageEXT) = vkGetInstanceProcAddr(instance, toStringz("vkSubmitDebugUtilsMessageEXT"));	*(cast(void**)&vkTrimCommandPool) = vkGetInstanceProcAddr(instance, toStringz("vkTrimCommandPool"));	*(cast(void**)&vkTrimCommandPoolKHR) = vkGetInstanceProcAddr(instance, toStringz("vkTrimCommandPoolKHR"));	*(cast(void**)&vkUninitializePerformanceApiINTEL) = vkGetInstanceProcAddr(instance, toStringz("vkUninitializePerformanceApiINTEL"));	*(cast(void**)&vkUnmapMemory) = vkGetInstanceProcAddr(instance, toStringz("vkUnmapMemory"));	*(cast(void**)&vkUpdateDescriptorSetWithTemplate) = vkGetInstanceProcAddr(instance, toStringz("vkUpdateDescriptorSetWithTemplate"));	*(cast(void**)&vkUpdateDescriptorSetWithTemplateKHR) = vkGetInstanceProcAddr(instance, toStringz("vkUpdateDescriptorSetWithTemplateKHR"));	*(cast(void**)&vkUpdateDescriptorSets) = vkGetInstanceProcAddr(instance, toStringz("vkUpdateDescriptorSets"));	*(cast(void**)&vkWaitForFences) = vkGetInstanceProcAddr(instance, toStringz("vkWaitForFences"));	*(cast(void**)&vkWaitForPresentKHR) = vkGetInstanceProcAddr(instance, toStringz("vkWaitForPresentKHR"));	*(cast(void**)&vkWaitSemaphores) = vkGetInstanceProcAddr(instance, toStringz("vkWaitSemaphores"));	*(cast(void**)&vkWaitSemaphoresKHR) = vkGetInstanceProcAddr(instance, toStringz("vkWaitSemaphoresKHR"));	*(cast(void**)&vkWriteAccelerationStructuresPropertiesKHR) = vkGetInstanceProcAddr(instance, toStringz("vkWriteAccelerationStructuresPropertiesKHR"));}
// Aliases
alias BOOL = int;
alias DWORD = uint;
alias HANDLE = void*;
alias LPCWSTR = WCHAR*;
alias LPVOID = void*;
alias PFN_vkAllocationFunction = extern(Windows) void* function(void* pUserData, size_t size, size_t alignment, VkSystemAllocationScope allocationScope) nothrow;
alias PFN_vkDebugReportCallbackEXT = extern(Windows) VkBool32 function(VkDebugReportFlagsEXT flags, VkDebugReportObjectTypeEXT objectType, uint64_t object, size_t location, int32_t messageCode, immutable(char)* pLayerPrefix, immutable(char)* pMessage, void* pUserData) nothrow;
alias PFN_vkDebugUtilsMessengerCallbackEXT = extern(Windows) VkBool32 function(VkDebugUtilsMessageSeverityFlagBitsEXT messageSeverity, VkDebugUtilsMessageTypeFlagsEXT messageTypes, VkDebugUtilsMessengerCallbackDataEXT* pCallbackData, void* pUserData) nothrow;
alias PFN_vkDeviceMemoryReportCallbackEXT = extern(Windows) void function(VkDeviceMemoryReportCallbackDataEXT* pCallbackData, void* pUserData) nothrow;
alias PFN_vkFreeFunction = extern(Windows) void function(void* pUserData, void* pMemory) nothrow;
alias PFN_vkInternalAllocationNotification = extern(Windows) void function(void* pUserData, size_t size, VkInternalAllocationType allocationType, VkSystemAllocationScope allocationScope) nothrow;
alias PFN_vkInternalFreeNotification = extern(Windows) void function(void* pUserData, size_t size, VkInternalAllocationType allocationType, VkSystemAllocationScope allocationScope) nothrow;
alias PFN_vkReallocationFunction = extern(Windows) void* function(void* pUserData, void* pOriginal, size_t size, size_t alignment, VkSystemAllocationScope allocationScope) nothrow;
alias PFN_vkVoidFunction = extern(Windows) void function() nothrow;
struct SECURITY_ATTRIBUTES {
	DWORD nLength;
	LPVOID lpSecurityDescriptor;
	BOOL bInheritHandle;
}
alias VkAccelerationStructureCreateFlagsKHR = VkFlags;
alias VkAccelerationStructureKHR = VkAccelerationStructureKHR_T*;
alias VkAccelerationStructureMotionInfoFlagsNV = VkFlags;
alias VkAccelerationStructureMotionInstanceFlagsNV = VkFlags;
alias VkAccelerationStructureNV = VkAccelerationStructureNV_T*;
alias VkAccelerationStructureTypeNV = VkAccelerationStructureTypeKHR;
alias VkAccessFlags = VkFlags;
alias VkAccessFlags2 = VkFlags64;
alias VkAcquireProfilingLockFlagsKHR = VkFlags;
alias VkAttachmentDescriptionFlags = VkFlags;
alias VkBool32 = uint32_t;
alias VkBuffer = VkBuffer_T*;
alias VkBufferCreateFlags = VkFlags;
alias VkBufferUsageFlags = VkFlags;
alias VkBufferView = VkBufferView_T*;
alias VkBufferViewCreateFlags = VkFlags;
alias VkBuildAccelerationStructureFlagsKHR = VkFlags;
alias VkBuildAccelerationStructureFlagsNV = VkBuildAccelerationStructureFlagsKHR;
alias VkColorComponentFlags = VkFlags;
alias VkCommandBuffer = VkCommandBuffer_T*;
alias VkCommandBufferResetFlags = VkFlags;
alias VkCommandBufferUsageFlags = VkFlags;
alias VkCommandPool = VkCommandPool_T*;
alias VkCommandPoolCreateFlags = VkFlags;
alias VkCommandPoolResetFlags = VkFlags;
alias VkCommandPoolTrimFlags = VkFlags;
alias VkCompositeAlphaFlagsKHR = VkFlags;
alias VkConditionalRenderingFlagsEXT = VkFlags;
alias VkCuFunctionNVX = VkCuFunctionNVX_T*;
alias VkCuModuleNVX = VkCuModuleNVX_T*;
alias VkCullModeFlags = VkFlags;
alias VkDebugReportCallbackEXT = VkDebugReportCallbackEXT_T*;
alias VkDebugReportFlagsEXT = VkFlags;
alias VkDebugUtilsMessageSeverityFlagsEXT = VkFlags;
alias VkDebugUtilsMessageTypeFlagsEXT = VkFlags;
alias VkDebugUtilsMessengerCallbackDataFlagsEXT = VkFlags;
alias VkDebugUtilsMessengerCreateFlagsEXT = VkFlags;
alias VkDebugUtilsMessengerEXT = VkDebugUtilsMessengerEXT_T*;
alias VkDeferredOperationKHR = VkDeferredOperationKHR_T*;
alias VkDependencyFlags = VkFlags;
alias VkDescriptorBindingFlags = VkFlags;
alias VkDescriptorPool = VkDescriptorPool_T*;
alias VkDescriptorPoolCreateFlags = VkFlags;
alias VkDescriptorPoolResetFlags = VkFlags;
alias VkDescriptorSet = VkDescriptorSet_T*;
alias VkDescriptorSetLayout = VkDescriptorSetLayout_T*;
alias VkDescriptorSetLayoutCreateFlags = VkFlags;
alias VkDescriptorUpdateTemplate = VkDescriptorUpdateTemplate_T*;
alias VkDescriptorUpdateTemplateCreateFlags = VkFlags;
alias VkDevice = VkDevice_T*;
alias VkDeviceAddress = uint64_t;
alias VkDeviceCreateFlags = VkFlags;
alias VkDeviceDiagnosticsConfigFlagsNV = VkFlags;
alias VkDeviceGroupPresentModeFlagsKHR = VkFlags;
alias VkDeviceMemory = VkDeviceMemory_T*;
alias VkDeviceMemoryReportFlagsEXT = VkFlags;
alias VkDeviceQueueCreateFlags = VkFlags;
alias VkDeviceSize = uint64_t;
alias VkDisplayKHR = VkDisplayKHR_T*;
alias VkDisplayModeCreateFlagsKHR = VkFlags;
alias VkDisplayModeKHR = VkDisplayModeKHR_T*;
alias VkDisplayPlaneAlphaFlagsKHR = VkFlags;
alias VkDisplaySurfaceCreateFlagsKHR = VkFlags;
alias VkEvent = VkEvent_T*;
alias VkEventCreateFlags = VkFlags;
alias VkExternalFenceFeatureFlags = VkFlags;
alias VkExternalFenceHandleTypeFlags = VkFlags;
alias VkExternalMemoryFeatureFlags = VkFlags;
alias VkExternalMemoryFeatureFlagsNV = VkFlags;
alias VkExternalMemoryHandleTypeFlags = VkFlags;
alias VkExternalMemoryHandleTypeFlagsNV = VkFlags;
alias VkExternalSemaphoreFeatureFlags = VkFlags;
alias VkExternalSemaphoreHandleTypeFlags = VkFlags;
alias VkFence = VkFence_T*;
alias VkFenceCreateFlags = VkFlags;
alias VkFenceImportFlags = VkFlags;
alias VkFlags = uint32_t;
alias VkFlags64 = uint64_t;
alias VkFormatFeatureFlags = VkFlags;
alias VkFormatFeatureFlags2 = VkFlags64;
alias VkFramebuffer = VkFramebuffer_T*;
alias VkFramebufferCreateFlags = VkFlags;
alias VkGeometryFlagsKHR = VkFlags;
alias VkGeometryInstanceFlagsKHR = VkFlags;
alias VkGraphicsPipelineLibraryFlagsEXT = VkFlags;
alias VkHeadlessSurfaceCreateFlagsEXT = VkFlags;
alias VkImage = VkImage_T*;
alias VkImageAspectFlags = VkFlags;
alias VkImageCreateFlags = VkFlags;
alias VkImageUsageFlags = VkFlags;
alias VkImageView = VkImageView_T*;
alias VkImageViewCreateFlags = VkFlags;
alias VkIndirectCommandsLayoutNV = VkIndirectCommandsLayoutNV_T*;
alias VkIndirectCommandsLayoutUsageFlagsNV = VkFlags;
alias VkIndirectStateFlagsNV = VkFlags;
alias VkInstance = VkInstance_T*;
alias VkInstanceCreateFlags = VkFlags;
alias VkMemoryAllocateFlags = VkFlags;
alias VkMemoryHeapFlags = VkFlags;
alias VkMemoryMapFlags = VkFlags;
alias VkMemoryPropertyFlags = VkFlags;
alias VkMemoryRequirements2KHR = VkMemoryRequirements2;
alias VkPeerMemoryFeatureFlags = VkFlags;
alias VkPerformanceConfigurationINTEL = VkPerformanceConfigurationINTEL_T*;
alias VkPerformanceCounterDescriptionFlagsKHR = VkFlags;
alias VkPhysicalDevice = VkPhysicalDevice_T*;
alias VkPipeline = VkPipeline_T*;
alias VkPipelineCache = VkPipelineCache_T*;
alias VkPipelineCacheCreateFlags = VkFlags;
alias VkPipelineColorBlendStateCreateFlags = VkFlags;
alias VkPipelineCompilerControlFlagsAMD = VkFlags;
alias VkPipelineCoverageModulationStateCreateFlagsNV = VkFlags;
alias VkPipelineCoverageReductionStateCreateFlagsNV = VkFlags;
alias VkPipelineCoverageToColorStateCreateFlagsNV = VkFlags;
alias VkPipelineCreateFlags = VkFlags;
alias VkPipelineCreationFeedbackFlags = VkFlags;
alias VkPipelineDepthStencilStateCreateFlags = VkFlags;
alias VkPipelineDiscardRectangleStateCreateFlagsEXT = VkFlags;
alias VkPipelineDynamicStateCreateFlags = VkFlags;
alias VkPipelineInputAssemblyStateCreateFlags = VkFlags;
alias VkPipelineLayout = VkPipelineLayout_T*;
alias VkPipelineLayoutCreateFlags = VkFlags;
alias VkPipelineMultisampleStateCreateFlags = VkFlags;
alias VkPipelineRasterizationConservativeStateCreateFlagsEXT = VkFlags;
alias VkPipelineRasterizationDepthClipStateCreateFlagsEXT = VkFlags;
alias VkPipelineRasterizationStateCreateFlags = VkFlags;
alias VkPipelineRasterizationStateStreamCreateFlagsEXT = VkFlags;
alias VkPipelineShaderStageCreateFlags = VkFlags;
alias VkPipelineStageFlags = VkFlags;
alias VkPipelineStageFlags2 = VkFlags64;
alias VkPipelineTessellationStateCreateFlags = VkFlags;
alias VkPipelineVertexInputStateCreateFlags = VkFlags;
alias VkPipelineViewportStateCreateFlags = VkFlags;
alias VkPipelineViewportSwizzleStateCreateFlagsNV = VkFlags;
alias VkPrivateDataSlot = VkPrivateDataSlot_T*;
alias VkPrivateDataSlotCreateFlags = VkFlags;
alias VkQueryControlFlags = VkFlags;
alias VkQueryPipelineStatisticFlags = VkFlags;
alias VkQueryPool = VkQueryPool_T*;
alias VkQueryPoolCreateFlags = VkFlags;
alias VkQueryResultFlags = VkFlags;
alias VkQueue = VkQueue_T*;
alias VkQueueFlags = VkFlags;
alias VkRemoteAddressNV = void*;
alias VkRenderPass = VkRenderPass_T*;
alias VkRenderPassCreateFlags = VkFlags;
alias VkRenderingFlags = VkFlags;
alias VkResolveModeFlags = VkFlags;
alias VkSampleCountFlags = VkFlags;
alias VkSampleMask = uint32_t;
alias VkSampler = VkSampler_T*;
alias VkSamplerCreateFlags = VkFlags;
alias VkSamplerYcbcrConversion = VkSamplerYcbcrConversion_T*;
alias VkSemaphore = VkSemaphore_T*;
alias VkSemaphoreCreateFlags = VkFlags;
alias VkSemaphoreImportFlags = VkFlags;
alias VkSemaphoreWaitFlags = VkFlags;
alias VkShaderCorePropertiesFlagsAMD = VkFlags;
alias VkShaderModule = VkShaderModule_T*;
alias VkShaderModuleCreateFlags = VkFlags;
alias VkShaderStageFlags = VkFlags;
alias VkSparseImageFormatFlags = VkFlags;
alias VkSparseMemoryBindFlags = VkFlags;
alias VkStencilFaceFlags = VkFlags;
alias VkSubgroupFeatureFlags = VkFlags;
alias VkSubmitFlags = VkFlags;
alias VkSubpassDescriptionFlags = VkFlags;
alias VkSurfaceCounterFlagsEXT = VkFlags;
alias VkSurfaceKHR = VkSurfaceKHR_T*;
alias VkSurfaceTransformFlagsKHR = VkFlags;
alias VkSwapchainCreateFlagsKHR = VkFlags;
alias VkSwapchainKHR = VkSwapchainKHR_T*;
alias VkToolPurposeFlags = VkFlags;
alias VkValidationCacheCreateFlagsEXT = VkFlags;
alias VkValidationCacheEXT = VkValidationCacheEXT_T*;
alias VkWin32SurfaceCreateFlagsKHR = VkFlags;
alias WCHAR = wchar_t;
alias int32_t = int;
alias int64_t = long;
alias size_t = ulong;
alias uint16_t = ushort;
alias uint32_t = uint;
alias uint64_t = ulong;
alias uint8_t = ubyte;
alias wchar_t = ushort;
alias PFN_vkAcquireDrmDisplayEXT = extern(Windows) VkResult function(VkPhysicalDevice physicalDevice, int32_t drmFd, VkDisplayKHR display) nothrow;
alias PFN_vkAcquireFullScreenExclusiveModeEXT = extern(Windows) VkResult function(VkDevice device, VkSwapchainKHR swapchain) nothrow;
alias PFN_vkAcquireNextImage2KHR = extern(Windows) VkResult function(VkDevice device, VkAcquireNextImageInfoKHR* pAcquireInfo, uint32_t* pImageIndex) nothrow;
alias PFN_vkAcquireNextImageKHR = extern(Windows) VkResult function(VkDevice device, VkSwapchainKHR swapchain, uint64_t timeout, VkSemaphore semaphore, VkFence fence, uint32_t* pImageIndex) nothrow;
alias PFN_vkAcquirePerformanceConfigurationINTEL = extern(Windows) VkResult function(VkDevice device, VkPerformanceConfigurationAcquireInfoINTEL* pAcquireInfo, VkPerformanceConfigurationINTEL* pConfiguration) nothrow;
alias PFN_vkAcquireProfilingLockKHR = extern(Windows) VkResult function(VkDevice device, VkAcquireProfilingLockInfoKHR* pInfo) nothrow;
alias PFN_vkAcquireWinrtDisplayNV = extern(Windows) VkResult function(VkPhysicalDevice physicalDevice, VkDisplayKHR display) nothrow;
alias PFN_vkAllocateCommandBuffers = extern(Windows) VkResult function(VkDevice device, VkCommandBufferAllocateInfo* pAllocateInfo, VkCommandBuffer* pCommandBuffers) nothrow;
alias PFN_vkAllocateDescriptorSets = extern(Windows) VkResult function(VkDevice device, VkDescriptorSetAllocateInfo* pAllocateInfo, VkDescriptorSet* pDescriptorSets) nothrow;
alias PFN_vkAllocateMemory = extern(Windows) VkResult function(VkDevice device, VkMemoryAllocateInfo* pAllocateInfo, VkAllocationCallbacks* pAllocator, VkDeviceMemory* pMemory) nothrow;
alias PFN_vkBeginCommandBuffer = extern(Windows) VkResult function(VkCommandBuffer commandBuffer, VkCommandBufferBeginInfo* pBeginInfo) nothrow;
alias PFN_vkBindAccelerationStructureMemoryNV = extern(Windows) VkResult function(VkDevice device, uint32_t bindInfoCount, VkBindAccelerationStructureMemoryInfoNV* pBindInfos) nothrow;
alias PFN_vkBindBufferMemory = extern(Windows) VkResult function(VkDevice device, VkBuffer buffer, VkDeviceMemory memory, VkDeviceSize memoryOffset) nothrow;
alias PFN_vkBindBufferMemory2 = extern(Windows) VkResult function(VkDevice device, uint32_t bindInfoCount, VkBindBufferMemoryInfo* pBindInfos) nothrow;
alias PFN_vkBindBufferMemory2KHR = extern(Windows) VkResult function(VkDevice device, uint32_t bindInfoCount, VkBindBufferMemoryInfo* pBindInfos) nothrow;
alias PFN_vkBindImageMemory = extern(Windows) VkResult function(VkDevice device, VkImage image, VkDeviceMemory memory, VkDeviceSize memoryOffset) nothrow;
alias PFN_vkBindImageMemory2 = extern(Windows) VkResult function(VkDevice device, uint32_t bindInfoCount, VkBindImageMemoryInfo* pBindInfos) nothrow;
alias PFN_vkBindImageMemory2KHR = extern(Windows) VkResult function(VkDevice device, uint32_t bindInfoCount, VkBindImageMemoryInfo* pBindInfos) nothrow;
alias PFN_vkBuildAccelerationStructuresKHR = extern(Windows) VkResult function(VkDevice device, VkDeferredOperationKHR deferredOperation, uint32_t infoCount, VkAccelerationStructureBuildGeometryInfoKHR* pInfos, VkAccelerationStructureBuildRangeInfoKHR** ppBuildRangeInfos) nothrow;
alias PFN_vkCmdBeginConditionalRenderingEXT = extern(Windows) void function(VkCommandBuffer commandBuffer, VkConditionalRenderingBeginInfoEXT* pConditionalRenderingBegin) nothrow;
alias PFN_vkCmdBeginDebugUtilsLabelEXT = extern(Windows) void function(VkCommandBuffer commandBuffer, VkDebugUtilsLabelEXT* pLabelInfo) nothrow;
alias PFN_vkCmdBeginQuery = extern(Windows) void function(VkCommandBuffer commandBuffer, VkQueryPool queryPool, uint32_t query, VkQueryControlFlags flags) nothrow;
alias PFN_vkCmdBeginQueryIndexedEXT = extern(Windows) void function(VkCommandBuffer commandBuffer, VkQueryPool queryPool, uint32_t query, VkQueryControlFlags flags, uint32_t index) nothrow;
alias PFN_vkCmdBeginRenderPass = extern(Windows) void function(VkCommandBuffer commandBuffer, VkRenderPassBeginInfo* pRenderPassBegin, VkSubpassContents contents) nothrow;
alias PFN_vkCmdBeginRenderPass2 = extern(Windows) void function(VkCommandBuffer commandBuffer, VkRenderPassBeginInfo* pRenderPassBegin, VkSubpassBeginInfo* pSubpassBeginInfo) nothrow;
alias PFN_vkCmdBeginRenderPass2KHR = extern(Windows) void function(VkCommandBuffer commandBuffer, VkRenderPassBeginInfo* pRenderPassBegin, VkSubpassBeginInfo* pSubpassBeginInfo) nothrow;
alias PFN_vkCmdBeginRendering = extern(Windows) void function(VkCommandBuffer commandBuffer, VkRenderingInfo* pRenderingInfo) nothrow;
alias PFN_vkCmdBeginRenderingKHR = extern(Windows) void function(VkCommandBuffer commandBuffer, VkRenderingInfo* pRenderingInfo) nothrow;
alias PFN_vkCmdBeginTransformFeedbackEXT = extern(Windows) void function(VkCommandBuffer commandBuffer, uint32_t firstCounterBuffer, uint32_t counterBufferCount, VkBuffer* pCounterBuffers, VkDeviceSize* pCounterBufferOffsets) nothrow;
alias PFN_vkCmdBindDescriptorSets = extern(Windows) void function(VkCommandBuffer commandBuffer, VkPipelineBindPoint pipelineBindPoint, VkPipelineLayout layout, uint32_t firstSet, uint32_t descriptorSetCount, VkDescriptorSet* pDescriptorSets, uint32_t dynamicOffsetCount, uint32_t* pDynamicOffsets) nothrow;
alias PFN_vkCmdBindIndexBuffer = extern(Windows) void function(VkCommandBuffer commandBuffer, VkBuffer buffer, VkDeviceSize offset, VkIndexType indexType) nothrow;
alias PFN_vkCmdBindInvocationMaskHUAWEI = extern(Windows) void function(VkCommandBuffer commandBuffer, VkImageView imageView, VkImageLayout imageLayout) nothrow;
alias PFN_vkCmdBindPipeline = extern(Windows) void function(VkCommandBuffer commandBuffer, VkPipelineBindPoint pipelineBindPoint, VkPipeline pipeline) nothrow;
alias PFN_vkCmdBindPipelineShaderGroupNV = extern(Windows) void function(VkCommandBuffer commandBuffer, VkPipelineBindPoint pipelineBindPoint, VkPipeline pipeline, uint32_t groupIndex) nothrow;
alias PFN_vkCmdBindShadingRateImageNV = extern(Windows) void function(VkCommandBuffer commandBuffer, VkImageView imageView, VkImageLayout imageLayout) nothrow;
alias PFN_vkCmdBindTransformFeedbackBuffersEXT = extern(Windows) void function(VkCommandBuffer commandBuffer, uint32_t firstBinding, uint32_t bindingCount, VkBuffer* pBuffers, VkDeviceSize* pOffsets, VkDeviceSize* pSizes) nothrow;
alias PFN_vkCmdBindVertexBuffers = extern(Windows) void function(VkCommandBuffer commandBuffer, uint32_t firstBinding, uint32_t bindingCount, VkBuffer* pBuffers, VkDeviceSize* pOffsets) nothrow;
alias PFN_vkCmdBindVertexBuffers2 = extern(Windows) void function(VkCommandBuffer commandBuffer, uint32_t firstBinding, uint32_t bindingCount, VkBuffer* pBuffers, VkDeviceSize* pOffsets, VkDeviceSize* pSizes, VkDeviceSize* pStrides) nothrow;
alias PFN_vkCmdBindVertexBuffers2EXT = extern(Windows) void function(VkCommandBuffer commandBuffer, uint32_t firstBinding, uint32_t bindingCount, VkBuffer* pBuffers, VkDeviceSize* pOffsets, VkDeviceSize* pSizes, VkDeviceSize* pStrides) nothrow;
alias PFN_vkCmdBlitImage = extern(Windows) void function(VkCommandBuffer commandBuffer, VkImage srcImage, VkImageLayout srcImageLayout, VkImage dstImage, VkImageLayout dstImageLayout, uint32_t regionCount, VkImageBlit* pRegions, VkFilter filter) nothrow;
alias PFN_vkCmdBlitImage2 = extern(Windows) void function(VkCommandBuffer commandBuffer, VkBlitImageInfo2* pBlitImageInfo) nothrow;
alias PFN_vkCmdBlitImage2KHR = extern(Windows) void function(VkCommandBuffer commandBuffer, VkBlitImageInfo2* pBlitImageInfo) nothrow;
alias PFN_vkCmdBuildAccelerationStructureNV = extern(Windows) void function(VkCommandBuffer commandBuffer, VkAccelerationStructureInfoNV* pInfo, VkBuffer instanceData, VkDeviceSize instanceOffset, VkBool32 update, VkAccelerationStructureNV dst, VkAccelerationStructureNV src, VkBuffer scratch, VkDeviceSize scratchOffset) nothrow;
alias PFN_vkCmdBuildAccelerationStructuresIndirectKHR = extern(Windows) void function(VkCommandBuffer commandBuffer, uint32_t infoCount, VkAccelerationStructureBuildGeometryInfoKHR* pInfos, VkDeviceAddress* pIndirectDeviceAddresses, uint32_t* pIndirectStrides, uint32_t** ppMaxPrimitiveCounts) nothrow;
alias PFN_vkCmdBuildAccelerationStructuresKHR = extern(Windows) void function(VkCommandBuffer commandBuffer, uint32_t infoCount, VkAccelerationStructureBuildGeometryInfoKHR* pInfos, VkAccelerationStructureBuildRangeInfoKHR** ppBuildRangeInfos) nothrow;
alias PFN_vkCmdClearAttachments = extern(Windows) void function(VkCommandBuffer commandBuffer, uint32_t attachmentCount, VkClearAttachment* pAttachments, uint32_t rectCount, VkClearRect* pRects) nothrow;
alias PFN_vkCmdClearColorImage = extern(Windows) void function(VkCommandBuffer commandBuffer, VkImage image, VkImageLayout imageLayout, VkClearColorValue* pColor, uint32_t rangeCount, VkImageSubresourceRange* pRanges) nothrow;
alias PFN_vkCmdClearDepthStencilImage = extern(Windows) void function(VkCommandBuffer commandBuffer, VkImage image, VkImageLayout imageLayout, VkClearDepthStencilValue* pDepthStencil, uint32_t rangeCount, VkImageSubresourceRange* pRanges) nothrow;
alias PFN_vkCmdCopyAccelerationStructureKHR = extern(Windows) void function(VkCommandBuffer commandBuffer, VkCopyAccelerationStructureInfoKHR* pInfo) nothrow;
alias PFN_vkCmdCopyAccelerationStructureNV = extern(Windows) void function(VkCommandBuffer commandBuffer, VkAccelerationStructureNV dst, VkAccelerationStructureNV src, VkCopyAccelerationStructureModeKHR mode) nothrow;
alias PFN_vkCmdCopyAccelerationStructureToMemoryKHR = extern(Windows) void function(VkCommandBuffer commandBuffer, VkCopyAccelerationStructureToMemoryInfoKHR* pInfo) nothrow;
alias PFN_vkCmdCopyBuffer = extern(Windows) void function(VkCommandBuffer commandBuffer, VkBuffer srcBuffer, VkBuffer dstBuffer, uint32_t regionCount, VkBufferCopy* pRegions) nothrow;
alias PFN_vkCmdCopyBuffer2 = extern(Windows) void function(VkCommandBuffer commandBuffer, VkCopyBufferInfo2* pCopyBufferInfo) nothrow;
alias PFN_vkCmdCopyBuffer2KHR = extern(Windows) void function(VkCommandBuffer commandBuffer, VkCopyBufferInfo2* pCopyBufferInfo) nothrow;
alias PFN_vkCmdCopyBufferToImage = extern(Windows) void function(VkCommandBuffer commandBuffer, VkBuffer srcBuffer, VkImage dstImage, VkImageLayout dstImageLayout, uint32_t regionCount, VkBufferImageCopy* pRegions) nothrow;
alias PFN_vkCmdCopyBufferToImage2 = extern(Windows) void function(VkCommandBuffer commandBuffer, VkCopyBufferToImageInfo2* pCopyBufferToImageInfo) nothrow;
alias PFN_vkCmdCopyBufferToImage2KHR = extern(Windows) void function(VkCommandBuffer commandBuffer, VkCopyBufferToImageInfo2* pCopyBufferToImageInfo) nothrow;
alias PFN_vkCmdCopyImage = extern(Windows) void function(VkCommandBuffer commandBuffer, VkImage srcImage, VkImageLayout srcImageLayout, VkImage dstImage, VkImageLayout dstImageLayout, uint32_t regionCount, VkImageCopy* pRegions) nothrow;
alias PFN_vkCmdCopyImage2 = extern(Windows) void function(VkCommandBuffer commandBuffer, VkCopyImageInfo2* pCopyImageInfo) nothrow;
alias PFN_vkCmdCopyImage2KHR = extern(Windows) void function(VkCommandBuffer commandBuffer, VkCopyImageInfo2* pCopyImageInfo) nothrow;
alias PFN_vkCmdCopyImageToBuffer = extern(Windows) void function(VkCommandBuffer commandBuffer, VkImage srcImage, VkImageLayout srcImageLayout, VkBuffer dstBuffer, uint32_t regionCount, VkBufferImageCopy* pRegions) nothrow;
alias PFN_vkCmdCopyImageToBuffer2 = extern(Windows) void function(VkCommandBuffer commandBuffer, VkCopyImageToBufferInfo2* pCopyImageToBufferInfo) nothrow;
alias PFN_vkCmdCopyImageToBuffer2KHR = extern(Windows) void function(VkCommandBuffer commandBuffer, VkCopyImageToBufferInfo2* pCopyImageToBufferInfo) nothrow;
alias PFN_vkCmdCopyMemoryToAccelerationStructureKHR = extern(Windows) void function(VkCommandBuffer commandBuffer, VkCopyMemoryToAccelerationStructureInfoKHR* pInfo) nothrow;
alias PFN_vkCmdCopyQueryPoolResults = extern(Windows) void function(VkCommandBuffer commandBuffer, VkQueryPool queryPool, uint32_t firstQuery, uint32_t queryCount, VkBuffer dstBuffer, VkDeviceSize dstOffset, VkDeviceSize stride, VkQueryResultFlags flags) nothrow;
alias PFN_vkCmdCuLaunchKernelNVX = extern(Windows) void function(VkCommandBuffer commandBuffer, VkCuLaunchInfoNVX* pLaunchInfo) nothrow;
alias PFN_vkCmdDebugMarkerBeginEXT = extern(Windows) void function(VkCommandBuffer commandBuffer, VkDebugMarkerMarkerInfoEXT* pMarkerInfo) nothrow;
alias PFN_vkCmdDebugMarkerEndEXT = extern(Windows) void function(VkCommandBuffer commandBuffer) nothrow;
alias PFN_vkCmdDebugMarkerInsertEXT = extern(Windows) void function(VkCommandBuffer commandBuffer, VkDebugMarkerMarkerInfoEXT* pMarkerInfo) nothrow;
alias PFN_vkCmdDispatch = extern(Windows) void function(VkCommandBuffer commandBuffer, uint32_t groupCountX, uint32_t groupCountY, uint32_t groupCountZ) nothrow;
alias PFN_vkCmdDispatchBase = extern(Windows) void function(VkCommandBuffer commandBuffer, uint32_t baseGroupX, uint32_t baseGroupY, uint32_t baseGroupZ, uint32_t groupCountX, uint32_t groupCountY, uint32_t groupCountZ) nothrow;
alias PFN_vkCmdDispatchBaseKHR = extern(Windows) void function(VkCommandBuffer commandBuffer, uint32_t baseGroupX, uint32_t baseGroupY, uint32_t baseGroupZ, uint32_t groupCountX, uint32_t groupCountY, uint32_t groupCountZ) nothrow;
alias PFN_vkCmdDispatchIndirect = extern(Windows) void function(VkCommandBuffer commandBuffer, VkBuffer buffer, VkDeviceSize offset) nothrow;
alias PFN_vkCmdDraw = extern(Windows) void function(VkCommandBuffer commandBuffer, uint32_t vertexCount, uint32_t instanceCount, uint32_t firstVertex, uint32_t firstInstance) nothrow;
alias PFN_vkCmdDrawIndexed = extern(Windows) void function(VkCommandBuffer commandBuffer, uint32_t indexCount, uint32_t instanceCount, uint32_t firstIndex, int32_t vertexOffset, uint32_t firstInstance) nothrow;
alias PFN_vkCmdDrawIndexedIndirect = extern(Windows) void function(VkCommandBuffer commandBuffer, VkBuffer buffer, VkDeviceSize offset, uint32_t drawCount, uint32_t stride) nothrow;
alias PFN_vkCmdDrawIndexedIndirectCount = extern(Windows) void function(VkCommandBuffer commandBuffer, VkBuffer buffer, VkDeviceSize offset, VkBuffer countBuffer, VkDeviceSize countBufferOffset, uint32_t maxDrawCount, uint32_t stride) nothrow;
alias PFN_vkCmdDrawIndexedIndirectCountAMD = extern(Windows) void function(VkCommandBuffer commandBuffer, VkBuffer buffer, VkDeviceSize offset, VkBuffer countBuffer, VkDeviceSize countBufferOffset, uint32_t maxDrawCount, uint32_t stride) nothrow;
alias PFN_vkCmdDrawIndexedIndirectCountKHR = extern(Windows) void function(VkCommandBuffer commandBuffer, VkBuffer buffer, VkDeviceSize offset, VkBuffer countBuffer, VkDeviceSize countBufferOffset, uint32_t maxDrawCount, uint32_t stride) nothrow;
alias PFN_vkCmdDrawIndirect = extern(Windows) void function(VkCommandBuffer commandBuffer, VkBuffer buffer, VkDeviceSize offset, uint32_t drawCount, uint32_t stride) nothrow;
alias PFN_vkCmdDrawIndirectByteCountEXT = extern(Windows) void function(VkCommandBuffer commandBuffer, uint32_t instanceCount, uint32_t firstInstance, VkBuffer counterBuffer, VkDeviceSize counterBufferOffset, uint32_t counterOffset, uint32_t vertexStride) nothrow;
alias PFN_vkCmdDrawIndirectCount = extern(Windows) void function(VkCommandBuffer commandBuffer, VkBuffer buffer, VkDeviceSize offset, VkBuffer countBuffer, VkDeviceSize countBufferOffset, uint32_t maxDrawCount, uint32_t stride) nothrow;
alias PFN_vkCmdDrawIndirectCountAMD = extern(Windows) void function(VkCommandBuffer commandBuffer, VkBuffer buffer, VkDeviceSize offset, VkBuffer countBuffer, VkDeviceSize countBufferOffset, uint32_t maxDrawCount, uint32_t stride) nothrow;
alias PFN_vkCmdDrawIndirectCountKHR = extern(Windows) void function(VkCommandBuffer commandBuffer, VkBuffer buffer, VkDeviceSize offset, VkBuffer countBuffer, VkDeviceSize countBufferOffset, uint32_t maxDrawCount, uint32_t stride) nothrow;
alias PFN_vkCmdDrawMeshTasksIndirectCountNV = extern(Windows) void function(VkCommandBuffer commandBuffer, VkBuffer buffer, VkDeviceSize offset, VkBuffer countBuffer, VkDeviceSize countBufferOffset, uint32_t maxDrawCount, uint32_t stride) nothrow;
alias PFN_vkCmdDrawMeshTasksIndirectNV = extern(Windows) void function(VkCommandBuffer commandBuffer, VkBuffer buffer, VkDeviceSize offset, uint32_t drawCount, uint32_t stride) nothrow;
alias PFN_vkCmdDrawMeshTasksNV = extern(Windows) void function(VkCommandBuffer commandBuffer, uint32_t taskCount, uint32_t firstTask) nothrow;
alias PFN_vkCmdDrawMultiEXT = extern(Windows) void function(VkCommandBuffer commandBuffer, uint32_t drawCount, VkMultiDrawInfoEXT* pVertexInfo, uint32_t instanceCount, uint32_t firstInstance, uint32_t stride) nothrow;
alias PFN_vkCmdDrawMultiIndexedEXT = extern(Windows) void function(VkCommandBuffer commandBuffer, uint32_t drawCount, VkMultiDrawIndexedInfoEXT* pIndexInfo, uint32_t instanceCount, uint32_t firstInstance, uint32_t stride, int32_t* pVertexOffset) nothrow;
alias PFN_vkCmdEndConditionalRenderingEXT = extern(Windows) void function(VkCommandBuffer commandBuffer) nothrow;
alias PFN_vkCmdEndDebugUtilsLabelEXT = extern(Windows) void function(VkCommandBuffer commandBuffer) nothrow;
alias PFN_vkCmdEndQuery = extern(Windows) void function(VkCommandBuffer commandBuffer, VkQueryPool queryPool, uint32_t query) nothrow;
alias PFN_vkCmdEndQueryIndexedEXT = extern(Windows) void function(VkCommandBuffer commandBuffer, VkQueryPool queryPool, uint32_t query, uint32_t index) nothrow;
alias PFN_vkCmdEndRenderPass = extern(Windows) void function(VkCommandBuffer commandBuffer) nothrow;
alias PFN_vkCmdEndRenderPass2 = extern(Windows) void function(VkCommandBuffer commandBuffer, VkSubpassEndInfo* pSubpassEndInfo) nothrow;
alias PFN_vkCmdEndRenderPass2KHR = extern(Windows) void function(VkCommandBuffer commandBuffer, VkSubpassEndInfo* pSubpassEndInfo) nothrow;
alias PFN_vkCmdEndRendering = extern(Windows) void function(VkCommandBuffer commandBuffer) nothrow;
alias PFN_vkCmdEndRenderingKHR = extern(Windows) void function(VkCommandBuffer commandBuffer) nothrow;
alias PFN_vkCmdEndTransformFeedbackEXT = extern(Windows) void function(VkCommandBuffer commandBuffer, uint32_t firstCounterBuffer, uint32_t counterBufferCount, VkBuffer* pCounterBuffers, VkDeviceSize* pCounterBufferOffsets) nothrow;
alias PFN_vkCmdExecuteCommands = extern(Windows) void function(VkCommandBuffer commandBuffer, uint32_t commandBufferCount, VkCommandBuffer* pCommandBuffers) nothrow;
alias PFN_vkCmdExecuteGeneratedCommandsNV = extern(Windows) void function(VkCommandBuffer commandBuffer, VkBool32 isPreprocessed, VkGeneratedCommandsInfoNV* pGeneratedCommandsInfo) nothrow;
alias PFN_vkCmdFillBuffer = extern(Windows) void function(VkCommandBuffer commandBuffer, VkBuffer dstBuffer, VkDeviceSize dstOffset, VkDeviceSize size, uint32_t data) nothrow;
alias PFN_vkCmdInsertDebugUtilsLabelEXT = extern(Windows) void function(VkCommandBuffer commandBuffer, VkDebugUtilsLabelEXT* pLabelInfo) nothrow;
alias PFN_vkCmdNextSubpass = extern(Windows) void function(VkCommandBuffer commandBuffer, VkSubpassContents contents) nothrow;
alias PFN_vkCmdNextSubpass2 = extern(Windows) void function(VkCommandBuffer commandBuffer, VkSubpassBeginInfo* pSubpassBeginInfo, VkSubpassEndInfo* pSubpassEndInfo) nothrow;
alias PFN_vkCmdNextSubpass2KHR = extern(Windows) void function(VkCommandBuffer commandBuffer, VkSubpassBeginInfo* pSubpassBeginInfo, VkSubpassEndInfo* pSubpassEndInfo) nothrow;
alias PFN_vkCmdPipelineBarrier = extern(Windows) void function(VkCommandBuffer commandBuffer, VkPipelineStageFlags srcStageMask, VkPipelineStageFlags dstStageMask, VkDependencyFlags dependencyFlags, uint32_t memoryBarrierCount, VkMemoryBarrier* pMemoryBarriers, uint32_t bufferMemoryBarrierCount, VkBufferMemoryBarrier* pBufferMemoryBarriers, uint32_t imageMemoryBarrierCount, VkImageMemoryBarrier* pImageMemoryBarriers) nothrow;
alias PFN_vkCmdPipelineBarrier2 = extern(Windows) void function(VkCommandBuffer commandBuffer, VkDependencyInfo* pDependencyInfo) nothrow;
alias PFN_vkCmdPipelineBarrier2KHR = extern(Windows) void function(VkCommandBuffer commandBuffer, VkDependencyInfo* pDependencyInfo) nothrow;
alias PFN_vkCmdPreprocessGeneratedCommandsNV = extern(Windows) void function(VkCommandBuffer commandBuffer, VkGeneratedCommandsInfoNV* pGeneratedCommandsInfo) nothrow;
alias PFN_vkCmdPushConstants = extern(Windows) void function(VkCommandBuffer commandBuffer, VkPipelineLayout layout, VkShaderStageFlags stageFlags, uint32_t offset, uint32_t size, void* pValues) nothrow;
alias PFN_vkCmdPushDescriptorSetKHR = extern(Windows) void function(VkCommandBuffer commandBuffer, VkPipelineBindPoint pipelineBindPoint, VkPipelineLayout layout, uint32_t set, uint32_t descriptorWriteCount, VkWriteDescriptorSet* pDescriptorWrites) nothrow;
alias PFN_vkCmdPushDescriptorSetWithTemplateKHR = extern(Windows) void function(VkCommandBuffer commandBuffer, VkDescriptorUpdateTemplate descriptorUpdateTemplate, VkPipelineLayout layout, uint32_t set, void* pData) nothrow;
alias PFN_vkCmdResetEvent = extern(Windows) void function(VkCommandBuffer commandBuffer, VkEvent event, VkPipelineStageFlags stageMask) nothrow;
alias PFN_vkCmdResetEvent2 = extern(Windows) void function(VkCommandBuffer commandBuffer, VkEvent event, VkPipelineStageFlags2 stageMask) nothrow;
alias PFN_vkCmdResetEvent2KHR = extern(Windows) void function(VkCommandBuffer commandBuffer, VkEvent event, VkPipelineStageFlags2 stageMask) nothrow;
alias PFN_vkCmdResetQueryPool = extern(Windows) void function(VkCommandBuffer commandBuffer, VkQueryPool queryPool, uint32_t firstQuery, uint32_t queryCount) nothrow;
alias PFN_vkCmdResolveImage = extern(Windows) void function(VkCommandBuffer commandBuffer, VkImage srcImage, VkImageLayout srcImageLayout, VkImage dstImage, VkImageLayout dstImageLayout, uint32_t regionCount, VkImageResolve* pRegions) nothrow;
alias PFN_vkCmdResolveImage2 = extern(Windows) void function(VkCommandBuffer commandBuffer, VkResolveImageInfo2* pResolveImageInfo) nothrow;
alias PFN_vkCmdResolveImage2KHR = extern(Windows) void function(VkCommandBuffer commandBuffer, VkResolveImageInfo2* pResolveImageInfo) nothrow;
alias PFN_vkCmdSetBlendConstants = extern(Windows) void function(VkCommandBuffer commandBuffer, float[4] blendConstants) nothrow;
alias PFN_vkCmdSetCheckpointNV = extern(Windows) void function(VkCommandBuffer commandBuffer, void* pCheckpointMarker) nothrow;
alias PFN_vkCmdSetCoarseSampleOrderNV = extern(Windows) void function(VkCommandBuffer commandBuffer, VkCoarseSampleOrderTypeNV sampleOrderType, uint32_t customSampleOrderCount, VkCoarseSampleOrderCustomNV* pCustomSampleOrders) nothrow;
alias PFN_vkCmdSetColorWriteEnableEXT = extern(Windows) void function(VkCommandBuffer commandBuffer, uint32_t attachmentCount, VkBool32* pColorWriteEnables) nothrow;
alias PFN_vkCmdSetCullMode = extern(Windows) void function(VkCommandBuffer commandBuffer, VkCullModeFlags cullMode) nothrow;
alias PFN_vkCmdSetCullModeEXT = extern(Windows) void function(VkCommandBuffer commandBuffer, VkCullModeFlags cullMode) nothrow;
alias PFN_vkCmdSetDepthBias = extern(Windows) void function(VkCommandBuffer commandBuffer, float depthBiasConstantFactor, float depthBiasClamp, float depthBiasSlopeFactor) nothrow;
alias PFN_vkCmdSetDepthBiasEnable = extern(Windows) void function(VkCommandBuffer commandBuffer, VkBool32 depthBiasEnable) nothrow;
alias PFN_vkCmdSetDepthBiasEnableEXT = extern(Windows) void function(VkCommandBuffer commandBuffer, VkBool32 depthBiasEnable) nothrow;
alias PFN_vkCmdSetDepthBounds = extern(Windows) void function(VkCommandBuffer commandBuffer, float minDepthBounds, float maxDepthBounds) nothrow;
alias PFN_vkCmdSetDepthBoundsTestEnable = extern(Windows) void function(VkCommandBuffer commandBuffer, VkBool32 depthBoundsTestEnable) nothrow;
alias PFN_vkCmdSetDepthBoundsTestEnableEXT = extern(Windows) void function(VkCommandBuffer commandBuffer, VkBool32 depthBoundsTestEnable) nothrow;
alias PFN_vkCmdSetDepthCompareOp = extern(Windows) void function(VkCommandBuffer commandBuffer, VkCompareOp depthCompareOp) nothrow;
alias PFN_vkCmdSetDepthCompareOpEXT = extern(Windows) void function(VkCommandBuffer commandBuffer, VkCompareOp depthCompareOp) nothrow;
alias PFN_vkCmdSetDepthTestEnable = extern(Windows) void function(VkCommandBuffer commandBuffer, VkBool32 depthTestEnable) nothrow;
alias PFN_vkCmdSetDepthTestEnableEXT = extern(Windows) void function(VkCommandBuffer commandBuffer, VkBool32 depthTestEnable) nothrow;
alias PFN_vkCmdSetDepthWriteEnable = extern(Windows) void function(VkCommandBuffer commandBuffer, VkBool32 depthWriteEnable) nothrow;
alias PFN_vkCmdSetDepthWriteEnableEXT = extern(Windows) void function(VkCommandBuffer commandBuffer, VkBool32 depthWriteEnable) nothrow;
alias PFN_vkCmdSetDeviceMask = extern(Windows) void function(VkCommandBuffer commandBuffer, uint32_t deviceMask) nothrow;
alias PFN_vkCmdSetDeviceMaskKHR = extern(Windows) void function(VkCommandBuffer commandBuffer, uint32_t deviceMask) nothrow;
alias PFN_vkCmdSetDiscardRectangleEXT = extern(Windows) void function(VkCommandBuffer commandBuffer, uint32_t firstDiscardRectangle, uint32_t discardRectangleCount, VkRect2D* pDiscardRectangles) nothrow;
alias PFN_vkCmdSetEvent = extern(Windows) void function(VkCommandBuffer commandBuffer, VkEvent event, VkPipelineStageFlags stageMask) nothrow;
alias PFN_vkCmdSetEvent2 = extern(Windows) void function(VkCommandBuffer commandBuffer, VkEvent event, VkDependencyInfo* pDependencyInfo) nothrow;
alias PFN_vkCmdSetEvent2KHR = extern(Windows) void function(VkCommandBuffer commandBuffer, VkEvent event, VkDependencyInfo* pDependencyInfo) nothrow;
alias PFN_vkCmdSetExclusiveScissorNV = extern(Windows) void function(VkCommandBuffer commandBuffer, uint32_t firstExclusiveScissor, uint32_t exclusiveScissorCount, VkRect2D* pExclusiveScissors) nothrow;
alias PFN_vkCmdSetFragmentShadingRateEnumNV = extern(Windows) void function(VkCommandBuffer commandBuffer, VkFragmentShadingRateNV shadingRate, VkFragmentShadingRateCombinerOpKHR[2] combinerOps) nothrow;
alias PFN_vkCmdSetFragmentShadingRateKHR = extern(Windows) void function(VkCommandBuffer commandBuffer, VkExtent2D* pFragmentSize, VkFragmentShadingRateCombinerOpKHR[2] combinerOps) nothrow;
alias PFN_vkCmdSetFrontFace = extern(Windows) void function(VkCommandBuffer commandBuffer, VkFrontFace frontFace) nothrow;
alias PFN_vkCmdSetFrontFaceEXT = extern(Windows) void function(VkCommandBuffer commandBuffer, VkFrontFace frontFace) nothrow;
alias PFN_vkCmdSetLineStippleEXT = extern(Windows) void function(VkCommandBuffer commandBuffer, uint32_t lineStippleFactor, uint16_t lineStipplePattern) nothrow;
alias PFN_vkCmdSetLineWidth = extern(Windows) void function(VkCommandBuffer commandBuffer, float lineWidth) nothrow;
alias PFN_vkCmdSetLogicOpEXT = extern(Windows) void function(VkCommandBuffer commandBuffer, VkLogicOp logicOp) nothrow;
alias PFN_vkCmdSetPatchControlPointsEXT = extern(Windows) void function(VkCommandBuffer commandBuffer, uint32_t patchControlPoints) nothrow;
alias PFN_vkCmdSetPerformanceMarkerINTEL = extern(Windows) VkResult function(VkCommandBuffer commandBuffer, VkPerformanceMarkerInfoINTEL* pMarkerInfo) nothrow;
alias PFN_vkCmdSetPerformanceOverrideINTEL = extern(Windows) VkResult function(VkCommandBuffer commandBuffer, VkPerformanceOverrideInfoINTEL* pOverrideInfo) nothrow;
alias PFN_vkCmdSetPerformanceStreamMarkerINTEL = extern(Windows) VkResult function(VkCommandBuffer commandBuffer, VkPerformanceStreamMarkerInfoINTEL* pMarkerInfo) nothrow;
alias PFN_vkCmdSetPrimitiveRestartEnable = extern(Windows) void function(VkCommandBuffer commandBuffer, VkBool32 primitiveRestartEnable) nothrow;
alias PFN_vkCmdSetPrimitiveRestartEnableEXT = extern(Windows) void function(VkCommandBuffer commandBuffer, VkBool32 primitiveRestartEnable) nothrow;
alias PFN_vkCmdSetPrimitiveTopology = extern(Windows) void function(VkCommandBuffer commandBuffer, VkPrimitiveTopology primitiveTopology) nothrow;
alias PFN_vkCmdSetPrimitiveTopologyEXT = extern(Windows) void function(VkCommandBuffer commandBuffer, VkPrimitiveTopology primitiveTopology) nothrow;
alias PFN_vkCmdSetRasterizerDiscardEnable = extern(Windows) void function(VkCommandBuffer commandBuffer, VkBool32 rasterizerDiscardEnable) nothrow;
alias PFN_vkCmdSetRasterizerDiscardEnableEXT = extern(Windows) void function(VkCommandBuffer commandBuffer, VkBool32 rasterizerDiscardEnable) nothrow;
alias PFN_vkCmdSetRayTracingPipelineStackSizeKHR = extern(Windows) void function(VkCommandBuffer commandBuffer, uint32_t pipelineStackSize) nothrow;
alias PFN_vkCmdSetSampleLocationsEXT = extern(Windows) void function(VkCommandBuffer commandBuffer, VkSampleLocationsInfoEXT* pSampleLocationsInfo) nothrow;
alias PFN_vkCmdSetScissor = extern(Windows) void function(VkCommandBuffer commandBuffer, uint32_t firstScissor, uint32_t scissorCount, VkRect2D* pScissors) nothrow;
alias PFN_vkCmdSetScissorWithCount = extern(Windows) void function(VkCommandBuffer commandBuffer, uint32_t scissorCount, VkRect2D* pScissors) nothrow;
alias PFN_vkCmdSetScissorWithCountEXT = extern(Windows) void function(VkCommandBuffer commandBuffer, uint32_t scissorCount, VkRect2D* pScissors) nothrow;
alias PFN_vkCmdSetStencilCompareMask = extern(Windows) void function(VkCommandBuffer commandBuffer, VkStencilFaceFlags faceMask, uint32_t compareMask) nothrow;
alias PFN_vkCmdSetStencilOp = extern(Windows) void function(VkCommandBuffer commandBuffer, VkStencilFaceFlags faceMask, VkStencilOp failOp, VkStencilOp passOp, VkStencilOp depthFailOp, VkCompareOp compareOp) nothrow;
alias PFN_vkCmdSetStencilOpEXT = extern(Windows) void function(VkCommandBuffer commandBuffer, VkStencilFaceFlags faceMask, VkStencilOp failOp, VkStencilOp passOp, VkStencilOp depthFailOp, VkCompareOp compareOp) nothrow;
alias PFN_vkCmdSetStencilReference = extern(Windows) void function(VkCommandBuffer commandBuffer, VkStencilFaceFlags faceMask, uint32_t reference) nothrow;
alias PFN_vkCmdSetStencilTestEnable = extern(Windows) void function(VkCommandBuffer commandBuffer, VkBool32 stencilTestEnable) nothrow;
alias PFN_vkCmdSetStencilTestEnableEXT = extern(Windows) void function(VkCommandBuffer commandBuffer, VkBool32 stencilTestEnable) nothrow;
alias PFN_vkCmdSetStencilWriteMask = extern(Windows) void function(VkCommandBuffer commandBuffer, VkStencilFaceFlags faceMask, uint32_t writeMask) nothrow;
alias PFN_vkCmdSetVertexInputEXT = extern(Windows) void function(VkCommandBuffer commandBuffer, uint32_t vertexBindingDescriptionCount, VkVertexInputBindingDescription2EXT* pVertexBindingDescriptions, uint32_t vertexAttributeDescriptionCount, VkVertexInputAttributeDescription2EXT* pVertexAttributeDescriptions) nothrow;
alias PFN_vkCmdSetViewport = extern(Windows) void function(VkCommandBuffer commandBuffer, uint32_t firstViewport, uint32_t viewportCount, VkViewport* pViewports) nothrow;
alias PFN_vkCmdSetViewportShadingRatePaletteNV = extern(Windows) void function(VkCommandBuffer commandBuffer, uint32_t firstViewport, uint32_t viewportCount, VkShadingRatePaletteNV* pShadingRatePalettes) nothrow;
alias PFN_vkCmdSetViewportWScalingNV = extern(Windows) void function(VkCommandBuffer commandBuffer, uint32_t firstViewport, uint32_t viewportCount, VkViewportWScalingNV* pViewportWScalings) nothrow;
alias PFN_vkCmdSetViewportWithCount = extern(Windows) void function(VkCommandBuffer commandBuffer, uint32_t viewportCount, VkViewport* pViewports) nothrow;
alias PFN_vkCmdSetViewportWithCountEXT = extern(Windows) void function(VkCommandBuffer commandBuffer, uint32_t viewportCount, VkViewport* pViewports) nothrow;
alias PFN_vkCmdSubpassShadingHUAWEI = extern(Windows) void function(VkCommandBuffer commandBuffer) nothrow;
alias PFN_vkCmdTraceRaysIndirectKHR = extern(Windows) void function(VkCommandBuffer commandBuffer, VkStridedDeviceAddressRegionKHR* pRaygenShaderBindingTable, VkStridedDeviceAddressRegionKHR* pMissShaderBindingTable, VkStridedDeviceAddressRegionKHR* pHitShaderBindingTable, VkStridedDeviceAddressRegionKHR* pCallableShaderBindingTable, VkDeviceAddress indirectDeviceAddress) nothrow;
alias PFN_vkCmdTraceRaysKHR = extern(Windows) void function(VkCommandBuffer commandBuffer, VkStridedDeviceAddressRegionKHR* pRaygenShaderBindingTable, VkStridedDeviceAddressRegionKHR* pMissShaderBindingTable, VkStridedDeviceAddressRegionKHR* pHitShaderBindingTable, VkStridedDeviceAddressRegionKHR* pCallableShaderBindingTable, uint32_t width, uint32_t height, uint32_t depth) nothrow;
alias PFN_vkCmdTraceRaysNV = extern(Windows) void function(VkCommandBuffer commandBuffer, VkBuffer raygenShaderBindingTableBuffer, VkDeviceSize raygenShaderBindingOffset, VkBuffer missShaderBindingTableBuffer, VkDeviceSize missShaderBindingOffset, VkDeviceSize missShaderBindingStride, VkBuffer hitShaderBindingTableBuffer, VkDeviceSize hitShaderBindingOffset, VkDeviceSize hitShaderBindingStride, VkBuffer callableShaderBindingTableBuffer, VkDeviceSize callableShaderBindingOffset, VkDeviceSize callableShaderBindingStride, uint32_t width, uint32_t height, uint32_t depth) nothrow;
alias PFN_vkCmdUpdateBuffer = extern(Windows) void function(VkCommandBuffer commandBuffer, VkBuffer dstBuffer, VkDeviceSize dstOffset, VkDeviceSize dataSize, void* pData) nothrow;
alias PFN_vkCmdWaitEvents = extern(Windows) void function(VkCommandBuffer commandBuffer, uint32_t eventCount, VkEvent* pEvents, VkPipelineStageFlags srcStageMask, VkPipelineStageFlags dstStageMask, uint32_t memoryBarrierCount, VkMemoryBarrier* pMemoryBarriers, uint32_t bufferMemoryBarrierCount, VkBufferMemoryBarrier* pBufferMemoryBarriers, uint32_t imageMemoryBarrierCount, VkImageMemoryBarrier* pImageMemoryBarriers) nothrow;
alias PFN_vkCmdWaitEvents2 = extern(Windows) void function(VkCommandBuffer commandBuffer, uint32_t eventCount, VkEvent* pEvents, VkDependencyInfo* pDependencyInfos) nothrow;
alias PFN_vkCmdWaitEvents2KHR = extern(Windows) void function(VkCommandBuffer commandBuffer, uint32_t eventCount, VkEvent* pEvents, VkDependencyInfo* pDependencyInfos) nothrow;
alias PFN_vkCmdWriteAccelerationStructuresPropertiesKHR = extern(Windows) void function(VkCommandBuffer commandBuffer, uint32_t accelerationStructureCount, VkAccelerationStructureKHR* pAccelerationStructures, VkQueryType queryType, VkQueryPool queryPool, uint32_t firstQuery) nothrow;
alias PFN_vkCmdWriteAccelerationStructuresPropertiesNV = extern(Windows) void function(VkCommandBuffer commandBuffer, uint32_t accelerationStructureCount, VkAccelerationStructureNV* pAccelerationStructures, VkQueryType queryType, VkQueryPool queryPool, uint32_t firstQuery) nothrow;
alias PFN_vkCmdWriteBufferMarker2AMD = extern(Windows) void function(VkCommandBuffer commandBuffer, VkPipelineStageFlags2 stage, VkBuffer dstBuffer, VkDeviceSize dstOffset, uint32_t marker) nothrow;
alias PFN_vkCmdWriteBufferMarkerAMD = extern(Windows) void function(VkCommandBuffer commandBuffer, VkPipelineStageFlagBits pipelineStage, VkBuffer dstBuffer, VkDeviceSize dstOffset, uint32_t marker) nothrow;
alias PFN_vkCmdWriteTimestamp = extern(Windows) void function(VkCommandBuffer commandBuffer, VkPipelineStageFlagBits pipelineStage, VkQueryPool queryPool, uint32_t query) nothrow;
alias PFN_vkCmdWriteTimestamp2 = extern(Windows) void function(VkCommandBuffer commandBuffer, VkPipelineStageFlags2 stage, VkQueryPool queryPool, uint32_t query) nothrow;
alias PFN_vkCmdWriteTimestamp2KHR = extern(Windows) void function(VkCommandBuffer commandBuffer, VkPipelineStageFlags2 stage, VkQueryPool queryPool, uint32_t query) nothrow;
alias PFN_vkCompileDeferredNV = extern(Windows) VkResult function(VkDevice device, VkPipeline pipeline, uint32_t shader) nothrow;
alias PFN_vkCopyAccelerationStructureKHR = extern(Windows) VkResult function(VkDevice device, VkDeferredOperationKHR deferredOperation, VkCopyAccelerationStructureInfoKHR* pInfo) nothrow;
alias PFN_vkCopyAccelerationStructureToMemoryKHR = extern(Windows) VkResult function(VkDevice device, VkDeferredOperationKHR deferredOperation, VkCopyAccelerationStructureToMemoryInfoKHR* pInfo) nothrow;
alias PFN_vkCopyMemoryToAccelerationStructureKHR = extern(Windows) VkResult function(VkDevice device, VkDeferredOperationKHR deferredOperation, VkCopyMemoryToAccelerationStructureInfoKHR* pInfo) nothrow;
alias PFN_vkCreateAccelerationStructureKHR = extern(Windows) VkResult function(VkDevice device, VkAccelerationStructureCreateInfoKHR* pCreateInfo, VkAllocationCallbacks* pAllocator, VkAccelerationStructureKHR* pAccelerationStructure) nothrow;
alias PFN_vkCreateAccelerationStructureNV = extern(Windows) VkResult function(VkDevice device, VkAccelerationStructureCreateInfoNV* pCreateInfo, VkAllocationCallbacks* pAllocator, VkAccelerationStructureNV* pAccelerationStructure) nothrow;
alias PFN_vkCreateBuffer = extern(Windows) VkResult function(VkDevice device, VkBufferCreateInfo* pCreateInfo, VkAllocationCallbacks* pAllocator, VkBuffer* pBuffer) nothrow;
alias PFN_vkCreateBufferView = extern(Windows) VkResult function(VkDevice device, VkBufferViewCreateInfo* pCreateInfo, VkAllocationCallbacks* pAllocator, VkBufferView* pView) nothrow;
alias PFN_vkCreateCommandPool = extern(Windows) VkResult function(VkDevice device, VkCommandPoolCreateInfo* pCreateInfo, VkAllocationCallbacks* pAllocator, VkCommandPool* pCommandPool) nothrow;
alias PFN_vkCreateComputePipelines = extern(Windows) VkResult function(VkDevice device, VkPipelineCache pipelineCache, uint32_t createInfoCount, VkComputePipelineCreateInfo* pCreateInfos, VkAllocationCallbacks* pAllocator, VkPipeline* pPipelines) nothrow;
alias PFN_vkCreateCuFunctionNVX = extern(Windows) VkResult function(VkDevice device, VkCuFunctionCreateInfoNVX* pCreateInfo, VkAllocationCallbacks* pAllocator, VkCuFunctionNVX* pFunction) nothrow;
alias PFN_vkCreateCuModuleNVX = extern(Windows) VkResult function(VkDevice device, VkCuModuleCreateInfoNVX* pCreateInfo, VkAllocationCallbacks* pAllocator, VkCuModuleNVX* pModule) nothrow;
alias PFN_vkCreateDebugReportCallbackEXT = extern(Windows) VkResult function(VkInstance instance, VkDebugReportCallbackCreateInfoEXT* pCreateInfo, VkAllocationCallbacks* pAllocator, VkDebugReportCallbackEXT* pCallback) nothrow;
alias PFN_vkCreateDebugUtilsMessengerEXT = extern(Windows) VkResult function(VkInstance instance, VkDebugUtilsMessengerCreateInfoEXT* pCreateInfo, VkAllocationCallbacks* pAllocator, VkDebugUtilsMessengerEXT* pMessenger) nothrow;
alias PFN_vkCreateDeferredOperationKHR = extern(Windows) VkResult function(VkDevice device, VkAllocationCallbacks* pAllocator, VkDeferredOperationKHR* pDeferredOperation) nothrow;
alias PFN_vkCreateDescriptorPool = extern(Windows) VkResult function(VkDevice device, VkDescriptorPoolCreateInfo* pCreateInfo, VkAllocationCallbacks* pAllocator, VkDescriptorPool* pDescriptorPool) nothrow;
alias PFN_vkCreateDescriptorSetLayout = extern(Windows) VkResult function(VkDevice device, VkDescriptorSetLayoutCreateInfo* pCreateInfo, VkAllocationCallbacks* pAllocator, VkDescriptorSetLayout* pSetLayout) nothrow;
alias PFN_vkCreateDescriptorUpdateTemplate = extern(Windows) VkResult function(VkDevice device, VkDescriptorUpdateTemplateCreateInfo* pCreateInfo, VkAllocationCallbacks* pAllocator, VkDescriptorUpdateTemplate* pDescriptorUpdateTemplate) nothrow;
alias PFN_vkCreateDescriptorUpdateTemplateKHR = extern(Windows) VkResult function(VkDevice device, VkDescriptorUpdateTemplateCreateInfo* pCreateInfo, VkAllocationCallbacks* pAllocator, VkDescriptorUpdateTemplate* pDescriptorUpdateTemplate) nothrow;
alias PFN_vkCreateDevice = extern(Windows) VkResult function(VkPhysicalDevice physicalDevice, VkDeviceCreateInfo* pCreateInfo, VkAllocationCallbacks* pAllocator, VkDevice* pDevice) nothrow;
alias PFN_vkCreateDisplayModeKHR = extern(Windows) VkResult function(VkPhysicalDevice physicalDevice, VkDisplayKHR display, VkDisplayModeCreateInfoKHR* pCreateInfo, VkAllocationCallbacks* pAllocator, VkDisplayModeKHR* pMode) nothrow;
alias PFN_vkCreateDisplayPlaneSurfaceKHR = extern(Windows) VkResult function(VkInstance instance, VkDisplaySurfaceCreateInfoKHR* pCreateInfo, VkAllocationCallbacks* pAllocator, VkSurfaceKHR* pSurface) nothrow;
alias PFN_vkCreateEvent = extern(Windows) VkResult function(VkDevice device, VkEventCreateInfo* pCreateInfo, VkAllocationCallbacks* pAllocator, VkEvent* pEvent) nothrow;
alias PFN_vkCreateFence = extern(Windows) VkResult function(VkDevice device, VkFenceCreateInfo* pCreateInfo, VkAllocationCallbacks* pAllocator, VkFence* pFence) nothrow;
alias PFN_vkCreateFramebuffer = extern(Windows) VkResult function(VkDevice device, VkFramebufferCreateInfo* pCreateInfo, VkAllocationCallbacks* pAllocator, VkFramebuffer* pFramebuffer) nothrow;
alias PFN_vkCreateGraphicsPipelines = extern(Windows) VkResult function(VkDevice device, VkPipelineCache pipelineCache, uint32_t createInfoCount, VkGraphicsPipelineCreateInfo* pCreateInfos, VkAllocationCallbacks* pAllocator, VkPipeline* pPipelines) nothrow;
alias PFN_vkCreateHeadlessSurfaceEXT = extern(Windows) VkResult function(VkInstance instance, VkHeadlessSurfaceCreateInfoEXT* pCreateInfo, VkAllocationCallbacks* pAllocator, VkSurfaceKHR* pSurface) nothrow;
alias PFN_vkCreateImage = extern(Windows) VkResult function(VkDevice device, VkImageCreateInfo* pCreateInfo, VkAllocationCallbacks* pAllocator, VkImage* pImage) nothrow;
alias PFN_vkCreateImageView = extern(Windows) VkResult function(VkDevice device, VkImageViewCreateInfo* pCreateInfo, VkAllocationCallbacks* pAllocator, VkImageView* pView) nothrow;
alias PFN_vkCreateIndirectCommandsLayoutNV = extern(Windows) VkResult function(VkDevice device, VkIndirectCommandsLayoutCreateInfoNV* pCreateInfo, VkAllocationCallbacks* pAllocator, VkIndirectCommandsLayoutNV* pIndirectCommandsLayout) nothrow;
alias PFN_vkCreateInstance = extern(Windows) VkResult function(VkInstanceCreateInfo* pCreateInfo, VkAllocationCallbacks* pAllocator, VkInstance* pInstance) nothrow;
alias PFN_vkCreatePipelineCache = extern(Windows) VkResult function(VkDevice device, VkPipelineCacheCreateInfo* pCreateInfo, VkAllocationCallbacks* pAllocator, VkPipelineCache* pPipelineCache) nothrow;
alias PFN_vkCreatePipelineLayout = extern(Windows) VkResult function(VkDevice device, VkPipelineLayoutCreateInfo* pCreateInfo, VkAllocationCallbacks* pAllocator, VkPipelineLayout* pPipelineLayout) nothrow;
alias PFN_vkCreatePrivateDataSlot = extern(Windows) VkResult function(VkDevice device, VkPrivateDataSlotCreateInfo* pCreateInfo, VkAllocationCallbacks* pAllocator, VkPrivateDataSlot* pPrivateDataSlot) nothrow;
alias PFN_vkCreatePrivateDataSlotEXT = extern(Windows) VkResult function(VkDevice device, VkPrivateDataSlotCreateInfo* pCreateInfo, VkAllocationCallbacks* pAllocator, VkPrivateDataSlot* pPrivateDataSlot) nothrow;
alias PFN_vkCreateQueryPool = extern(Windows) VkResult function(VkDevice device, VkQueryPoolCreateInfo* pCreateInfo, VkAllocationCallbacks* pAllocator, VkQueryPool* pQueryPool) nothrow;
alias PFN_vkCreateRayTracingPipelinesKHR = extern(Windows) VkResult function(VkDevice device, VkDeferredOperationKHR deferredOperation, VkPipelineCache pipelineCache, uint32_t createInfoCount, VkRayTracingPipelineCreateInfoKHR* pCreateInfos, VkAllocationCallbacks* pAllocator, VkPipeline* pPipelines) nothrow;
alias PFN_vkCreateRayTracingPipelinesNV = extern(Windows) VkResult function(VkDevice device, VkPipelineCache pipelineCache, uint32_t createInfoCount, VkRayTracingPipelineCreateInfoNV* pCreateInfos, VkAllocationCallbacks* pAllocator, VkPipeline* pPipelines) nothrow;
alias PFN_vkCreateRenderPass = extern(Windows) VkResult function(VkDevice device, VkRenderPassCreateInfo* pCreateInfo, VkAllocationCallbacks* pAllocator, VkRenderPass* pRenderPass) nothrow;
alias PFN_vkCreateRenderPass2 = extern(Windows) VkResult function(VkDevice device, VkRenderPassCreateInfo2* pCreateInfo, VkAllocationCallbacks* pAllocator, VkRenderPass* pRenderPass) nothrow;
alias PFN_vkCreateRenderPass2KHR = extern(Windows) VkResult function(VkDevice device, VkRenderPassCreateInfo2* pCreateInfo, VkAllocationCallbacks* pAllocator, VkRenderPass* pRenderPass) nothrow;
alias PFN_vkCreateSampler = extern(Windows) VkResult function(VkDevice device, VkSamplerCreateInfo* pCreateInfo, VkAllocationCallbacks* pAllocator, VkSampler* pSampler) nothrow;
alias PFN_vkCreateSamplerYcbcrConversion = extern(Windows) VkResult function(VkDevice device, VkSamplerYcbcrConversionCreateInfo* pCreateInfo, VkAllocationCallbacks* pAllocator, VkSamplerYcbcrConversion* pYcbcrConversion) nothrow;
alias PFN_vkCreateSamplerYcbcrConversionKHR = extern(Windows) VkResult function(VkDevice device, VkSamplerYcbcrConversionCreateInfo* pCreateInfo, VkAllocationCallbacks* pAllocator, VkSamplerYcbcrConversion* pYcbcrConversion) nothrow;
alias PFN_vkCreateSemaphore = extern(Windows) VkResult function(VkDevice device, VkSemaphoreCreateInfo* pCreateInfo, VkAllocationCallbacks* pAllocator, VkSemaphore* pSemaphore) nothrow;
alias PFN_vkCreateShaderModule = extern(Windows) VkResult function(VkDevice device, VkShaderModuleCreateInfo* pCreateInfo, VkAllocationCallbacks* pAllocator, VkShaderModule* pShaderModule) nothrow;
alias PFN_vkCreateSharedSwapchainsKHR = extern(Windows) VkResult function(VkDevice device, uint32_t swapchainCount, VkSwapchainCreateInfoKHR* pCreateInfos, VkAllocationCallbacks* pAllocator, VkSwapchainKHR* pSwapchains) nothrow;
alias PFN_vkCreateSwapchainKHR = extern(Windows) VkResult function(VkDevice device, VkSwapchainCreateInfoKHR* pCreateInfo, VkAllocationCallbacks* pAllocator, VkSwapchainKHR* pSwapchain) nothrow;
alias PFN_vkCreateValidationCacheEXT = extern(Windows) VkResult function(VkDevice device, VkValidationCacheCreateInfoEXT* pCreateInfo, VkAllocationCallbacks* pAllocator, VkValidationCacheEXT* pValidationCache) nothrow;
alias PFN_vkCreateWin32SurfaceKHR = extern(Windows) VkResult function(VkInstance instance, VkWin32SurfaceCreateInfoKHR* pCreateInfo, VkAllocationCallbacks* pAllocator, VkSurfaceKHR* pSurface) nothrow;
alias PFN_vkDebugMarkerSetObjectNameEXT = extern(Windows) VkResult function(VkDevice device, VkDebugMarkerObjectNameInfoEXT* pNameInfo) nothrow;
alias PFN_vkDebugMarkerSetObjectTagEXT = extern(Windows) VkResult function(VkDevice device, VkDebugMarkerObjectTagInfoEXT* pTagInfo) nothrow;
alias PFN_vkDebugReportMessageEXT = extern(Windows) void function(VkInstance instance, VkDebugReportFlagsEXT flags, VkDebugReportObjectTypeEXT objectType, uint64_t object, size_t location, int32_t messageCode, immutable(char)* pLayerPrefix, immutable(char)* pMessage) nothrow;
alias PFN_vkDeferredOperationJoinKHR = extern(Windows) VkResult function(VkDevice device, VkDeferredOperationKHR operation) nothrow;
alias PFN_vkDestroyAccelerationStructureKHR = extern(Windows) void function(VkDevice device, VkAccelerationStructureKHR accelerationStructure, VkAllocationCallbacks* pAllocator) nothrow;
alias PFN_vkDestroyAccelerationStructureNV = extern(Windows) void function(VkDevice device, VkAccelerationStructureNV accelerationStructure, VkAllocationCallbacks* pAllocator) nothrow;
alias PFN_vkDestroyBuffer = extern(Windows) void function(VkDevice device, VkBuffer buffer, VkAllocationCallbacks* pAllocator) nothrow;
alias PFN_vkDestroyBufferView = extern(Windows) void function(VkDevice device, VkBufferView bufferView, VkAllocationCallbacks* pAllocator) nothrow;
alias PFN_vkDestroyCommandPool = extern(Windows) void function(VkDevice device, VkCommandPool commandPool, VkAllocationCallbacks* pAllocator) nothrow;
alias PFN_vkDestroyCuFunctionNVX = extern(Windows) void function(VkDevice device, VkCuFunctionNVX function_, VkAllocationCallbacks* pAllocator) nothrow;
alias PFN_vkDestroyCuModuleNVX = extern(Windows) void function(VkDevice device, VkCuModuleNVX module_, VkAllocationCallbacks* pAllocator) nothrow;
alias PFN_vkDestroyDebugReportCallbackEXT = extern(Windows) void function(VkInstance instance, VkDebugReportCallbackEXT callback, VkAllocationCallbacks* pAllocator) nothrow;
alias PFN_vkDestroyDebugUtilsMessengerEXT = extern(Windows) void function(VkInstance instance, VkDebugUtilsMessengerEXT messenger, VkAllocationCallbacks* pAllocator) nothrow;
alias PFN_vkDestroyDeferredOperationKHR = extern(Windows) void function(VkDevice device, VkDeferredOperationKHR operation, VkAllocationCallbacks* pAllocator) nothrow;
alias PFN_vkDestroyDescriptorPool = extern(Windows) void function(VkDevice device, VkDescriptorPool descriptorPool, VkAllocationCallbacks* pAllocator) nothrow;
alias PFN_vkDestroyDescriptorSetLayout = extern(Windows) void function(VkDevice device, VkDescriptorSetLayout descriptorSetLayout, VkAllocationCallbacks* pAllocator) nothrow;
alias PFN_vkDestroyDescriptorUpdateTemplate = extern(Windows) void function(VkDevice device, VkDescriptorUpdateTemplate descriptorUpdateTemplate, VkAllocationCallbacks* pAllocator) nothrow;
alias PFN_vkDestroyDescriptorUpdateTemplateKHR = extern(Windows) void function(VkDevice device, VkDescriptorUpdateTemplate descriptorUpdateTemplate, VkAllocationCallbacks* pAllocator) nothrow;
alias PFN_vkDestroyDevice = extern(Windows) void function(VkDevice device, VkAllocationCallbacks* pAllocator) nothrow;
alias PFN_vkDestroyEvent = extern(Windows) void function(VkDevice device, VkEvent event, VkAllocationCallbacks* pAllocator) nothrow;
alias PFN_vkDestroyFence = extern(Windows) void function(VkDevice device, VkFence fence, VkAllocationCallbacks* pAllocator) nothrow;
alias PFN_vkDestroyFramebuffer = extern(Windows) void function(VkDevice device, VkFramebuffer framebuffer, VkAllocationCallbacks* pAllocator) nothrow;
alias PFN_vkDestroyImage = extern(Windows) void function(VkDevice device, VkImage image, VkAllocationCallbacks* pAllocator) nothrow;
alias PFN_vkDestroyImageView = extern(Windows) void function(VkDevice device, VkImageView imageView, VkAllocationCallbacks* pAllocator) nothrow;
alias PFN_vkDestroyIndirectCommandsLayoutNV = extern(Windows) void function(VkDevice device, VkIndirectCommandsLayoutNV indirectCommandsLayout, VkAllocationCallbacks* pAllocator) nothrow;
alias PFN_vkDestroyInstance = extern(Windows) void function(VkInstance instance, VkAllocationCallbacks* pAllocator) nothrow;
alias PFN_vkDestroyPipeline = extern(Windows) void function(VkDevice device, VkPipeline pipeline, VkAllocationCallbacks* pAllocator) nothrow;
alias PFN_vkDestroyPipelineCache = extern(Windows) void function(VkDevice device, VkPipelineCache pipelineCache, VkAllocationCallbacks* pAllocator) nothrow;
alias PFN_vkDestroyPipelineLayout = extern(Windows) void function(VkDevice device, VkPipelineLayout pipelineLayout, VkAllocationCallbacks* pAllocator) nothrow;
alias PFN_vkDestroyPrivateDataSlot = extern(Windows) void function(VkDevice device, VkPrivateDataSlot privateDataSlot, VkAllocationCallbacks* pAllocator) nothrow;
alias PFN_vkDestroyPrivateDataSlotEXT = extern(Windows) void function(VkDevice device, VkPrivateDataSlot privateDataSlot, VkAllocationCallbacks* pAllocator) nothrow;
alias PFN_vkDestroyQueryPool = extern(Windows) void function(VkDevice device, VkQueryPool queryPool, VkAllocationCallbacks* pAllocator) nothrow;
alias PFN_vkDestroyRenderPass = extern(Windows) void function(VkDevice device, VkRenderPass renderPass, VkAllocationCallbacks* pAllocator) nothrow;
alias PFN_vkDestroySampler = extern(Windows) void function(VkDevice device, VkSampler sampler, VkAllocationCallbacks* pAllocator) nothrow;
alias PFN_vkDestroySamplerYcbcrConversion = extern(Windows) void function(VkDevice device, VkSamplerYcbcrConversion ycbcrConversion, VkAllocationCallbacks* pAllocator) nothrow;
alias PFN_vkDestroySamplerYcbcrConversionKHR = extern(Windows) void function(VkDevice device, VkSamplerYcbcrConversion ycbcrConversion, VkAllocationCallbacks* pAllocator) nothrow;
alias PFN_vkDestroySemaphore = extern(Windows) void function(VkDevice device, VkSemaphore semaphore, VkAllocationCallbacks* pAllocator) nothrow;
alias PFN_vkDestroyShaderModule = extern(Windows) void function(VkDevice device, VkShaderModule shaderModule, VkAllocationCallbacks* pAllocator) nothrow;
alias PFN_vkDestroySurfaceKHR = extern(Windows) void function(VkInstance instance, VkSurfaceKHR surface, VkAllocationCallbacks* pAllocator) nothrow;
alias PFN_vkDestroySwapchainKHR = extern(Windows) void function(VkDevice device, VkSwapchainKHR swapchain, VkAllocationCallbacks* pAllocator) nothrow;
alias PFN_vkDestroyValidationCacheEXT = extern(Windows) void function(VkDevice device, VkValidationCacheEXT validationCache, VkAllocationCallbacks* pAllocator) nothrow;
alias PFN_vkDeviceWaitIdle = extern(Windows) VkResult function(VkDevice device) nothrow;
alias PFN_vkDisplayPowerControlEXT = extern(Windows) VkResult function(VkDevice device, VkDisplayKHR display, VkDisplayPowerInfoEXT* pDisplayPowerInfo) nothrow;
alias PFN_vkEndCommandBuffer = extern(Windows) VkResult function(VkCommandBuffer commandBuffer) nothrow;
alias PFN_vkEnumerateDeviceExtensionProperties = extern(Windows) VkResult function(VkPhysicalDevice physicalDevice, immutable(char)* pLayerName, uint32_t* pPropertyCount, VkExtensionProperties* pProperties) nothrow;
alias PFN_vkEnumerateDeviceLayerProperties = extern(Windows) VkResult function(VkPhysicalDevice physicalDevice, uint32_t* pPropertyCount, VkLayerProperties* pProperties) nothrow;
alias PFN_vkEnumerateInstanceExtensionProperties = extern(Windows) VkResult function(immutable(char)* pLayerName, uint32_t* pPropertyCount, VkExtensionProperties* pProperties) nothrow;
alias PFN_vkEnumerateInstanceLayerProperties = extern(Windows) VkResult function(uint32_t* pPropertyCount, VkLayerProperties* pProperties) nothrow;
alias PFN_vkEnumerateInstanceVersion = extern(Windows) VkResult function(uint32_t* pApiVersion) nothrow;
alias PFN_vkEnumeratePhysicalDeviceGroups = extern(Windows) VkResult function(VkInstance instance, uint32_t* pPhysicalDeviceGroupCount, VkPhysicalDeviceGroupProperties* pPhysicalDeviceGroupProperties) nothrow;
alias PFN_vkEnumeratePhysicalDeviceGroupsKHR = extern(Windows) VkResult function(VkInstance instance, uint32_t* pPhysicalDeviceGroupCount, VkPhysicalDeviceGroupProperties* pPhysicalDeviceGroupProperties) nothrow;
alias PFN_vkEnumeratePhysicalDeviceQueueFamilyPerformanceQueryCountersKHR = extern(Windows) VkResult function(VkPhysicalDevice physicalDevice, uint32_t queueFamilyIndex, uint32_t* pCounterCount, VkPerformanceCounterKHR* pCounters, VkPerformanceCounterDescriptionKHR* pCounterDescriptions) nothrow;
alias PFN_vkEnumeratePhysicalDevices = extern(Windows) VkResult function(VkInstance instance, uint32_t* pPhysicalDeviceCount, VkPhysicalDevice* pPhysicalDevices) nothrow;
alias PFN_vkFlushMappedMemoryRanges = extern(Windows) VkResult function(VkDevice device, uint32_t memoryRangeCount, VkMappedMemoryRange* pMemoryRanges) nothrow;
alias PFN_vkFreeCommandBuffers = extern(Windows) void function(VkDevice device, VkCommandPool commandPool, uint32_t commandBufferCount, VkCommandBuffer* pCommandBuffers) nothrow;
alias PFN_vkFreeDescriptorSets = extern(Windows) VkResult function(VkDevice device, VkDescriptorPool descriptorPool, uint32_t descriptorSetCount, VkDescriptorSet* pDescriptorSets) nothrow;
alias PFN_vkFreeMemory = extern(Windows) void function(VkDevice device, VkDeviceMemory memory, VkAllocationCallbacks* pAllocator) nothrow;
alias PFN_vkGetAccelerationStructureBuildSizesKHR = extern(Windows) void function(VkDevice device, VkAccelerationStructureBuildTypeKHR buildType, VkAccelerationStructureBuildGeometryInfoKHR* pBuildInfo, uint32_t* pMaxPrimitiveCounts, VkAccelerationStructureBuildSizesInfoKHR* pSizeInfo) nothrow;
alias PFN_vkGetAccelerationStructureDeviceAddressKHR = extern(Windows) VkDeviceAddress function(VkDevice device, VkAccelerationStructureDeviceAddressInfoKHR* pInfo) nothrow;
alias PFN_vkGetAccelerationStructureHandleNV = extern(Windows) VkResult function(VkDevice device, VkAccelerationStructureNV accelerationStructure, size_t dataSize, void* pData) nothrow;
alias PFN_vkGetAccelerationStructureMemoryRequirementsNV = extern(Windows) void function(VkDevice device, VkAccelerationStructureMemoryRequirementsInfoNV* pInfo, VkMemoryRequirements2KHR* pMemoryRequirements) nothrow;
alias PFN_vkGetBufferDeviceAddress = extern(Windows) VkDeviceAddress function(VkDevice device, VkBufferDeviceAddressInfo* pInfo) nothrow;
alias PFN_vkGetBufferDeviceAddressEXT = extern(Windows) VkDeviceAddress function(VkDevice device, VkBufferDeviceAddressInfo* pInfo) nothrow;
alias PFN_vkGetBufferDeviceAddressKHR = extern(Windows) VkDeviceAddress function(VkDevice device, VkBufferDeviceAddressInfo* pInfo) nothrow;
alias PFN_vkGetBufferMemoryRequirements = extern(Windows) void function(VkDevice device, VkBuffer buffer, VkMemoryRequirements* pMemoryRequirements) nothrow;
alias PFN_vkGetBufferMemoryRequirements2 = extern(Windows) void function(VkDevice device, VkBufferMemoryRequirementsInfo2* pInfo, VkMemoryRequirements2* pMemoryRequirements) nothrow;
alias PFN_vkGetBufferMemoryRequirements2KHR = extern(Windows) void function(VkDevice device, VkBufferMemoryRequirementsInfo2* pInfo, VkMemoryRequirements2* pMemoryRequirements) nothrow;
alias PFN_vkGetBufferOpaqueCaptureAddress = extern(Windows) uint64_t function(VkDevice device, VkBufferDeviceAddressInfo* pInfo) nothrow;
alias PFN_vkGetBufferOpaqueCaptureAddressKHR = extern(Windows) uint64_t function(VkDevice device, VkBufferDeviceAddressInfo* pInfo) nothrow;
alias PFN_vkGetCalibratedTimestampsEXT = extern(Windows) VkResult function(VkDevice device, uint32_t timestampCount, VkCalibratedTimestampInfoEXT* pTimestampInfos, uint64_t* pTimestamps, uint64_t* pMaxDeviation) nothrow;
alias PFN_vkGetDeferredOperationMaxConcurrencyKHR = extern(Windows) uint32_t function(VkDevice device, VkDeferredOperationKHR operation) nothrow;
alias PFN_vkGetDeferredOperationResultKHR = extern(Windows) VkResult function(VkDevice device, VkDeferredOperationKHR operation) nothrow;
alias PFN_vkGetDescriptorSetHostMappingVALVE = extern(Windows) void function(VkDevice device, VkDescriptorSet descriptorSet, void** ppData) nothrow;
alias PFN_vkGetDescriptorSetLayoutHostMappingInfoVALVE = extern(Windows) void function(VkDevice device, VkDescriptorSetBindingReferenceVALVE* pBindingReference, VkDescriptorSetLayoutHostMappingInfoVALVE* pHostMapping) nothrow;
alias PFN_vkGetDescriptorSetLayoutSupport = extern(Windows) void function(VkDevice device, VkDescriptorSetLayoutCreateInfo* pCreateInfo, VkDescriptorSetLayoutSupport* pSupport) nothrow;
alias PFN_vkGetDescriptorSetLayoutSupportKHR = extern(Windows) void function(VkDevice device, VkDescriptorSetLayoutCreateInfo* pCreateInfo, VkDescriptorSetLayoutSupport* pSupport) nothrow;
alias PFN_vkGetDeviceAccelerationStructureCompatibilityKHR = extern(Windows) void function(VkDevice device, VkAccelerationStructureVersionInfoKHR* pVersionInfo, VkAccelerationStructureCompatibilityKHR* pCompatibility) nothrow;
alias PFN_vkGetDeviceBufferMemoryRequirements = extern(Windows) void function(VkDevice device, VkDeviceBufferMemoryRequirements* pInfo, VkMemoryRequirements2* pMemoryRequirements) nothrow;
alias PFN_vkGetDeviceBufferMemoryRequirementsKHR = extern(Windows) void function(VkDevice device, VkDeviceBufferMemoryRequirements* pInfo, VkMemoryRequirements2* pMemoryRequirements) nothrow;
alias PFN_vkGetDeviceGroupPeerMemoryFeatures = extern(Windows) void function(VkDevice device, uint32_t heapIndex, uint32_t localDeviceIndex, uint32_t remoteDeviceIndex, VkPeerMemoryFeatureFlags* pPeerMemoryFeatures) nothrow;
alias PFN_vkGetDeviceGroupPeerMemoryFeaturesKHR = extern(Windows) void function(VkDevice device, uint32_t heapIndex, uint32_t localDeviceIndex, uint32_t remoteDeviceIndex, VkPeerMemoryFeatureFlags* pPeerMemoryFeatures) nothrow;
alias PFN_vkGetDeviceGroupPresentCapabilitiesKHR = extern(Windows) VkResult function(VkDevice device, VkDeviceGroupPresentCapabilitiesKHR* pDeviceGroupPresentCapabilities) nothrow;
alias PFN_vkGetDeviceGroupSurfacePresentModes2EXT = extern(Windows) VkResult function(VkDevice device, VkPhysicalDeviceSurfaceInfo2KHR* pSurfaceInfo, VkDeviceGroupPresentModeFlagsKHR* pModes) nothrow;
alias PFN_vkGetDeviceGroupSurfacePresentModesKHR = extern(Windows) VkResult function(VkDevice device, VkSurfaceKHR surface, VkDeviceGroupPresentModeFlagsKHR* pModes) nothrow;
alias PFN_vkGetDeviceImageMemoryRequirements = extern(Windows) void function(VkDevice device, VkDeviceImageMemoryRequirements* pInfo, VkMemoryRequirements2* pMemoryRequirements) nothrow;
alias PFN_vkGetDeviceImageMemoryRequirementsKHR = extern(Windows) void function(VkDevice device, VkDeviceImageMemoryRequirements* pInfo, VkMemoryRequirements2* pMemoryRequirements) nothrow;
alias PFN_vkGetDeviceImageSparseMemoryRequirements = extern(Windows) void function(VkDevice device, VkDeviceImageMemoryRequirements* pInfo, uint32_t* pSparseMemoryRequirementCount, VkSparseImageMemoryRequirements2* pSparseMemoryRequirements) nothrow;
alias PFN_vkGetDeviceImageSparseMemoryRequirementsKHR = extern(Windows) void function(VkDevice device, VkDeviceImageMemoryRequirements* pInfo, uint32_t* pSparseMemoryRequirementCount, VkSparseImageMemoryRequirements2* pSparseMemoryRequirements) nothrow;
alias PFN_vkGetDeviceMemoryCommitment = extern(Windows) void function(VkDevice device, VkDeviceMemory memory, VkDeviceSize* pCommittedMemoryInBytes) nothrow;
alias PFN_vkGetDeviceMemoryOpaqueCaptureAddress = extern(Windows) uint64_t function(VkDevice device, VkDeviceMemoryOpaqueCaptureAddressInfo* pInfo) nothrow;
alias PFN_vkGetDeviceMemoryOpaqueCaptureAddressKHR = extern(Windows) uint64_t function(VkDevice device, VkDeviceMemoryOpaqueCaptureAddressInfo* pInfo) nothrow;
alias PFN_vkGetDeviceProcAddr = extern(Windows) PFN_vkVoidFunction function(VkDevice device, immutable(char)* pName) nothrow;
alias PFN_vkGetDeviceQueue = extern(Windows) void function(VkDevice device, uint32_t queueFamilyIndex, uint32_t queueIndex, VkQueue* pQueue) nothrow;
alias PFN_vkGetDeviceQueue2 = extern(Windows) void function(VkDevice device, VkDeviceQueueInfo2* pQueueInfo, VkQueue* pQueue) nothrow;
alias PFN_vkGetDeviceSubpassShadingMaxWorkgroupSizeHUAWEI = extern(Windows) VkResult function(VkDevice device, VkRenderPass renderpass, VkExtent2D* pMaxWorkgroupSize) nothrow;
alias PFN_vkGetDisplayModeProperties2KHR = extern(Windows) VkResult function(VkPhysicalDevice physicalDevice, VkDisplayKHR display, uint32_t* pPropertyCount, VkDisplayModeProperties2KHR* pProperties) nothrow;
alias PFN_vkGetDisplayModePropertiesKHR = extern(Windows) VkResult function(VkPhysicalDevice physicalDevice, VkDisplayKHR display, uint32_t* pPropertyCount, VkDisplayModePropertiesKHR* pProperties) nothrow;
alias PFN_vkGetDisplayPlaneCapabilities2KHR = extern(Windows) VkResult function(VkPhysicalDevice physicalDevice, VkDisplayPlaneInfo2KHR* pDisplayPlaneInfo, VkDisplayPlaneCapabilities2KHR* pCapabilities) nothrow;
alias PFN_vkGetDisplayPlaneCapabilitiesKHR = extern(Windows) VkResult function(VkPhysicalDevice physicalDevice, VkDisplayModeKHR mode, uint32_t planeIndex, VkDisplayPlaneCapabilitiesKHR* pCapabilities) nothrow;
alias PFN_vkGetDisplayPlaneSupportedDisplaysKHR = extern(Windows) VkResult function(VkPhysicalDevice physicalDevice, uint32_t planeIndex, uint32_t* pDisplayCount, VkDisplayKHR* pDisplays) nothrow;
alias PFN_vkGetDrmDisplayEXT = extern(Windows) VkResult function(VkPhysicalDevice physicalDevice, int32_t drmFd, uint32_t connectorId, VkDisplayKHR* display) nothrow;
alias PFN_vkGetEventStatus = extern(Windows) VkResult function(VkDevice device, VkEvent event) nothrow;
alias PFN_vkGetFenceFdKHR = extern(Windows) VkResult function(VkDevice device, VkFenceGetFdInfoKHR* pGetFdInfo, int* pFd) nothrow;
alias PFN_vkGetFenceStatus = extern(Windows) VkResult function(VkDevice device, VkFence fence) nothrow;
alias PFN_vkGetFenceWin32HandleKHR = extern(Windows) VkResult function(VkDevice device, VkFenceGetWin32HandleInfoKHR* pGetWin32HandleInfo, HANDLE* pHandle) nothrow;
alias PFN_vkGetGeneratedCommandsMemoryRequirementsNV = extern(Windows) void function(VkDevice device, VkGeneratedCommandsMemoryRequirementsInfoNV* pInfo, VkMemoryRequirements2* pMemoryRequirements) nothrow;
alias PFN_vkGetImageDrmFormatModifierPropertiesEXT = extern(Windows) VkResult function(VkDevice device, VkImage image, VkImageDrmFormatModifierPropertiesEXT* pProperties) nothrow;
alias PFN_vkGetImageMemoryRequirements = extern(Windows) void function(VkDevice device, VkImage image, VkMemoryRequirements* pMemoryRequirements) nothrow;
alias PFN_vkGetImageMemoryRequirements2 = extern(Windows) void function(VkDevice device, VkImageMemoryRequirementsInfo2* pInfo, VkMemoryRequirements2* pMemoryRequirements) nothrow;
alias PFN_vkGetImageMemoryRequirements2KHR = extern(Windows) void function(VkDevice device, VkImageMemoryRequirementsInfo2* pInfo, VkMemoryRequirements2* pMemoryRequirements) nothrow;
alias PFN_vkGetImageSparseMemoryRequirements = extern(Windows) void function(VkDevice device, VkImage image, uint32_t* pSparseMemoryRequirementCount, VkSparseImageMemoryRequirements* pSparseMemoryRequirements) nothrow;
alias PFN_vkGetImageSparseMemoryRequirements2 = extern(Windows) void function(VkDevice device, VkImageSparseMemoryRequirementsInfo2* pInfo, uint32_t* pSparseMemoryRequirementCount, VkSparseImageMemoryRequirements2* pSparseMemoryRequirements) nothrow;
alias PFN_vkGetImageSparseMemoryRequirements2KHR = extern(Windows) void function(VkDevice device, VkImageSparseMemoryRequirementsInfo2* pInfo, uint32_t* pSparseMemoryRequirementCount, VkSparseImageMemoryRequirements2* pSparseMemoryRequirements) nothrow;
alias PFN_vkGetImageSubresourceLayout = extern(Windows) void function(VkDevice device, VkImage image, VkImageSubresource* pSubresource, VkSubresourceLayout* pLayout) nothrow;
alias PFN_vkGetImageViewAddressNVX = extern(Windows) VkResult function(VkDevice device, VkImageView imageView, VkImageViewAddressPropertiesNVX* pProperties) nothrow;
alias PFN_vkGetImageViewHandleNVX = extern(Windows) uint32_t function(VkDevice device, VkImageViewHandleInfoNVX* pInfo) nothrow;
alias PFN_vkGetInstanceProcAddr = extern(Windows) PFN_vkVoidFunction function(VkInstance instance, immutable(char)* pName) nothrow;
alias PFN_vkGetMemoryFdKHR = extern(Windows) VkResult function(VkDevice device, VkMemoryGetFdInfoKHR* pGetFdInfo, int* pFd) nothrow;
alias PFN_vkGetMemoryFdPropertiesKHR = extern(Windows) VkResult function(VkDevice device, VkExternalMemoryHandleTypeFlagBits handleType, int fd, VkMemoryFdPropertiesKHR* pMemoryFdProperties) nothrow;
alias PFN_vkGetMemoryHostPointerPropertiesEXT = extern(Windows) VkResult function(VkDevice device, VkExternalMemoryHandleTypeFlagBits handleType, void* pHostPointer, VkMemoryHostPointerPropertiesEXT* pMemoryHostPointerProperties) nothrow;
alias PFN_vkGetMemoryRemoteAddressNV = extern(Windows) VkResult function(VkDevice device, VkMemoryGetRemoteAddressInfoNV* pMemoryGetRemoteAddressInfo, VkRemoteAddressNV* pAddress) nothrow;
alias PFN_vkGetMemoryWin32HandleKHR = extern(Windows) VkResult function(VkDevice device, VkMemoryGetWin32HandleInfoKHR* pGetWin32HandleInfo, HANDLE* pHandle) nothrow;
alias PFN_vkGetMemoryWin32HandleNV = extern(Windows) VkResult function(VkDevice device, VkDeviceMemory memory, VkExternalMemoryHandleTypeFlagsNV handleType, HANDLE* pHandle) nothrow;
alias PFN_vkGetMemoryWin32HandlePropertiesKHR = extern(Windows) VkResult function(VkDevice device, VkExternalMemoryHandleTypeFlagBits handleType, VkMemoryWin32HandlePropertiesKHR* pMemoryWin32HandleProperties) nothrow;
alias PFN_vkGetPastPresentationTimingGOOGLE = extern(Windows) VkResult function(VkDevice device, VkSwapchainKHR swapchain, uint32_t* pPresentationTimingCount, VkPastPresentationTimingGOOGLE* pPresentationTimings) nothrow;
alias PFN_vkGetPerformanceParameterINTEL = extern(Windows) VkResult function(VkDevice device, VkPerformanceParameterTypeINTEL parameter, VkPerformanceValueINTEL* pValue) nothrow;
alias PFN_vkGetPhysicalDeviceCalibrateableTimeDomainsEXT = extern(Windows) VkResult function(VkPhysicalDevice physicalDevice, uint32_t* pTimeDomainCount, VkTimeDomainEXT* pTimeDomains) nothrow;
alias PFN_vkGetPhysicalDeviceCooperativeMatrixPropertiesNV = extern(Windows) VkResult function(VkPhysicalDevice physicalDevice, uint32_t* pPropertyCount, VkCooperativeMatrixPropertiesNV* pProperties) nothrow;
alias PFN_vkGetPhysicalDeviceDisplayPlaneProperties2KHR = extern(Windows) VkResult function(VkPhysicalDevice physicalDevice, uint32_t* pPropertyCount, VkDisplayPlaneProperties2KHR* pProperties) nothrow;
alias PFN_vkGetPhysicalDeviceDisplayPlanePropertiesKHR = extern(Windows) VkResult function(VkPhysicalDevice physicalDevice, uint32_t* pPropertyCount, VkDisplayPlanePropertiesKHR* pProperties) nothrow;
alias PFN_vkGetPhysicalDeviceDisplayProperties2KHR = extern(Windows) VkResult function(VkPhysicalDevice physicalDevice, uint32_t* pPropertyCount, VkDisplayProperties2KHR* pProperties) nothrow;
alias PFN_vkGetPhysicalDeviceDisplayPropertiesKHR = extern(Windows) VkResult function(VkPhysicalDevice physicalDevice, uint32_t* pPropertyCount, VkDisplayPropertiesKHR* pProperties) nothrow;
alias PFN_vkGetPhysicalDeviceExternalBufferProperties = extern(Windows) void function(VkPhysicalDevice physicalDevice, VkPhysicalDeviceExternalBufferInfo* pExternalBufferInfo, VkExternalBufferProperties* pExternalBufferProperties) nothrow;
alias PFN_vkGetPhysicalDeviceExternalBufferPropertiesKHR = extern(Windows) void function(VkPhysicalDevice physicalDevice, VkPhysicalDeviceExternalBufferInfo* pExternalBufferInfo, VkExternalBufferProperties* pExternalBufferProperties) nothrow;
alias PFN_vkGetPhysicalDeviceExternalFenceProperties = extern(Windows) void function(VkPhysicalDevice physicalDevice, VkPhysicalDeviceExternalFenceInfo* pExternalFenceInfo, VkExternalFenceProperties* pExternalFenceProperties) nothrow;
alias PFN_vkGetPhysicalDeviceExternalFencePropertiesKHR = extern(Windows) void function(VkPhysicalDevice physicalDevice, VkPhysicalDeviceExternalFenceInfo* pExternalFenceInfo, VkExternalFenceProperties* pExternalFenceProperties) nothrow;
alias PFN_vkGetPhysicalDeviceExternalImageFormatPropertiesNV = extern(Windows) VkResult function(VkPhysicalDevice physicalDevice, VkFormat format, VkImageType type, VkImageTiling tiling, VkImageUsageFlags usage, VkImageCreateFlags flags, VkExternalMemoryHandleTypeFlagsNV externalHandleType, VkExternalImageFormatPropertiesNV* pExternalImageFormatProperties) nothrow;
alias PFN_vkGetPhysicalDeviceExternalSemaphoreProperties = extern(Windows) void function(VkPhysicalDevice physicalDevice, VkPhysicalDeviceExternalSemaphoreInfo* pExternalSemaphoreInfo, VkExternalSemaphoreProperties* pExternalSemaphoreProperties) nothrow;
alias PFN_vkGetPhysicalDeviceExternalSemaphorePropertiesKHR = extern(Windows) void function(VkPhysicalDevice physicalDevice, VkPhysicalDeviceExternalSemaphoreInfo* pExternalSemaphoreInfo, VkExternalSemaphoreProperties* pExternalSemaphoreProperties) nothrow;
alias PFN_vkGetPhysicalDeviceFeatures = extern(Windows) void function(VkPhysicalDevice physicalDevice, VkPhysicalDeviceFeatures* pFeatures) nothrow;
alias PFN_vkGetPhysicalDeviceFeatures2 = extern(Windows) void function(VkPhysicalDevice physicalDevice, VkPhysicalDeviceFeatures2* pFeatures) nothrow;
alias PFN_vkGetPhysicalDeviceFeatures2KHR = extern(Windows) void function(VkPhysicalDevice physicalDevice, VkPhysicalDeviceFeatures2* pFeatures) nothrow;
alias PFN_vkGetPhysicalDeviceFormatProperties = extern(Windows) void function(VkPhysicalDevice physicalDevice, VkFormat format, VkFormatProperties* pFormatProperties) nothrow;
alias PFN_vkGetPhysicalDeviceFormatProperties2 = extern(Windows) void function(VkPhysicalDevice physicalDevice, VkFormat format, VkFormatProperties2* pFormatProperties) nothrow;
alias PFN_vkGetPhysicalDeviceFormatProperties2KHR = extern(Windows) void function(VkPhysicalDevice physicalDevice, VkFormat format, VkFormatProperties2* pFormatProperties) nothrow;
alias PFN_vkGetPhysicalDeviceFragmentShadingRatesKHR = extern(Windows) VkResult function(VkPhysicalDevice physicalDevice, uint32_t* pFragmentShadingRateCount, VkPhysicalDeviceFragmentShadingRateKHR* pFragmentShadingRates) nothrow;
alias PFN_vkGetPhysicalDeviceImageFormatProperties = extern(Windows) VkResult function(VkPhysicalDevice physicalDevice, VkFormat format, VkImageType type, VkImageTiling tiling, VkImageUsageFlags usage, VkImageCreateFlags flags, VkImageFormatProperties* pImageFormatProperties) nothrow;
alias PFN_vkGetPhysicalDeviceImageFormatProperties2 = extern(Windows) VkResult function(VkPhysicalDevice physicalDevice, VkPhysicalDeviceImageFormatInfo2* pImageFormatInfo, VkImageFormatProperties2* pImageFormatProperties) nothrow;
alias PFN_vkGetPhysicalDeviceImageFormatProperties2KHR = extern(Windows) VkResult function(VkPhysicalDevice physicalDevice, VkPhysicalDeviceImageFormatInfo2* pImageFormatInfo, VkImageFormatProperties2* pImageFormatProperties) nothrow;
alias PFN_vkGetPhysicalDeviceMemoryProperties = extern(Windows) void function(VkPhysicalDevice physicalDevice, VkPhysicalDeviceMemoryProperties* pMemoryProperties) nothrow;
alias PFN_vkGetPhysicalDeviceMemoryProperties2 = extern(Windows) void function(VkPhysicalDevice physicalDevice, VkPhysicalDeviceMemoryProperties2* pMemoryProperties) nothrow;
alias PFN_vkGetPhysicalDeviceMemoryProperties2KHR = extern(Windows) void function(VkPhysicalDevice physicalDevice, VkPhysicalDeviceMemoryProperties2* pMemoryProperties) nothrow;
alias PFN_vkGetPhysicalDeviceMultisamplePropertiesEXT = extern(Windows) void function(VkPhysicalDevice physicalDevice, VkSampleCountFlagBits samples, VkMultisamplePropertiesEXT* pMultisampleProperties) nothrow;
alias PFN_vkGetPhysicalDevicePresentRectanglesKHR = extern(Windows) VkResult function(VkPhysicalDevice physicalDevice, VkSurfaceKHR surface, uint32_t* pRectCount, VkRect2D* pRects) nothrow;
alias PFN_vkGetPhysicalDeviceProperties = extern(Windows) void function(VkPhysicalDevice physicalDevice, VkPhysicalDeviceProperties* pProperties) nothrow;
alias PFN_vkGetPhysicalDeviceProperties2 = extern(Windows) void function(VkPhysicalDevice physicalDevice, VkPhysicalDeviceProperties2* pProperties) nothrow;
alias PFN_vkGetPhysicalDeviceProperties2KHR = extern(Windows) void function(VkPhysicalDevice physicalDevice, VkPhysicalDeviceProperties2* pProperties) nothrow;
alias PFN_vkGetPhysicalDeviceQueueFamilyPerformanceQueryPassesKHR = extern(Windows) void function(VkPhysicalDevice physicalDevice, VkQueryPoolPerformanceCreateInfoKHR* pPerformanceQueryCreateInfo, uint32_t* pNumPasses) nothrow;
alias PFN_vkGetPhysicalDeviceQueueFamilyProperties = extern(Windows) void function(VkPhysicalDevice physicalDevice, uint32_t* pQueueFamilyPropertyCount, VkQueueFamilyProperties* pQueueFamilyProperties) nothrow;
alias PFN_vkGetPhysicalDeviceQueueFamilyProperties2 = extern(Windows) void function(VkPhysicalDevice physicalDevice, uint32_t* pQueueFamilyPropertyCount, VkQueueFamilyProperties2* pQueueFamilyProperties) nothrow;
alias PFN_vkGetPhysicalDeviceQueueFamilyProperties2KHR = extern(Windows) void function(VkPhysicalDevice physicalDevice, uint32_t* pQueueFamilyPropertyCount, VkQueueFamilyProperties2* pQueueFamilyProperties) nothrow;
alias PFN_vkGetPhysicalDeviceSparseImageFormatProperties = extern(Windows) void function(VkPhysicalDevice physicalDevice, VkFormat format, VkImageType type, VkSampleCountFlagBits samples, VkImageUsageFlags usage, VkImageTiling tiling, uint32_t* pPropertyCount, VkSparseImageFormatProperties* pProperties) nothrow;
alias PFN_vkGetPhysicalDeviceSparseImageFormatProperties2 = extern(Windows) void function(VkPhysicalDevice physicalDevice, VkPhysicalDeviceSparseImageFormatInfo2* pFormatInfo, uint32_t* pPropertyCount, VkSparseImageFormatProperties2* pProperties) nothrow;
alias PFN_vkGetPhysicalDeviceSparseImageFormatProperties2KHR = extern(Windows) void function(VkPhysicalDevice physicalDevice, VkPhysicalDeviceSparseImageFormatInfo2* pFormatInfo, uint32_t* pPropertyCount, VkSparseImageFormatProperties2* pProperties) nothrow;
alias PFN_vkGetPhysicalDeviceSupportedFramebufferMixedSamplesCombinationsNV = extern(Windows) VkResult function(VkPhysicalDevice physicalDevice, uint32_t* pCombinationCount, VkFramebufferMixedSamplesCombinationNV* pCombinations) nothrow;
alias PFN_vkGetPhysicalDeviceSurfaceCapabilities2EXT = extern(Windows) VkResult function(VkPhysicalDevice physicalDevice, VkSurfaceKHR surface, VkSurfaceCapabilities2EXT* pSurfaceCapabilities) nothrow;
alias PFN_vkGetPhysicalDeviceSurfaceCapabilities2KHR = extern(Windows) VkResult function(VkPhysicalDevice physicalDevice, VkPhysicalDeviceSurfaceInfo2KHR* pSurfaceInfo, VkSurfaceCapabilities2KHR* pSurfaceCapabilities) nothrow;
alias PFN_vkGetPhysicalDeviceSurfaceCapabilitiesKHR = extern(Windows) VkResult function(VkPhysicalDevice physicalDevice, VkSurfaceKHR surface, VkSurfaceCapabilitiesKHR* pSurfaceCapabilities) nothrow;
alias PFN_vkGetPhysicalDeviceSurfaceFormats2KHR = extern(Windows) VkResult function(VkPhysicalDevice physicalDevice, VkPhysicalDeviceSurfaceInfo2KHR* pSurfaceInfo, uint32_t* pSurfaceFormatCount, VkSurfaceFormat2KHR* pSurfaceFormats) nothrow;
alias PFN_vkGetPhysicalDeviceSurfaceFormatsKHR = extern(Windows) VkResult function(VkPhysicalDevice physicalDevice, VkSurfaceKHR surface, uint32_t* pSurfaceFormatCount, VkSurfaceFormatKHR* pSurfaceFormats) nothrow;
alias PFN_vkGetPhysicalDeviceSurfacePresentModes2EXT = extern(Windows) VkResult function(VkPhysicalDevice physicalDevice, VkPhysicalDeviceSurfaceInfo2KHR* pSurfaceInfo, uint32_t* pPresentModeCount, VkPresentModeKHR* pPresentModes) nothrow;
alias PFN_vkGetPhysicalDeviceSurfacePresentModesKHR = extern(Windows) VkResult function(VkPhysicalDevice physicalDevice, VkSurfaceKHR surface, uint32_t* pPresentModeCount, VkPresentModeKHR* pPresentModes) nothrow;
alias PFN_vkGetPhysicalDeviceSurfaceSupportKHR = extern(Windows) VkResult function(VkPhysicalDevice physicalDevice, uint32_t queueFamilyIndex, VkSurfaceKHR surface, VkBool32* pSupported) nothrow;
alias PFN_vkGetPhysicalDeviceToolProperties = extern(Windows) VkResult function(VkPhysicalDevice physicalDevice, uint32_t* pToolCount, VkPhysicalDeviceToolProperties* pToolProperties) nothrow;
alias PFN_vkGetPhysicalDeviceToolPropertiesEXT = extern(Windows) VkResult function(VkPhysicalDevice physicalDevice, uint32_t* pToolCount, VkPhysicalDeviceToolProperties* pToolProperties) nothrow;
alias PFN_vkGetPhysicalDeviceWin32PresentationSupportKHR = extern(Windows) VkBool32 function(VkPhysicalDevice physicalDevice, uint32_t queueFamilyIndex) nothrow;
alias PFN_vkGetPipelineCacheData = extern(Windows) VkResult function(VkDevice device, VkPipelineCache pipelineCache, size_t* pDataSize, void* pData) nothrow;
alias PFN_vkGetPipelineExecutableInternalRepresentationsKHR = extern(Windows) VkResult function(VkDevice device, VkPipelineExecutableInfoKHR* pExecutableInfo, uint32_t* pInternalRepresentationCount, VkPipelineExecutableInternalRepresentationKHR* pInternalRepresentations) nothrow;
alias PFN_vkGetPipelineExecutablePropertiesKHR = extern(Windows) VkResult function(VkDevice device, VkPipelineInfoKHR* pPipelineInfo, uint32_t* pExecutableCount, VkPipelineExecutablePropertiesKHR* pProperties) nothrow;
alias PFN_vkGetPipelineExecutableStatisticsKHR = extern(Windows) VkResult function(VkDevice device, VkPipelineExecutableInfoKHR* pExecutableInfo, uint32_t* pStatisticCount, VkPipelineExecutableStatisticKHR* pStatistics) nothrow;
alias PFN_vkGetPrivateData = extern(Windows) void function(VkDevice device, VkObjectType objectType, uint64_t objectHandle, VkPrivateDataSlot privateDataSlot, uint64_t* pData) nothrow;
alias PFN_vkGetPrivateDataEXT = extern(Windows) void function(VkDevice device, VkObjectType objectType, uint64_t objectHandle, VkPrivateDataSlot privateDataSlot, uint64_t* pData) nothrow;
alias PFN_vkGetQueryPoolResults = extern(Windows) VkResult function(VkDevice device, VkQueryPool queryPool, uint32_t firstQuery, uint32_t queryCount, size_t dataSize, void* pData, VkDeviceSize stride, VkQueryResultFlags flags) nothrow;
alias PFN_vkGetQueueCheckpointData2NV = extern(Windows) void function(VkQueue queue, uint32_t* pCheckpointDataCount, VkCheckpointData2NV* pCheckpointData) nothrow;
alias PFN_vkGetQueueCheckpointDataNV = extern(Windows) void function(VkQueue queue, uint32_t* pCheckpointDataCount, VkCheckpointDataNV* pCheckpointData) nothrow;
alias PFN_vkGetRayTracingCaptureReplayShaderGroupHandlesKHR = extern(Windows) VkResult function(VkDevice device, VkPipeline pipeline, uint32_t firstGroup, uint32_t groupCount, size_t dataSize, void* pData) nothrow;
alias PFN_vkGetRayTracingShaderGroupHandlesKHR = extern(Windows) VkResult function(VkDevice device, VkPipeline pipeline, uint32_t firstGroup, uint32_t groupCount, size_t dataSize, void* pData) nothrow;
alias PFN_vkGetRayTracingShaderGroupHandlesNV = extern(Windows) VkResult function(VkDevice device, VkPipeline pipeline, uint32_t firstGroup, uint32_t groupCount, size_t dataSize, void* pData) nothrow;
alias PFN_vkGetRayTracingShaderGroupStackSizeKHR = extern(Windows) VkDeviceSize function(VkDevice device, VkPipeline pipeline, uint32_t group, VkShaderGroupShaderKHR groupShader) nothrow;
alias PFN_vkGetRefreshCycleDurationGOOGLE = extern(Windows) VkResult function(VkDevice device, VkSwapchainKHR swapchain, VkRefreshCycleDurationGOOGLE* pDisplayTimingProperties) nothrow;
alias PFN_vkGetRenderAreaGranularity = extern(Windows) void function(VkDevice device, VkRenderPass renderPass, VkExtent2D* pGranularity) nothrow;
alias PFN_vkGetSemaphoreCounterValue = extern(Windows) VkResult function(VkDevice device, VkSemaphore semaphore, uint64_t* pValue) nothrow;
alias PFN_vkGetSemaphoreCounterValueKHR = extern(Windows) VkResult function(VkDevice device, VkSemaphore semaphore, uint64_t* pValue) nothrow;
alias PFN_vkGetSemaphoreFdKHR = extern(Windows) VkResult function(VkDevice device, VkSemaphoreGetFdInfoKHR* pGetFdInfo, int* pFd) nothrow;
alias PFN_vkGetSemaphoreWin32HandleKHR = extern(Windows) VkResult function(VkDevice device, VkSemaphoreGetWin32HandleInfoKHR* pGetWin32HandleInfo, HANDLE* pHandle) nothrow;
alias PFN_vkGetShaderInfoAMD = extern(Windows) VkResult function(VkDevice device, VkPipeline pipeline, VkShaderStageFlagBits shaderStage, VkShaderInfoTypeAMD infoType, size_t* pInfoSize, void* pInfo) nothrow;
alias PFN_vkGetSwapchainCounterEXT = extern(Windows) VkResult function(VkDevice device, VkSwapchainKHR swapchain, VkSurfaceCounterFlagBitsEXT counter, uint64_t* pCounterValue) nothrow;
alias PFN_vkGetSwapchainImagesKHR = extern(Windows) VkResult function(VkDevice device, VkSwapchainKHR swapchain, uint32_t* pSwapchainImageCount, VkImage* pSwapchainImages) nothrow;
alias PFN_vkGetSwapchainStatusKHR = extern(Windows) VkResult function(VkDevice device, VkSwapchainKHR swapchain) nothrow;
alias PFN_vkGetValidationCacheDataEXT = extern(Windows) VkResult function(VkDevice device, VkValidationCacheEXT validationCache, size_t* pDataSize, void* pData) nothrow;
alias PFN_vkGetWinrtDisplayNV = extern(Windows) VkResult function(VkPhysicalDevice physicalDevice, uint32_t deviceRelativeId, VkDisplayKHR* pDisplay) nothrow;
alias PFN_vkImportFenceFdKHR = extern(Windows) VkResult function(VkDevice device, VkImportFenceFdInfoKHR* pImportFenceFdInfo) nothrow;
alias PFN_vkImportFenceWin32HandleKHR = extern(Windows) VkResult function(VkDevice device, VkImportFenceWin32HandleInfoKHR* pImportFenceWin32HandleInfo) nothrow;
alias PFN_vkImportSemaphoreFdKHR = extern(Windows) VkResult function(VkDevice device, VkImportSemaphoreFdInfoKHR* pImportSemaphoreFdInfo) nothrow;
alias PFN_vkImportSemaphoreWin32HandleKHR = extern(Windows) VkResult function(VkDevice device, VkImportSemaphoreWin32HandleInfoKHR* pImportSemaphoreWin32HandleInfo) nothrow;
alias PFN_vkInitializePerformanceApiINTEL = extern(Windows) VkResult function(VkDevice device, VkInitializePerformanceApiInfoINTEL* pInitializeInfo) nothrow;
alias PFN_vkInvalidateMappedMemoryRanges = extern(Windows) VkResult function(VkDevice device, uint32_t memoryRangeCount, VkMappedMemoryRange* pMemoryRanges) nothrow;
alias PFN_vkMapMemory = extern(Windows) VkResult function(VkDevice device, VkDeviceMemory memory, VkDeviceSize offset, VkDeviceSize size, VkMemoryMapFlags flags, void** ppData) nothrow;
alias PFN_vkMergePipelineCaches = extern(Windows) VkResult function(VkDevice device, VkPipelineCache dstCache, uint32_t srcCacheCount, VkPipelineCache* pSrcCaches) nothrow;
alias PFN_vkMergeValidationCachesEXT = extern(Windows) VkResult function(VkDevice device, VkValidationCacheEXT dstCache, uint32_t srcCacheCount, VkValidationCacheEXT* pSrcCaches) nothrow;
alias PFN_vkQueueBeginDebugUtilsLabelEXT = extern(Windows) void function(VkQueue queue, VkDebugUtilsLabelEXT* pLabelInfo) nothrow;
alias PFN_vkQueueBindSparse = extern(Windows) VkResult function(VkQueue queue, uint32_t bindInfoCount, VkBindSparseInfo* pBindInfo, VkFence fence) nothrow;
alias PFN_vkQueueEndDebugUtilsLabelEXT = extern(Windows) void function(VkQueue queue) nothrow;
alias PFN_vkQueueInsertDebugUtilsLabelEXT = extern(Windows) void function(VkQueue queue, VkDebugUtilsLabelEXT* pLabelInfo) nothrow;
alias PFN_vkQueuePresentKHR = extern(Windows) VkResult function(VkQueue queue, VkPresentInfoKHR* pPresentInfo) nothrow;
alias PFN_vkQueueSetPerformanceConfigurationINTEL = extern(Windows) VkResult function(VkQueue queue, VkPerformanceConfigurationINTEL configuration) nothrow;
alias PFN_vkQueueSubmit = extern(Windows) VkResult function(VkQueue queue, uint32_t submitCount, VkSubmitInfo* pSubmits, VkFence fence) nothrow;
alias PFN_vkQueueSubmit2 = extern(Windows) VkResult function(VkQueue queue, uint32_t submitCount, VkSubmitInfo2* pSubmits, VkFence fence) nothrow;
alias PFN_vkQueueSubmit2KHR = extern(Windows) VkResult function(VkQueue queue, uint32_t submitCount, VkSubmitInfo2* pSubmits, VkFence fence) nothrow;
alias PFN_vkQueueWaitIdle = extern(Windows) VkResult function(VkQueue queue) nothrow;
alias PFN_vkRegisterDeviceEventEXT = extern(Windows) VkResult function(VkDevice device, VkDeviceEventInfoEXT* pDeviceEventInfo, VkAllocationCallbacks* pAllocator, VkFence* pFence) nothrow;
alias PFN_vkRegisterDisplayEventEXT = extern(Windows) VkResult function(VkDevice device, VkDisplayKHR display, VkDisplayEventInfoEXT* pDisplayEventInfo, VkAllocationCallbacks* pAllocator, VkFence* pFence) nothrow;
alias PFN_vkReleaseDisplayEXT = extern(Windows) VkResult function(VkPhysicalDevice physicalDevice, VkDisplayKHR display) nothrow;
alias PFN_vkReleaseFullScreenExclusiveModeEXT = extern(Windows) VkResult function(VkDevice device, VkSwapchainKHR swapchain) nothrow;
alias PFN_vkReleasePerformanceConfigurationINTEL = extern(Windows) VkResult function(VkDevice device, VkPerformanceConfigurationINTEL configuration) nothrow;
alias PFN_vkReleaseProfilingLockKHR = extern(Windows) void function(VkDevice device) nothrow;
alias PFN_vkResetCommandBuffer = extern(Windows) VkResult function(VkCommandBuffer commandBuffer, VkCommandBufferResetFlags flags) nothrow;
alias PFN_vkResetCommandPool = extern(Windows) VkResult function(VkDevice device, VkCommandPool commandPool, VkCommandPoolResetFlags flags) nothrow;
alias PFN_vkResetDescriptorPool = extern(Windows) VkResult function(VkDevice device, VkDescriptorPool descriptorPool, VkDescriptorPoolResetFlags flags) nothrow;
alias PFN_vkResetEvent = extern(Windows) VkResult function(VkDevice device, VkEvent event) nothrow;
alias PFN_vkResetFences = extern(Windows) VkResult function(VkDevice device, uint32_t fenceCount, VkFence* pFences) nothrow;
alias PFN_vkResetQueryPool = extern(Windows) void function(VkDevice device, VkQueryPool queryPool, uint32_t firstQuery, uint32_t queryCount) nothrow;
alias PFN_vkResetQueryPoolEXT = extern(Windows) void function(VkDevice device, VkQueryPool queryPool, uint32_t firstQuery, uint32_t queryCount) nothrow;
alias PFN_vkSetDebugUtilsObjectNameEXT = extern(Windows) VkResult function(VkDevice device, VkDebugUtilsObjectNameInfoEXT* pNameInfo) nothrow;
alias PFN_vkSetDebugUtilsObjectTagEXT = extern(Windows) VkResult function(VkDevice device, VkDebugUtilsObjectTagInfoEXT* pTagInfo) nothrow;
alias PFN_vkSetDeviceMemoryPriorityEXT = extern(Windows) void function(VkDevice device, VkDeviceMemory memory, float priority) nothrow;
alias PFN_vkSetEvent = extern(Windows) VkResult function(VkDevice device, VkEvent event) nothrow;
alias PFN_vkSetHdrMetadataEXT = extern(Windows) void function(VkDevice device, uint32_t swapchainCount, VkSwapchainKHR* pSwapchains, VkHdrMetadataEXT* pMetadata) nothrow;
alias PFN_vkSetLocalDimmingAMD = extern(Windows) void function(VkDevice device, VkSwapchainKHR swapChain, VkBool32 localDimmingEnable) nothrow;
alias PFN_vkSetPrivateData = extern(Windows) VkResult function(VkDevice device, VkObjectType objectType, uint64_t objectHandle, VkPrivateDataSlot privateDataSlot, uint64_t data) nothrow;
alias PFN_vkSetPrivateDataEXT = extern(Windows) VkResult function(VkDevice device, VkObjectType objectType, uint64_t objectHandle, VkPrivateDataSlot privateDataSlot, uint64_t data) nothrow;
alias PFN_vkSignalSemaphore = extern(Windows) VkResult function(VkDevice device, VkSemaphoreSignalInfo* pSignalInfo) nothrow;
alias PFN_vkSignalSemaphoreKHR = extern(Windows) VkResult function(VkDevice device, VkSemaphoreSignalInfo* pSignalInfo) nothrow;
alias PFN_vkSubmitDebugUtilsMessageEXT = extern(Windows) void function(VkInstance instance, VkDebugUtilsMessageSeverityFlagBitsEXT messageSeverity, VkDebugUtilsMessageTypeFlagsEXT messageTypes, VkDebugUtilsMessengerCallbackDataEXT* pCallbackData) nothrow;
alias PFN_vkTrimCommandPool = extern(Windows) void function(VkDevice device, VkCommandPool commandPool, VkCommandPoolTrimFlags flags) nothrow;
alias PFN_vkTrimCommandPoolKHR = extern(Windows) void function(VkDevice device, VkCommandPool commandPool, VkCommandPoolTrimFlags flags) nothrow;
alias PFN_vkUninitializePerformanceApiINTEL = extern(Windows) void function(VkDevice device) nothrow;
alias PFN_vkUnmapMemory = extern(Windows) void function(VkDevice device, VkDeviceMemory memory) nothrow;
alias PFN_vkUpdateDescriptorSetWithTemplate = extern(Windows) void function(VkDevice device, VkDescriptorSet descriptorSet, VkDescriptorUpdateTemplate descriptorUpdateTemplate, void* pData) nothrow;
alias PFN_vkUpdateDescriptorSetWithTemplateKHR = extern(Windows) void function(VkDevice device, VkDescriptorSet descriptorSet, VkDescriptorUpdateTemplate descriptorUpdateTemplate, void* pData) nothrow;
alias PFN_vkUpdateDescriptorSets = extern(Windows) void function(VkDevice device, uint32_t descriptorWriteCount, VkWriteDescriptorSet* pDescriptorWrites, uint32_t descriptorCopyCount, VkCopyDescriptorSet* pDescriptorCopies) nothrow;
alias PFN_vkWaitForFences = extern(Windows) VkResult function(VkDevice device, uint32_t fenceCount, VkFence* pFences, VkBool32 waitAll, uint64_t timeout) nothrow;
alias PFN_vkWaitForPresentKHR = extern(Windows) VkResult function(VkDevice device, VkSwapchainKHR swapchain, uint64_t presentId, uint64_t timeout) nothrow;
alias PFN_vkWaitSemaphores = extern(Windows) VkResult function(VkDevice device, VkSemaphoreWaitInfo* pWaitInfo, uint64_t timeout) nothrow;
alias PFN_vkWaitSemaphoresKHR = extern(Windows) VkResult function(VkDevice device, VkSemaphoreWaitInfo* pWaitInfo, uint64_t timeout) nothrow;
alias PFN_vkWriteAccelerationStructuresPropertiesKHR = extern(Windows) VkResult function(VkDevice device, uint32_t accelerationStructureCount, VkAccelerationStructureKHR* pAccelerationStructures, VkQueryType queryType, size_t dataSize, void* pData, size_t stride) nothrow;

// Enums
enum VK_TRUE = 1;
enum VK_FALSE = 0;
enum VK_REMAINING_ARRAY_LAYERS = (~0U);
enum VK_REMAINING_MIP_LEVELS = (~0U);
enum VK_SUBPASS_EXTERNAL = (~0U);
enum VK_WHOLE_SIZE = (~0UL);
enum VK_NULL_HANDLE = null;
enum VK_QUEUE_FAMILY_IGNORED = (~0U);

enum VkAccelerationStructureBuildTypeKHR {
	VK_ACCELERATION_STRUCTURE_BUILD_TYPE_HOST_KHR = 0,
	VK_ACCELERATION_STRUCTURE_BUILD_TYPE_DEVICE_KHR = 1,
	VK_ACCELERATION_STRUCTURE_BUILD_TYPE_HOST_OR_DEVICE_KHR = 2,
	VK_ACCELERATION_STRUCTURE_BUILD_TYPE_MAX_ENUM_KHR = 0x7FFFFFFF,
}
enum : VkAccelerationStructureBuildTypeKHR {
	VK_ACCELERATION_STRUCTURE_BUILD_TYPE_HOST_KHR = VkAccelerationStructureBuildTypeKHR.VK_ACCELERATION_STRUCTURE_BUILD_TYPE_HOST_KHR,
	VK_ACCELERATION_STRUCTURE_BUILD_TYPE_DEVICE_KHR = VkAccelerationStructureBuildTypeKHR.VK_ACCELERATION_STRUCTURE_BUILD_TYPE_DEVICE_KHR,
	VK_ACCELERATION_STRUCTURE_BUILD_TYPE_HOST_OR_DEVICE_KHR = VkAccelerationStructureBuildTypeKHR.VK_ACCELERATION_STRUCTURE_BUILD_TYPE_HOST_OR_DEVICE_KHR,
	VK_ACCELERATION_STRUCTURE_BUILD_TYPE_MAX_ENUM_KHR = VkAccelerationStructureBuildTypeKHR.VK_ACCELERATION_STRUCTURE_BUILD_TYPE_MAX_ENUM_KHR,
}
enum VkAccelerationStructureCompatibilityKHR {
	VK_ACCELERATION_STRUCTURE_COMPATIBILITY_COMPATIBLE_KHR = 0,
	VK_ACCELERATION_STRUCTURE_COMPATIBILITY_INCOMPATIBLE_KHR = 1,
	VK_ACCELERATION_STRUCTURE_COMPATIBILITY_MAX_ENUM_KHR = 0x7FFFFFFF,
}
enum : VkAccelerationStructureCompatibilityKHR {
	VK_ACCELERATION_STRUCTURE_COMPATIBILITY_COMPATIBLE_KHR = VkAccelerationStructureCompatibilityKHR.VK_ACCELERATION_STRUCTURE_COMPATIBILITY_COMPATIBLE_KHR,
	VK_ACCELERATION_STRUCTURE_COMPATIBILITY_INCOMPATIBLE_KHR = VkAccelerationStructureCompatibilityKHR.VK_ACCELERATION_STRUCTURE_COMPATIBILITY_INCOMPATIBLE_KHR,
	VK_ACCELERATION_STRUCTURE_COMPATIBILITY_MAX_ENUM_KHR = VkAccelerationStructureCompatibilityKHR.VK_ACCELERATION_STRUCTURE_COMPATIBILITY_MAX_ENUM_KHR,
}
enum VkAccelerationStructureCreateFlagBitsKHR {
	VK_ACCELERATION_STRUCTURE_CREATE_DEVICE_ADDRESS_CAPTURE_REPLAY_BIT_KHR = 0x00000001,
	VK_ACCELERATION_STRUCTURE_CREATE_MOTION_BIT_NV = 0x00000004,
	VK_ACCELERATION_STRUCTURE_CREATE_FLAG_BITS_MAX_ENUM_KHR = 0x7FFFFFFF,
}
enum : VkAccelerationStructureCreateFlagBitsKHR {
	VK_ACCELERATION_STRUCTURE_CREATE_DEVICE_ADDRESS_CAPTURE_REPLAY_BIT_KHR = VkAccelerationStructureCreateFlagBitsKHR.VK_ACCELERATION_STRUCTURE_CREATE_DEVICE_ADDRESS_CAPTURE_REPLAY_BIT_KHR,
	VK_ACCELERATION_STRUCTURE_CREATE_MOTION_BIT_NV = VkAccelerationStructureCreateFlagBitsKHR.VK_ACCELERATION_STRUCTURE_CREATE_MOTION_BIT_NV,
	VK_ACCELERATION_STRUCTURE_CREATE_FLAG_BITS_MAX_ENUM_KHR = VkAccelerationStructureCreateFlagBitsKHR.VK_ACCELERATION_STRUCTURE_CREATE_FLAG_BITS_MAX_ENUM_KHR,
}
enum VkAccelerationStructureMemoryRequirementsTypeNV {
	VK_ACCELERATION_STRUCTURE_MEMORY_REQUIREMENTS_TYPE_OBJECT_NV = 0,
	VK_ACCELERATION_STRUCTURE_MEMORY_REQUIREMENTS_TYPE_BUILD_SCRATCH_NV = 1,
	VK_ACCELERATION_STRUCTURE_MEMORY_REQUIREMENTS_TYPE_UPDATE_SCRATCH_NV = 2,
	VK_ACCELERATION_STRUCTURE_MEMORY_REQUIREMENTS_TYPE_MAX_ENUM_NV = 0x7FFFFFFF,
}
enum : VkAccelerationStructureMemoryRequirementsTypeNV {
	VK_ACCELERATION_STRUCTURE_MEMORY_REQUIREMENTS_TYPE_OBJECT_NV = VkAccelerationStructureMemoryRequirementsTypeNV.VK_ACCELERATION_STRUCTURE_MEMORY_REQUIREMENTS_TYPE_OBJECT_NV,
	VK_ACCELERATION_STRUCTURE_MEMORY_REQUIREMENTS_TYPE_BUILD_SCRATCH_NV = VkAccelerationStructureMemoryRequirementsTypeNV.VK_ACCELERATION_STRUCTURE_MEMORY_REQUIREMENTS_TYPE_BUILD_SCRATCH_NV,
	VK_ACCELERATION_STRUCTURE_MEMORY_REQUIREMENTS_TYPE_UPDATE_SCRATCH_NV = VkAccelerationStructureMemoryRequirementsTypeNV.VK_ACCELERATION_STRUCTURE_MEMORY_REQUIREMENTS_TYPE_UPDATE_SCRATCH_NV,
	VK_ACCELERATION_STRUCTURE_MEMORY_REQUIREMENTS_TYPE_MAX_ENUM_NV = VkAccelerationStructureMemoryRequirementsTypeNV.VK_ACCELERATION_STRUCTURE_MEMORY_REQUIREMENTS_TYPE_MAX_ENUM_NV,
}
enum VkAccelerationStructureMotionInstanceTypeNV {
	VK_ACCELERATION_STRUCTURE_MOTION_INSTANCE_TYPE_STATIC_NV = 0,
	VK_ACCELERATION_STRUCTURE_MOTION_INSTANCE_TYPE_MATRIX_MOTION_NV = 1,
	VK_ACCELERATION_STRUCTURE_MOTION_INSTANCE_TYPE_SRT_MOTION_NV = 2,
	VK_ACCELERATION_STRUCTURE_MOTION_INSTANCE_TYPE_MAX_ENUM_NV = 0x7FFFFFFF,
}
enum : VkAccelerationStructureMotionInstanceTypeNV {
	VK_ACCELERATION_STRUCTURE_MOTION_INSTANCE_TYPE_STATIC_NV = VkAccelerationStructureMotionInstanceTypeNV.VK_ACCELERATION_STRUCTURE_MOTION_INSTANCE_TYPE_STATIC_NV,
	VK_ACCELERATION_STRUCTURE_MOTION_INSTANCE_TYPE_MATRIX_MOTION_NV = VkAccelerationStructureMotionInstanceTypeNV.VK_ACCELERATION_STRUCTURE_MOTION_INSTANCE_TYPE_MATRIX_MOTION_NV,
	VK_ACCELERATION_STRUCTURE_MOTION_INSTANCE_TYPE_SRT_MOTION_NV = VkAccelerationStructureMotionInstanceTypeNV.VK_ACCELERATION_STRUCTURE_MOTION_INSTANCE_TYPE_SRT_MOTION_NV,
	VK_ACCELERATION_STRUCTURE_MOTION_INSTANCE_TYPE_MAX_ENUM_NV = VkAccelerationStructureMotionInstanceTypeNV.VK_ACCELERATION_STRUCTURE_MOTION_INSTANCE_TYPE_MAX_ENUM_NV,
}
enum VkAccelerationStructureTypeKHR {
	VK_ACCELERATION_STRUCTURE_TYPE_TOP_LEVEL_KHR = 0,
	VK_ACCELERATION_STRUCTURE_TYPE_BOTTOM_LEVEL_KHR = 1,
	VK_ACCELERATION_STRUCTURE_TYPE_GENERIC_KHR = 2,
	VK_ACCELERATION_STRUCTURE_TYPE_TOP_LEVEL_NV = VK_ACCELERATION_STRUCTURE_TYPE_TOP_LEVEL_KHR,
	VK_ACCELERATION_STRUCTURE_TYPE_BOTTOM_LEVEL_NV = VK_ACCELERATION_STRUCTURE_TYPE_BOTTOM_LEVEL_KHR,
	VK_ACCELERATION_STRUCTURE_TYPE_MAX_ENUM_KHR = 0x7FFFFFFF,
}
enum : VkAccelerationStructureTypeKHR {
	VK_ACCELERATION_STRUCTURE_TYPE_TOP_LEVEL_KHR = VkAccelerationStructureTypeKHR.VK_ACCELERATION_STRUCTURE_TYPE_TOP_LEVEL_KHR,
	VK_ACCELERATION_STRUCTURE_TYPE_BOTTOM_LEVEL_KHR = VkAccelerationStructureTypeKHR.VK_ACCELERATION_STRUCTURE_TYPE_BOTTOM_LEVEL_KHR,
	VK_ACCELERATION_STRUCTURE_TYPE_GENERIC_KHR = VkAccelerationStructureTypeKHR.VK_ACCELERATION_STRUCTURE_TYPE_GENERIC_KHR,
	VK_ACCELERATION_STRUCTURE_TYPE_TOP_LEVEL_NV = VkAccelerationStructureTypeKHR.VK_ACCELERATION_STRUCTURE_TYPE_TOP_LEVEL_NV,
	VK_ACCELERATION_STRUCTURE_TYPE_BOTTOM_LEVEL_NV = VkAccelerationStructureTypeKHR.VK_ACCELERATION_STRUCTURE_TYPE_BOTTOM_LEVEL_NV,
	VK_ACCELERATION_STRUCTURE_TYPE_MAX_ENUM_KHR = VkAccelerationStructureTypeKHR.VK_ACCELERATION_STRUCTURE_TYPE_MAX_ENUM_KHR,
}
enum VkAccessFlagBits {
	VK_ACCESS_INDIRECT_COMMAND_READ_BIT = 0x00000001,
	VK_ACCESS_INDEX_READ_BIT = 0x00000002,
	VK_ACCESS_VERTEX_ATTRIBUTE_READ_BIT = 0x00000004,
	VK_ACCESS_UNIFORM_READ_BIT = 0x00000008,
	VK_ACCESS_INPUT_ATTACHMENT_READ_BIT = 0x00000010,
	VK_ACCESS_SHADER_READ_BIT = 0x00000020,
	VK_ACCESS_SHADER_WRITE_BIT = 0x00000040,
	VK_ACCESS_COLOR_ATTACHMENT_READ_BIT = 0x00000080,
	VK_ACCESS_COLOR_ATTACHMENT_WRITE_BIT = 0x00000100,
	VK_ACCESS_DEPTH_STENCIL_ATTACHMENT_READ_BIT = 0x00000200,
	VK_ACCESS_DEPTH_STENCIL_ATTACHMENT_WRITE_BIT = 0x00000400,
	VK_ACCESS_TRANSFER_READ_BIT = 0x00000800,
	VK_ACCESS_TRANSFER_WRITE_BIT = 0x00001000,
	VK_ACCESS_HOST_READ_BIT = 0x00002000,
	VK_ACCESS_HOST_WRITE_BIT = 0x00004000,
	VK_ACCESS_MEMORY_READ_BIT = 0x00008000,
	VK_ACCESS_MEMORY_WRITE_BIT = 0x00010000,
	VK_ACCESS_NONE = 0,
	VK_ACCESS_TRANSFORM_FEEDBACK_WRITE_BIT_EXT = 0x02000000,
	VK_ACCESS_TRANSFORM_FEEDBACK_COUNTER_READ_BIT_EXT = 0x04000000,
	VK_ACCESS_TRANSFORM_FEEDBACK_COUNTER_WRITE_BIT_EXT = 0x08000000,
	VK_ACCESS_CONDITIONAL_RENDERING_READ_BIT_EXT = 0x00100000,
	VK_ACCESS_COLOR_ATTACHMENT_READ_NONCOHERENT_BIT_EXT = 0x00080000,
	VK_ACCESS_ACCELERATION_STRUCTURE_READ_BIT_KHR = 0x00200000,
	VK_ACCESS_ACCELERATION_STRUCTURE_WRITE_BIT_KHR = 0x00400000,
	VK_ACCESS_FRAGMENT_DENSITY_MAP_READ_BIT_EXT = 0x01000000,
	VK_ACCESS_FRAGMENT_SHADING_RATE_ATTACHMENT_READ_BIT_KHR = 0x00800000,
	VK_ACCESS_COMMAND_PREPROCESS_READ_BIT_NV = 0x00020000,
	VK_ACCESS_COMMAND_PREPROCESS_WRITE_BIT_NV = 0x00040000,
	VK_ACCESS_SHADING_RATE_IMAGE_READ_BIT_NV = VK_ACCESS_FRAGMENT_SHADING_RATE_ATTACHMENT_READ_BIT_KHR,
	VK_ACCESS_ACCELERATION_STRUCTURE_READ_BIT_NV = VK_ACCESS_ACCELERATION_STRUCTURE_READ_BIT_KHR,
	VK_ACCESS_ACCELERATION_STRUCTURE_WRITE_BIT_NV = VK_ACCESS_ACCELERATION_STRUCTURE_WRITE_BIT_KHR,
	VK_ACCESS_NONE_KHR = VK_ACCESS_NONE,
	VK_ACCESS_FLAG_BITS_MAX_ENUM = 0x7FFFFFFF,
}
enum : VkAccessFlagBits {
	VK_ACCESS_INDIRECT_COMMAND_READ_BIT = VkAccessFlagBits.VK_ACCESS_INDIRECT_COMMAND_READ_BIT,
	VK_ACCESS_INDEX_READ_BIT = VkAccessFlagBits.VK_ACCESS_INDEX_READ_BIT,
	VK_ACCESS_VERTEX_ATTRIBUTE_READ_BIT = VkAccessFlagBits.VK_ACCESS_VERTEX_ATTRIBUTE_READ_BIT,
	VK_ACCESS_UNIFORM_READ_BIT = VkAccessFlagBits.VK_ACCESS_UNIFORM_READ_BIT,
	VK_ACCESS_INPUT_ATTACHMENT_READ_BIT = VkAccessFlagBits.VK_ACCESS_INPUT_ATTACHMENT_READ_BIT,
	VK_ACCESS_SHADER_READ_BIT = VkAccessFlagBits.VK_ACCESS_SHADER_READ_BIT,
	VK_ACCESS_SHADER_WRITE_BIT = VkAccessFlagBits.VK_ACCESS_SHADER_WRITE_BIT,
	VK_ACCESS_COLOR_ATTACHMENT_READ_BIT = VkAccessFlagBits.VK_ACCESS_COLOR_ATTACHMENT_READ_BIT,
	VK_ACCESS_COLOR_ATTACHMENT_WRITE_BIT = VkAccessFlagBits.VK_ACCESS_COLOR_ATTACHMENT_WRITE_BIT,
	VK_ACCESS_DEPTH_STENCIL_ATTACHMENT_READ_BIT = VkAccessFlagBits.VK_ACCESS_DEPTH_STENCIL_ATTACHMENT_READ_BIT,
	VK_ACCESS_DEPTH_STENCIL_ATTACHMENT_WRITE_BIT = VkAccessFlagBits.VK_ACCESS_DEPTH_STENCIL_ATTACHMENT_WRITE_BIT,
	VK_ACCESS_TRANSFER_READ_BIT = VkAccessFlagBits.VK_ACCESS_TRANSFER_READ_BIT,
	VK_ACCESS_TRANSFER_WRITE_BIT = VkAccessFlagBits.VK_ACCESS_TRANSFER_WRITE_BIT,
	VK_ACCESS_HOST_READ_BIT = VkAccessFlagBits.VK_ACCESS_HOST_READ_BIT,
	VK_ACCESS_HOST_WRITE_BIT = VkAccessFlagBits.VK_ACCESS_HOST_WRITE_BIT,
	VK_ACCESS_MEMORY_READ_BIT = VkAccessFlagBits.VK_ACCESS_MEMORY_READ_BIT,
	VK_ACCESS_MEMORY_WRITE_BIT = VkAccessFlagBits.VK_ACCESS_MEMORY_WRITE_BIT,
	VK_ACCESS_NONE = VkAccessFlagBits.VK_ACCESS_NONE,
	VK_ACCESS_TRANSFORM_FEEDBACK_WRITE_BIT_EXT = VkAccessFlagBits.VK_ACCESS_TRANSFORM_FEEDBACK_WRITE_BIT_EXT,
	VK_ACCESS_TRANSFORM_FEEDBACK_COUNTER_READ_BIT_EXT = VkAccessFlagBits.VK_ACCESS_TRANSFORM_FEEDBACK_COUNTER_READ_BIT_EXT,
	VK_ACCESS_TRANSFORM_FEEDBACK_COUNTER_WRITE_BIT_EXT = VkAccessFlagBits.VK_ACCESS_TRANSFORM_FEEDBACK_COUNTER_WRITE_BIT_EXT,
	VK_ACCESS_CONDITIONAL_RENDERING_READ_BIT_EXT = VkAccessFlagBits.VK_ACCESS_CONDITIONAL_RENDERING_READ_BIT_EXT,
	VK_ACCESS_COLOR_ATTACHMENT_READ_NONCOHERENT_BIT_EXT = VkAccessFlagBits.VK_ACCESS_COLOR_ATTACHMENT_READ_NONCOHERENT_BIT_EXT,
	VK_ACCESS_ACCELERATION_STRUCTURE_READ_BIT_KHR = VkAccessFlagBits.VK_ACCESS_ACCELERATION_STRUCTURE_READ_BIT_KHR,
	VK_ACCESS_ACCELERATION_STRUCTURE_WRITE_BIT_KHR = VkAccessFlagBits.VK_ACCESS_ACCELERATION_STRUCTURE_WRITE_BIT_KHR,
	VK_ACCESS_FRAGMENT_DENSITY_MAP_READ_BIT_EXT = VkAccessFlagBits.VK_ACCESS_FRAGMENT_DENSITY_MAP_READ_BIT_EXT,
	VK_ACCESS_FRAGMENT_SHADING_RATE_ATTACHMENT_READ_BIT_KHR = VkAccessFlagBits.VK_ACCESS_FRAGMENT_SHADING_RATE_ATTACHMENT_READ_BIT_KHR,
	VK_ACCESS_COMMAND_PREPROCESS_READ_BIT_NV = VkAccessFlagBits.VK_ACCESS_COMMAND_PREPROCESS_READ_BIT_NV,
	VK_ACCESS_COMMAND_PREPROCESS_WRITE_BIT_NV = VkAccessFlagBits.VK_ACCESS_COMMAND_PREPROCESS_WRITE_BIT_NV,
	VK_ACCESS_SHADING_RATE_IMAGE_READ_BIT_NV = VkAccessFlagBits.VK_ACCESS_SHADING_RATE_IMAGE_READ_BIT_NV,
	VK_ACCESS_ACCELERATION_STRUCTURE_READ_BIT_NV = VkAccessFlagBits.VK_ACCESS_ACCELERATION_STRUCTURE_READ_BIT_NV,
	VK_ACCESS_ACCELERATION_STRUCTURE_WRITE_BIT_NV = VkAccessFlagBits.VK_ACCESS_ACCELERATION_STRUCTURE_WRITE_BIT_NV,
	VK_ACCESS_NONE_KHR = VkAccessFlagBits.VK_ACCESS_NONE_KHR,
	VK_ACCESS_FLAG_BITS_MAX_ENUM = VkAccessFlagBits.VK_ACCESS_FLAG_BITS_MAX_ENUM,
}
enum VkAcquireProfilingLockFlagBitsKHR {
	VK_ACQUIRE_PROFILING_LOCK_FLAG_BITS_MAX_ENUM_KHR = 0x7FFFFFFF,
}
enum : VkAcquireProfilingLockFlagBitsKHR {
	VK_ACQUIRE_PROFILING_LOCK_FLAG_BITS_MAX_ENUM_KHR = VkAcquireProfilingLockFlagBitsKHR.VK_ACQUIRE_PROFILING_LOCK_FLAG_BITS_MAX_ENUM_KHR,
}
enum VkAttachmentDescriptionFlagBits {
	VK_ATTACHMENT_DESCRIPTION_MAY_ALIAS_BIT = 0x00000001,
	VK_ATTACHMENT_DESCRIPTION_FLAG_BITS_MAX_ENUM = 0x7FFFFFFF,
}
enum : VkAttachmentDescriptionFlagBits {
	VK_ATTACHMENT_DESCRIPTION_MAY_ALIAS_BIT = VkAttachmentDescriptionFlagBits.VK_ATTACHMENT_DESCRIPTION_MAY_ALIAS_BIT,
	VK_ATTACHMENT_DESCRIPTION_FLAG_BITS_MAX_ENUM = VkAttachmentDescriptionFlagBits.VK_ATTACHMENT_DESCRIPTION_FLAG_BITS_MAX_ENUM,
}
enum VkAttachmentLoadOp {
	VK_ATTACHMENT_LOAD_OP_LOAD = 0,
	VK_ATTACHMENT_LOAD_OP_CLEAR = 1,
	VK_ATTACHMENT_LOAD_OP_DONT_CARE = 2,
	VK_ATTACHMENT_LOAD_OP_NONE_EXT = 1000400000,
	VK_ATTACHMENT_LOAD_OP_MAX_ENUM = 0x7FFFFFFF,
}
enum : VkAttachmentLoadOp {
	VK_ATTACHMENT_LOAD_OP_LOAD = VkAttachmentLoadOp.VK_ATTACHMENT_LOAD_OP_LOAD,
	VK_ATTACHMENT_LOAD_OP_CLEAR = VkAttachmentLoadOp.VK_ATTACHMENT_LOAD_OP_CLEAR,
	VK_ATTACHMENT_LOAD_OP_DONT_CARE = VkAttachmentLoadOp.VK_ATTACHMENT_LOAD_OP_DONT_CARE,
	VK_ATTACHMENT_LOAD_OP_NONE_EXT = VkAttachmentLoadOp.VK_ATTACHMENT_LOAD_OP_NONE_EXT,
	VK_ATTACHMENT_LOAD_OP_MAX_ENUM = VkAttachmentLoadOp.VK_ATTACHMENT_LOAD_OP_MAX_ENUM,
}
enum VkAttachmentStoreOp {
	VK_ATTACHMENT_STORE_OP_STORE = 0,
	VK_ATTACHMENT_STORE_OP_DONT_CARE = 1,
	VK_ATTACHMENT_STORE_OP_NONE = 1000301000,
	VK_ATTACHMENT_STORE_OP_NONE_KHR = VK_ATTACHMENT_STORE_OP_NONE,
	VK_ATTACHMENT_STORE_OP_NONE_QCOM = VK_ATTACHMENT_STORE_OP_NONE,
	VK_ATTACHMENT_STORE_OP_NONE_EXT = VK_ATTACHMENT_STORE_OP_NONE,
	VK_ATTACHMENT_STORE_OP_MAX_ENUM = 0x7FFFFFFF,
}
enum : VkAttachmentStoreOp {
	VK_ATTACHMENT_STORE_OP_STORE = VkAttachmentStoreOp.VK_ATTACHMENT_STORE_OP_STORE,
	VK_ATTACHMENT_STORE_OP_DONT_CARE = VkAttachmentStoreOp.VK_ATTACHMENT_STORE_OP_DONT_CARE,
	VK_ATTACHMENT_STORE_OP_NONE = VkAttachmentStoreOp.VK_ATTACHMENT_STORE_OP_NONE,
	VK_ATTACHMENT_STORE_OP_NONE_KHR = VkAttachmentStoreOp.VK_ATTACHMENT_STORE_OP_NONE_KHR,
	VK_ATTACHMENT_STORE_OP_NONE_QCOM = VkAttachmentStoreOp.VK_ATTACHMENT_STORE_OP_NONE_QCOM,
	VK_ATTACHMENT_STORE_OP_NONE_EXT = VkAttachmentStoreOp.VK_ATTACHMENT_STORE_OP_NONE_EXT,
	VK_ATTACHMENT_STORE_OP_MAX_ENUM = VkAttachmentStoreOp.VK_ATTACHMENT_STORE_OP_MAX_ENUM,
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
enum : VkBlendFactor {
	VK_BLEND_FACTOR_ZERO = VkBlendFactor.VK_BLEND_FACTOR_ZERO,
	VK_BLEND_FACTOR_ONE = VkBlendFactor.VK_BLEND_FACTOR_ONE,
	VK_BLEND_FACTOR_SRC_COLOR = VkBlendFactor.VK_BLEND_FACTOR_SRC_COLOR,
	VK_BLEND_FACTOR_ONE_MINUS_SRC_COLOR = VkBlendFactor.VK_BLEND_FACTOR_ONE_MINUS_SRC_COLOR,
	VK_BLEND_FACTOR_DST_COLOR = VkBlendFactor.VK_BLEND_FACTOR_DST_COLOR,
	VK_BLEND_FACTOR_ONE_MINUS_DST_COLOR = VkBlendFactor.VK_BLEND_FACTOR_ONE_MINUS_DST_COLOR,
	VK_BLEND_FACTOR_SRC_ALPHA = VkBlendFactor.VK_BLEND_FACTOR_SRC_ALPHA,
	VK_BLEND_FACTOR_ONE_MINUS_SRC_ALPHA = VkBlendFactor.VK_BLEND_FACTOR_ONE_MINUS_SRC_ALPHA,
	VK_BLEND_FACTOR_DST_ALPHA = VkBlendFactor.VK_BLEND_FACTOR_DST_ALPHA,
	VK_BLEND_FACTOR_ONE_MINUS_DST_ALPHA = VkBlendFactor.VK_BLEND_FACTOR_ONE_MINUS_DST_ALPHA,
	VK_BLEND_FACTOR_CONSTANT_COLOR = VkBlendFactor.VK_BLEND_FACTOR_CONSTANT_COLOR,
	VK_BLEND_FACTOR_ONE_MINUS_CONSTANT_COLOR = VkBlendFactor.VK_BLEND_FACTOR_ONE_MINUS_CONSTANT_COLOR,
	VK_BLEND_FACTOR_CONSTANT_ALPHA = VkBlendFactor.VK_BLEND_FACTOR_CONSTANT_ALPHA,
	VK_BLEND_FACTOR_ONE_MINUS_CONSTANT_ALPHA = VkBlendFactor.VK_BLEND_FACTOR_ONE_MINUS_CONSTANT_ALPHA,
	VK_BLEND_FACTOR_SRC_ALPHA_SATURATE = VkBlendFactor.VK_BLEND_FACTOR_SRC_ALPHA_SATURATE,
	VK_BLEND_FACTOR_SRC1_COLOR = VkBlendFactor.VK_BLEND_FACTOR_SRC1_COLOR,
	VK_BLEND_FACTOR_ONE_MINUS_SRC1_COLOR = VkBlendFactor.VK_BLEND_FACTOR_ONE_MINUS_SRC1_COLOR,
	VK_BLEND_FACTOR_SRC1_ALPHA = VkBlendFactor.VK_BLEND_FACTOR_SRC1_ALPHA,
	VK_BLEND_FACTOR_ONE_MINUS_SRC1_ALPHA = VkBlendFactor.VK_BLEND_FACTOR_ONE_MINUS_SRC1_ALPHA,
	VK_BLEND_FACTOR_MAX_ENUM = VkBlendFactor.VK_BLEND_FACTOR_MAX_ENUM,
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
enum : VkBlendOp {
	VK_BLEND_OP_ADD = VkBlendOp.VK_BLEND_OP_ADD,
	VK_BLEND_OP_SUBTRACT = VkBlendOp.VK_BLEND_OP_SUBTRACT,
	VK_BLEND_OP_REVERSE_SUBTRACT = VkBlendOp.VK_BLEND_OP_REVERSE_SUBTRACT,
	VK_BLEND_OP_MIN = VkBlendOp.VK_BLEND_OP_MIN,
	VK_BLEND_OP_MAX = VkBlendOp.VK_BLEND_OP_MAX,
	VK_BLEND_OP_ZERO_EXT = VkBlendOp.VK_BLEND_OP_ZERO_EXT,
	VK_BLEND_OP_SRC_EXT = VkBlendOp.VK_BLEND_OP_SRC_EXT,
	VK_BLEND_OP_DST_EXT = VkBlendOp.VK_BLEND_OP_DST_EXT,
	VK_BLEND_OP_SRC_OVER_EXT = VkBlendOp.VK_BLEND_OP_SRC_OVER_EXT,
	VK_BLEND_OP_DST_OVER_EXT = VkBlendOp.VK_BLEND_OP_DST_OVER_EXT,
	VK_BLEND_OP_SRC_IN_EXT = VkBlendOp.VK_BLEND_OP_SRC_IN_EXT,
	VK_BLEND_OP_DST_IN_EXT = VkBlendOp.VK_BLEND_OP_DST_IN_EXT,
	VK_BLEND_OP_SRC_OUT_EXT = VkBlendOp.VK_BLEND_OP_SRC_OUT_EXT,
	VK_BLEND_OP_DST_OUT_EXT = VkBlendOp.VK_BLEND_OP_DST_OUT_EXT,
	VK_BLEND_OP_SRC_ATOP_EXT = VkBlendOp.VK_BLEND_OP_SRC_ATOP_EXT,
	VK_BLEND_OP_DST_ATOP_EXT = VkBlendOp.VK_BLEND_OP_DST_ATOP_EXT,
	VK_BLEND_OP_XOR_EXT = VkBlendOp.VK_BLEND_OP_XOR_EXT,
	VK_BLEND_OP_MULTIPLY_EXT = VkBlendOp.VK_BLEND_OP_MULTIPLY_EXT,
	VK_BLEND_OP_SCREEN_EXT = VkBlendOp.VK_BLEND_OP_SCREEN_EXT,
	VK_BLEND_OP_OVERLAY_EXT = VkBlendOp.VK_BLEND_OP_OVERLAY_EXT,
	VK_BLEND_OP_DARKEN_EXT = VkBlendOp.VK_BLEND_OP_DARKEN_EXT,
	VK_BLEND_OP_LIGHTEN_EXT = VkBlendOp.VK_BLEND_OP_LIGHTEN_EXT,
	VK_BLEND_OP_COLORDODGE_EXT = VkBlendOp.VK_BLEND_OP_COLORDODGE_EXT,
	VK_BLEND_OP_COLORBURN_EXT = VkBlendOp.VK_BLEND_OP_COLORBURN_EXT,
	VK_BLEND_OP_HARDLIGHT_EXT = VkBlendOp.VK_BLEND_OP_HARDLIGHT_EXT,
	VK_BLEND_OP_SOFTLIGHT_EXT = VkBlendOp.VK_BLEND_OP_SOFTLIGHT_EXT,
	VK_BLEND_OP_DIFFERENCE_EXT = VkBlendOp.VK_BLEND_OP_DIFFERENCE_EXT,
	VK_BLEND_OP_EXCLUSION_EXT = VkBlendOp.VK_BLEND_OP_EXCLUSION_EXT,
	VK_BLEND_OP_INVERT_EXT = VkBlendOp.VK_BLEND_OP_INVERT_EXT,
	VK_BLEND_OP_INVERT_RGB_EXT = VkBlendOp.VK_BLEND_OP_INVERT_RGB_EXT,
	VK_BLEND_OP_LINEARDODGE_EXT = VkBlendOp.VK_BLEND_OP_LINEARDODGE_EXT,
	VK_BLEND_OP_LINEARBURN_EXT = VkBlendOp.VK_BLEND_OP_LINEARBURN_EXT,
	VK_BLEND_OP_VIVIDLIGHT_EXT = VkBlendOp.VK_BLEND_OP_VIVIDLIGHT_EXT,
	VK_BLEND_OP_LINEARLIGHT_EXT = VkBlendOp.VK_BLEND_OP_LINEARLIGHT_EXT,
	VK_BLEND_OP_PINLIGHT_EXT = VkBlendOp.VK_BLEND_OP_PINLIGHT_EXT,
	VK_BLEND_OP_HARDMIX_EXT = VkBlendOp.VK_BLEND_OP_HARDMIX_EXT,
	VK_BLEND_OP_HSL_HUE_EXT = VkBlendOp.VK_BLEND_OP_HSL_HUE_EXT,
	VK_BLEND_OP_HSL_SATURATION_EXT = VkBlendOp.VK_BLEND_OP_HSL_SATURATION_EXT,
	VK_BLEND_OP_HSL_COLOR_EXT = VkBlendOp.VK_BLEND_OP_HSL_COLOR_EXT,
	VK_BLEND_OP_HSL_LUMINOSITY_EXT = VkBlendOp.VK_BLEND_OP_HSL_LUMINOSITY_EXT,
	VK_BLEND_OP_PLUS_EXT = VkBlendOp.VK_BLEND_OP_PLUS_EXT,
	VK_BLEND_OP_PLUS_CLAMPED_EXT = VkBlendOp.VK_BLEND_OP_PLUS_CLAMPED_EXT,
	VK_BLEND_OP_PLUS_CLAMPED_ALPHA_EXT = VkBlendOp.VK_BLEND_OP_PLUS_CLAMPED_ALPHA_EXT,
	VK_BLEND_OP_PLUS_DARKER_EXT = VkBlendOp.VK_BLEND_OP_PLUS_DARKER_EXT,
	VK_BLEND_OP_MINUS_EXT = VkBlendOp.VK_BLEND_OP_MINUS_EXT,
	VK_BLEND_OP_MINUS_CLAMPED_EXT = VkBlendOp.VK_BLEND_OP_MINUS_CLAMPED_EXT,
	VK_BLEND_OP_CONTRAST_EXT = VkBlendOp.VK_BLEND_OP_CONTRAST_EXT,
	VK_BLEND_OP_INVERT_OVG_EXT = VkBlendOp.VK_BLEND_OP_INVERT_OVG_EXT,
	VK_BLEND_OP_RED_EXT = VkBlendOp.VK_BLEND_OP_RED_EXT,
	VK_BLEND_OP_GREEN_EXT = VkBlendOp.VK_BLEND_OP_GREEN_EXT,
	VK_BLEND_OP_BLUE_EXT = VkBlendOp.VK_BLEND_OP_BLUE_EXT,
	VK_BLEND_OP_MAX_ENUM = VkBlendOp.VK_BLEND_OP_MAX_ENUM,
}
enum VkBlendOverlapEXT {
	VK_BLEND_OVERLAP_UNCORRELATED_EXT = 0,
	VK_BLEND_OVERLAP_DISJOINT_EXT = 1,
	VK_BLEND_OVERLAP_CONJOINT_EXT = 2,
	VK_BLEND_OVERLAP_MAX_ENUM_EXT = 0x7FFFFFFF,
}
enum : VkBlendOverlapEXT {
	VK_BLEND_OVERLAP_UNCORRELATED_EXT = VkBlendOverlapEXT.VK_BLEND_OVERLAP_UNCORRELATED_EXT,
	VK_BLEND_OVERLAP_DISJOINT_EXT = VkBlendOverlapEXT.VK_BLEND_OVERLAP_DISJOINT_EXT,
	VK_BLEND_OVERLAP_CONJOINT_EXT = VkBlendOverlapEXT.VK_BLEND_OVERLAP_CONJOINT_EXT,
	VK_BLEND_OVERLAP_MAX_ENUM_EXT = VkBlendOverlapEXT.VK_BLEND_OVERLAP_MAX_ENUM_EXT,
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
enum : VkBorderColor {
	VK_BORDER_COLOR_FLOAT_TRANSPARENT_BLACK = VkBorderColor.VK_BORDER_COLOR_FLOAT_TRANSPARENT_BLACK,
	VK_BORDER_COLOR_INT_TRANSPARENT_BLACK = VkBorderColor.VK_BORDER_COLOR_INT_TRANSPARENT_BLACK,
	VK_BORDER_COLOR_FLOAT_OPAQUE_BLACK = VkBorderColor.VK_BORDER_COLOR_FLOAT_OPAQUE_BLACK,
	VK_BORDER_COLOR_INT_OPAQUE_BLACK = VkBorderColor.VK_BORDER_COLOR_INT_OPAQUE_BLACK,
	VK_BORDER_COLOR_FLOAT_OPAQUE_WHITE = VkBorderColor.VK_BORDER_COLOR_FLOAT_OPAQUE_WHITE,
	VK_BORDER_COLOR_INT_OPAQUE_WHITE = VkBorderColor.VK_BORDER_COLOR_INT_OPAQUE_WHITE,
	VK_BORDER_COLOR_FLOAT_CUSTOM_EXT = VkBorderColor.VK_BORDER_COLOR_FLOAT_CUSTOM_EXT,
	VK_BORDER_COLOR_INT_CUSTOM_EXT = VkBorderColor.VK_BORDER_COLOR_INT_CUSTOM_EXT,
	VK_BORDER_COLOR_MAX_ENUM = VkBorderColor.VK_BORDER_COLOR_MAX_ENUM,
}
enum VkBufferCreateFlagBits {
	VK_BUFFER_CREATE_SPARSE_BINDING_BIT = 0x00000001,
	VK_BUFFER_CREATE_SPARSE_RESIDENCY_BIT = 0x00000002,
	VK_BUFFER_CREATE_SPARSE_ALIASED_BIT = 0x00000004,
	VK_BUFFER_CREATE_PROTECTED_BIT = 0x00000008,
	VK_BUFFER_CREATE_DEVICE_ADDRESS_CAPTURE_REPLAY_BIT = 0x00000010,
	VK_BUFFER_CREATE_DEVICE_ADDRESS_CAPTURE_REPLAY_BIT_EXT = VK_BUFFER_CREATE_DEVICE_ADDRESS_CAPTURE_REPLAY_BIT,
	VK_BUFFER_CREATE_DEVICE_ADDRESS_CAPTURE_REPLAY_BIT_KHR = VK_BUFFER_CREATE_DEVICE_ADDRESS_CAPTURE_REPLAY_BIT,
	VK_BUFFER_CREATE_FLAG_BITS_MAX_ENUM = 0x7FFFFFFF,
}
enum : VkBufferCreateFlagBits {
	VK_BUFFER_CREATE_SPARSE_BINDING_BIT = VkBufferCreateFlagBits.VK_BUFFER_CREATE_SPARSE_BINDING_BIT,
	VK_BUFFER_CREATE_SPARSE_RESIDENCY_BIT = VkBufferCreateFlagBits.VK_BUFFER_CREATE_SPARSE_RESIDENCY_BIT,
	VK_BUFFER_CREATE_SPARSE_ALIASED_BIT = VkBufferCreateFlagBits.VK_BUFFER_CREATE_SPARSE_ALIASED_BIT,
	VK_BUFFER_CREATE_PROTECTED_BIT = VkBufferCreateFlagBits.VK_BUFFER_CREATE_PROTECTED_BIT,
	VK_BUFFER_CREATE_DEVICE_ADDRESS_CAPTURE_REPLAY_BIT = VkBufferCreateFlagBits.VK_BUFFER_CREATE_DEVICE_ADDRESS_CAPTURE_REPLAY_BIT,
	VK_BUFFER_CREATE_DEVICE_ADDRESS_CAPTURE_REPLAY_BIT_EXT = VkBufferCreateFlagBits.VK_BUFFER_CREATE_DEVICE_ADDRESS_CAPTURE_REPLAY_BIT_EXT,
	VK_BUFFER_CREATE_DEVICE_ADDRESS_CAPTURE_REPLAY_BIT_KHR = VkBufferCreateFlagBits.VK_BUFFER_CREATE_DEVICE_ADDRESS_CAPTURE_REPLAY_BIT_KHR,
	VK_BUFFER_CREATE_FLAG_BITS_MAX_ENUM = VkBufferCreateFlagBits.VK_BUFFER_CREATE_FLAG_BITS_MAX_ENUM,
}
enum VkBufferUsageFlagBits {
	VK_BUFFER_USAGE_TRANSFER_SRC_BIT = 0x00000001,
	VK_BUFFER_USAGE_TRANSFER_DST_BIT = 0x00000002,
	VK_BUFFER_USAGE_UNIFORM_TEXEL_BUFFER_BIT = 0x00000004,
	VK_BUFFER_USAGE_STORAGE_TEXEL_BUFFER_BIT = 0x00000008,
	VK_BUFFER_USAGE_UNIFORM_BUFFER_BIT = 0x00000010,
	VK_BUFFER_USAGE_STORAGE_BUFFER_BIT = 0x00000020,
	VK_BUFFER_USAGE_INDEX_BUFFER_BIT = 0x00000040,
	VK_BUFFER_USAGE_VERTEX_BUFFER_BIT = 0x00000080,
	VK_BUFFER_USAGE_INDIRECT_BUFFER_BIT = 0x00000100,
	VK_BUFFER_USAGE_SHADER_DEVICE_ADDRESS_BIT = 0x00020000,
	VK_BUFFER_USAGE_TRANSFORM_FEEDBACK_BUFFER_BIT_EXT = 0x00000800,
	VK_BUFFER_USAGE_TRANSFORM_FEEDBACK_COUNTER_BUFFER_BIT_EXT = 0x00001000,
	VK_BUFFER_USAGE_CONDITIONAL_RENDERING_BIT_EXT = 0x00000200,
	VK_BUFFER_USAGE_ACCELERATION_STRUCTURE_BUILD_INPUT_READ_ONLY_BIT_KHR = 0x00080000,
	VK_BUFFER_USAGE_ACCELERATION_STRUCTURE_STORAGE_BIT_KHR = 0x00100000,
	VK_BUFFER_USAGE_SHADER_BINDING_TABLE_BIT_KHR = 0x00000400,
	VK_BUFFER_USAGE_RAY_TRACING_BIT_NV = VK_BUFFER_USAGE_SHADER_BINDING_TABLE_BIT_KHR,
	VK_BUFFER_USAGE_SHADER_DEVICE_ADDRESS_BIT_EXT = VK_BUFFER_USAGE_SHADER_DEVICE_ADDRESS_BIT,
	VK_BUFFER_USAGE_SHADER_DEVICE_ADDRESS_BIT_KHR = VK_BUFFER_USAGE_SHADER_DEVICE_ADDRESS_BIT,
	VK_BUFFER_USAGE_FLAG_BITS_MAX_ENUM = 0x7FFFFFFF,
}
enum : VkBufferUsageFlagBits {
	VK_BUFFER_USAGE_TRANSFER_SRC_BIT = VkBufferUsageFlagBits.VK_BUFFER_USAGE_TRANSFER_SRC_BIT,
	VK_BUFFER_USAGE_TRANSFER_DST_BIT = VkBufferUsageFlagBits.VK_BUFFER_USAGE_TRANSFER_DST_BIT,
	VK_BUFFER_USAGE_UNIFORM_TEXEL_BUFFER_BIT = VkBufferUsageFlagBits.VK_BUFFER_USAGE_UNIFORM_TEXEL_BUFFER_BIT,
	VK_BUFFER_USAGE_STORAGE_TEXEL_BUFFER_BIT = VkBufferUsageFlagBits.VK_BUFFER_USAGE_STORAGE_TEXEL_BUFFER_BIT,
	VK_BUFFER_USAGE_UNIFORM_BUFFER_BIT = VkBufferUsageFlagBits.VK_BUFFER_USAGE_UNIFORM_BUFFER_BIT,
	VK_BUFFER_USAGE_STORAGE_BUFFER_BIT = VkBufferUsageFlagBits.VK_BUFFER_USAGE_STORAGE_BUFFER_BIT,
	VK_BUFFER_USAGE_INDEX_BUFFER_BIT = VkBufferUsageFlagBits.VK_BUFFER_USAGE_INDEX_BUFFER_BIT,
	VK_BUFFER_USAGE_VERTEX_BUFFER_BIT = VkBufferUsageFlagBits.VK_BUFFER_USAGE_VERTEX_BUFFER_BIT,
	VK_BUFFER_USAGE_INDIRECT_BUFFER_BIT = VkBufferUsageFlagBits.VK_BUFFER_USAGE_INDIRECT_BUFFER_BIT,
	VK_BUFFER_USAGE_SHADER_DEVICE_ADDRESS_BIT = VkBufferUsageFlagBits.VK_BUFFER_USAGE_SHADER_DEVICE_ADDRESS_BIT,
	VK_BUFFER_USAGE_TRANSFORM_FEEDBACK_BUFFER_BIT_EXT = VkBufferUsageFlagBits.VK_BUFFER_USAGE_TRANSFORM_FEEDBACK_BUFFER_BIT_EXT,
	VK_BUFFER_USAGE_TRANSFORM_FEEDBACK_COUNTER_BUFFER_BIT_EXT = VkBufferUsageFlagBits.VK_BUFFER_USAGE_TRANSFORM_FEEDBACK_COUNTER_BUFFER_BIT_EXT,
	VK_BUFFER_USAGE_CONDITIONAL_RENDERING_BIT_EXT = VkBufferUsageFlagBits.VK_BUFFER_USAGE_CONDITIONAL_RENDERING_BIT_EXT,
	VK_BUFFER_USAGE_ACCELERATION_STRUCTURE_BUILD_INPUT_READ_ONLY_BIT_KHR = VkBufferUsageFlagBits.VK_BUFFER_USAGE_ACCELERATION_STRUCTURE_BUILD_INPUT_READ_ONLY_BIT_KHR,
	VK_BUFFER_USAGE_ACCELERATION_STRUCTURE_STORAGE_BIT_KHR = VkBufferUsageFlagBits.VK_BUFFER_USAGE_ACCELERATION_STRUCTURE_STORAGE_BIT_KHR,
	VK_BUFFER_USAGE_SHADER_BINDING_TABLE_BIT_KHR = VkBufferUsageFlagBits.VK_BUFFER_USAGE_SHADER_BINDING_TABLE_BIT_KHR,
	VK_BUFFER_USAGE_RAY_TRACING_BIT_NV = VkBufferUsageFlagBits.VK_BUFFER_USAGE_RAY_TRACING_BIT_NV,
	VK_BUFFER_USAGE_SHADER_DEVICE_ADDRESS_BIT_EXT = VkBufferUsageFlagBits.VK_BUFFER_USAGE_SHADER_DEVICE_ADDRESS_BIT_EXT,
	VK_BUFFER_USAGE_SHADER_DEVICE_ADDRESS_BIT_KHR = VkBufferUsageFlagBits.VK_BUFFER_USAGE_SHADER_DEVICE_ADDRESS_BIT_KHR,
	VK_BUFFER_USAGE_FLAG_BITS_MAX_ENUM = VkBufferUsageFlagBits.VK_BUFFER_USAGE_FLAG_BITS_MAX_ENUM,
}
enum VkBuildAccelerationStructureFlagBitsKHR {
	VK_BUILD_ACCELERATION_STRUCTURE_ALLOW_UPDATE_BIT_KHR = 0x00000001,
	VK_BUILD_ACCELERATION_STRUCTURE_ALLOW_COMPACTION_BIT_KHR = 0x00000002,
	VK_BUILD_ACCELERATION_STRUCTURE_PREFER_FAST_TRACE_BIT_KHR = 0x00000004,
	VK_BUILD_ACCELERATION_STRUCTURE_PREFER_FAST_BUILD_BIT_KHR = 0x00000008,
	VK_BUILD_ACCELERATION_STRUCTURE_LOW_MEMORY_BIT_KHR = 0x00000010,
	VK_BUILD_ACCELERATION_STRUCTURE_MOTION_BIT_NV = 0x00000020,
	VK_BUILD_ACCELERATION_STRUCTURE_ALLOW_UPDATE_BIT_NV = VK_BUILD_ACCELERATION_STRUCTURE_ALLOW_UPDATE_BIT_KHR,
	VK_BUILD_ACCELERATION_STRUCTURE_ALLOW_COMPACTION_BIT_NV = VK_BUILD_ACCELERATION_STRUCTURE_ALLOW_COMPACTION_BIT_KHR,
	VK_BUILD_ACCELERATION_STRUCTURE_PREFER_FAST_TRACE_BIT_NV = VK_BUILD_ACCELERATION_STRUCTURE_PREFER_FAST_TRACE_BIT_KHR,
	VK_BUILD_ACCELERATION_STRUCTURE_PREFER_FAST_BUILD_BIT_NV = VK_BUILD_ACCELERATION_STRUCTURE_PREFER_FAST_BUILD_BIT_KHR,
	VK_BUILD_ACCELERATION_STRUCTURE_LOW_MEMORY_BIT_NV = VK_BUILD_ACCELERATION_STRUCTURE_LOW_MEMORY_BIT_KHR,
	VK_BUILD_ACCELERATION_STRUCTURE_FLAG_BITS_MAX_ENUM_KHR = 0x7FFFFFFF,
}
enum : VkBuildAccelerationStructureFlagBitsKHR {
	VK_BUILD_ACCELERATION_STRUCTURE_ALLOW_UPDATE_BIT_KHR = VkBuildAccelerationStructureFlagBitsKHR.VK_BUILD_ACCELERATION_STRUCTURE_ALLOW_UPDATE_BIT_KHR,
	VK_BUILD_ACCELERATION_STRUCTURE_ALLOW_COMPACTION_BIT_KHR = VkBuildAccelerationStructureFlagBitsKHR.VK_BUILD_ACCELERATION_STRUCTURE_ALLOW_COMPACTION_BIT_KHR,
	VK_BUILD_ACCELERATION_STRUCTURE_PREFER_FAST_TRACE_BIT_KHR = VkBuildAccelerationStructureFlagBitsKHR.VK_BUILD_ACCELERATION_STRUCTURE_PREFER_FAST_TRACE_BIT_KHR,
	VK_BUILD_ACCELERATION_STRUCTURE_PREFER_FAST_BUILD_BIT_KHR = VkBuildAccelerationStructureFlagBitsKHR.VK_BUILD_ACCELERATION_STRUCTURE_PREFER_FAST_BUILD_BIT_KHR,
	VK_BUILD_ACCELERATION_STRUCTURE_LOW_MEMORY_BIT_KHR = VkBuildAccelerationStructureFlagBitsKHR.VK_BUILD_ACCELERATION_STRUCTURE_LOW_MEMORY_BIT_KHR,
	VK_BUILD_ACCELERATION_STRUCTURE_MOTION_BIT_NV = VkBuildAccelerationStructureFlagBitsKHR.VK_BUILD_ACCELERATION_STRUCTURE_MOTION_BIT_NV,
	VK_BUILD_ACCELERATION_STRUCTURE_ALLOW_UPDATE_BIT_NV = VkBuildAccelerationStructureFlagBitsKHR.VK_BUILD_ACCELERATION_STRUCTURE_ALLOW_UPDATE_BIT_NV,
	VK_BUILD_ACCELERATION_STRUCTURE_ALLOW_COMPACTION_BIT_NV = VkBuildAccelerationStructureFlagBitsKHR.VK_BUILD_ACCELERATION_STRUCTURE_ALLOW_COMPACTION_BIT_NV,
	VK_BUILD_ACCELERATION_STRUCTURE_PREFER_FAST_TRACE_BIT_NV = VkBuildAccelerationStructureFlagBitsKHR.VK_BUILD_ACCELERATION_STRUCTURE_PREFER_FAST_TRACE_BIT_NV,
	VK_BUILD_ACCELERATION_STRUCTURE_PREFER_FAST_BUILD_BIT_NV = VkBuildAccelerationStructureFlagBitsKHR.VK_BUILD_ACCELERATION_STRUCTURE_PREFER_FAST_BUILD_BIT_NV,
	VK_BUILD_ACCELERATION_STRUCTURE_LOW_MEMORY_BIT_NV = VkBuildAccelerationStructureFlagBitsKHR.VK_BUILD_ACCELERATION_STRUCTURE_LOW_MEMORY_BIT_NV,
	VK_BUILD_ACCELERATION_STRUCTURE_FLAG_BITS_MAX_ENUM_KHR = VkBuildAccelerationStructureFlagBitsKHR.VK_BUILD_ACCELERATION_STRUCTURE_FLAG_BITS_MAX_ENUM_KHR,
}
enum VkBuildAccelerationStructureModeKHR {
	VK_BUILD_ACCELERATION_STRUCTURE_MODE_BUILD_KHR = 0,
	VK_BUILD_ACCELERATION_STRUCTURE_MODE_UPDATE_KHR = 1,
	VK_BUILD_ACCELERATION_STRUCTURE_MODE_MAX_ENUM_KHR = 0x7FFFFFFF,
}
enum : VkBuildAccelerationStructureModeKHR {
	VK_BUILD_ACCELERATION_STRUCTURE_MODE_BUILD_KHR = VkBuildAccelerationStructureModeKHR.VK_BUILD_ACCELERATION_STRUCTURE_MODE_BUILD_KHR,
	VK_BUILD_ACCELERATION_STRUCTURE_MODE_UPDATE_KHR = VkBuildAccelerationStructureModeKHR.VK_BUILD_ACCELERATION_STRUCTURE_MODE_UPDATE_KHR,
	VK_BUILD_ACCELERATION_STRUCTURE_MODE_MAX_ENUM_KHR = VkBuildAccelerationStructureModeKHR.VK_BUILD_ACCELERATION_STRUCTURE_MODE_MAX_ENUM_KHR,
}
enum VkChromaLocation {
	VK_CHROMA_LOCATION_COSITED_EVEN = 0,
	VK_CHROMA_LOCATION_MIDPOINT = 1,
	VK_CHROMA_LOCATION_COSITED_EVEN_KHR = VK_CHROMA_LOCATION_COSITED_EVEN,
	VK_CHROMA_LOCATION_MIDPOINT_KHR = VK_CHROMA_LOCATION_MIDPOINT,
	VK_CHROMA_LOCATION_MAX_ENUM = 0x7FFFFFFF,
}
enum : VkChromaLocation {
	VK_CHROMA_LOCATION_COSITED_EVEN = VkChromaLocation.VK_CHROMA_LOCATION_COSITED_EVEN,
	VK_CHROMA_LOCATION_MIDPOINT = VkChromaLocation.VK_CHROMA_LOCATION_MIDPOINT,
	VK_CHROMA_LOCATION_COSITED_EVEN_KHR = VkChromaLocation.VK_CHROMA_LOCATION_COSITED_EVEN_KHR,
	VK_CHROMA_LOCATION_MIDPOINT_KHR = VkChromaLocation.VK_CHROMA_LOCATION_MIDPOINT_KHR,
	VK_CHROMA_LOCATION_MAX_ENUM = VkChromaLocation.VK_CHROMA_LOCATION_MAX_ENUM,
}
enum VkCoarseSampleOrderTypeNV {
	VK_COARSE_SAMPLE_ORDER_TYPE_DEFAULT_NV = 0,
	VK_COARSE_SAMPLE_ORDER_TYPE_CUSTOM_NV = 1,
	VK_COARSE_SAMPLE_ORDER_TYPE_PIXEL_MAJOR_NV = 2,
	VK_COARSE_SAMPLE_ORDER_TYPE_SAMPLE_MAJOR_NV = 3,
	VK_COARSE_SAMPLE_ORDER_TYPE_MAX_ENUM_NV = 0x7FFFFFFF,
}
enum : VkCoarseSampleOrderTypeNV {
	VK_COARSE_SAMPLE_ORDER_TYPE_DEFAULT_NV = VkCoarseSampleOrderTypeNV.VK_COARSE_SAMPLE_ORDER_TYPE_DEFAULT_NV,
	VK_COARSE_SAMPLE_ORDER_TYPE_CUSTOM_NV = VkCoarseSampleOrderTypeNV.VK_COARSE_SAMPLE_ORDER_TYPE_CUSTOM_NV,
	VK_COARSE_SAMPLE_ORDER_TYPE_PIXEL_MAJOR_NV = VkCoarseSampleOrderTypeNV.VK_COARSE_SAMPLE_ORDER_TYPE_PIXEL_MAJOR_NV,
	VK_COARSE_SAMPLE_ORDER_TYPE_SAMPLE_MAJOR_NV = VkCoarseSampleOrderTypeNV.VK_COARSE_SAMPLE_ORDER_TYPE_SAMPLE_MAJOR_NV,
	VK_COARSE_SAMPLE_ORDER_TYPE_MAX_ENUM_NV = VkCoarseSampleOrderTypeNV.VK_COARSE_SAMPLE_ORDER_TYPE_MAX_ENUM_NV,
}
enum VkColorComponentFlagBits {
	VK_COLOR_COMPONENT_R_BIT = 0x00000001,
	VK_COLOR_COMPONENT_G_BIT = 0x00000002,
	VK_COLOR_COMPONENT_B_BIT = 0x00000004,
	VK_COLOR_COMPONENT_A_BIT = 0x00000008,
	VK_COLOR_COMPONENT_FLAG_BITS_MAX_ENUM = 0x7FFFFFFF,
}
enum : VkColorComponentFlagBits {
	VK_COLOR_COMPONENT_R_BIT = VkColorComponentFlagBits.VK_COLOR_COMPONENT_R_BIT,
	VK_COLOR_COMPONENT_G_BIT = VkColorComponentFlagBits.VK_COLOR_COMPONENT_G_BIT,
	VK_COLOR_COMPONENT_B_BIT = VkColorComponentFlagBits.VK_COLOR_COMPONENT_B_BIT,
	VK_COLOR_COMPONENT_A_BIT = VkColorComponentFlagBits.VK_COLOR_COMPONENT_A_BIT,
	VK_COLOR_COMPONENT_FLAG_BITS_MAX_ENUM = VkColorComponentFlagBits.VK_COLOR_COMPONENT_FLAG_BITS_MAX_ENUM,
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
enum : VkColorSpaceKHR {
	VK_COLOR_SPACE_SRGB_NONLINEAR_KHR = VkColorSpaceKHR.VK_COLOR_SPACE_SRGB_NONLINEAR_KHR,
	VK_COLOR_SPACE_DISPLAY_P3_NONLINEAR_EXT = VkColorSpaceKHR.VK_COLOR_SPACE_DISPLAY_P3_NONLINEAR_EXT,
	VK_COLOR_SPACE_EXTENDED_SRGB_LINEAR_EXT = VkColorSpaceKHR.VK_COLOR_SPACE_EXTENDED_SRGB_LINEAR_EXT,
	VK_COLOR_SPACE_DISPLAY_P3_LINEAR_EXT = VkColorSpaceKHR.VK_COLOR_SPACE_DISPLAY_P3_LINEAR_EXT,
	VK_COLOR_SPACE_DCI_P3_NONLINEAR_EXT = VkColorSpaceKHR.VK_COLOR_SPACE_DCI_P3_NONLINEAR_EXT,
	VK_COLOR_SPACE_BT709_LINEAR_EXT = VkColorSpaceKHR.VK_COLOR_SPACE_BT709_LINEAR_EXT,
	VK_COLOR_SPACE_BT709_NONLINEAR_EXT = VkColorSpaceKHR.VK_COLOR_SPACE_BT709_NONLINEAR_EXT,
	VK_COLOR_SPACE_BT2020_LINEAR_EXT = VkColorSpaceKHR.VK_COLOR_SPACE_BT2020_LINEAR_EXT,
	VK_COLOR_SPACE_HDR10_ST2084_EXT = VkColorSpaceKHR.VK_COLOR_SPACE_HDR10_ST2084_EXT,
	VK_COLOR_SPACE_DOLBYVISION_EXT = VkColorSpaceKHR.VK_COLOR_SPACE_DOLBYVISION_EXT,
	VK_COLOR_SPACE_HDR10_HLG_EXT = VkColorSpaceKHR.VK_COLOR_SPACE_HDR10_HLG_EXT,
	VK_COLOR_SPACE_ADOBERGB_LINEAR_EXT = VkColorSpaceKHR.VK_COLOR_SPACE_ADOBERGB_LINEAR_EXT,
	VK_COLOR_SPACE_ADOBERGB_NONLINEAR_EXT = VkColorSpaceKHR.VK_COLOR_SPACE_ADOBERGB_NONLINEAR_EXT,
	VK_COLOR_SPACE_PASS_THROUGH_EXT = VkColorSpaceKHR.VK_COLOR_SPACE_PASS_THROUGH_EXT,
	VK_COLOR_SPACE_EXTENDED_SRGB_NONLINEAR_EXT = VkColorSpaceKHR.VK_COLOR_SPACE_EXTENDED_SRGB_NONLINEAR_EXT,
	VK_COLOR_SPACE_DISPLAY_NATIVE_AMD = VkColorSpaceKHR.VK_COLOR_SPACE_DISPLAY_NATIVE_AMD,
	VK_COLORSPACE_SRGB_NONLINEAR_KHR = VkColorSpaceKHR.VK_COLORSPACE_SRGB_NONLINEAR_KHR,
	VK_COLOR_SPACE_DCI_P3_LINEAR_EXT = VkColorSpaceKHR.VK_COLOR_SPACE_DCI_P3_LINEAR_EXT,
	VK_COLOR_SPACE_MAX_ENUM_KHR = VkColorSpaceKHR.VK_COLOR_SPACE_MAX_ENUM_KHR,
}
enum VkCommandBufferLevel {
	VK_COMMAND_BUFFER_LEVEL_PRIMARY = 0,
	VK_COMMAND_BUFFER_LEVEL_SECONDARY = 1,
	VK_COMMAND_BUFFER_LEVEL_MAX_ENUM = 0x7FFFFFFF,
}
enum : VkCommandBufferLevel {
	VK_COMMAND_BUFFER_LEVEL_PRIMARY = VkCommandBufferLevel.VK_COMMAND_BUFFER_LEVEL_PRIMARY,
	VK_COMMAND_BUFFER_LEVEL_SECONDARY = VkCommandBufferLevel.VK_COMMAND_BUFFER_LEVEL_SECONDARY,
	VK_COMMAND_BUFFER_LEVEL_MAX_ENUM = VkCommandBufferLevel.VK_COMMAND_BUFFER_LEVEL_MAX_ENUM,
}
enum VkCommandBufferResetFlagBits {
	VK_COMMAND_BUFFER_RESET_RELEASE_RESOURCES_BIT = 0x00000001,
	VK_COMMAND_BUFFER_RESET_FLAG_BITS_MAX_ENUM = 0x7FFFFFFF,
}
enum : VkCommandBufferResetFlagBits {
	VK_COMMAND_BUFFER_RESET_RELEASE_RESOURCES_BIT = VkCommandBufferResetFlagBits.VK_COMMAND_BUFFER_RESET_RELEASE_RESOURCES_BIT,
	VK_COMMAND_BUFFER_RESET_FLAG_BITS_MAX_ENUM = VkCommandBufferResetFlagBits.VK_COMMAND_BUFFER_RESET_FLAG_BITS_MAX_ENUM,
}
enum VkCommandBufferUsageFlagBits {
	VK_COMMAND_BUFFER_USAGE_ONE_TIME_SUBMIT_BIT = 0x00000001,
	VK_COMMAND_BUFFER_USAGE_RENDER_PASS_CONTINUE_BIT = 0x00000002,
	VK_COMMAND_BUFFER_USAGE_SIMULTANEOUS_USE_BIT = 0x00000004,
	VK_COMMAND_BUFFER_USAGE_FLAG_BITS_MAX_ENUM = 0x7FFFFFFF,
}
enum : VkCommandBufferUsageFlagBits {
	VK_COMMAND_BUFFER_USAGE_ONE_TIME_SUBMIT_BIT = VkCommandBufferUsageFlagBits.VK_COMMAND_BUFFER_USAGE_ONE_TIME_SUBMIT_BIT,
	VK_COMMAND_BUFFER_USAGE_RENDER_PASS_CONTINUE_BIT = VkCommandBufferUsageFlagBits.VK_COMMAND_BUFFER_USAGE_RENDER_PASS_CONTINUE_BIT,
	VK_COMMAND_BUFFER_USAGE_SIMULTANEOUS_USE_BIT = VkCommandBufferUsageFlagBits.VK_COMMAND_BUFFER_USAGE_SIMULTANEOUS_USE_BIT,
	VK_COMMAND_BUFFER_USAGE_FLAG_BITS_MAX_ENUM = VkCommandBufferUsageFlagBits.VK_COMMAND_BUFFER_USAGE_FLAG_BITS_MAX_ENUM,
}
enum VkCommandPoolCreateFlagBits {
	VK_COMMAND_POOL_CREATE_TRANSIENT_BIT = 0x00000001,
	VK_COMMAND_POOL_CREATE_RESET_COMMAND_BUFFER_BIT = 0x00000002,
	VK_COMMAND_POOL_CREATE_PROTECTED_BIT = 0x00000004,
	VK_COMMAND_POOL_CREATE_FLAG_BITS_MAX_ENUM = 0x7FFFFFFF,
}
enum : VkCommandPoolCreateFlagBits {
	VK_COMMAND_POOL_CREATE_TRANSIENT_BIT = VkCommandPoolCreateFlagBits.VK_COMMAND_POOL_CREATE_TRANSIENT_BIT,
	VK_COMMAND_POOL_CREATE_RESET_COMMAND_BUFFER_BIT = VkCommandPoolCreateFlagBits.VK_COMMAND_POOL_CREATE_RESET_COMMAND_BUFFER_BIT,
	VK_COMMAND_POOL_CREATE_PROTECTED_BIT = VkCommandPoolCreateFlagBits.VK_COMMAND_POOL_CREATE_PROTECTED_BIT,
	VK_COMMAND_POOL_CREATE_FLAG_BITS_MAX_ENUM = VkCommandPoolCreateFlagBits.VK_COMMAND_POOL_CREATE_FLAG_BITS_MAX_ENUM,
}
enum VkCommandPoolResetFlagBits {
	VK_COMMAND_POOL_RESET_RELEASE_RESOURCES_BIT = 0x00000001,
	VK_COMMAND_POOL_RESET_FLAG_BITS_MAX_ENUM = 0x7FFFFFFF,
}
enum : VkCommandPoolResetFlagBits {
	VK_COMMAND_POOL_RESET_RELEASE_RESOURCES_BIT = VkCommandPoolResetFlagBits.VK_COMMAND_POOL_RESET_RELEASE_RESOURCES_BIT,
	VK_COMMAND_POOL_RESET_FLAG_BITS_MAX_ENUM = VkCommandPoolResetFlagBits.VK_COMMAND_POOL_RESET_FLAG_BITS_MAX_ENUM,
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
enum : VkCompareOp {
	VK_COMPARE_OP_NEVER = VkCompareOp.VK_COMPARE_OP_NEVER,
	VK_COMPARE_OP_LESS = VkCompareOp.VK_COMPARE_OP_LESS,
	VK_COMPARE_OP_EQUAL = VkCompareOp.VK_COMPARE_OP_EQUAL,
	VK_COMPARE_OP_LESS_OR_EQUAL = VkCompareOp.VK_COMPARE_OP_LESS_OR_EQUAL,
	VK_COMPARE_OP_GREATER = VkCompareOp.VK_COMPARE_OP_GREATER,
	VK_COMPARE_OP_NOT_EQUAL = VkCompareOp.VK_COMPARE_OP_NOT_EQUAL,
	VK_COMPARE_OP_GREATER_OR_EQUAL = VkCompareOp.VK_COMPARE_OP_GREATER_OR_EQUAL,
	VK_COMPARE_OP_ALWAYS = VkCompareOp.VK_COMPARE_OP_ALWAYS,
	VK_COMPARE_OP_MAX_ENUM = VkCompareOp.VK_COMPARE_OP_MAX_ENUM,
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
enum : VkComponentSwizzle {
	VK_COMPONENT_SWIZZLE_IDENTITY = VkComponentSwizzle.VK_COMPONENT_SWIZZLE_IDENTITY,
	VK_COMPONENT_SWIZZLE_ZERO = VkComponentSwizzle.VK_COMPONENT_SWIZZLE_ZERO,
	VK_COMPONENT_SWIZZLE_ONE = VkComponentSwizzle.VK_COMPONENT_SWIZZLE_ONE,
	VK_COMPONENT_SWIZZLE_R = VkComponentSwizzle.VK_COMPONENT_SWIZZLE_R,
	VK_COMPONENT_SWIZZLE_G = VkComponentSwizzle.VK_COMPONENT_SWIZZLE_G,
	VK_COMPONENT_SWIZZLE_B = VkComponentSwizzle.VK_COMPONENT_SWIZZLE_B,
	VK_COMPONENT_SWIZZLE_A = VkComponentSwizzle.VK_COMPONENT_SWIZZLE_A,
	VK_COMPONENT_SWIZZLE_MAX_ENUM = VkComponentSwizzle.VK_COMPONENT_SWIZZLE_MAX_ENUM,
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
enum : VkComponentTypeNV {
	VK_COMPONENT_TYPE_FLOAT16_NV = VkComponentTypeNV.VK_COMPONENT_TYPE_FLOAT16_NV,
	VK_COMPONENT_TYPE_FLOAT32_NV = VkComponentTypeNV.VK_COMPONENT_TYPE_FLOAT32_NV,
	VK_COMPONENT_TYPE_FLOAT64_NV = VkComponentTypeNV.VK_COMPONENT_TYPE_FLOAT64_NV,
	VK_COMPONENT_TYPE_SINT8_NV = VkComponentTypeNV.VK_COMPONENT_TYPE_SINT8_NV,
	VK_COMPONENT_TYPE_SINT16_NV = VkComponentTypeNV.VK_COMPONENT_TYPE_SINT16_NV,
	VK_COMPONENT_TYPE_SINT32_NV = VkComponentTypeNV.VK_COMPONENT_TYPE_SINT32_NV,
	VK_COMPONENT_TYPE_SINT64_NV = VkComponentTypeNV.VK_COMPONENT_TYPE_SINT64_NV,
	VK_COMPONENT_TYPE_UINT8_NV = VkComponentTypeNV.VK_COMPONENT_TYPE_UINT8_NV,
	VK_COMPONENT_TYPE_UINT16_NV = VkComponentTypeNV.VK_COMPONENT_TYPE_UINT16_NV,
	VK_COMPONENT_TYPE_UINT32_NV = VkComponentTypeNV.VK_COMPONENT_TYPE_UINT32_NV,
	VK_COMPONENT_TYPE_UINT64_NV = VkComponentTypeNV.VK_COMPONENT_TYPE_UINT64_NV,
	VK_COMPONENT_TYPE_MAX_ENUM_NV = VkComponentTypeNV.VK_COMPONENT_TYPE_MAX_ENUM_NV,
}
enum VkCompositeAlphaFlagBitsKHR {
	VK_COMPOSITE_ALPHA_OPAQUE_BIT_KHR = 0x00000001,
	VK_COMPOSITE_ALPHA_PRE_MULTIPLIED_BIT_KHR = 0x00000002,
	VK_COMPOSITE_ALPHA_POST_MULTIPLIED_BIT_KHR = 0x00000004,
	VK_COMPOSITE_ALPHA_INHERIT_BIT_KHR = 0x00000008,
	VK_COMPOSITE_ALPHA_FLAG_BITS_MAX_ENUM_KHR = 0x7FFFFFFF,
}
enum : VkCompositeAlphaFlagBitsKHR {
	VK_COMPOSITE_ALPHA_OPAQUE_BIT_KHR = VkCompositeAlphaFlagBitsKHR.VK_COMPOSITE_ALPHA_OPAQUE_BIT_KHR,
	VK_COMPOSITE_ALPHA_PRE_MULTIPLIED_BIT_KHR = VkCompositeAlphaFlagBitsKHR.VK_COMPOSITE_ALPHA_PRE_MULTIPLIED_BIT_KHR,
	VK_COMPOSITE_ALPHA_POST_MULTIPLIED_BIT_KHR = VkCompositeAlphaFlagBitsKHR.VK_COMPOSITE_ALPHA_POST_MULTIPLIED_BIT_KHR,
	VK_COMPOSITE_ALPHA_INHERIT_BIT_KHR = VkCompositeAlphaFlagBitsKHR.VK_COMPOSITE_ALPHA_INHERIT_BIT_KHR,
	VK_COMPOSITE_ALPHA_FLAG_BITS_MAX_ENUM_KHR = VkCompositeAlphaFlagBitsKHR.VK_COMPOSITE_ALPHA_FLAG_BITS_MAX_ENUM_KHR,
}
enum VkConditionalRenderingFlagBitsEXT {
	VK_CONDITIONAL_RENDERING_INVERTED_BIT_EXT = 0x00000001,
	VK_CONDITIONAL_RENDERING_FLAG_BITS_MAX_ENUM_EXT = 0x7FFFFFFF,
}
enum : VkConditionalRenderingFlagBitsEXT {
	VK_CONDITIONAL_RENDERING_INVERTED_BIT_EXT = VkConditionalRenderingFlagBitsEXT.VK_CONDITIONAL_RENDERING_INVERTED_BIT_EXT,
	VK_CONDITIONAL_RENDERING_FLAG_BITS_MAX_ENUM_EXT = VkConditionalRenderingFlagBitsEXT.VK_CONDITIONAL_RENDERING_FLAG_BITS_MAX_ENUM_EXT,
}
enum VkConservativeRasterizationModeEXT {
	VK_CONSERVATIVE_RASTERIZATION_MODE_DISABLED_EXT = 0,
	VK_CONSERVATIVE_RASTERIZATION_MODE_OVERESTIMATE_EXT = 1,
	VK_CONSERVATIVE_RASTERIZATION_MODE_UNDERESTIMATE_EXT = 2,
	VK_CONSERVATIVE_RASTERIZATION_MODE_MAX_ENUM_EXT = 0x7FFFFFFF,
}
enum : VkConservativeRasterizationModeEXT {
	VK_CONSERVATIVE_RASTERIZATION_MODE_DISABLED_EXT = VkConservativeRasterizationModeEXT.VK_CONSERVATIVE_RASTERIZATION_MODE_DISABLED_EXT,
	VK_CONSERVATIVE_RASTERIZATION_MODE_OVERESTIMATE_EXT = VkConservativeRasterizationModeEXT.VK_CONSERVATIVE_RASTERIZATION_MODE_OVERESTIMATE_EXT,
	VK_CONSERVATIVE_RASTERIZATION_MODE_UNDERESTIMATE_EXT = VkConservativeRasterizationModeEXT.VK_CONSERVATIVE_RASTERIZATION_MODE_UNDERESTIMATE_EXT,
	VK_CONSERVATIVE_RASTERIZATION_MODE_MAX_ENUM_EXT = VkConservativeRasterizationModeEXT.VK_CONSERVATIVE_RASTERIZATION_MODE_MAX_ENUM_EXT,
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
enum : VkCopyAccelerationStructureModeKHR {
	VK_COPY_ACCELERATION_STRUCTURE_MODE_CLONE_KHR = VkCopyAccelerationStructureModeKHR.VK_COPY_ACCELERATION_STRUCTURE_MODE_CLONE_KHR,
	VK_COPY_ACCELERATION_STRUCTURE_MODE_COMPACT_KHR = VkCopyAccelerationStructureModeKHR.VK_COPY_ACCELERATION_STRUCTURE_MODE_COMPACT_KHR,
	VK_COPY_ACCELERATION_STRUCTURE_MODE_SERIALIZE_KHR = VkCopyAccelerationStructureModeKHR.VK_COPY_ACCELERATION_STRUCTURE_MODE_SERIALIZE_KHR,
	VK_COPY_ACCELERATION_STRUCTURE_MODE_DESERIALIZE_KHR = VkCopyAccelerationStructureModeKHR.VK_COPY_ACCELERATION_STRUCTURE_MODE_DESERIALIZE_KHR,
	VK_COPY_ACCELERATION_STRUCTURE_MODE_CLONE_NV = VkCopyAccelerationStructureModeKHR.VK_COPY_ACCELERATION_STRUCTURE_MODE_CLONE_NV,
	VK_COPY_ACCELERATION_STRUCTURE_MODE_COMPACT_NV = VkCopyAccelerationStructureModeKHR.VK_COPY_ACCELERATION_STRUCTURE_MODE_COMPACT_NV,
	VK_COPY_ACCELERATION_STRUCTURE_MODE_MAX_ENUM_KHR = VkCopyAccelerationStructureModeKHR.VK_COPY_ACCELERATION_STRUCTURE_MODE_MAX_ENUM_KHR,
}
enum VkCoverageModulationModeNV {
	VK_COVERAGE_MODULATION_MODE_NONE_NV = 0,
	VK_COVERAGE_MODULATION_MODE_RGB_NV = 1,
	VK_COVERAGE_MODULATION_MODE_ALPHA_NV = 2,
	VK_COVERAGE_MODULATION_MODE_RGBA_NV = 3,
	VK_COVERAGE_MODULATION_MODE_MAX_ENUM_NV = 0x7FFFFFFF,
}
enum : VkCoverageModulationModeNV {
	VK_COVERAGE_MODULATION_MODE_NONE_NV = VkCoverageModulationModeNV.VK_COVERAGE_MODULATION_MODE_NONE_NV,
	VK_COVERAGE_MODULATION_MODE_RGB_NV = VkCoverageModulationModeNV.VK_COVERAGE_MODULATION_MODE_RGB_NV,
	VK_COVERAGE_MODULATION_MODE_ALPHA_NV = VkCoverageModulationModeNV.VK_COVERAGE_MODULATION_MODE_ALPHA_NV,
	VK_COVERAGE_MODULATION_MODE_RGBA_NV = VkCoverageModulationModeNV.VK_COVERAGE_MODULATION_MODE_RGBA_NV,
	VK_COVERAGE_MODULATION_MODE_MAX_ENUM_NV = VkCoverageModulationModeNV.VK_COVERAGE_MODULATION_MODE_MAX_ENUM_NV,
}
enum VkCoverageReductionModeNV {
	VK_COVERAGE_REDUCTION_MODE_MERGE_NV = 0,
	VK_COVERAGE_REDUCTION_MODE_TRUNCATE_NV = 1,
	VK_COVERAGE_REDUCTION_MODE_MAX_ENUM_NV = 0x7FFFFFFF,
}
enum : VkCoverageReductionModeNV {
	VK_COVERAGE_REDUCTION_MODE_MERGE_NV = VkCoverageReductionModeNV.VK_COVERAGE_REDUCTION_MODE_MERGE_NV,
	VK_COVERAGE_REDUCTION_MODE_TRUNCATE_NV = VkCoverageReductionModeNV.VK_COVERAGE_REDUCTION_MODE_TRUNCATE_NV,
	VK_COVERAGE_REDUCTION_MODE_MAX_ENUM_NV = VkCoverageReductionModeNV.VK_COVERAGE_REDUCTION_MODE_MAX_ENUM_NV,
}
enum VkCullModeFlagBits {
	VK_CULL_MODE_NONE = 0,
	VK_CULL_MODE_FRONT_BIT = 0x00000001,
	VK_CULL_MODE_BACK_BIT = 0x00000002,
	VK_CULL_MODE_FRONT_AND_BACK = 0x00000003,
	VK_CULL_MODE_FLAG_BITS_MAX_ENUM = 0x7FFFFFFF,
}
enum : VkCullModeFlagBits {
	VK_CULL_MODE_NONE = VkCullModeFlagBits.VK_CULL_MODE_NONE,
	VK_CULL_MODE_FRONT_BIT = VkCullModeFlagBits.VK_CULL_MODE_FRONT_BIT,
	VK_CULL_MODE_BACK_BIT = VkCullModeFlagBits.VK_CULL_MODE_BACK_BIT,
	VK_CULL_MODE_FRONT_AND_BACK = VkCullModeFlagBits.VK_CULL_MODE_FRONT_AND_BACK,
	VK_CULL_MODE_FLAG_BITS_MAX_ENUM = VkCullModeFlagBits.VK_CULL_MODE_FLAG_BITS_MAX_ENUM,
}
enum VkDebugReportFlagBitsEXT {
	VK_DEBUG_REPORT_INFORMATION_BIT_EXT = 0x00000001,
	VK_DEBUG_REPORT_WARNING_BIT_EXT = 0x00000002,
	VK_DEBUG_REPORT_PERFORMANCE_WARNING_BIT_EXT = 0x00000004,
	VK_DEBUG_REPORT_ERROR_BIT_EXT = 0x00000008,
	VK_DEBUG_REPORT_DEBUG_BIT_EXT = 0x00000010,
	VK_DEBUG_REPORT_FLAG_BITS_MAX_ENUM_EXT = 0x7FFFFFFF,
}
enum : VkDebugReportFlagBitsEXT {
	VK_DEBUG_REPORT_INFORMATION_BIT_EXT = VkDebugReportFlagBitsEXT.VK_DEBUG_REPORT_INFORMATION_BIT_EXT,
	VK_DEBUG_REPORT_WARNING_BIT_EXT = VkDebugReportFlagBitsEXT.VK_DEBUG_REPORT_WARNING_BIT_EXT,
	VK_DEBUG_REPORT_PERFORMANCE_WARNING_BIT_EXT = VkDebugReportFlagBitsEXT.VK_DEBUG_REPORT_PERFORMANCE_WARNING_BIT_EXT,
	VK_DEBUG_REPORT_ERROR_BIT_EXT = VkDebugReportFlagBitsEXT.VK_DEBUG_REPORT_ERROR_BIT_EXT,
	VK_DEBUG_REPORT_DEBUG_BIT_EXT = VkDebugReportFlagBitsEXT.VK_DEBUG_REPORT_DEBUG_BIT_EXT,
	VK_DEBUG_REPORT_FLAG_BITS_MAX_ENUM_EXT = VkDebugReportFlagBitsEXT.VK_DEBUG_REPORT_FLAG_BITS_MAX_ENUM_EXT,
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
	VK_DEBUG_REPORT_OBJECT_TYPE_CU_MODULE_NVX_EXT = 1000029000,
	VK_DEBUG_REPORT_OBJECT_TYPE_CU_FUNCTION_NVX_EXT = 1000029001,
	VK_DEBUG_REPORT_OBJECT_TYPE_ACCELERATION_STRUCTURE_KHR_EXT = 1000150000,
	VK_DEBUG_REPORT_OBJECT_TYPE_ACCELERATION_STRUCTURE_NV_EXT = 1000165000,
	VK_DEBUG_REPORT_OBJECT_TYPE_BUFFER_COLLECTION_FUCHSIA_EXT = 1000366000,
	VK_DEBUG_REPORT_OBJECT_TYPE_DEBUG_REPORT_EXT = VK_DEBUG_REPORT_OBJECT_TYPE_DEBUG_REPORT_CALLBACK_EXT_EXT,
	VK_DEBUG_REPORT_OBJECT_TYPE_VALIDATION_CACHE_EXT = VK_DEBUG_REPORT_OBJECT_TYPE_VALIDATION_CACHE_EXT_EXT,
	VK_DEBUG_REPORT_OBJECT_TYPE_DESCRIPTOR_UPDATE_TEMPLATE_KHR_EXT = VK_DEBUG_REPORT_OBJECT_TYPE_DESCRIPTOR_UPDATE_TEMPLATE_EXT,
	VK_DEBUG_REPORT_OBJECT_TYPE_SAMPLER_YCBCR_CONVERSION_KHR_EXT = VK_DEBUG_REPORT_OBJECT_TYPE_SAMPLER_YCBCR_CONVERSION_EXT,
	VK_DEBUG_REPORT_OBJECT_TYPE_MAX_ENUM_EXT = 0x7FFFFFFF,
}
enum : VkDebugReportObjectTypeEXT {
	VK_DEBUG_REPORT_OBJECT_TYPE_UNKNOWN_EXT = VkDebugReportObjectTypeEXT.VK_DEBUG_REPORT_OBJECT_TYPE_UNKNOWN_EXT,
	VK_DEBUG_REPORT_OBJECT_TYPE_INSTANCE_EXT = VkDebugReportObjectTypeEXT.VK_DEBUG_REPORT_OBJECT_TYPE_INSTANCE_EXT,
	VK_DEBUG_REPORT_OBJECT_TYPE_PHYSICAL_DEVICE_EXT = VkDebugReportObjectTypeEXT.VK_DEBUG_REPORT_OBJECT_TYPE_PHYSICAL_DEVICE_EXT,
	VK_DEBUG_REPORT_OBJECT_TYPE_DEVICE_EXT = VkDebugReportObjectTypeEXT.VK_DEBUG_REPORT_OBJECT_TYPE_DEVICE_EXT,
	VK_DEBUG_REPORT_OBJECT_TYPE_QUEUE_EXT = VkDebugReportObjectTypeEXT.VK_DEBUG_REPORT_OBJECT_TYPE_QUEUE_EXT,
	VK_DEBUG_REPORT_OBJECT_TYPE_SEMAPHORE_EXT = VkDebugReportObjectTypeEXT.VK_DEBUG_REPORT_OBJECT_TYPE_SEMAPHORE_EXT,
	VK_DEBUG_REPORT_OBJECT_TYPE_COMMAND_BUFFER_EXT = VkDebugReportObjectTypeEXT.VK_DEBUG_REPORT_OBJECT_TYPE_COMMAND_BUFFER_EXT,
	VK_DEBUG_REPORT_OBJECT_TYPE_FENCE_EXT = VkDebugReportObjectTypeEXT.VK_DEBUG_REPORT_OBJECT_TYPE_FENCE_EXT,
	VK_DEBUG_REPORT_OBJECT_TYPE_DEVICE_MEMORY_EXT = VkDebugReportObjectTypeEXT.VK_DEBUG_REPORT_OBJECT_TYPE_DEVICE_MEMORY_EXT,
	VK_DEBUG_REPORT_OBJECT_TYPE_BUFFER_EXT = VkDebugReportObjectTypeEXT.VK_DEBUG_REPORT_OBJECT_TYPE_BUFFER_EXT,
	VK_DEBUG_REPORT_OBJECT_TYPE_IMAGE_EXT = VkDebugReportObjectTypeEXT.VK_DEBUG_REPORT_OBJECT_TYPE_IMAGE_EXT,
	VK_DEBUG_REPORT_OBJECT_TYPE_EVENT_EXT = VkDebugReportObjectTypeEXT.VK_DEBUG_REPORT_OBJECT_TYPE_EVENT_EXT,
	VK_DEBUG_REPORT_OBJECT_TYPE_QUERY_POOL_EXT = VkDebugReportObjectTypeEXT.VK_DEBUG_REPORT_OBJECT_TYPE_QUERY_POOL_EXT,
	VK_DEBUG_REPORT_OBJECT_TYPE_BUFFER_VIEW_EXT = VkDebugReportObjectTypeEXT.VK_DEBUG_REPORT_OBJECT_TYPE_BUFFER_VIEW_EXT,
	VK_DEBUG_REPORT_OBJECT_TYPE_IMAGE_VIEW_EXT = VkDebugReportObjectTypeEXT.VK_DEBUG_REPORT_OBJECT_TYPE_IMAGE_VIEW_EXT,
	VK_DEBUG_REPORT_OBJECT_TYPE_SHADER_MODULE_EXT = VkDebugReportObjectTypeEXT.VK_DEBUG_REPORT_OBJECT_TYPE_SHADER_MODULE_EXT,
	VK_DEBUG_REPORT_OBJECT_TYPE_PIPELINE_CACHE_EXT = VkDebugReportObjectTypeEXT.VK_DEBUG_REPORT_OBJECT_TYPE_PIPELINE_CACHE_EXT,
	VK_DEBUG_REPORT_OBJECT_TYPE_PIPELINE_LAYOUT_EXT = VkDebugReportObjectTypeEXT.VK_DEBUG_REPORT_OBJECT_TYPE_PIPELINE_LAYOUT_EXT,
	VK_DEBUG_REPORT_OBJECT_TYPE_RENDER_PASS_EXT = VkDebugReportObjectTypeEXT.VK_DEBUG_REPORT_OBJECT_TYPE_RENDER_PASS_EXT,
	VK_DEBUG_REPORT_OBJECT_TYPE_PIPELINE_EXT = VkDebugReportObjectTypeEXT.VK_DEBUG_REPORT_OBJECT_TYPE_PIPELINE_EXT,
	VK_DEBUG_REPORT_OBJECT_TYPE_DESCRIPTOR_SET_LAYOUT_EXT = VkDebugReportObjectTypeEXT.VK_DEBUG_REPORT_OBJECT_TYPE_DESCRIPTOR_SET_LAYOUT_EXT,
	VK_DEBUG_REPORT_OBJECT_TYPE_SAMPLER_EXT = VkDebugReportObjectTypeEXT.VK_DEBUG_REPORT_OBJECT_TYPE_SAMPLER_EXT,
	VK_DEBUG_REPORT_OBJECT_TYPE_DESCRIPTOR_POOL_EXT = VkDebugReportObjectTypeEXT.VK_DEBUG_REPORT_OBJECT_TYPE_DESCRIPTOR_POOL_EXT,
	VK_DEBUG_REPORT_OBJECT_TYPE_DESCRIPTOR_SET_EXT = VkDebugReportObjectTypeEXT.VK_DEBUG_REPORT_OBJECT_TYPE_DESCRIPTOR_SET_EXT,
	VK_DEBUG_REPORT_OBJECT_TYPE_FRAMEBUFFER_EXT = VkDebugReportObjectTypeEXT.VK_DEBUG_REPORT_OBJECT_TYPE_FRAMEBUFFER_EXT,
	VK_DEBUG_REPORT_OBJECT_TYPE_COMMAND_POOL_EXT = VkDebugReportObjectTypeEXT.VK_DEBUG_REPORT_OBJECT_TYPE_COMMAND_POOL_EXT,
	VK_DEBUG_REPORT_OBJECT_TYPE_SURFACE_KHR_EXT = VkDebugReportObjectTypeEXT.VK_DEBUG_REPORT_OBJECT_TYPE_SURFACE_KHR_EXT,
	VK_DEBUG_REPORT_OBJECT_TYPE_SWAPCHAIN_KHR_EXT = VkDebugReportObjectTypeEXT.VK_DEBUG_REPORT_OBJECT_TYPE_SWAPCHAIN_KHR_EXT,
	VK_DEBUG_REPORT_OBJECT_TYPE_DEBUG_REPORT_CALLBACK_EXT_EXT = VkDebugReportObjectTypeEXT.VK_DEBUG_REPORT_OBJECT_TYPE_DEBUG_REPORT_CALLBACK_EXT_EXT,
	VK_DEBUG_REPORT_OBJECT_TYPE_DISPLAY_KHR_EXT = VkDebugReportObjectTypeEXT.VK_DEBUG_REPORT_OBJECT_TYPE_DISPLAY_KHR_EXT,
	VK_DEBUG_REPORT_OBJECT_TYPE_DISPLAY_MODE_KHR_EXT = VkDebugReportObjectTypeEXT.VK_DEBUG_REPORT_OBJECT_TYPE_DISPLAY_MODE_KHR_EXT,
	VK_DEBUG_REPORT_OBJECT_TYPE_VALIDATION_CACHE_EXT_EXT = VkDebugReportObjectTypeEXT.VK_DEBUG_REPORT_OBJECT_TYPE_VALIDATION_CACHE_EXT_EXT,
	VK_DEBUG_REPORT_OBJECT_TYPE_SAMPLER_YCBCR_CONVERSION_EXT = VkDebugReportObjectTypeEXT.VK_DEBUG_REPORT_OBJECT_TYPE_SAMPLER_YCBCR_CONVERSION_EXT,
	VK_DEBUG_REPORT_OBJECT_TYPE_DESCRIPTOR_UPDATE_TEMPLATE_EXT = VkDebugReportObjectTypeEXT.VK_DEBUG_REPORT_OBJECT_TYPE_DESCRIPTOR_UPDATE_TEMPLATE_EXT,
	VK_DEBUG_REPORT_OBJECT_TYPE_CU_MODULE_NVX_EXT = VkDebugReportObjectTypeEXT.VK_DEBUG_REPORT_OBJECT_TYPE_CU_MODULE_NVX_EXT,
	VK_DEBUG_REPORT_OBJECT_TYPE_CU_FUNCTION_NVX_EXT = VkDebugReportObjectTypeEXT.VK_DEBUG_REPORT_OBJECT_TYPE_CU_FUNCTION_NVX_EXT,
	VK_DEBUG_REPORT_OBJECT_TYPE_ACCELERATION_STRUCTURE_KHR_EXT = VkDebugReportObjectTypeEXT.VK_DEBUG_REPORT_OBJECT_TYPE_ACCELERATION_STRUCTURE_KHR_EXT,
	VK_DEBUG_REPORT_OBJECT_TYPE_ACCELERATION_STRUCTURE_NV_EXT = VkDebugReportObjectTypeEXT.VK_DEBUG_REPORT_OBJECT_TYPE_ACCELERATION_STRUCTURE_NV_EXT,
	VK_DEBUG_REPORT_OBJECT_TYPE_BUFFER_COLLECTION_FUCHSIA_EXT = VkDebugReportObjectTypeEXT.VK_DEBUG_REPORT_OBJECT_TYPE_BUFFER_COLLECTION_FUCHSIA_EXT,
	VK_DEBUG_REPORT_OBJECT_TYPE_DEBUG_REPORT_EXT = VkDebugReportObjectTypeEXT.VK_DEBUG_REPORT_OBJECT_TYPE_DEBUG_REPORT_EXT,
	VK_DEBUG_REPORT_OBJECT_TYPE_VALIDATION_CACHE_EXT = VkDebugReportObjectTypeEXT.VK_DEBUG_REPORT_OBJECT_TYPE_VALIDATION_CACHE_EXT,
	VK_DEBUG_REPORT_OBJECT_TYPE_DESCRIPTOR_UPDATE_TEMPLATE_KHR_EXT = VkDebugReportObjectTypeEXT.VK_DEBUG_REPORT_OBJECT_TYPE_DESCRIPTOR_UPDATE_TEMPLATE_KHR_EXT,
	VK_DEBUG_REPORT_OBJECT_TYPE_SAMPLER_YCBCR_CONVERSION_KHR_EXT = VkDebugReportObjectTypeEXT.VK_DEBUG_REPORT_OBJECT_TYPE_SAMPLER_YCBCR_CONVERSION_KHR_EXT,
	VK_DEBUG_REPORT_OBJECT_TYPE_MAX_ENUM_EXT = VkDebugReportObjectTypeEXT.VK_DEBUG_REPORT_OBJECT_TYPE_MAX_ENUM_EXT,
}
enum VkDebugUtilsMessageSeverityFlagBitsEXT {
	VK_DEBUG_UTILS_MESSAGE_SEVERITY_VERBOSE_BIT_EXT = 0x00000001,
	VK_DEBUG_UTILS_MESSAGE_SEVERITY_INFO_BIT_EXT = 0x00000010,
	VK_DEBUG_UTILS_MESSAGE_SEVERITY_WARNING_BIT_EXT = 0x00000100,
	VK_DEBUG_UTILS_MESSAGE_SEVERITY_ERROR_BIT_EXT = 0x00001000,
	VK_DEBUG_UTILS_MESSAGE_SEVERITY_FLAG_BITS_MAX_ENUM_EXT = 0x7FFFFFFF,
}
enum : VkDebugUtilsMessageSeverityFlagBitsEXT {
	VK_DEBUG_UTILS_MESSAGE_SEVERITY_VERBOSE_BIT_EXT = VkDebugUtilsMessageSeverityFlagBitsEXT.VK_DEBUG_UTILS_MESSAGE_SEVERITY_VERBOSE_BIT_EXT,
	VK_DEBUG_UTILS_MESSAGE_SEVERITY_INFO_BIT_EXT = VkDebugUtilsMessageSeverityFlagBitsEXT.VK_DEBUG_UTILS_MESSAGE_SEVERITY_INFO_BIT_EXT,
	VK_DEBUG_UTILS_MESSAGE_SEVERITY_WARNING_BIT_EXT = VkDebugUtilsMessageSeverityFlagBitsEXT.VK_DEBUG_UTILS_MESSAGE_SEVERITY_WARNING_BIT_EXT,
	VK_DEBUG_UTILS_MESSAGE_SEVERITY_ERROR_BIT_EXT = VkDebugUtilsMessageSeverityFlagBitsEXT.VK_DEBUG_UTILS_MESSAGE_SEVERITY_ERROR_BIT_EXT,
	VK_DEBUG_UTILS_MESSAGE_SEVERITY_FLAG_BITS_MAX_ENUM_EXT = VkDebugUtilsMessageSeverityFlagBitsEXT.VK_DEBUG_UTILS_MESSAGE_SEVERITY_FLAG_BITS_MAX_ENUM_EXT,
}
enum VkDebugUtilsMessageTypeFlagBitsEXT {
	VK_DEBUG_UTILS_MESSAGE_TYPE_GENERAL_BIT_EXT = 0x00000001,
	VK_DEBUG_UTILS_MESSAGE_TYPE_VALIDATION_BIT_EXT = 0x00000002,
	VK_DEBUG_UTILS_MESSAGE_TYPE_PERFORMANCE_BIT_EXT = 0x00000004,
	VK_DEBUG_UTILS_MESSAGE_TYPE_FLAG_BITS_MAX_ENUM_EXT = 0x7FFFFFFF,
}
enum : VkDebugUtilsMessageTypeFlagBitsEXT {
	VK_DEBUG_UTILS_MESSAGE_TYPE_GENERAL_BIT_EXT = VkDebugUtilsMessageTypeFlagBitsEXT.VK_DEBUG_UTILS_MESSAGE_TYPE_GENERAL_BIT_EXT,
	VK_DEBUG_UTILS_MESSAGE_TYPE_VALIDATION_BIT_EXT = VkDebugUtilsMessageTypeFlagBitsEXT.VK_DEBUG_UTILS_MESSAGE_TYPE_VALIDATION_BIT_EXT,
	VK_DEBUG_UTILS_MESSAGE_TYPE_PERFORMANCE_BIT_EXT = VkDebugUtilsMessageTypeFlagBitsEXT.VK_DEBUG_UTILS_MESSAGE_TYPE_PERFORMANCE_BIT_EXT,
	VK_DEBUG_UTILS_MESSAGE_TYPE_FLAG_BITS_MAX_ENUM_EXT = VkDebugUtilsMessageTypeFlagBitsEXT.VK_DEBUG_UTILS_MESSAGE_TYPE_FLAG_BITS_MAX_ENUM_EXT,
}
enum VkDependencyFlagBits {
	VK_DEPENDENCY_BY_REGION_BIT = 0x00000001,
	VK_DEPENDENCY_DEVICE_GROUP_BIT = 0x00000004,
	VK_DEPENDENCY_VIEW_LOCAL_BIT = 0x00000002,
	VK_DEPENDENCY_VIEW_LOCAL_BIT_KHR = VK_DEPENDENCY_VIEW_LOCAL_BIT,
	VK_DEPENDENCY_DEVICE_GROUP_BIT_KHR = VK_DEPENDENCY_DEVICE_GROUP_BIT,
	VK_DEPENDENCY_FLAG_BITS_MAX_ENUM = 0x7FFFFFFF,
}
enum : VkDependencyFlagBits {
	VK_DEPENDENCY_BY_REGION_BIT = VkDependencyFlagBits.VK_DEPENDENCY_BY_REGION_BIT,
	VK_DEPENDENCY_DEVICE_GROUP_BIT = VkDependencyFlagBits.VK_DEPENDENCY_DEVICE_GROUP_BIT,
	VK_DEPENDENCY_VIEW_LOCAL_BIT = VkDependencyFlagBits.VK_DEPENDENCY_VIEW_LOCAL_BIT,
	VK_DEPENDENCY_VIEW_LOCAL_BIT_KHR = VkDependencyFlagBits.VK_DEPENDENCY_VIEW_LOCAL_BIT_KHR,
	VK_DEPENDENCY_DEVICE_GROUP_BIT_KHR = VkDependencyFlagBits.VK_DEPENDENCY_DEVICE_GROUP_BIT_KHR,
	VK_DEPENDENCY_FLAG_BITS_MAX_ENUM = VkDependencyFlagBits.VK_DEPENDENCY_FLAG_BITS_MAX_ENUM,
}
enum VkDescriptorBindingFlagBits {
	VK_DESCRIPTOR_BINDING_UPDATE_AFTER_BIND_BIT = 0x00000001,
	VK_DESCRIPTOR_BINDING_UPDATE_UNUSED_WHILE_PENDING_BIT = 0x00000002,
	VK_DESCRIPTOR_BINDING_PARTIALLY_BOUND_BIT = 0x00000004,
	VK_DESCRIPTOR_BINDING_VARIABLE_DESCRIPTOR_COUNT_BIT = 0x00000008,
	VK_DESCRIPTOR_BINDING_UPDATE_AFTER_BIND_BIT_EXT = VK_DESCRIPTOR_BINDING_UPDATE_AFTER_BIND_BIT,
	VK_DESCRIPTOR_BINDING_UPDATE_UNUSED_WHILE_PENDING_BIT_EXT = VK_DESCRIPTOR_BINDING_UPDATE_UNUSED_WHILE_PENDING_BIT,
	VK_DESCRIPTOR_BINDING_PARTIALLY_BOUND_BIT_EXT = VK_DESCRIPTOR_BINDING_PARTIALLY_BOUND_BIT,
	VK_DESCRIPTOR_BINDING_VARIABLE_DESCRIPTOR_COUNT_BIT_EXT = VK_DESCRIPTOR_BINDING_VARIABLE_DESCRIPTOR_COUNT_BIT,
	VK_DESCRIPTOR_BINDING_FLAG_BITS_MAX_ENUM = 0x7FFFFFFF,
}
enum : VkDescriptorBindingFlagBits {
	VK_DESCRIPTOR_BINDING_UPDATE_AFTER_BIND_BIT = VkDescriptorBindingFlagBits.VK_DESCRIPTOR_BINDING_UPDATE_AFTER_BIND_BIT,
	VK_DESCRIPTOR_BINDING_UPDATE_UNUSED_WHILE_PENDING_BIT = VkDescriptorBindingFlagBits.VK_DESCRIPTOR_BINDING_UPDATE_UNUSED_WHILE_PENDING_BIT,
	VK_DESCRIPTOR_BINDING_PARTIALLY_BOUND_BIT = VkDescriptorBindingFlagBits.VK_DESCRIPTOR_BINDING_PARTIALLY_BOUND_BIT,
	VK_DESCRIPTOR_BINDING_VARIABLE_DESCRIPTOR_COUNT_BIT = VkDescriptorBindingFlagBits.VK_DESCRIPTOR_BINDING_VARIABLE_DESCRIPTOR_COUNT_BIT,
	VK_DESCRIPTOR_BINDING_UPDATE_AFTER_BIND_BIT_EXT = VkDescriptorBindingFlagBits.VK_DESCRIPTOR_BINDING_UPDATE_AFTER_BIND_BIT_EXT,
	VK_DESCRIPTOR_BINDING_UPDATE_UNUSED_WHILE_PENDING_BIT_EXT = VkDescriptorBindingFlagBits.VK_DESCRIPTOR_BINDING_UPDATE_UNUSED_WHILE_PENDING_BIT_EXT,
	VK_DESCRIPTOR_BINDING_PARTIALLY_BOUND_BIT_EXT = VkDescriptorBindingFlagBits.VK_DESCRIPTOR_BINDING_PARTIALLY_BOUND_BIT_EXT,
	VK_DESCRIPTOR_BINDING_VARIABLE_DESCRIPTOR_COUNT_BIT_EXT = VkDescriptorBindingFlagBits.VK_DESCRIPTOR_BINDING_VARIABLE_DESCRIPTOR_COUNT_BIT_EXT,
	VK_DESCRIPTOR_BINDING_FLAG_BITS_MAX_ENUM = VkDescriptorBindingFlagBits.VK_DESCRIPTOR_BINDING_FLAG_BITS_MAX_ENUM,
}
enum VkDescriptorPoolCreateFlagBits {
	VK_DESCRIPTOR_POOL_CREATE_FREE_DESCRIPTOR_SET_BIT = 0x00000001,
	VK_DESCRIPTOR_POOL_CREATE_UPDATE_AFTER_BIND_BIT = 0x00000002,
	VK_DESCRIPTOR_POOL_CREATE_HOST_ONLY_BIT_VALVE = 0x00000004,
	VK_DESCRIPTOR_POOL_CREATE_UPDATE_AFTER_BIND_BIT_EXT = VK_DESCRIPTOR_POOL_CREATE_UPDATE_AFTER_BIND_BIT,
	VK_DESCRIPTOR_POOL_CREATE_FLAG_BITS_MAX_ENUM = 0x7FFFFFFF,
}
enum : VkDescriptorPoolCreateFlagBits {
	VK_DESCRIPTOR_POOL_CREATE_FREE_DESCRIPTOR_SET_BIT = VkDescriptorPoolCreateFlagBits.VK_DESCRIPTOR_POOL_CREATE_FREE_DESCRIPTOR_SET_BIT,
	VK_DESCRIPTOR_POOL_CREATE_UPDATE_AFTER_BIND_BIT = VkDescriptorPoolCreateFlagBits.VK_DESCRIPTOR_POOL_CREATE_UPDATE_AFTER_BIND_BIT,
	VK_DESCRIPTOR_POOL_CREATE_HOST_ONLY_BIT_VALVE = VkDescriptorPoolCreateFlagBits.VK_DESCRIPTOR_POOL_CREATE_HOST_ONLY_BIT_VALVE,
	VK_DESCRIPTOR_POOL_CREATE_UPDATE_AFTER_BIND_BIT_EXT = VkDescriptorPoolCreateFlagBits.VK_DESCRIPTOR_POOL_CREATE_UPDATE_AFTER_BIND_BIT_EXT,
	VK_DESCRIPTOR_POOL_CREATE_FLAG_BITS_MAX_ENUM = VkDescriptorPoolCreateFlagBits.VK_DESCRIPTOR_POOL_CREATE_FLAG_BITS_MAX_ENUM,
}
enum VkDescriptorSetLayoutCreateFlagBits {
	VK_DESCRIPTOR_SET_LAYOUT_CREATE_UPDATE_AFTER_BIND_POOL_BIT = 0x00000002,
	VK_DESCRIPTOR_SET_LAYOUT_CREATE_PUSH_DESCRIPTOR_BIT_KHR = 0x00000001,
	VK_DESCRIPTOR_SET_LAYOUT_CREATE_HOST_ONLY_POOL_BIT_VALVE = 0x00000004,
	VK_DESCRIPTOR_SET_LAYOUT_CREATE_UPDATE_AFTER_BIND_POOL_BIT_EXT = VK_DESCRIPTOR_SET_LAYOUT_CREATE_UPDATE_AFTER_BIND_POOL_BIT,
	VK_DESCRIPTOR_SET_LAYOUT_CREATE_FLAG_BITS_MAX_ENUM = 0x7FFFFFFF,
}
enum : VkDescriptorSetLayoutCreateFlagBits {
	VK_DESCRIPTOR_SET_LAYOUT_CREATE_UPDATE_AFTER_BIND_POOL_BIT = VkDescriptorSetLayoutCreateFlagBits.VK_DESCRIPTOR_SET_LAYOUT_CREATE_UPDATE_AFTER_BIND_POOL_BIT,
	VK_DESCRIPTOR_SET_LAYOUT_CREATE_PUSH_DESCRIPTOR_BIT_KHR = VkDescriptorSetLayoutCreateFlagBits.VK_DESCRIPTOR_SET_LAYOUT_CREATE_PUSH_DESCRIPTOR_BIT_KHR,
	VK_DESCRIPTOR_SET_LAYOUT_CREATE_HOST_ONLY_POOL_BIT_VALVE = VkDescriptorSetLayoutCreateFlagBits.VK_DESCRIPTOR_SET_LAYOUT_CREATE_HOST_ONLY_POOL_BIT_VALVE,
	VK_DESCRIPTOR_SET_LAYOUT_CREATE_UPDATE_AFTER_BIND_POOL_BIT_EXT = VkDescriptorSetLayoutCreateFlagBits.VK_DESCRIPTOR_SET_LAYOUT_CREATE_UPDATE_AFTER_BIND_POOL_BIT_EXT,
	VK_DESCRIPTOR_SET_LAYOUT_CREATE_FLAG_BITS_MAX_ENUM = VkDescriptorSetLayoutCreateFlagBits.VK_DESCRIPTOR_SET_LAYOUT_CREATE_FLAG_BITS_MAX_ENUM,
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
	VK_DESCRIPTOR_TYPE_INLINE_UNIFORM_BLOCK = 1000138000,
	VK_DESCRIPTOR_TYPE_ACCELERATION_STRUCTURE_KHR = 1000150000,
	VK_DESCRIPTOR_TYPE_ACCELERATION_STRUCTURE_NV = 1000165000,
	VK_DESCRIPTOR_TYPE_MUTABLE_VALVE = 1000351000,
	VK_DESCRIPTOR_TYPE_INLINE_UNIFORM_BLOCK_EXT = VK_DESCRIPTOR_TYPE_INLINE_UNIFORM_BLOCK,
	VK_DESCRIPTOR_TYPE_MAX_ENUM = 0x7FFFFFFF,
}
enum : VkDescriptorType {
	VK_DESCRIPTOR_TYPE_SAMPLER = VkDescriptorType.VK_DESCRIPTOR_TYPE_SAMPLER,
	VK_DESCRIPTOR_TYPE_COMBINED_IMAGE_SAMPLER = VkDescriptorType.VK_DESCRIPTOR_TYPE_COMBINED_IMAGE_SAMPLER,
	VK_DESCRIPTOR_TYPE_SAMPLED_IMAGE = VkDescriptorType.VK_DESCRIPTOR_TYPE_SAMPLED_IMAGE,
	VK_DESCRIPTOR_TYPE_STORAGE_IMAGE = VkDescriptorType.VK_DESCRIPTOR_TYPE_STORAGE_IMAGE,
	VK_DESCRIPTOR_TYPE_UNIFORM_TEXEL_BUFFER = VkDescriptorType.VK_DESCRIPTOR_TYPE_UNIFORM_TEXEL_BUFFER,
	VK_DESCRIPTOR_TYPE_STORAGE_TEXEL_BUFFER = VkDescriptorType.VK_DESCRIPTOR_TYPE_STORAGE_TEXEL_BUFFER,
	VK_DESCRIPTOR_TYPE_UNIFORM_BUFFER = VkDescriptorType.VK_DESCRIPTOR_TYPE_UNIFORM_BUFFER,
	VK_DESCRIPTOR_TYPE_STORAGE_BUFFER = VkDescriptorType.VK_DESCRIPTOR_TYPE_STORAGE_BUFFER,
	VK_DESCRIPTOR_TYPE_UNIFORM_BUFFER_DYNAMIC = VkDescriptorType.VK_DESCRIPTOR_TYPE_UNIFORM_BUFFER_DYNAMIC,
	VK_DESCRIPTOR_TYPE_STORAGE_BUFFER_DYNAMIC = VkDescriptorType.VK_DESCRIPTOR_TYPE_STORAGE_BUFFER_DYNAMIC,
	VK_DESCRIPTOR_TYPE_INPUT_ATTACHMENT = VkDescriptorType.VK_DESCRIPTOR_TYPE_INPUT_ATTACHMENT,
	VK_DESCRIPTOR_TYPE_INLINE_UNIFORM_BLOCK = VkDescriptorType.VK_DESCRIPTOR_TYPE_INLINE_UNIFORM_BLOCK,
	VK_DESCRIPTOR_TYPE_ACCELERATION_STRUCTURE_KHR = VkDescriptorType.VK_DESCRIPTOR_TYPE_ACCELERATION_STRUCTURE_KHR,
	VK_DESCRIPTOR_TYPE_ACCELERATION_STRUCTURE_NV = VkDescriptorType.VK_DESCRIPTOR_TYPE_ACCELERATION_STRUCTURE_NV,
	VK_DESCRIPTOR_TYPE_MUTABLE_VALVE = VkDescriptorType.VK_DESCRIPTOR_TYPE_MUTABLE_VALVE,
	VK_DESCRIPTOR_TYPE_INLINE_UNIFORM_BLOCK_EXT = VkDescriptorType.VK_DESCRIPTOR_TYPE_INLINE_UNIFORM_BLOCK_EXT,
	VK_DESCRIPTOR_TYPE_MAX_ENUM = VkDescriptorType.VK_DESCRIPTOR_TYPE_MAX_ENUM,
}
enum VkDescriptorUpdateTemplateType {
	VK_DESCRIPTOR_UPDATE_TEMPLATE_TYPE_DESCRIPTOR_SET = 0,
	VK_DESCRIPTOR_UPDATE_TEMPLATE_TYPE_PUSH_DESCRIPTORS_KHR = 1,
	VK_DESCRIPTOR_UPDATE_TEMPLATE_TYPE_DESCRIPTOR_SET_KHR = VK_DESCRIPTOR_UPDATE_TEMPLATE_TYPE_DESCRIPTOR_SET,
	VK_DESCRIPTOR_UPDATE_TEMPLATE_TYPE_MAX_ENUM = 0x7FFFFFFF,
}
enum : VkDescriptorUpdateTemplateType {
	VK_DESCRIPTOR_UPDATE_TEMPLATE_TYPE_DESCRIPTOR_SET = VkDescriptorUpdateTemplateType.VK_DESCRIPTOR_UPDATE_TEMPLATE_TYPE_DESCRIPTOR_SET,
	VK_DESCRIPTOR_UPDATE_TEMPLATE_TYPE_PUSH_DESCRIPTORS_KHR = VkDescriptorUpdateTemplateType.VK_DESCRIPTOR_UPDATE_TEMPLATE_TYPE_PUSH_DESCRIPTORS_KHR,
	VK_DESCRIPTOR_UPDATE_TEMPLATE_TYPE_DESCRIPTOR_SET_KHR = VkDescriptorUpdateTemplateType.VK_DESCRIPTOR_UPDATE_TEMPLATE_TYPE_DESCRIPTOR_SET_KHR,
	VK_DESCRIPTOR_UPDATE_TEMPLATE_TYPE_MAX_ENUM = VkDescriptorUpdateTemplateType.VK_DESCRIPTOR_UPDATE_TEMPLATE_TYPE_MAX_ENUM,
}
enum VkDeviceDiagnosticsConfigFlagBitsNV {
	VK_DEVICE_DIAGNOSTICS_CONFIG_ENABLE_SHADER_DEBUG_INFO_BIT_NV = 0x00000001,
	VK_DEVICE_DIAGNOSTICS_CONFIG_ENABLE_RESOURCE_TRACKING_BIT_NV = 0x00000002,
	VK_DEVICE_DIAGNOSTICS_CONFIG_ENABLE_AUTOMATIC_CHECKPOINTS_BIT_NV = 0x00000004,
	VK_DEVICE_DIAGNOSTICS_CONFIG_FLAG_BITS_MAX_ENUM_NV = 0x7FFFFFFF,
}
enum : VkDeviceDiagnosticsConfigFlagBitsNV {
	VK_DEVICE_DIAGNOSTICS_CONFIG_ENABLE_SHADER_DEBUG_INFO_BIT_NV = VkDeviceDiagnosticsConfigFlagBitsNV.VK_DEVICE_DIAGNOSTICS_CONFIG_ENABLE_SHADER_DEBUG_INFO_BIT_NV,
	VK_DEVICE_DIAGNOSTICS_CONFIG_ENABLE_RESOURCE_TRACKING_BIT_NV = VkDeviceDiagnosticsConfigFlagBitsNV.VK_DEVICE_DIAGNOSTICS_CONFIG_ENABLE_RESOURCE_TRACKING_BIT_NV,
	VK_DEVICE_DIAGNOSTICS_CONFIG_ENABLE_AUTOMATIC_CHECKPOINTS_BIT_NV = VkDeviceDiagnosticsConfigFlagBitsNV.VK_DEVICE_DIAGNOSTICS_CONFIG_ENABLE_AUTOMATIC_CHECKPOINTS_BIT_NV,
	VK_DEVICE_DIAGNOSTICS_CONFIG_FLAG_BITS_MAX_ENUM_NV = VkDeviceDiagnosticsConfigFlagBitsNV.VK_DEVICE_DIAGNOSTICS_CONFIG_FLAG_BITS_MAX_ENUM_NV,
}
enum VkDeviceEventTypeEXT {
	VK_DEVICE_EVENT_TYPE_DISPLAY_HOTPLUG_EXT = 0,
	VK_DEVICE_EVENT_TYPE_MAX_ENUM_EXT = 0x7FFFFFFF,
}
enum : VkDeviceEventTypeEXT {
	VK_DEVICE_EVENT_TYPE_DISPLAY_HOTPLUG_EXT = VkDeviceEventTypeEXT.VK_DEVICE_EVENT_TYPE_DISPLAY_HOTPLUG_EXT,
	VK_DEVICE_EVENT_TYPE_MAX_ENUM_EXT = VkDeviceEventTypeEXT.VK_DEVICE_EVENT_TYPE_MAX_ENUM_EXT,
}
enum VkDeviceGroupPresentModeFlagBitsKHR {
	VK_DEVICE_GROUP_PRESENT_MODE_LOCAL_BIT_KHR = 0x00000001,
	VK_DEVICE_GROUP_PRESENT_MODE_REMOTE_BIT_KHR = 0x00000002,
	VK_DEVICE_GROUP_PRESENT_MODE_SUM_BIT_KHR = 0x00000004,
	VK_DEVICE_GROUP_PRESENT_MODE_LOCAL_MULTI_DEVICE_BIT_KHR = 0x00000008,
	VK_DEVICE_GROUP_PRESENT_MODE_FLAG_BITS_MAX_ENUM_KHR = 0x7FFFFFFF,
}
enum : VkDeviceGroupPresentModeFlagBitsKHR {
	VK_DEVICE_GROUP_PRESENT_MODE_LOCAL_BIT_KHR = VkDeviceGroupPresentModeFlagBitsKHR.VK_DEVICE_GROUP_PRESENT_MODE_LOCAL_BIT_KHR,
	VK_DEVICE_GROUP_PRESENT_MODE_REMOTE_BIT_KHR = VkDeviceGroupPresentModeFlagBitsKHR.VK_DEVICE_GROUP_PRESENT_MODE_REMOTE_BIT_KHR,
	VK_DEVICE_GROUP_PRESENT_MODE_SUM_BIT_KHR = VkDeviceGroupPresentModeFlagBitsKHR.VK_DEVICE_GROUP_PRESENT_MODE_SUM_BIT_KHR,
	VK_DEVICE_GROUP_PRESENT_MODE_LOCAL_MULTI_DEVICE_BIT_KHR = VkDeviceGroupPresentModeFlagBitsKHR.VK_DEVICE_GROUP_PRESENT_MODE_LOCAL_MULTI_DEVICE_BIT_KHR,
	VK_DEVICE_GROUP_PRESENT_MODE_FLAG_BITS_MAX_ENUM_KHR = VkDeviceGroupPresentModeFlagBitsKHR.VK_DEVICE_GROUP_PRESENT_MODE_FLAG_BITS_MAX_ENUM_KHR,
}
enum VkDeviceMemoryReportEventTypeEXT {
	VK_DEVICE_MEMORY_REPORT_EVENT_TYPE_ALLOCATE_EXT = 0,
	VK_DEVICE_MEMORY_REPORT_EVENT_TYPE_FREE_EXT = 1,
	VK_DEVICE_MEMORY_REPORT_EVENT_TYPE_IMPORT_EXT = 2,
	VK_DEVICE_MEMORY_REPORT_EVENT_TYPE_UNIMPORT_EXT = 3,
	VK_DEVICE_MEMORY_REPORT_EVENT_TYPE_ALLOCATION_FAILED_EXT = 4,
	VK_DEVICE_MEMORY_REPORT_EVENT_TYPE_MAX_ENUM_EXT = 0x7FFFFFFF,
}
enum : VkDeviceMemoryReportEventTypeEXT {
	VK_DEVICE_MEMORY_REPORT_EVENT_TYPE_ALLOCATE_EXT = VkDeviceMemoryReportEventTypeEXT.VK_DEVICE_MEMORY_REPORT_EVENT_TYPE_ALLOCATE_EXT,
	VK_DEVICE_MEMORY_REPORT_EVENT_TYPE_FREE_EXT = VkDeviceMemoryReportEventTypeEXT.VK_DEVICE_MEMORY_REPORT_EVENT_TYPE_FREE_EXT,
	VK_DEVICE_MEMORY_REPORT_EVENT_TYPE_IMPORT_EXT = VkDeviceMemoryReportEventTypeEXT.VK_DEVICE_MEMORY_REPORT_EVENT_TYPE_IMPORT_EXT,
	VK_DEVICE_MEMORY_REPORT_EVENT_TYPE_UNIMPORT_EXT = VkDeviceMemoryReportEventTypeEXT.VK_DEVICE_MEMORY_REPORT_EVENT_TYPE_UNIMPORT_EXT,
	VK_DEVICE_MEMORY_REPORT_EVENT_TYPE_ALLOCATION_FAILED_EXT = VkDeviceMemoryReportEventTypeEXT.VK_DEVICE_MEMORY_REPORT_EVENT_TYPE_ALLOCATION_FAILED_EXT,
	VK_DEVICE_MEMORY_REPORT_EVENT_TYPE_MAX_ENUM_EXT = VkDeviceMemoryReportEventTypeEXT.VK_DEVICE_MEMORY_REPORT_EVENT_TYPE_MAX_ENUM_EXT,
}
enum VkDeviceQueueCreateFlagBits {
	VK_DEVICE_QUEUE_CREATE_PROTECTED_BIT = 0x00000001,
	VK_DEVICE_QUEUE_CREATE_FLAG_BITS_MAX_ENUM = 0x7FFFFFFF,
}
enum : VkDeviceQueueCreateFlagBits {
	VK_DEVICE_QUEUE_CREATE_PROTECTED_BIT = VkDeviceQueueCreateFlagBits.VK_DEVICE_QUEUE_CREATE_PROTECTED_BIT,
	VK_DEVICE_QUEUE_CREATE_FLAG_BITS_MAX_ENUM = VkDeviceQueueCreateFlagBits.VK_DEVICE_QUEUE_CREATE_FLAG_BITS_MAX_ENUM,
}
enum VkDiscardRectangleModeEXT {
	VK_DISCARD_RECTANGLE_MODE_INCLUSIVE_EXT = 0,
	VK_DISCARD_RECTANGLE_MODE_EXCLUSIVE_EXT = 1,
	VK_DISCARD_RECTANGLE_MODE_MAX_ENUM_EXT = 0x7FFFFFFF,
}
enum : VkDiscardRectangleModeEXT {
	VK_DISCARD_RECTANGLE_MODE_INCLUSIVE_EXT = VkDiscardRectangleModeEXT.VK_DISCARD_RECTANGLE_MODE_INCLUSIVE_EXT,
	VK_DISCARD_RECTANGLE_MODE_EXCLUSIVE_EXT = VkDiscardRectangleModeEXT.VK_DISCARD_RECTANGLE_MODE_EXCLUSIVE_EXT,
	VK_DISCARD_RECTANGLE_MODE_MAX_ENUM_EXT = VkDiscardRectangleModeEXT.VK_DISCARD_RECTANGLE_MODE_MAX_ENUM_EXT,
}
enum VkDisplayEventTypeEXT {
	VK_DISPLAY_EVENT_TYPE_FIRST_PIXEL_OUT_EXT = 0,
	VK_DISPLAY_EVENT_TYPE_MAX_ENUM_EXT = 0x7FFFFFFF,
}
enum : VkDisplayEventTypeEXT {
	VK_DISPLAY_EVENT_TYPE_FIRST_PIXEL_OUT_EXT = VkDisplayEventTypeEXT.VK_DISPLAY_EVENT_TYPE_FIRST_PIXEL_OUT_EXT,
	VK_DISPLAY_EVENT_TYPE_MAX_ENUM_EXT = VkDisplayEventTypeEXT.VK_DISPLAY_EVENT_TYPE_MAX_ENUM_EXT,
}
enum VkDisplayPlaneAlphaFlagBitsKHR {
	VK_DISPLAY_PLANE_ALPHA_OPAQUE_BIT_KHR = 0x00000001,
	VK_DISPLAY_PLANE_ALPHA_GLOBAL_BIT_KHR = 0x00000002,
	VK_DISPLAY_PLANE_ALPHA_PER_PIXEL_BIT_KHR = 0x00000004,
	VK_DISPLAY_PLANE_ALPHA_PER_PIXEL_PREMULTIPLIED_BIT_KHR = 0x00000008,
	VK_DISPLAY_PLANE_ALPHA_FLAG_BITS_MAX_ENUM_KHR = 0x7FFFFFFF,
}
enum : VkDisplayPlaneAlphaFlagBitsKHR {
	VK_DISPLAY_PLANE_ALPHA_OPAQUE_BIT_KHR = VkDisplayPlaneAlphaFlagBitsKHR.VK_DISPLAY_PLANE_ALPHA_OPAQUE_BIT_KHR,
	VK_DISPLAY_PLANE_ALPHA_GLOBAL_BIT_KHR = VkDisplayPlaneAlphaFlagBitsKHR.VK_DISPLAY_PLANE_ALPHA_GLOBAL_BIT_KHR,
	VK_DISPLAY_PLANE_ALPHA_PER_PIXEL_BIT_KHR = VkDisplayPlaneAlphaFlagBitsKHR.VK_DISPLAY_PLANE_ALPHA_PER_PIXEL_BIT_KHR,
	VK_DISPLAY_PLANE_ALPHA_PER_PIXEL_PREMULTIPLIED_BIT_KHR = VkDisplayPlaneAlphaFlagBitsKHR.VK_DISPLAY_PLANE_ALPHA_PER_PIXEL_PREMULTIPLIED_BIT_KHR,
	VK_DISPLAY_PLANE_ALPHA_FLAG_BITS_MAX_ENUM_KHR = VkDisplayPlaneAlphaFlagBitsKHR.VK_DISPLAY_PLANE_ALPHA_FLAG_BITS_MAX_ENUM_KHR,
}
enum VkDisplayPowerStateEXT {
	VK_DISPLAY_POWER_STATE_OFF_EXT = 0,
	VK_DISPLAY_POWER_STATE_SUSPEND_EXT = 1,
	VK_DISPLAY_POWER_STATE_ON_EXT = 2,
	VK_DISPLAY_POWER_STATE_MAX_ENUM_EXT = 0x7FFFFFFF,
}
enum : VkDisplayPowerStateEXT {
	VK_DISPLAY_POWER_STATE_OFF_EXT = VkDisplayPowerStateEXT.VK_DISPLAY_POWER_STATE_OFF_EXT,
	VK_DISPLAY_POWER_STATE_SUSPEND_EXT = VkDisplayPowerStateEXT.VK_DISPLAY_POWER_STATE_SUSPEND_EXT,
	VK_DISPLAY_POWER_STATE_ON_EXT = VkDisplayPowerStateEXT.VK_DISPLAY_POWER_STATE_ON_EXT,
	VK_DISPLAY_POWER_STATE_MAX_ENUM_EXT = VkDisplayPowerStateEXT.VK_DISPLAY_POWER_STATE_MAX_ENUM_EXT,
}
enum VkDriverId {
	VK_DRIVER_ID_AMD_PROPRIETARY = 1,
	VK_DRIVER_ID_AMD_OPEN_SOURCE = 2,
	VK_DRIVER_ID_MESA_RADV = 3,
	VK_DRIVER_ID_NVIDIA_PROPRIETARY = 4,
	VK_DRIVER_ID_INTEL_PROPRIETARY_WINDOWS = 5,
	VK_DRIVER_ID_INTEL_OPEN_SOURCE_MESA = 6,
	VK_DRIVER_ID_IMAGINATION_PROPRIETARY = 7,
	VK_DRIVER_ID_QUALCOMM_PROPRIETARY = 8,
	VK_DRIVER_ID_ARM_PROPRIETARY = 9,
	VK_DRIVER_ID_GOOGLE_SWIFTSHADER = 10,
	VK_DRIVER_ID_GGP_PROPRIETARY = 11,
	VK_DRIVER_ID_BROADCOM_PROPRIETARY = 12,
	VK_DRIVER_ID_MESA_LLVMPIPE = 13,
	VK_DRIVER_ID_MOLTENVK = 14,
	VK_DRIVER_ID_COREAVI_PROPRIETARY = 15,
	VK_DRIVER_ID_JUICE_PROPRIETARY = 16,
	VK_DRIVER_ID_VERISILICON_PROPRIETARY = 17,
	VK_DRIVER_ID_MESA_TURNIP = 18,
	VK_DRIVER_ID_MESA_V3DV = 19,
	VK_DRIVER_ID_MESA_PANVK = 20,
	VK_DRIVER_ID_SAMSUNG_PROPRIETARY = 21,
	VK_DRIVER_ID_MESA_VENUS = 22,
	VK_DRIVER_ID_AMD_PROPRIETARY_KHR = VK_DRIVER_ID_AMD_PROPRIETARY,
	VK_DRIVER_ID_AMD_OPEN_SOURCE_KHR = VK_DRIVER_ID_AMD_OPEN_SOURCE,
	VK_DRIVER_ID_MESA_RADV_KHR = VK_DRIVER_ID_MESA_RADV,
	VK_DRIVER_ID_NVIDIA_PROPRIETARY_KHR = VK_DRIVER_ID_NVIDIA_PROPRIETARY,
	VK_DRIVER_ID_INTEL_PROPRIETARY_WINDOWS_KHR = VK_DRIVER_ID_INTEL_PROPRIETARY_WINDOWS,
	VK_DRIVER_ID_INTEL_OPEN_SOURCE_MESA_KHR = VK_DRIVER_ID_INTEL_OPEN_SOURCE_MESA,
	VK_DRIVER_ID_IMAGINATION_PROPRIETARY_KHR = VK_DRIVER_ID_IMAGINATION_PROPRIETARY,
	VK_DRIVER_ID_QUALCOMM_PROPRIETARY_KHR = VK_DRIVER_ID_QUALCOMM_PROPRIETARY,
	VK_DRIVER_ID_ARM_PROPRIETARY_KHR = VK_DRIVER_ID_ARM_PROPRIETARY,
	VK_DRIVER_ID_GOOGLE_SWIFTSHADER_KHR = VK_DRIVER_ID_GOOGLE_SWIFTSHADER,
	VK_DRIVER_ID_GGP_PROPRIETARY_KHR = VK_DRIVER_ID_GGP_PROPRIETARY,
	VK_DRIVER_ID_BROADCOM_PROPRIETARY_KHR = VK_DRIVER_ID_BROADCOM_PROPRIETARY,
	VK_DRIVER_ID_MAX_ENUM = 0x7FFFFFFF,
}
enum : VkDriverId {
	VK_DRIVER_ID_AMD_PROPRIETARY = VkDriverId.VK_DRIVER_ID_AMD_PROPRIETARY,
	VK_DRIVER_ID_AMD_OPEN_SOURCE = VkDriverId.VK_DRIVER_ID_AMD_OPEN_SOURCE,
	VK_DRIVER_ID_MESA_RADV = VkDriverId.VK_DRIVER_ID_MESA_RADV,
	VK_DRIVER_ID_NVIDIA_PROPRIETARY = VkDriverId.VK_DRIVER_ID_NVIDIA_PROPRIETARY,
	VK_DRIVER_ID_INTEL_PROPRIETARY_WINDOWS = VkDriverId.VK_DRIVER_ID_INTEL_PROPRIETARY_WINDOWS,
	VK_DRIVER_ID_INTEL_OPEN_SOURCE_MESA = VkDriverId.VK_DRIVER_ID_INTEL_OPEN_SOURCE_MESA,
	VK_DRIVER_ID_IMAGINATION_PROPRIETARY = VkDriverId.VK_DRIVER_ID_IMAGINATION_PROPRIETARY,
	VK_DRIVER_ID_QUALCOMM_PROPRIETARY = VkDriverId.VK_DRIVER_ID_QUALCOMM_PROPRIETARY,
	VK_DRIVER_ID_ARM_PROPRIETARY = VkDriverId.VK_DRIVER_ID_ARM_PROPRIETARY,
	VK_DRIVER_ID_GOOGLE_SWIFTSHADER = VkDriverId.VK_DRIVER_ID_GOOGLE_SWIFTSHADER,
	VK_DRIVER_ID_GGP_PROPRIETARY = VkDriverId.VK_DRIVER_ID_GGP_PROPRIETARY,
	VK_DRIVER_ID_BROADCOM_PROPRIETARY = VkDriverId.VK_DRIVER_ID_BROADCOM_PROPRIETARY,
	VK_DRIVER_ID_MESA_LLVMPIPE = VkDriverId.VK_DRIVER_ID_MESA_LLVMPIPE,
	VK_DRIVER_ID_MOLTENVK = VkDriverId.VK_DRIVER_ID_MOLTENVK,
	VK_DRIVER_ID_COREAVI_PROPRIETARY = VkDriverId.VK_DRIVER_ID_COREAVI_PROPRIETARY,
	VK_DRIVER_ID_JUICE_PROPRIETARY = VkDriverId.VK_DRIVER_ID_JUICE_PROPRIETARY,
	VK_DRIVER_ID_VERISILICON_PROPRIETARY = VkDriverId.VK_DRIVER_ID_VERISILICON_PROPRIETARY,
	VK_DRIVER_ID_MESA_TURNIP = VkDriverId.VK_DRIVER_ID_MESA_TURNIP,
	VK_DRIVER_ID_MESA_V3DV = VkDriverId.VK_DRIVER_ID_MESA_V3DV,
	VK_DRIVER_ID_MESA_PANVK = VkDriverId.VK_DRIVER_ID_MESA_PANVK,
	VK_DRIVER_ID_SAMSUNG_PROPRIETARY = VkDriverId.VK_DRIVER_ID_SAMSUNG_PROPRIETARY,
	VK_DRIVER_ID_MESA_VENUS = VkDriverId.VK_DRIVER_ID_MESA_VENUS,
	VK_DRIVER_ID_AMD_PROPRIETARY_KHR = VkDriverId.VK_DRIVER_ID_AMD_PROPRIETARY_KHR,
	VK_DRIVER_ID_AMD_OPEN_SOURCE_KHR = VkDriverId.VK_DRIVER_ID_AMD_OPEN_SOURCE_KHR,
	VK_DRIVER_ID_MESA_RADV_KHR = VkDriverId.VK_DRIVER_ID_MESA_RADV_KHR,
	VK_DRIVER_ID_NVIDIA_PROPRIETARY_KHR = VkDriverId.VK_DRIVER_ID_NVIDIA_PROPRIETARY_KHR,
	VK_DRIVER_ID_INTEL_PROPRIETARY_WINDOWS_KHR = VkDriverId.VK_DRIVER_ID_INTEL_PROPRIETARY_WINDOWS_KHR,
	VK_DRIVER_ID_INTEL_OPEN_SOURCE_MESA_KHR = VkDriverId.VK_DRIVER_ID_INTEL_OPEN_SOURCE_MESA_KHR,
	VK_DRIVER_ID_IMAGINATION_PROPRIETARY_KHR = VkDriverId.VK_DRIVER_ID_IMAGINATION_PROPRIETARY_KHR,
	VK_DRIVER_ID_QUALCOMM_PROPRIETARY_KHR = VkDriverId.VK_DRIVER_ID_QUALCOMM_PROPRIETARY_KHR,
	VK_DRIVER_ID_ARM_PROPRIETARY_KHR = VkDriverId.VK_DRIVER_ID_ARM_PROPRIETARY_KHR,
	VK_DRIVER_ID_GOOGLE_SWIFTSHADER_KHR = VkDriverId.VK_DRIVER_ID_GOOGLE_SWIFTSHADER_KHR,
	VK_DRIVER_ID_GGP_PROPRIETARY_KHR = VkDriverId.VK_DRIVER_ID_GGP_PROPRIETARY_KHR,
	VK_DRIVER_ID_BROADCOM_PROPRIETARY_KHR = VkDriverId.VK_DRIVER_ID_BROADCOM_PROPRIETARY_KHR,
	VK_DRIVER_ID_MAX_ENUM = VkDriverId.VK_DRIVER_ID_MAX_ENUM,
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
	VK_DYNAMIC_STATE_CULL_MODE = 1000267000,
	VK_DYNAMIC_STATE_FRONT_FACE = 1000267001,
	VK_DYNAMIC_STATE_PRIMITIVE_TOPOLOGY = 1000267002,
	VK_DYNAMIC_STATE_VIEWPORT_WITH_COUNT = 1000267003,
	VK_DYNAMIC_STATE_SCISSOR_WITH_COUNT = 1000267004,
	VK_DYNAMIC_STATE_VERTEX_INPUT_BINDING_STRIDE = 1000267005,
	VK_DYNAMIC_STATE_DEPTH_TEST_ENABLE = 1000267006,
	VK_DYNAMIC_STATE_DEPTH_WRITE_ENABLE = 1000267007,
	VK_DYNAMIC_STATE_DEPTH_COMPARE_OP = 1000267008,
	VK_DYNAMIC_STATE_DEPTH_BOUNDS_TEST_ENABLE = 1000267009,
	VK_DYNAMIC_STATE_STENCIL_TEST_ENABLE = 1000267010,
	VK_DYNAMIC_STATE_STENCIL_OP = 1000267011,
	VK_DYNAMIC_STATE_RASTERIZER_DISCARD_ENABLE = 1000377001,
	VK_DYNAMIC_STATE_DEPTH_BIAS_ENABLE = 1000377002,
	VK_DYNAMIC_STATE_PRIMITIVE_RESTART_ENABLE = 1000377004,
	VK_DYNAMIC_STATE_VIEWPORT_W_SCALING_NV = 1000087000,
	VK_DYNAMIC_STATE_DISCARD_RECTANGLE_EXT = 1000099000,
	VK_DYNAMIC_STATE_SAMPLE_LOCATIONS_EXT = 1000143000,
	VK_DYNAMIC_STATE_RAY_TRACING_PIPELINE_STACK_SIZE_KHR = 1000347000,
	VK_DYNAMIC_STATE_VIEWPORT_SHADING_RATE_PALETTE_NV = 1000164004,
	VK_DYNAMIC_STATE_VIEWPORT_COARSE_SAMPLE_ORDER_NV = 1000164006,
	VK_DYNAMIC_STATE_EXCLUSIVE_SCISSOR_NV = 1000205001,
	VK_DYNAMIC_STATE_FRAGMENT_SHADING_RATE_KHR = 1000226000,
	VK_DYNAMIC_STATE_LINE_STIPPLE_EXT = 1000259000,
	VK_DYNAMIC_STATE_VERTEX_INPUT_EXT = 1000352000,
	VK_DYNAMIC_STATE_PATCH_CONTROL_POINTS_EXT = 1000377000,
	VK_DYNAMIC_STATE_LOGIC_OP_EXT = 1000377003,
	VK_DYNAMIC_STATE_COLOR_WRITE_ENABLE_EXT = 1000381000,
	VK_DYNAMIC_STATE_CULL_MODE_EXT = VK_DYNAMIC_STATE_CULL_MODE,
	VK_DYNAMIC_STATE_FRONT_FACE_EXT = VK_DYNAMIC_STATE_FRONT_FACE,
	VK_DYNAMIC_STATE_PRIMITIVE_TOPOLOGY_EXT = VK_DYNAMIC_STATE_PRIMITIVE_TOPOLOGY,
	VK_DYNAMIC_STATE_VIEWPORT_WITH_COUNT_EXT = VK_DYNAMIC_STATE_VIEWPORT_WITH_COUNT,
	VK_DYNAMIC_STATE_SCISSOR_WITH_COUNT_EXT = VK_DYNAMIC_STATE_SCISSOR_WITH_COUNT,
	VK_DYNAMIC_STATE_VERTEX_INPUT_BINDING_STRIDE_EXT = VK_DYNAMIC_STATE_VERTEX_INPUT_BINDING_STRIDE,
	VK_DYNAMIC_STATE_DEPTH_TEST_ENABLE_EXT = VK_DYNAMIC_STATE_DEPTH_TEST_ENABLE,
	VK_DYNAMIC_STATE_DEPTH_WRITE_ENABLE_EXT = VK_DYNAMIC_STATE_DEPTH_WRITE_ENABLE,
	VK_DYNAMIC_STATE_DEPTH_COMPARE_OP_EXT = VK_DYNAMIC_STATE_DEPTH_COMPARE_OP,
	VK_DYNAMIC_STATE_DEPTH_BOUNDS_TEST_ENABLE_EXT = VK_DYNAMIC_STATE_DEPTH_BOUNDS_TEST_ENABLE,
	VK_DYNAMIC_STATE_STENCIL_TEST_ENABLE_EXT = VK_DYNAMIC_STATE_STENCIL_TEST_ENABLE,
	VK_DYNAMIC_STATE_STENCIL_OP_EXT = VK_DYNAMIC_STATE_STENCIL_OP,
	VK_DYNAMIC_STATE_RASTERIZER_DISCARD_ENABLE_EXT = VK_DYNAMIC_STATE_RASTERIZER_DISCARD_ENABLE,
	VK_DYNAMIC_STATE_DEPTH_BIAS_ENABLE_EXT = VK_DYNAMIC_STATE_DEPTH_BIAS_ENABLE,
	VK_DYNAMIC_STATE_PRIMITIVE_RESTART_ENABLE_EXT = VK_DYNAMIC_STATE_PRIMITIVE_RESTART_ENABLE,
	VK_DYNAMIC_STATE_MAX_ENUM = 0x7FFFFFFF,
}
enum : VkDynamicState {
	VK_DYNAMIC_STATE_VIEWPORT = VkDynamicState.VK_DYNAMIC_STATE_VIEWPORT,
	VK_DYNAMIC_STATE_SCISSOR = VkDynamicState.VK_DYNAMIC_STATE_SCISSOR,
	VK_DYNAMIC_STATE_LINE_WIDTH = VkDynamicState.VK_DYNAMIC_STATE_LINE_WIDTH,
	VK_DYNAMIC_STATE_DEPTH_BIAS = VkDynamicState.VK_DYNAMIC_STATE_DEPTH_BIAS,
	VK_DYNAMIC_STATE_BLEND_CONSTANTS = VkDynamicState.VK_DYNAMIC_STATE_BLEND_CONSTANTS,
	VK_DYNAMIC_STATE_DEPTH_BOUNDS = VkDynamicState.VK_DYNAMIC_STATE_DEPTH_BOUNDS,
	VK_DYNAMIC_STATE_STENCIL_COMPARE_MASK = VkDynamicState.VK_DYNAMIC_STATE_STENCIL_COMPARE_MASK,
	VK_DYNAMIC_STATE_STENCIL_WRITE_MASK = VkDynamicState.VK_DYNAMIC_STATE_STENCIL_WRITE_MASK,
	VK_DYNAMIC_STATE_STENCIL_REFERENCE = VkDynamicState.VK_DYNAMIC_STATE_STENCIL_REFERENCE,
	VK_DYNAMIC_STATE_CULL_MODE = VkDynamicState.VK_DYNAMIC_STATE_CULL_MODE,
	VK_DYNAMIC_STATE_FRONT_FACE = VkDynamicState.VK_DYNAMIC_STATE_FRONT_FACE,
	VK_DYNAMIC_STATE_PRIMITIVE_TOPOLOGY = VkDynamicState.VK_DYNAMIC_STATE_PRIMITIVE_TOPOLOGY,
	VK_DYNAMIC_STATE_VIEWPORT_WITH_COUNT = VkDynamicState.VK_DYNAMIC_STATE_VIEWPORT_WITH_COUNT,
	VK_DYNAMIC_STATE_SCISSOR_WITH_COUNT = VkDynamicState.VK_DYNAMIC_STATE_SCISSOR_WITH_COUNT,
	VK_DYNAMIC_STATE_VERTEX_INPUT_BINDING_STRIDE = VkDynamicState.VK_DYNAMIC_STATE_VERTEX_INPUT_BINDING_STRIDE,
	VK_DYNAMIC_STATE_DEPTH_TEST_ENABLE = VkDynamicState.VK_DYNAMIC_STATE_DEPTH_TEST_ENABLE,
	VK_DYNAMIC_STATE_DEPTH_WRITE_ENABLE = VkDynamicState.VK_DYNAMIC_STATE_DEPTH_WRITE_ENABLE,
	VK_DYNAMIC_STATE_DEPTH_COMPARE_OP = VkDynamicState.VK_DYNAMIC_STATE_DEPTH_COMPARE_OP,
	VK_DYNAMIC_STATE_DEPTH_BOUNDS_TEST_ENABLE = VkDynamicState.VK_DYNAMIC_STATE_DEPTH_BOUNDS_TEST_ENABLE,
	VK_DYNAMIC_STATE_STENCIL_TEST_ENABLE = VkDynamicState.VK_DYNAMIC_STATE_STENCIL_TEST_ENABLE,
	VK_DYNAMIC_STATE_STENCIL_OP = VkDynamicState.VK_DYNAMIC_STATE_STENCIL_OP,
	VK_DYNAMIC_STATE_RASTERIZER_DISCARD_ENABLE = VkDynamicState.VK_DYNAMIC_STATE_RASTERIZER_DISCARD_ENABLE,
	VK_DYNAMIC_STATE_DEPTH_BIAS_ENABLE = VkDynamicState.VK_DYNAMIC_STATE_DEPTH_BIAS_ENABLE,
	VK_DYNAMIC_STATE_PRIMITIVE_RESTART_ENABLE = VkDynamicState.VK_DYNAMIC_STATE_PRIMITIVE_RESTART_ENABLE,
	VK_DYNAMIC_STATE_VIEWPORT_W_SCALING_NV = VkDynamicState.VK_DYNAMIC_STATE_VIEWPORT_W_SCALING_NV,
	VK_DYNAMIC_STATE_DISCARD_RECTANGLE_EXT = VkDynamicState.VK_DYNAMIC_STATE_DISCARD_RECTANGLE_EXT,
	VK_DYNAMIC_STATE_SAMPLE_LOCATIONS_EXT = VkDynamicState.VK_DYNAMIC_STATE_SAMPLE_LOCATIONS_EXT,
	VK_DYNAMIC_STATE_RAY_TRACING_PIPELINE_STACK_SIZE_KHR = VkDynamicState.VK_DYNAMIC_STATE_RAY_TRACING_PIPELINE_STACK_SIZE_KHR,
	VK_DYNAMIC_STATE_VIEWPORT_SHADING_RATE_PALETTE_NV = VkDynamicState.VK_DYNAMIC_STATE_VIEWPORT_SHADING_RATE_PALETTE_NV,
	VK_DYNAMIC_STATE_VIEWPORT_COARSE_SAMPLE_ORDER_NV = VkDynamicState.VK_DYNAMIC_STATE_VIEWPORT_COARSE_SAMPLE_ORDER_NV,
	VK_DYNAMIC_STATE_EXCLUSIVE_SCISSOR_NV = VkDynamicState.VK_DYNAMIC_STATE_EXCLUSIVE_SCISSOR_NV,
	VK_DYNAMIC_STATE_FRAGMENT_SHADING_RATE_KHR = VkDynamicState.VK_DYNAMIC_STATE_FRAGMENT_SHADING_RATE_KHR,
	VK_DYNAMIC_STATE_LINE_STIPPLE_EXT = VkDynamicState.VK_DYNAMIC_STATE_LINE_STIPPLE_EXT,
	VK_DYNAMIC_STATE_VERTEX_INPUT_EXT = VkDynamicState.VK_DYNAMIC_STATE_VERTEX_INPUT_EXT,
	VK_DYNAMIC_STATE_PATCH_CONTROL_POINTS_EXT = VkDynamicState.VK_DYNAMIC_STATE_PATCH_CONTROL_POINTS_EXT,
	VK_DYNAMIC_STATE_LOGIC_OP_EXT = VkDynamicState.VK_DYNAMIC_STATE_LOGIC_OP_EXT,
	VK_DYNAMIC_STATE_COLOR_WRITE_ENABLE_EXT = VkDynamicState.VK_DYNAMIC_STATE_COLOR_WRITE_ENABLE_EXT,
	VK_DYNAMIC_STATE_CULL_MODE_EXT = VkDynamicState.VK_DYNAMIC_STATE_CULL_MODE_EXT,
	VK_DYNAMIC_STATE_FRONT_FACE_EXT = VkDynamicState.VK_DYNAMIC_STATE_FRONT_FACE_EXT,
	VK_DYNAMIC_STATE_PRIMITIVE_TOPOLOGY_EXT = VkDynamicState.VK_DYNAMIC_STATE_PRIMITIVE_TOPOLOGY_EXT,
	VK_DYNAMIC_STATE_VIEWPORT_WITH_COUNT_EXT = VkDynamicState.VK_DYNAMIC_STATE_VIEWPORT_WITH_COUNT_EXT,
	VK_DYNAMIC_STATE_SCISSOR_WITH_COUNT_EXT = VkDynamicState.VK_DYNAMIC_STATE_SCISSOR_WITH_COUNT_EXT,
	VK_DYNAMIC_STATE_VERTEX_INPUT_BINDING_STRIDE_EXT = VkDynamicState.VK_DYNAMIC_STATE_VERTEX_INPUT_BINDING_STRIDE_EXT,
	VK_DYNAMIC_STATE_DEPTH_TEST_ENABLE_EXT = VkDynamicState.VK_DYNAMIC_STATE_DEPTH_TEST_ENABLE_EXT,
	VK_DYNAMIC_STATE_DEPTH_WRITE_ENABLE_EXT = VkDynamicState.VK_DYNAMIC_STATE_DEPTH_WRITE_ENABLE_EXT,
	VK_DYNAMIC_STATE_DEPTH_COMPARE_OP_EXT = VkDynamicState.VK_DYNAMIC_STATE_DEPTH_COMPARE_OP_EXT,
	VK_DYNAMIC_STATE_DEPTH_BOUNDS_TEST_ENABLE_EXT = VkDynamicState.VK_DYNAMIC_STATE_DEPTH_BOUNDS_TEST_ENABLE_EXT,
	VK_DYNAMIC_STATE_STENCIL_TEST_ENABLE_EXT = VkDynamicState.VK_DYNAMIC_STATE_STENCIL_TEST_ENABLE_EXT,
	VK_DYNAMIC_STATE_STENCIL_OP_EXT = VkDynamicState.VK_DYNAMIC_STATE_STENCIL_OP_EXT,
	VK_DYNAMIC_STATE_RASTERIZER_DISCARD_ENABLE_EXT = VkDynamicState.VK_DYNAMIC_STATE_RASTERIZER_DISCARD_ENABLE_EXT,
	VK_DYNAMIC_STATE_DEPTH_BIAS_ENABLE_EXT = VkDynamicState.VK_DYNAMIC_STATE_DEPTH_BIAS_ENABLE_EXT,
	VK_DYNAMIC_STATE_PRIMITIVE_RESTART_ENABLE_EXT = VkDynamicState.VK_DYNAMIC_STATE_PRIMITIVE_RESTART_ENABLE_EXT,
	VK_DYNAMIC_STATE_MAX_ENUM = VkDynamicState.VK_DYNAMIC_STATE_MAX_ENUM,
}
enum VkEventCreateFlagBits {
	VK_EVENT_CREATE_DEVICE_ONLY_BIT = 0x00000001,
	VK_EVENT_CREATE_DEVICE_ONLY_BIT_KHR = VK_EVENT_CREATE_DEVICE_ONLY_BIT,
	VK_EVENT_CREATE_FLAG_BITS_MAX_ENUM = 0x7FFFFFFF,
}
enum : VkEventCreateFlagBits {
	VK_EVENT_CREATE_DEVICE_ONLY_BIT = VkEventCreateFlagBits.VK_EVENT_CREATE_DEVICE_ONLY_BIT,
	VK_EVENT_CREATE_DEVICE_ONLY_BIT_KHR = VkEventCreateFlagBits.VK_EVENT_CREATE_DEVICE_ONLY_BIT_KHR,
	VK_EVENT_CREATE_FLAG_BITS_MAX_ENUM = VkEventCreateFlagBits.VK_EVENT_CREATE_FLAG_BITS_MAX_ENUM,
}
enum VkExternalFenceFeatureFlagBits {
	VK_EXTERNAL_FENCE_FEATURE_EXPORTABLE_BIT = 0x00000001,
	VK_EXTERNAL_FENCE_FEATURE_IMPORTABLE_BIT = 0x00000002,
	VK_EXTERNAL_FENCE_FEATURE_EXPORTABLE_BIT_KHR = VK_EXTERNAL_FENCE_FEATURE_EXPORTABLE_BIT,
	VK_EXTERNAL_FENCE_FEATURE_IMPORTABLE_BIT_KHR = VK_EXTERNAL_FENCE_FEATURE_IMPORTABLE_BIT,
	VK_EXTERNAL_FENCE_FEATURE_FLAG_BITS_MAX_ENUM = 0x7FFFFFFF,
}
enum : VkExternalFenceFeatureFlagBits {
	VK_EXTERNAL_FENCE_FEATURE_EXPORTABLE_BIT = VkExternalFenceFeatureFlagBits.VK_EXTERNAL_FENCE_FEATURE_EXPORTABLE_BIT,
	VK_EXTERNAL_FENCE_FEATURE_IMPORTABLE_BIT = VkExternalFenceFeatureFlagBits.VK_EXTERNAL_FENCE_FEATURE_IMPORTABLE_BIT,
	VK_EXTERNAL_FENCE_FEATURE_EXPORTABLE_BIT_KHR = VkExternalFenceFeatureFlagBits.VK_EXTERNAL_FENCE_FEATURE_EXPORTABLE_BIT_KHR,
	VK_EXTERNAL_FENCE_FEATURE_IMPORTABLE_BIT_KHR = VkExternalFenceFeatureFlagBits.VK_EXTERNAL_FENCE_FEATURE_IMPORTABLE_BIT_KHR,
	VK_EXTERNAL_FENCE_FEATURE_FLAG_BITS_MAX_ENUM = VkExternalFenceFeatureFlagBits.VK_EXTERNAL_FENCE_FEATURE_FLAG_BITS_MAX_ENUM,
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
enum : VkExternalFenceHandleTypeFlagBits {
	VK_EXTERNAL_FENCE_HANDLE_TYPE_OPAQUE_FD_BIT = VkExternalFenceHandleTypeFlagBits.VK_EXTERNAL_FENCE_HANDLE_TYPE_OPAQUE_FD_BIT,
	VK_EXTERNAL_FENCE_HANDLE_TYPE_OPAQUE_WIN32_BIT = VkExternalFenceHandleTypeFlagBits.VK_EXTERNAL_FENCE_HANDLE_TYPE_OPAQUE_WIN32_BIT,
	VK_EXTERNAL_FENCE_HANDLE_TYPE_OPAQUE_WIN32_KMT_BIT = VkExternalFenceHandleTypeFlagBits.VK_EXTERNAL_FENCE_HANDLE_TYPE_OPAQUE_WIN32_KMT_BIT,
	VK_EXTERNAL_FENCE_HANDLE_TYPE_SYNC_FD_BIT = VkExternalFenceHandleTypeFlagBits.VK_EXTERNAL_FENCE_HANDLE_TYPE_SYNC_FD_BIT,
	VK_EXTERNAL_FENCE_HANDLE_TYPE_OPAQUE_FD_BIT_KHR = VkExternalFenceHandleTypeFlagBits.VK_EXTERNAL_FENCE_HANDLE_TYPE_OPAQUE_FD_BIT_KHR,
	VK_EXTERNAL_FENCE_HANDLE_TYPE_OPAQUE_WIN32_BIT_KHR = VkExternalFenceHandleTypeFlagBits.VK_EXTERNAL_FENCE_HANDLE_TYPE_OPAQUE_WIN32_BIT_KHR,
	VK_EXTERNAL_FENCE_HANDLE_TYPE_OPAQUE_WIN32_KMT_BIT_KHR = VkExternalFenceHandleTypeFlagBits.VK_EXTERNAL_FENCE_HANDLE_TYPE_OPAQUE_WIN32_KMT_BIT_KHR,
	VK_EXTERNAL_FENCE_HANDLE_TYPE_SYNC_FD_BIT_KHR = VkExternalFenceHandleTypeFlagBits.VK_EXTERNAL_FENCE_HANDLE_TYPE_SYNC_FD_BIT_KHR,
	VK_EXTERNAL_FENCE_HANDLE_TYPE_FLAG_BITS_MAX_ENUM = VkExternalFenceHandleTypeFlagBits.VK_EXTERNAL_FENCE_HANDLE_TYPE_FLAG_BITS_MAX_ENUM,
}
enum VkExternalMemoryFeatureFlagBits {
	VK_EXTERNAL_MEMORY_FEATURE_DEDICATED_ONLY_BIT = 0x00000001,
	VK_EXTERNAL_MEMORY_FEATURE_EXPORTABLE_BIT = 0x00000002,
	VK_EXTERNAL_MEMORY_FEATURE_IMPORTABLE_BIT = 0x00000004,
	VK_EXTERNAL_MEMORY_FEATURE_DEDICATED_ONLY_BIT_KHR = VK_EXTERNAL_MEMORY_FEATURE_DEDICATED_ONLY_BIT,
	VK_EXTERNAL_MEMORY_FEATURE_EXPORTABLE_BIT_KHR = VK_EXTERNAL_MEMORY_FEATURE_EXPORTABLE_BIT,
	VK_EXTERNAL_MEMORY_FEATURE_IMPORTABLE_BIT_KHR = VK_EXTERNAL_MEMORY_FEATURE_IMPORTABLE_BIT,
	VK_EXTERNAL_MEMORY_FEATURE_FLAG_BITS_MAX_ENUM = 0x7FFFFFFF,
}
enum : VkExternalMemoryFeatureFlagBits {
	VK_EXTERNAL_MEMORY_FEATURE_DEDICATED_ONLY_BIT = VkExternalMemoryFeatureFlagBits.VK_EXTERNAL_MEMORY_FEATURE_DEDICATED_ONLY_BIT,
	VK_EXTERNAL_MEMORY_FEATURE_EXPORTABLE_BIT = VkExternalMemoryFeatureFlagBits.VK_EXTERNAL_MEMORY_FEATURE_EXPORTABLE_BIT,
	VK_EXTERNAL_MEMORY_FEATURE_IMPORTABLE_BIT = VkExternalMemoryFeatureFlagBits.VK_EXTERNAL_MEMORY_FEATURE_IMPORTABLE_BIT,
	VK_EXTERNAL_MEMORY_FEATURE_DEDICATED_ONLY_BIT_KHR = VkExternalMemoryFeatureFlagBits.VK_EXTERNAL_MEMORY_FEATURE_DEDICATED_ONLY_BIT_KHR,
	VK_EXTERNAL_MEMORY_FEATURE_EXPORTABLE_BIT_KHR = VkExternalMemoryFeatureFlagBits.VK_EXTERNAL_MEMORY_FEATURE_EXPORTABLE_BIT_KHR,
	VK_EXTERNAL_MEMORY_FEATURE_IMPORTABLE_BIT_KHR = VkExternalMemoryFeatureFlagBits.VK_EXTERNAL_MEMORY_FEATURE_IMPORTABLE_BIT_KHR,
	VK_EXTERNAL_MEMORY_FEATURE_FLAG_BITS_MAX_ENUM = VkExternalMemoryFeatureFlagBits.VK_EXTERNAL_MEMORY_FEATURE_FLAG_BITS_MAX_ENUM,
}
enum VkExternalMemoryFeatureFlagBitsNV {
	VK_EXTERNAL_MEMORY_FEATURE_DEDICATED_ONLY_BIT_NV = 0x00000001,
	VK_EXTERNAL_MEMORY_FEATURE_EXPORTABLE_BIT_NV = 0x00000002,
	VK_EXTERNAL_MEMORY_FEATURE_IMPORTABLE_BIT_NV = 0x00000004,
	VK_EXTERNAL_MEMORY_FEATURE_FLAG_BITS_MAX_ENUM_NV = 0x7FFFFFFF,
}
enum : VkExternalMemoryFeatureFlagBitsNV {
	VK_EXTERNAL_MEMORY_FEATURE_DEDICATED_ONLY_BIT_NV = VkExternalMemoryFeatureFlagBitsNV.VK_EXTERNAL_MEMORY_FEATURE_DEDICATED_ONLY_BIT_NV,
	VK_EXTERNAL_MEMORY_FEATURE_EXPORTABLE_BIT_NV = VkExternalMemoryFeatureFlagBitsNV.VK_EXTERNAL_MEMORY_FEATURE_EXPORTABLE_BIT_NV,
	VK_EXTERNAL_MEMORY_FEATURE_IMPORTABLE_BIT_NV = VkExternalMemoryFeatureFlagBitsNV.VK_EXTERNAL_MEMORY_FEATURE_IMPORTABLE_BIT_NV,
	VK_EXTERNAL_MEMORY_FEATURE_FLAG_BITS_MAX_ENUM_NV = VkExternalMemoryFeatureFlagBitsNV.VK_EXTERNAL_MEMORY_FEATURE_FLAG_BITS_MAX_ENUM_NV,
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
	VK_EXTERNAL_MEMORY_HANDLE_TYPE_ZIRCON_VMO_BIT_FUCHSIA = 0x00000800,
	VK_EXTERNAL_MEMORY_HANDLE_TYPE_RDMA_ADDRESS_BIT_NV = 0x00001000,
	VK_EXTERNAL_MEMORY_HANDLE_TYPE_OPAQUE_FD_BIT_KHR = VK_EXTERNAL_MEMORY_HANDLE_TYPE_OPAQUE_FD_BIT,
	VK_EXTERNAL_MEMORY_HANDLE_TYPE_OPAQUE_WIN32_BIT_KHR = VK_EXTERNAL_MEMORY_HANDLE_TYPE_OPAQUE_WIN32_BIT,
	VK_EXTERNAL_MEMORY_HANDLE_TYPE_OPAQUE_WIN32_KMT_BIT_KHR = VK_EXTERNAL_MEMORY_HANDLE_TYPE_OPAQUE_WIN32_KMT_BIT,
	VK_EXTERNAL_MEMORY_HANDLE_TYPE_D3D11_TEXTURE_BIT_KHR = VK_EXTERNAL_MEMORY_HANDLE_TYPE_D3D11_TEXTURE_BIT,
	VK_EXTERNAL_MEMORY_HANDLE_TYPE_D3D11_TEXTURE_KMT_BIT_KHR = VK_EXTERNAL_MEMORY_HANDLE_TYPE_D3D11_TEXTURE_KMT_BIT,
	VK_EXTERNAL_MEMORY_HANDLE_TYPE_D3D12_HEAP_BIT_KHR = VK_EXTERNAL_MEMORY_HANDLE_TYPE_D3D12_HEAP_BIT,
	VK_EXTERNAL_MEMORY_HANDLE_TYPE_D3D12_RESOURCE_BIT_KHR = VK_EXTERNAL_MEMORY_HANDLE_TYPE_D3D12_RESOURCE_BIT,
	VK_EXTERNAL_MEMORY_HANDLE_TYPE_FLAG_BITS_MAX_ENUM = 0x7FFFFFFF,
}
enum : VkExternalMemoryHandleTypeFlagBits {
	VK_EXTERNAL_MEMORY_HANDLE_TYPE_OPAQUE_FD_BIT = VkExternalMemoryHandleTypeFlagBits.VK_EXTERNAL_MEMORY_HANDLE_TYPE_OPAQUE_FD_BIT,
	VK_EXTERNAL_MEMORY_HANDLE_TYPE_OPAQUE_WIN32_BIT = VkExternalMemoryHandleTypeFlagBits.VK_EXTERNAL_MEMORY_HANDLE_TYPE_OPAQUE_WIN32_BIT,
	VK_EXTERNAL_MEMORY_HANDLE_TYPE_OPAQUE_WIN32_KMT_BIT = VkExternalMemoryHandleTypeFlagBits.VK_EXTERNAL_MEMORY_HANDLE_TYPE_OPAQUE_WIN32_KMT_BIT,
	VK_EXTERNAL_MEMORY_HANDLE_TYPE_D3D11_TEXTURE_BIT = VkExternalMemoryHandleTypeFlagBits.VK_EXTERNAL_MEMORY_HANDLE_TYPE_D3D11_TEXTURE_BIT,
	VK_EXTERNAL_MEMORY_HANDLE_TYPE_D3D11_TEXTURE_KMT_BIT = VkExternalMemoryHandleTypeFlagBits.VK_EXTERNAL_MEMORY_HANDLE_TYPE_D3D11_TEXTURE_KMT_BIT,
	VK_EXTERNAL_MEMORY_HANDLE_TYPE_D3D12_HEAP_BIT = VkExternalMemoryHandleTypeFlagBits.VK_EXTERNAL_MEMORY_HANDLE_TYPE_D3D12_HEAP_BIT,
	VK_EXTERNAL_MEMORY_HANDLE_TYPE_D3D12_RESOURCE_BIT = VkExternalMemoryHandleTypeFlagBits.VK_EXTERNAL_MEMORY_HANDLE_TYPE_D3D12_RESOURCE_BIT,
	VK_EXTERNAL_MEMORY_HANDLE_TYPE_DMA_BUF_BIT_EXT = VkExternalMemoryHandleTypeFlagBits.VK_EXTERNAL_MEMORY_HANDLE_TYPE_DMA_BUF_BIT_EXT,
	VK_EXTERNAL_MEMORY_HANDLE_TYPE_ANDROID_HARDWARE_BUFFER_BIT_ANDROID = VkExternalMemoryHandleTypeFlagBits.VK_EXTERNAL_MEMORY_HANDLE_TYPE_ANDROID_HARDWARE_BUFFER_BIT_ANDROID,
	VK_EXTERNAL_MEMORY_HANDLE_TYPE_HOST_ALLOCATION_BIT_EXT = VkExternalMemoryHandleTypeFlagBits.VK_EXTERNAL_MEMORY_HANDLE_TYPE_HOST_ALLOCATION_BIT_EXT,
	VK_EXTERNAL_MEMORY_HANDLE_TYPE_HOST_MAPPED_FOREIGN_MEMORY_BIT_EXT = VkExternalMemoryHandleTypeFlagBits.VK_EXTERNAL_MEMORY_HANDLE_TYPE_HOST_MAPPED_FOREIGN_MEMORY_BIT_EXT,
	VK_EXTERNAL_MEMORY_HANDLE_TYPE_ZIRCON_VMO_BIT_FUCHSIA = VkExternalMemoryHandleTypeFlagBits.VK_EXTERNAL_MEMORY_HANDLE_TYPE_ZIRCON_VMO_BIT_FUCHSIA,
	VK_EXTERNAL_MEMORY_HANDLE_TYPE_RDMA_ADDRESS_BIT_NV = VkExternalMemoryHandleTypeFlagBits.VK_EXTERNAL_MEMORY_HANDLE_TYPE_RDMA_ADDRESS_BIT_NV,
	VK_EXTERNAL_MEMORY_HANDLE_TYPE_OPAQUE_FD_BIT_KHR = VkExternalMemoryHandleTypeFlagBits.VK_EXTERNAL_MEMORY_HANDLE_TYPE_OPAQUE_FD_BIT_KHR,
	VK_EXTERNAL_MEMORY_HANDLE_TYPE_OPAQUE_WIN32_BIT_KHR = VkExternalMemoryHandleTypeFlagBits.VK_EXTERNAL_MEMORY_HANDLE_TYPE_OPAQUE_WIN32_BIT_KHR,
	VK_EXTERNAL_MEMORY_HANDLE_TYPE_OPAQUE_WIN32_KMT_BIT_KHR = VkExternalMemoryHandleTypeFlagBits.VK_EXTERNAL_MEMORY_HANDLE_TYPE_OPAQUE_WIN32_KMT_BIT_KHR,
	VK_EXTERNAL_MEMORY_HANDLE_TYPE_D3D11_TEXTURE_BIT_KHR = VkExternalMemoryHandleTypeFlagBits.VK_EXTERNAL_MEMORY_HANDLE_TYPE_D3D11_TEXTURE_BIT_KHR,
	VK_EXTERNAL_MEMORY_HANDLE_TYPE_D3D11_TEXTURE_KMT_BIT_KHR = VkExternalMemoryHandleTypeFlagBits.VK_EXTERNAL_MEMORY_HANDLE_TYPE_D3D11_TEXTURE_KMT_BIT_KHR,
	VK_EXTERNAL_MEMORY_HANDLE_TYPE_D3D12_HEAP_BIT_KHR = VkExternalMemoryHandleTypeFlagBits.VK_EXTERNAL_MEMORY_HANDLE_TYPE_D3D12_HEAP_BIT_KHR,
	VK_EXTERNAL_MEMORY_HANDLE_TYPE_D3D12_RESOURCE_BIT_KHR = VkExternalMemoryHandleTypeFlagBits.VK_EXTERNAL_MEMORY_HANDLE_TYPE_D3D12_RESOURCE_BIT_KHR,
	VK_EXTERNAL_MEMORY_HANDLE_TYPE_FLAG_BITS_MAX_ENUM = VkExternalMemoryHandleTypeFlagBits.VK_EXTERNAL_MEMORY_HANDLE_TYPE_FLAG_BITS_MAX_ENUM,
}
enum VkExternalMemoryHandleTypeFlagBitsNV {
	VK_EXTERNAL_MEMORY_HANDLE_TYPE_OPAQUE_WIN32_BIT_NV = 0x00000001,
	VK_EXTERNAL_MEMORY_HANDLE_TYPE_OPAQUE_WIN32_KMT_BIT_NV = 0x00000002,
	VK_EXTERNAL_MEMORY_HANDLE_TYPE_D3D11_IMAGE_BIT_NV = 0x00000004,
	VK_EXTERNAL_MEMORY_HANDLE_TYPE_D3D11_IMAGE_KMT_BIT_NV = 0x00000008,
	VK_EXTERNAL_MEMORY_HANDLE_TYPE_FLAG_BITS_MAX_ENUM_NV = 0x7FFFFFFF,
}
enum : VkExternalMemoryHandleTypeFlagBitsNV {
	VK_EXTERNAL_MEMORY_HANDLE_TYPE_OPAQUE_WIN32_BIT_NV = VkExternalMemoryHandleTypeFlagBitsNV.VK_EXTERNAL_MEMORY_HANDLE_TYPE_OPAQUE_WIN32_BIT_NV,
	VK_EXTERNAL_MEMORY_HANDLE_TYPE_OPAQUE_WIN32_KMT_BIT_NV = VkExternalMemoryHandleTypeFlagBitsNV.VK_EXTERNAL_MEMORY_HANDLE_TYPE_OPAQUE_WIN32_KMT_BIT_NV,
	VK_EXTERNAL_MEMORY_HANDLE_TYPE_D3D11_IMAGE_BIT_NV = VkExternalMemoryHandleTypeFlagBitsNV.VK_EXTERNAL_MEMORY_HANDLE_TYPE_D3D11_IMAGE_BIT_NV,
	VK_EXTERNAL_MEMORY_HANDLE_TYPE_D3D11_IMAGE_KMT_BIT_NV = VkExternalMemoryHandleTypeFlagBitsNV.VK_EXTERNAL_MEMORY_HANDLE_TYPE_D3D11_IMAGE_KMT_BIT_NV,
	VK_EXTERNAL_MEMORY_HANDLE_TYPE_FLAG_BITS_MAX_ENUM_NV = VkExternalMemoryHandleTypeFlagBitsNV.VK_EXTERNAL_MEMORY_HANDLE_TYPE_FLAG_BITS_MAX_ENUM_NV,
}
enum VkExternalSemaphoreFeatureFlagBits {
	VK_EXTERNAL_SEMAPHORE_FEATURE_EXPORTABLE_BIT = 0x00000001,
	VK_EXTERNAL_SEMAPHORE_FEATURE_IMPORTABLE_BIT = 0x00000002,
	VK_EXTERNAL_SEMAPHORE_FEATURE_EXPORTABLE_BIT_KHR = VK_EXTERNAL_SEMAPHORE_FEATURE_EXPORTABLE_BIT,
	VK_EXTERNAL_SEMAPHORE_FEATURE_IMPORTABLE_BIT_KHR = VK_EXTERNAL_SEMAPHORE_FEATURE_IMPORTABLE_BIT,
	VK_EXTERNAL_SEMAPHORE_FEATURE_FLAG_BITS_MAX_ENUM = 0x7FFFFFFF,
}
enum : VkExternalSemaphoreFeatureFlagBits {
	VK_EXTERNAL_SEMAPHORE_FEATURE_EXPORTABLE_BIT = VkExternalSemaphoreFeatureFlagBits.VK_EXTERNAL_SEMAPHORE_FEATURE_EXPORTABLE_BIT,
	VK_EXTERNAL_SEMAPHORE_FEATURE_IMPORTABLE_BIT = VkExternalSemaphoreFeatureFlagBits.VK_EXTERNAL_SEMAPHORE_FEATURE_IMPORTABLE_BIT,
	VK_EXTERNAL_SEMAPHORE_FEATURE_EXPORTABLE_BIT_KHR = VkExternalSemaphoreFeatureFlagBits.VK_EXTERNAL_SEMAPHORE_FEATURE_EXPORTABLE_BIT_KHR,
	VK_EXTERNAL_SEMAPHORE_FEATURE_IMPORTABLE_BIT_KHR = VkExternalSemaphoreFeatureFlagBits.VK_EXTERNAL_SEMAPHORE_FEATURE_IMPORTABLE_BIT_KHR,
	VK_EXTERNAL_SEMAPHORE_FEATURE_FLAG_BITS_MAX_ENUM = VkExternalSemaphoreFeatureFlagBits.VK_EXTERNAL_SEMAPHORE_FEATURE_FLAG_BITS_MAX_ENUM,
}
enum VkExternalSemaphoreHandleTypeFlagBits {
	VK_EXTERNAL_SEMAPHORE_HANDLE_TYPE_OPAQUE_FD_BIT = 0x00000001,
	VK_EXTERNAL_SEMAPHORE_HANDLE_TYPE_OPAQUE_WIN32_BIT = 0x00000002,
	VK_EXTERNAL_SEMAPHORE_HANDLE_TYPE_OPAQUE_WIN32_KMT_BIT = 0x00000004,
	VK_EXTERNAL_SEMAPHORE_HANDLE_TYPE_D3D12_FENCE_BIT = 0x00000008,
	VK_EXTERNAL_SEMAPHORE_HANDLE_TYPE_SYNC_FD_BIT = 0x00000010,
	VK_EXTERNAL_SEMAPHORE_HANDLE_TYPE_ZIRCON_EVENT_BIT_FUCHSIA = 0x00000080,
	VK_EXTERNAL_SEMAPHORE_HANDLE_TYPE_D3D11_FENCE_BIT = VK_EXTERNAL_SEMAPHORE_HANDLE_TYPE_D3D12_FENCE_BIT,
	VK_EXTERNAL_SEMAPHORE_HANDLE_TYPE_OPAQUE_FD_BIT_KHR = VK_EXTERNAL_SEMAPHORE_HANDLE_TYPE_OPAQUE_FD_BIT,
	VK_EXTERNAL_SEMAPHORE_HANDLE_TYPE_OPAQUE_WIN32_BIT_KHR = VK_EXTERNAL_SEMAPHORE_HANDLE_TYPE_OPAQUE_WIN32_BIT,
	VK_EXTERNAL_SEMAPHORE_HANDLE_TYPE_OPAQUE_WIN32_KMT_BIT_KHR = VK_EXTERNAL_SEMAPHORE_HANDLE_TYPE_OPAQUE_WIN32_KMT_BIT,
	VK_EXTERNAL_SEMAPHORE_HANDLE_TYPE_D3D12_FENCE_BIT_KHR = VK_EXTERNAL_SEMAPHORE_HANDLE_TYPE_D3D12_FENCE_BIT,
	VK_EXTERNAL_SEMAPHORE_HANDLE_TYPE_SYNC_FD_BIT_KHR = VK_EXTERNAL_SEMAPHORE_HANDLE_TYPE_SYNC_FD_BIT,
	VK_EXTERNAL_SEMAPHORE_HANDLE_TYPE_FLAG_BITS_MAX_ENUM = 0x7FFFFFFF,
}
enum : VkExternalSemaphoreHandleTypeFlagBits {
	VK_EXTERNAL_SEMAPHORE_HANDLE_TYPE_OPAQUE_FD_BIT = VkExternalSemaphoreHandleTypeFlagBits.VK_EXTERNAL_SEMAPHORE_HANDLE_TYPE_OPAQUE_FD_BIT,
	VK_EXTERNAL_SEMAPHORE_HANDLE_TYPE_OPAQUE_WIN32_BIT = VkExternalSemaphoreHandleTypeFlagBits.VK_EXTERNAL_SEMAPHORE_HANDLE_TYPE_OPAQUE_WIN32_BIT,
	VK_EXTERNAL_SEMAPHORE_HANDLE_TYPE_OPAQUE_WIN32_KMT_BIT = VkExternalSemaphoreHandleTypeFlagBits.VK_EXTERNAL_SEMAPHORE_HANDLE_TYPE_OPAQUE_WIN32_KMT_BIT,
	VK_EXTERNAL_SEMAPHORE_HANDLE_TYPE_D3D12_FENCE_BIT = VkExternalSemaphoreHandleTypeFlagBits.VK_EXTERNAL_SEMAPHORE_HANDLE_TYPE_D3D12_FENCE_BIT,
	VK_EXTERNAL_SEMAPHORE_HANDLE_TYPE_SYNC_FD_BIT = VkExternalSemaphoreHandleTypeFlagBits.VK_EXTERNAL_SEMAPHORE_HANDLE_TYPE_SYNC_FD_BIT,
	VK_EXTERNAL_SEMAPHORE_HANDLE_TYPE_ZIRCON_EVENT_BIT_FUCHSIA = VkExternalSemaphoreHandleTypeFlagBits.VK_EXTERNAL_SEMAPHORE_HANDLE_TYPE_ZIRCON_EVENT_BIT_FUCHSIA,
	VK_EXTERNAL_SEMAPHORE_HANDLE_TYPE_D3D11_FENCE_BIT = VkExternalSemaphoreHandleTypeFlagBits.VK_EXTERNAL_SEMAPHORE_HANDLE_TYPE_D3D11_FENCE_BIT,
	VK_EXTERNAL_SEMAPHORE_HANDLE_TYPE_OPAQUE_FD_BIT_KHR = VkExternalSemaphoreHandleTypeFlagBits.VK_EXTERNAL_SEMAPHORE_HANDLE_TYPE_OPAQUE_FD_BIT_KHR,
	VK_EXTERNAL_SEMAPHORE_HANDLE_TYPE_OPAQUE_WIN32_BIT_KHR = VkExternalSemaphoreHandleTypeFlagBits.VK_EXTERNAL_SEMAPHORE_HANDLE_TYPE_OPAQUE_WIN32_BIT_KHR,
	VK_EXTERNAL_SEMAPHORE_HANDLE_TYPE_OPAQUE_WIN32_KMT_BIT_KHR = VkExternalSemaphoreHandleTypeFlagBits.VK_EXTERNAL_SEMAPHORE_HANDLE_TYPE_OPAQUE_WIN32_KMT_BIT_KHR,
	VK_EXTERNAL_SEMAPHORE_HANDLE_TYPE_D3D12_FENCE_BIT_KHR = VkExternalSemaphoreHandleTypeFlagBits.VK_EXTERNAL_SEMAPHORE_HANDLE_TYPE_D3D12_FENCE_BIT_KHR,
	VK_EXTERNAL_SEMAPHORE_HANDLE_TYPE_SYNC_FD_BIT_KHR = VkExternalSemaphoreHandleTypeFlagBits.VK_EXTERNAL_SEMAPHORE_HANDLE_TYPE_SYNC_FD_BIT_KHR,
	VK_EXTERNAL_SEMAPHORE_HANDLE_TYPE_FLAG_BITS_MAX_ENUM = VkExternalSemaphoreHandleTypeFlagBits.VK_EXTERNAL_SEMAPHORE_HANDLE_TYPE_FLAG_BITS_MAX_ENUM,
}
enum VkFenceCreateFlagBits {
	VK_FENCE_CREATE_SIGNALED_BIT = 0x00000001,
	VK_FENCE_CREATE_FLAG_BITS_MAX_ENUM = 0x7FFFFFFF,
}
enum : VkFenceCreateFlagBits {
	VK_FENCE_CREATE_SIGNALED_BIT = VkFenceCreateFlagBits.VK_FENCE_CREATE_SIGNALED_BIT,
	VK_FENCE_CREATE_FLAG_BITS_MAX_ENUM = VkFenceCreateFlagBits.VK_FENCE_CREATE_FLAG_BITS_MAX_ENUM,
}
enum VkFenceImportFlagBits {
	VK_FENCE_IMPORT_TEMPORARY_BIT = 0x00000001,
	VK_FENCE_IMPORT_TEMPORARY_BIT_KHR = VK_FENCE_IMPORT_TEMPORARY_BIT,
	VK_FENCE_IMPORT_FLAG_BITS_MAX_ENUM = 0x7FFFFFFF,
}
enum : VkFenceImportFlagBits {
	VK_FENCE_IMPORT_TEMPORARY_BIT = VkFenceImportFlagBits.VK_FENCE_IMPORT_TEMPORARY_BIT,
	VK_FENCE_IMPORT_TEMPORARY_BIT_KHR = VkFenceImportFlagBits.VK_FENCE_IMPORT_TEMPORARY_BIT_KHR,
	VK_FENCE_IMPORT_FLAG_BITS_MAX_ENUM = VkFenceImportFlagBits.VK_FENCE_IMPORT_FLAG_BITS_MAX_ENUM,
}
enum VkFilter {
	VK_FILTER_NEAREST = 0,
	VK_FILTER_LINEAR = 1,
	VK_FILTER_CUBIC_IMG = 1000015000,
	VK_FILTER_CUBIC_EXT = VK_FILTER_CUBIC_IMG,
	VK_FILTER_MAX_ENUM = 0x7FFFFFFF,
}
enum : VkFilter {
	VK_FILTER_NEAREST = VkFilter.VK_FILTER_NEAREST,
	VK_FILTER_LINEAR = VkFilter.VK_FILTER_LINEAR,
	VK_FILTER_CUBIC_IMG = VkFilter.VK_FILTER_CUBIC_IMG,
	VK_FILTER_CUBIC_EXT = VkFilter.VK_FILTER_CUBIC_EXT,
	VK_FILTER_MAX_ENUM = VkFilter.VK_FILTER_MAX_ENUM,
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
	VK_FORMAT_G8_B8R8_2PLANE_444_UNORM = 1000330000,
	VK_FORMAT_G10X6_B10X6R10X6_2PLANE_444_UNORM_3PACK16 = 1000330001,
	VK_FORMAT_G12X4_B12X4R12X4_2PLANE_444_UNORM_3PACK16 = 1000330002,
	VK_FORMAT_G16_B16R16_2PLANE_444_UNORM = 1000330003,
	VK_FORMAT_A4R4G4B4_UNORM_PACK16 = 1000340000,
	VK_FORMAT_A4B4G4R4_UNORM_PACK16 = 1000340001,
	VK_FORMAT_ASTC_4x4_SFLOAT_BLOCK = 1000066000,
	VK_FORMAT_ASTC_5x4_SFLOAT_BLOCK = 1000066001,
	VK_FORMAT_ASTC_5x5_SFLOAT_BLOCK = 1000066002,
	VK_FORMAT_ASTC_6x5_SFLOAT_BLOCK = 1000066003,
	VK_FORMAT_ASTC_6x6_SFLOAT_BLOCK = 1000066004,
	VK_FORMAT_ASTC_8x5_SFLOAT_BLOCK = 1000066005,
	VK_FORMAT_ASTC_8x6_SFLOAT_BLOCK = 1000066006,
	VK_FORMAT_ASTC_8x8_SFLOAT_BLOCK = 1000066007,
	VK_FORMAT_ASTC_10x5_SFLOAT_BLOCK = 1000066008,
	VK_FORMAT_ASTC_10x6_SFLOAT_BLOCK = 1000066009,
	VK_FORMAT_ASTC_10x8_SFLOAT_BLOCK = 1000066010,
	VK_FORMAT_ASTC_10x10_SFLOAT_BLOCK = 1000066011,
	VK_FORMAT_ASTC_12x10_SFLOAT_BLOCK = 1000066012,
	VK_FORMAT_ASTC_12x12_SFLOAT_BLOCK = 1000066013,
	VK_FORMAT_PVRTC1_2BPP_UNORM_BLOCK_IMG = 1000054000,
	VK_FORMAT_PVRTC1_4BPP_UNORM_BLOCK_IMG = 1000054001,
	VK_FORMAT_PVRTC2_2BPP_UNORM_BLOCK_IMG = 1000054002,
	VK_FORMAT_PVRTC2_4BPP_UNORM_BLOCK_IMG = 1000054003,
	VK_FORMAT_PVRTC1_2BPP_SRGB_BLOCK_IMG = 1000054004,
	VK_FORMAT_PVRTC1_4BPP_SRGB_BLOCK_IMG = 1000054005,
	VK_FORMAT_PVRTC2_2BPP_SRGB_BLOCK_IMG = 1000054006,
	VK_FORMAT_PVRTC2_4BPP_SRGB_BLOCK_IMG = 1000054007,
	VK_FORMAT_ASTC_4x4_SFLOAT_BLOCK_EXT = VK_FORMAT_ASTC_4x4_SFLOAT_BLOCK,
	VK_FORMAT_ASTC_5x4_SFLOAT_BLOCK_EXT = VK_FORMAT_ASTC_5x4_SFLOAT_BLOCK,
	VK_FORMAT_ASTC_5x5_SFLOAT_BLOCK_EXT = VK_FORMAT_ASTC_5x5_SFLOAT_BLOCK,
	VK_FORMAT_ASTC_6x5_SFLOAT_BLOCK_EXT = VK_FORMAT_ASTC_6x5_SFLOAT_BLOCK,
	VK_FORMAT_ASTC_6x6_SFLOAT_BLOCK_EXT = VK_FORMAT_ASTC_6x6_SFLOAT_BLOCK,
	VK_FORMAT_ASTC_8x5_SFLOAT_BLOCK_EXT = VK_FORMAT_ASTC_8x5_SFLOAT_BLOCK,
	VK_FORMAT_ASTC_8x6_SFLOAT_BLOCK_EXT = VK_FORMAT_ASTC_8x6_SFLOAT_BLOCK,
	VK_FORMAT_ASTC_8x8_SFLOAT_BLOCK_EXT = VK_FORMAT_ASTC_8x8_SFLOAT_BLOCK,
	VK_FORMAT_ASTC_10x5_SFLOAT_BLOCK_EXT = VK_FORMAT_ASTC_10x5_SFLOAT_BLOCK,
	VK_FORMAT_ASTC_10x6_SFLOAT_BLOCK_EXT = VK_FORMAT_ASTC_10x6_SFLOAT_BLOCK,
	VK_FORMAT_ASTC_10x8_SFLOAT_BLOCK_EXT = VK_FORMAT_ASTC_10x8_SFLOAT_BLOCK,
	VK_FORMAT_ASTC_10x10_SFLOAT_BLOCK_EXT = VK_FORMAT_ASTC_10x10_SFLOAT_BLOCK,
	VK_FORMAT_ASTC_12x10_SFLOAT_BLOCK_EXT = VK_FORMAT_ASTC_12x10_SFLOAT_BLOCK,
	VK_FORMAT_ASTC_12x12_SFLOAT_BLOCK_EXT = VK_FORMAT_ASTC_12x12_SFLOAT_BLOCK,
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
	VK_FORMAT_G8_B8R8_2PLANE_444_UNORM_EXT = VK_FORMAT_G8_B8R8_2PLANE_444_UNORM,
	VK_FORMAT_G10X6_B10X6R10X6_2PLANE_444_UNORM_3PACK16_EXT = VK_FORMAT_G10X6_B10X6R10X6_2PLANE_444_UNORM_3PACK16,
	VK_FORMAT_G12X4_B12X4R12X4_2PLANE_444_UNORM_3PACK16_EXT = VK_FORMAT_G12X4_B12X4R12X4_2PLANE_444_UNORM_3PACK16,
	VK_FORMAT_G16_B16R16_2PLANE_444_UNORM_EXT = VK_FORMAT_G16_B16R16_2PLANE_444_UNORM,
	VK_FORMAT_A4R4G4B4_UNORM_PACK16_EXT = VK_FORMAT_A4R4G4B4_UNORM_PACK16,
	VK_FORMAT_A4B4G4R4_UNORM_PACK16_EXT = VK_FORMAT_A4B4G4R4_UNORM_PACK16,
	VK_FORMAT_MAX_ENUM = 0x7FFFFFFF,
}
enum : VkFormat {
	VK_FORMAT_UNDEFINED = VkFormat.VK_FORMAT_UNDEFINED,
	VK_FORMAT_R4G4_UNORM_PACK8 = VkFormat.VK_FORMAT_R4G4_UNORM_PACK8,
	VK_FORMAT_R4G4B4A4_UNORM_PACK16 = VkFormat.VK_FORMAT_R4G4B4A4_UNORM_PACK16,
	VK_FORMAT_B4G4R4A4_UNORM_PACK16 = VkFormat.VK_FORMAT_B4G4R4A4_UNORM_PACK16,
	VK_FORMAT_R5G6B5_UNORM_PACK16 = VkFormat.VK_FORMAT_R5G6B5_UNORM_PACK16,
	VK_FORMAT_B5G6R5_UNORM_PACK16 = VkFormat.VK_FORMAT_B5G6R5_UNORM_PACK16,
	VK_FORMAT_R5G5B5A1_UNORM_PACK16 = VkFormat.VK_FORMAT_R5G5B5A1_UNORM_PACK16,
	VK_FORMAT_B5G5R5A1_UNORM_PACK16 = VkFormat.VK_FORMAT_B5G5R5A1_UNORM_PACK16,
	VK_FORMAT_A1R5G5B5_UNORM_PACK16 = VkFormat.VK_FORMAT_A1R5G5B5_UNORM_PACK16,
	VK_FORMAT_R8_UNORM = VkFormat.VK_FORMAT_R8_UNORM,
	VK_FORMAT_R8_SNORM = VkFormat.VK_FORMAT_R8_SNORM,
	VK_FORMAT_R8_USCALED = VkFormat.VK_FORMAT_R8_USCALED,
	VK_FORMAT_R8_SSCALED = VkFormat.VK_FORMAT_R8_SSCALED,
	VK_FORMAT_R8_UINT = VkFormat.VK_FORMAT_R8_UINT,
	VK_FORMAT_R8_SINT = VkFormat.VK_FORMAT_R8_SINT,
	VK_FORMAT_R8_SRGB = VkFormat.VK_FORMAT_R8_SRGB,
	VK_FORMAT_R8G8_UNORM = VkFormat.VK_FORMAT_R8G8_UNORM,
	VK_FORMAT_R8G8_SNORM = VkFormat.VK_FORMAT_R8G8_SNORM,
	VK_FORMAT_R8G8_USCALED = VkFormat.VK_FORMAT_R8G8_USCALED,
	VK_FORMAT_R8G8_SSCALED = VkFormat.VK_FORMAT_R8G8_SSCALED,
	VK_FORMAT_R8G8_UINT = VkFormat.VK_FORMAT_R8G8_UINT,
	VK_FORMAT_R8G8_SINT = VkFormat.VK_FORMAT_R8G8_SINT,
	VK_FORMAT_R8G8_SRGB = VkFormat.VK_FORMAT_R8G8_SRGB,
	VK_FORMAT_R8G8B8_UNORM = VkFormat.VK_FORMAT_R8G8B8_UNORM,
	VK_FORMAT_R8G8B8_SNORM = VkFormat.VK_FORMAT_R8G8B8_SNORM,
	VK_FORMAT_R8G8B8_USCALED = VkFormat.VK_FORMAT_R8G8B8_USCALED,
	VK_FORMAT_R8G8B8_SSCALED = VkFormat.VK_FORMAT_R8G8B8_SSCALED,
	VK_FORMAT_R8G8B8_UINT = VkFormat.VK_FORMAT_R8G8B8_UINT,
	VK_FORMAT_R8G8B8_SINT = VkFormat.VK_FORMAT_R8G8B8_SINT,
	VK_FORMAT_R8G8B8_SRGB = VkFormat.VK_FORMAT_R8G8B8_SRGB,
	VK_FORMAT_B8G8R8_UNORM = VkFormat.VK_FORMAT_B8G8R8_UNORM,
	VK_FORMAT_B8G8R8_SNORM = VkFormat.VK_FORMAT_B8G8R8_SNORM,
	VK_FORMAT_B8G8R8_USCALED = VkFormat.VK_FORMAT_B8G8R8_USCALED,
	VK_FORMAT_B8G8R8_SSCALED = VkFormat.VK_FORMAT_B8G8R8_SSCALED,
	VK_FORMAT_B8G8R8_UINT = VkFormat.VK_FORMAT_B8G8R8_UINT,
	VK_FORMAT_B8G8R8_SINT = VkFormat.VK_FORMAT_B8G8R8_SINT,
	VK_FORMAT_B8G8R8_SRGB = VkFormat.VK_FORMAT_B8G8R8_SRGB,
	VK_FORMAT_R8G8B8A8_UNORM = VkFormat.VK_FORMAT_R8G8B8A8_UNORM,
	VK_FORMAT_R8G8B8A8_SNORM = VkFormat.VK_FORMAT_R8G8B8A8_SNORM,
	VK_FORMAT_R8G8B8A8_USCALED = VkFormat.VK_FORMAT_R8G8B8A8_USCALED,
	VK_FORMAT_R8G8B8A8_SSCALED = VkFormat.VK_FORMAT_R8G8B8A8_SSCALED,
	VK_FORMAT_R8G8B8A8_UINT = VkFormat.VK_FORMAT_R8G8B8A8_UINT,
	VK_FORMAT_R8G8B8A8_SINT = VkFormat.VK_FORMAT_R8G8B8A8_SINT,
	VK_FORMAT_R8G8B8A8_SRGB = VkFormat.VK_FORMAT_R8G8B8A8_SRGB,
	VK_FORMAT_B8G8R8A8_UNORM = VkFormat.VK_FORMAT_B8G8R8A8_UNORM,
	VK_FORMAT_B8G8R8A8_SNORM = VkFormat.VK_FORMAT_B8G8R8A8_SNORM,
	VK_FORMAT_B8G8R8A8_USCALED = VkFormat.VK_FORMAT_B8G8R8A8_USCALED,
	VK_FORMAT_B8G8R8A8_SSCALED = VkFormat.VK_FORMAT_B8G8R8A8_SSCALED,
	VK_FORMAT_B8G8R8A8_UINT = VkFormat.VK_FORMAT_B8G8R8A8_UINT,
	VK_FORMAT_B8G8R8A8_SINT = VkFormat.VK_FORMAT_B8G8R8A8_SINT,
	VK_FORMAT_B8G8R8A8_SRGB = VkFormat.VK_FORMAT_B8G8R8A8_SRGB,
	VK_FORMAT_A8B8G8R8_UNORM_PACK32 = VkFormat.VK_FORMAT_A8B8G8R8_UNORM_PACK32,
	VK_FORMAT_A8B8G8R8_SNORM_PACK32 = VkFormat.VK_FORMAT_A8B8G8R8_SNORM_PACK32,
	VK_FORMAT_A8B8G8R8_USCALED_PACK32 = VkFormat.VK_FORMAT_A8B8G8R8_USCALED_PACK32,
	VK_FORMAT_A8B8G8R8_SSCALED_PACK32 = VkFormat.VK_FORMAT_A8B8G8R8_SSCALED_PACK32,
	VK_FORMAT_A8B8G8R8_UINT_PACK32 = VkFormat.VK_FORMAT_A8B8G8R8_UINT_PACK32,
	VK_FORMAT_A8B8G8R8_SINT_PACK32 = VkFormat.VK_FORMAT_A8B8G8R8_SINT_PACK32,
	VK_FORMAT_A8B8G8R8_SRGB_PACK32 = VkFormat.VK_FORMAT_A8B8G8R8_SRGB_PACK32,
	VK_FORMAT_A2R10G10B10_UNORM_PACK32 = VkFormat.VK_FORMAT_A2R10G10B10_UNORM_PACK32,
	VK_FORMAT_A2R10G10B10_SNORM_PACK32 = VkFormat.VK_FORMAT_A2R10G10B10_SNORM_PACK32,
	VK_FORMAT_A2R10G10B10_USCALED_PACK32 = VkFormat.VK_FORMAT_A2R10G10B10_USCALED_PACK32,
	VK_FORMAT_A2R10G10B10_SSCALED_PACK32 = VkFormat.VK_FORMAT_A2R10G10B10_SSCALED_PACK32,
	VK_FORMAT_A2R10G10B10_UINT_PACK32 = VkFormat.VK_FORMAT_A2R10G10B10_UINT_PACK32,
	VK_FORMAT_A2R10G10B10_SINT_PACK32 = VkFormat.VK_FORMAT_A2R10G10B10_SINT_PACK32,
	VK_FORMAT_A2B10G10R10_UNORM_PACK32 = VkFormat.VK_FORMAT_A2B10G10R10_UNORM_PACK32,
	VK_FORMAT_A2B10G10R10_SNORM_PACK32 = VkFormat.VK_FORMAT_A2B10G10R10_SNORM_PACK32,
	VK_FORMAT_A2B10G10R10_USCALED_PACK32 = VkFormat.VK_FORMAT_A2B10G10R10_USCALED_PACK32,
	VK_FORMAT_A2B10G10R10_SSCALED_PACK32 = VkFormat.VK_FORMAT_A2B10G10R10_SSCALED_PACK32,
	VK_FORMAT_A2B10G10R10_UINT_PACK32 = VkFormat.VK_FORMAT_A2B10G10R10_UINT_PACK32,
	VK_FORMAT_A2B10G10R10_SINT_PACK32 = VkFormat.VK_FORMAT_A2B10G10R10_SINT_PACK32,
	VK_FORMAT_R16_UNORM = VkFormat.VK_FORMAT_R16_UNORM,
	VK_FORMAT_R16_SNORM = VkFormat.VK_FORMAT_R16_SNORM,
	VK_FORMAT_R16_USCALED = VkFormat.VK_FORMAT_R16_USCALED,
	VK_FORMAT_R16_SSCALED = VkFormat.VK_FORMAT_R16_SSCALED,
	VK_FORMAT_R16_UINT = VkFormat.VK_FORMAT_R16_UINT,
	VK_FORMAT_R16_SINT = VkFormat.VK_FORMAT_R16_SINT,
	VK_FORMAT_R16_SFLOAT = VkFormat.VK_FORMAT_R16_SFLOAT,
	VK_FORMAT_R16G16_UNORM = VkFormat.VK_FORMAT_R16G16_UNORM,
	VK_FORMAT_R16G16_SNORM = VkFormat.VK_FORMAT_R16G16_SNORM,
	VK_FORMAT_R16G16_USCALED = VkFormat.VK_FORMAT_R16G16_USCALED,
	VK_FORMAT_R16G16_SSCALED = VkFormat.VK_FORMAT_R16G16_SSCALED,
	VK_FORMAT_R16G16_UINT = VkFormat.VK_FORMAT_R16G16_UINT,
	VK_FORMAT_R16G16_SINT = VkFormat.VK_FORMAT_R16G16_SINT,
	VK_FORMAT_R16G16_SFLOAT = VkFormat.VK_FORMAT_R16G16_SFLOAT,
	VK_FORMAT_R16G16B16_UNORM = VkFormat.VK_FORMAT_R16G16B16_UNORM,
	VK_FORMAT_R16G16B16_SNORM = VkFormat.VK_FORMAT_R16G16B16_SNORM,
	VK_FORMAT_R16G16B16_USCALED = VkFormat.VK_FORMAT_R16G16B16_USCALED,
	VK_FORMAT_R16G16B16_SSCALED = VkFormat.VK_FORMAT_R16G16B16_SSCALED,
	VK_FORMAT_R16G16B16_UINT = VkFormat.VK_FORMAT_R16G16B16_UINT,
	VK_FORMAT_R16G16B16_SINT = VkFormat.VK_FORMAT_R16G16B16_SINT,
	VK_FORMAT_R16G16B16_SFLOAT = VkFormat.VK_FORMAT_R16G16B16_SFLOAT,
	VK_FORMAT_R16G16B16A16_UNORM = VkFormat.VK_FORMAT_R16G16B16A16_UNORM,
	VK_FORMAT_R16G16B16A16_SNORM = VkFormat.VK_FORMAT_R16G16B16A16_SNORM,
	VK_FORMAT_R16G16B16A16_USCALED = VkFormat.VK_FORMAT_R16G16B16A16_USCALED,
	VK_FORMAT_R16G16B16A16_SSCALED = VkFormat.VK_FORMAT_R16G16B16A16_SSCALED,
	VK_FORMAT_R16G16B16A16_UINT = VkFormat.VK_FORMAT_R16G16B16A16_UINT,
	VK_FORMAT_R16G16B16A16_SINT = VkFormat.VK_FORMAT_R16G16B16A16_SINT,
	VK_FORMAT_R16G16B16A16_SFLOAT = VkFormat.VK_FORMAT_R16G16B16A16_SFLOAT,
	VK_FORMAT_R32_UINT = VkFormat.VK_FORMAT_R32_UINT,
	VK_FORMAT_R32_SINT = VkFormat.VK_FORMAT_R32_SINT,
	VK_FORMAT_R32_SFLOAT = VkFormat.VK_FORMAT_R32_SFLOAT,
	VK_FORMAT_R32G32_UINT = VkFormat.VK_FORMAT_R32G32_UINT,
	VK_FORMAT_R32G32_SINT = VkFormat.VK_FORMAT_R32G32_SINT,
	VK_FORMAT_R32G32_SFLOAT = VkFormat.VK_FORMAT_R32G32_SFLOAT,
	VK_FORMAT_R32G32B32_UINT = VkFormat.VK_FORMAT_R32G32B32_UINT,
	VK_FORMAT_R32G32B32_SINT = VkFormat.VK_FORMAT_R32G32B32_SINT,
	VK_FORMAT_R32G32B32_SFLOAT = VkFormat.VK_FORMAT_R32G32B32_SFLOAT,
	VK_FORMAT_R32G32B32A32_UINT = VkFormat.VK_FORMAT_R32G32B32A32_UINT,
	VK_FORMAT_R32G32B32A32_SINT = VkFormat.VK_FORMAT_R32G32B32A32_SINT,
	VK_FORMAT_R32G32B32A32_SFLOAT = VkFormat.VK_FORMAT_R32G32B32A32_SFLOAT,
	VK_FORMAT_R64_UINT = VkFormat.VK_FORMAT_R64_UINT,
	VK_FORMAT_R64_SINT = VkFormat.VK_FORMAT_R64_SINT,
	VK_FORMAT_R64_SFLOAT = VkFormat.VK_FORMAT_R64_SFLOAT,
	VK_FORMAT_R64G64_UINT = VkFormat.VK_FORMAT_R64G64_UINT,
	VK_FORMAT_R64G64_SINT = VkFormat.VK_FORMAT_R64G64_SINT,
	VK_FORMAT_R64G64_SFLOAT = VkFormat.VK_FORMAT_R64G64_SFLOAT,
	VK_FORMAT_R64G64B64_UINT = VkFormat.VK_FORMAT_R64G64B64_UINT,
	VK_FORMAT_R64G64B64_SINT = VkFormat.VK_FORMAT_R64G64B64_SINT,
	VK_FORMAT_R64G64B64_SFLOAT = VkFormat.VK_FORMAT_R64G64B64_SFLOAT,
	VK_FORMAT_R64G64B64A64_UINT = VkFormat.VK_FORMAT_R64G64B64A64_UINT,
	VK_FORMAT_R64G64B64A64_SINT = VkFormat.VK_FORMAT_R64G64B64A64_SINT,
	VK_FORMAT_R64G64B64A64_SFLOAT = VkFormat.VK_FORMAT_R64G64B64A64_SFLOAT,
	VK_FORMAT_B10G11R11_UFLOAT_PACK32 = VkFormat.VK_FORMAT_B10G11R11_UFLOAT_PACK32,
	VK_FORMAT_E5B9G9R9_UFLOAT_PACK32 = VkFormat.VK_FORMAT_E5B9G9R9_UFLOAT_PACK32,
	VK_FORMAT_D16_UNORM = VkFormat.VK_FORMAT_D16_UNORM,
	VK_FORMAT_X8_D24_UNORM_PACK32 = VkFormat.VK_FORMAT_X8_D24_UNORM_PACK32,
	VK_FORMAT_D32_SFLOAT = VkFormat.VK_FORMAT_D32_SFLOAT,
	VK_FORMAT_S8_UINT = VkFormat.VK_FORMAT_S8_UINT,
	VK_FORMAT_D16_UNORM_S8_UINT = VkFormat.VK_FORMAT_D16_UNORM_S8_UINT,
	VK_FORMAT_D24_UNORM_S8_UINT = VkFormat.VK_FORMAT_D24_UNORM_S8_UINT,
	VK_FORMAT_D32_SFLOAT_S8_UINT = VkFormat.VK_FORMAT_D32_SFLOAT_S8_UINT,
	VK_FORMAT_BC1_RGB_UNORM_BLOCK = VkFormat.VK_FORMAT_BC1_RGB_UNORM_BLOCK,
	VK_FORMAT_BC1_RGB_SRGB_BLOCK = VkFormat.VK_FORMAT_BC1_RGB_SRGB_BLOCK,
	VK_FORMAT_BC1_RGBA_UNORM_BLOCK = VkFormat.VK_FORMAT_BC1_RGBA_UNORM_BLOCK,
	VK_FORMAT_BC1_RGBA_SRGB_BLOCK = VkFormat.VK_FORMAT_BC1_RGBA_SRGB_BLOCK,
	VK_FORMAT_BC2_UNORM_BLOCK = VkFormat.VK_FORMAT_BC2_UNORM_BLOCK,
	VK_FORMAT_BC2_SRGB_BLOCK = VkFormat.VK_FORMAT_BC2_SRGB_BLOCK,
	VK_FORMAT_BC3_UNORM_BLOCK = VkFormat.VK_FORMAT_BC3_UNORM_BLOCK,
	VK_FORMAT_BC3_SRGB_BLOCK = VkFormat.VK_FORMAT_BC3_SRGB_BLOCK,
	VK_FORMAT_BC4_UNORM_BLOCK = VkFormat.VK_FORMAT_BC4_UNORM_BLOCK,
	VK_FORMAT_BC4_SNORM_BLOCK = VkFormat.VK_FORMAT_BC4_SNORM_BLOCK,
	VK_FORMAT_BC5_UNORM_BLOCK = VkFormat.VK_FORMAT_BC5_UNORM_BLOCK,
	VK_FORMAT_BC5_SNORM_BLOCK = VkFormat.VK_FORMAT_BC5_SNORM_BLOCK,
	VK_FORMAT_BC6H_UFLOAT_BLOCK = VkFormat.VK_FORMAT_BC6H_UFLOAT_BLOCK,
	VK_FORMAT_BC6H_SFLOAT_BLOCK = VkFormat.VK_FORMAT_BC6H_SFLOAT_BLOCK,
	VK_FORMAT_BC7_UNORM_BLOCK = VkFormat.VK_FORMAT_BC7_UNORM_BLOCK,
	VK_FORMAT_BC7_SRGB_BLOCK = VkFormat.VK_FORMAT_BC7_SRGB_BLOCK,
	VK_FORMAT_ETC2_R8G8B8_UNORM_BLOCK = VkFormat.VK_FORMAT_ETC2_R8G8B8_UNORM_BLOCK,
	VK_FORMAT_ETC2_R8G8B8_SRGB_BLOCK = VkFormat.VK_FORMAT_ETC2_R8G8B8_SRGB_BLOCK,
	VK_FORMAT_ETC2_R8G8B8A1_UNORM_BLOCK = VkFormat.VK_FORMAT_ETC2_R8G8B8A1_UNORM_BLOCK,
	VK_FORMAT_ETC2_R8G8B8A1_SRGB_BLOCK = VkFormat.VK_FORMAT_ETC2_R8G8B8A1_SRGB_BLOCK,
	VK_FORMAT_ETC2_R8G8B8A8_UNORM_BLOCK = VkFormat.VK_FORMAT_ETC2_R8G8B8A8_UNORM_BLOCK,
	VK_FORMAT_ETC2_R8G8B8A8_SRGB_BLOCK = VkFormat.VK_FORMAT_ETC2_R8G8B8A8_SRGB_BLOCK,
	VK_FORMAT_EAC_R11_UNORM_BLOCK = VkFormat.VK_FORMAT_EAC_R11_UNORM_BLOCK,
	VK_FORMAT_EAC_R11_SNORM_BLOCK = VkFormat.VK_FORMAT_EAC_R11_SNORM_BLOCK,
	VK_FORMAT_EAC_R11G11_UNORM_BLOCK = VkFormat.VK_FORMAT_EAC_R11G11_UNORM_BLOCK,
	VK_FORMAT_EAC_R11G11_SNORM_BLOCK = VkFormat.VK_FORMAT_EAC_R11G11_SNORM_BLOCK,
	VK_FORMAT_ASTC_4x4_UNORM_BLOCK = VkFormat.VK_FORMAT_ASTC_4x4_UNORM_BLOCK,
	VK_FORMAT_ASTC_4x4_SRGB_BLOCK = VkFormat.VK_FORMAT_ASTC_4x4_SRGB_BLOCK,
	VK_FORMAT_ASTC_5x4_UNORM_BLOCK = VkFormat.VK_FORMAT_ASTC_5x4_UNORM_BLOCK,
	VK_FORMAT_ASTC_5x4_SRGB_BLOCK = VkFormat.VK_FORMAT_ASTC_5x4_SRGB_BLOCK,
	VK_FORMAT_ASTC_5x5_UNORM_BLOCK = VkFormat.VK_FORMAT_ASTC_5x5_UNORM_BLOCK,
	VK_FORMAT_ASTC_5x5_SRGB_BLOCK = VkFormat.VK_FORMAT_ASTC_5x5_SRGB_BLOCK,
	VK_FORMAT_ASTC_6x5_UNORM_BLOCK = VkFormat.VK_FORMAT_ASTC_6x5_UNORM_BLOCK,
	VK_FORMAT_ASTC_6x5_SRGB_BLOCK = VkFormat.VK_FORMAT_ASTC_6x5_SRGB_BLOCK,
	VK_FORMAT_ASTC_6x6_UNORM_BLOCK = VkFormat.VK_FORMAT_ASTC_6x6_UNORM_BLOCK,
	VK_FORMAT_ASTC_6x6_SRGB_BLOCK = VkFormat.VK_FORMAT_ASTC_6x6_SRGB_BLOCK,
	VK_FORMAT_ASTC_8x5_UNORM_BLOCK = VkFormat.VK_FORMAT_ASTC_8x5_UNORM_BLOCK,
	VK_FORMAT_ASTC_8x5_SRGB_BLOCK = VkFormat.VK_FORMAT_ASTC_8x5_SRGB_BLOCK,
	VK_FORMAT_ASTC_8x6_UNORM_BLOCK = VkFormat.VK_FORMAT_ASTC_8x6_UNORM_BLOCK,
	VK_FORMAT_ASTC_8x6_SRGB_BLOCK = VkFormat.VK_FORMAT_ASTC_8x6_SRGB_BLOCK,
	VK_FORMAT_ASTC_8x8_UNORM_BLOCK = VkFormat.VK_FORMAT_ASTC_8x8_UNORM_BLOCK,
	VK_FORMAT_ASTC_8x8_SRGB_BLOCK = VkFormat.VK_FORMAT_ASTC_8x8_SRGB_BLOCK,
	VK_FORMAT_ASTC_10x5_UNORM_BLOCK = VkFormat.VK_FORMAT_ASTC_10x5_UNORM_BLOCK,
	VK_FORMAT_ASTC_10x5_SRGB_BLOCK = VkFormat.VK_FORMAT_ASTC_10x5_SRGB_BLOCK,
	VK_FORMAT_ASTC_10x6_UNORM_BLOCK = VkFormat.VK_FORMAT_ASTC_10x6_UNORM_BLOCK,
	VK_FORMAT_ASTC_10x6_SRGB_BLOCK = VkFormat.VK_FORMAT_ASTC_10x6_SRGB_BLOCK,
	VK_FORMAT_ASTC_10x8_UNORM_BLOCK = VkFormat.VK_FORMAT_ASTC_10x8_UNORM_BLOCK,
	VK_FORMAT_ASTC_10x8_SRGB_BLOCK = VkFormat.VK_FORMAT_ASTC_10x8_SRGB_BLOCK,
	VK_FORMAT_ASTC_10x10_UNORM_BLOCK = VkFormat.VK_FORMAT_ASTC_10x10_UNORM_BLOCK,
	VK_FORMAT_ASTC_10x10_SRGB_BLOCK = VkFormat.VK_FORMAT_ASTC_10x10_SRGB_BLOCK,
	VK_FORMAT_ASTC_12x10_UNORM_BLOCK = VkFormat.VK_FORMAT_ASTC_12x10_UNORM_BLOCK,
	VK_FORMAT_ASTC_12x10_SRGB_BLOCK = VkFormat.VK_FORMAT_ASTC_12x10_SRGB_BLOCK,
	VK_FORMAT_ASTC_12x12_UNORM_BLOCK = VkFormat.VK_FORMAT_ASTC_12x12_UNORM_BLOCK,
	VK_FORMAT_ASTC_12x12_SRGB_BLOCK = VkFormat.VK_FORMAT_ASTC_12x12_SRGB_BLOCK,
	VK_FORMAT_G8B8G8R8_422_UNORM = VkFormat.VK_FORMAT_G8B8G8R8_422_UNORM,
	VK_FORMAT_B8G8R8G8_422_UNORM = VkFormat.VK_FORMAT_B8G8R8G8_422_UNORM,
	VK_FORMAT_G8_B8_R8_3PLANE_420_UNORM = VkFormat.VK_FORMAT_G8_B8_R8_3PLANE_420_UNORM,
	VK_FORMAT_G8_B8R8_2PLANE_420_UNORM = VkFormat.VK_FORMAT_G8_B8R8_2PLANE_420_UNORM,
	VK_FORMAT_G8_B8_R8_3PLANE_422_UNORM = VkFormat.VK_FORMAT_G8_B8_R8_3PLANE_422_UNORM,
	VK_FORMAT_G8_B8R8_2PLANE_422_UNORM = VkFormat.VK_FORMAT_G8_B8R8_2PLANE_422_UNORM,
	VK_FORMAT_G8_B8_R8_3PLANE_444_UNORM = VkFormat.VK_FORMAT_G8_B8_R8_3PLANE_444_UNORM,
	VK_FORMAT_R10X6_UNORM_PACK16 = VkFormat.VK_FORMAT_R10X6_UNORM_PACK16,
	VK_FORMAT_R10X6G10X6_UNORM_2PACK16 = VkFormat.VK_FORMAT_R10X6G10X6_UNORM_2PACK16,
	VK_FORMAT_R10X6G10X6B10X6A10X6_UNORM_4PACK16 = VkFormat.VK_FORMAT_R10X6G10X6B10X6A10X6_UNORM_4PACK16,
	VK_FORMAT_G10X6B10X6G10X6R10X6_422_UNORM_4PACK16 = VkFormat.VK_FORMAT_G10X6B10X6G10X6R10X6_422_UNORM_4PACK16,
	VK_FORMAT_B10X6G10X6R10X6G10X6_422_UNORM_4PACK16 = VkFormat.VK_FORMAT_B10X6G10X6R10X6G10X6_422_UNORM_4PACK16,
	VK_FORMAT_G10X6_B10X6_R10X6_3PLANE_420_UNORM_3PACK16 = VkFormat.VK_FORMAT_G10X6_B10X6_R10X6_3PLANE_420_UNORM_3PACK16,
	VK_FORMAT_G10X6_B10X6R10X6_2PLANE_420_UNORM_3PACK16 = VkFormat.VK_FORMAT_G10X6_B10X6R10X6_2PLANE_420_UNORM_3PACK16,
	VK_FORMAT_G10X6_B10X6_R10X6_3PLANE_422_UNORM_3PACK16 = VkFormat.VK_FORMAT_G10X6_B10X6_R10X6_3PLANE_422_UNORM_3PACK16,
	VK_FORMAT_G10X6_B10X6R10X6_2PLANE_422_UNORM_3PACK16 = VkFormat.VK_FORMAT_G10X6_B10X6R10X6_2PLANE_422_UNORM_3PACK16,
	VK_FORMAT_G10X6_B10X6_R10X6_3PLANE_444_UNORM_3PACK16 = VkFormat.VK_FORMAT_G10X6_B10X6_R10X6_3PLANE_444_UNORM_3PACK16,
	VK_FORMAT_R12X4_UNORM_PACK16 = VkFormat.VK_FORMAT_R12X4_UNORM_PACK16,
	VK_FORMAT_R12X4G12X4_UNORM_2PACK16 = VkFormat.VK_FORMAT_R12X4G12X4_UNORM_2PACK16,
	VK_FORMAT_R12X4G12X4B12X4A12X4_UNORM_4PACK16 = VkFormat.VK_FORMAT_R12X4G12X4B12X4A12X4_UNORM_4PACK16,
	VK_FORMAT_G12X4B12X4G12X4R12X4_422_UNORM_4PACK16 = VkFormat.VK_FORMAT_G12X4B12X4G12X4R12X4_422_UNORM_4PACK16,
	VK_FORMAT_B12X4G12X4R12X4G12X4_422_UNORM_4PACK16 = VkFormat.VK_FORMAT_B12X4G12X4R12X4G12X4_422_UNORM_4PACK16,
	VK_FORMAT_G12X4_B12X4_R12X4_3PLANE_420_UNORM_3PACK16 = VkFormat.VK_FORMAT_G12X4_B12X4_R12X4_3PLANE_420_UNORM_3PACK16,
	VK_FORMAT_G12X4_B12X4R12X4_2PLANE_420_UNORM_3PACK16 = VkFormat.VK_FORMAT_G12X4_B12X4R12X4_2PLANE_420_UNORM_3PACK16,
	VK_FORMAT_G12X4_B12X4_R12X4_3PLANE_422_UNORM_3PACK16 = VkFormat.VK_FORMAT_G12X4_B12X4_R12X4_3PLANE_422_UNORM_3PACK16,
	VK_FORMAT_G12X4_B12X4R12X4_2PLANE_422_UNORM_3PACK16 = VkFormat.VK_FORMAT_G12X4_B12X4R12X4_2PLANE_422_UNORM_3PACK16,
	VK_FORMAT_G12X4_B12X4_R12X4_3PLANE_444_UNORM_3PACK16 = VkFormat.VK_FORMAT_G12X4_B12X4_R12X4_3PLANE_444_UNORM_3PACK16,
	VK_FORMAT_G16B16G16R16_422_UNORM = VkFormat.VK_FORMAT_G16B16G16R16_422_UNORM,
	VK_FORMAT_B16G16R16G16_422_UNORM = VkFormat.VK_FORMAT_B16G16R16G16_422_UNORM,
	VK_FORMAT_G16_B16_R16_3PLANE_420_UNORM = VkFormat.VK_FORMAT_G16_B16_R16_3PLANE_420_UNORM,
	VK_FORMAT_G16_B16R16_2PLANE_420_UNORM = VkFormat.VK_FORMAT_G16_B16R16_2PLANE_420_UNORM,
	VK_FORMAT_G16_B16_R16_3PLANE_422_UNORM = VkFormat.VK_FORMAT_G16_B16_R16_3PLANE_422_UNORM,
	VK_FORMAT_G16_B16R16_2PLANE_422_UNORM = VkFormat.VK_FORMAT_G16_B16R16_2PLANE_422_UNORM,
	VK_FORMAT_G16_B16_R16_3PLANE_444_UNORM = VkFormat.VK_FORMAT_G16_B16_R16_3PLANE_444_UNORM,
	VK_FORMAT_G8_B8R8_2PLANE_444_UNORM = VkFormat.VK_FORMAT_G8_B8R8_2PLANE_444_UNORM,
	VK_FORMAT_G10X6_B10X6R10X6_2PLANE_444_UNORM_3PACK16 = VkFormat.VK_FORMAT_G10X6_B10X6R10X6_2PLANE_444_UNORM_3PACK16,
	VK_FORMAT_G12X4_B12X4R12X4_2PLANE_444_UNORM_3PACK16 = VkFormat.VK_FORMAT_G12X4_B12X4R12X4_2PLANE_444_UNORM_3PACK16,
	VK_FORMAT_G16_B16R16_2PLANE_444_UNORM = VkFormat.VK_FORMAT_G16_B16R16_2PLANE_444_UNORM,
	VK_FORMAT_A4R4G4B4_UNORM_PACK16 = VkFormat.VK_FORMAT_A4R4G4B4_UNORM_PACK16,
	VK_FORMAT_A4B4G4R4_UNORM_PACK16 = VkFormat.VK_FORMAT_A4B4G4R4_UNORM_PACK16,
	VK_FORMAT_ASTC_4x4_SFLOAT_BLOCK = VkFormat.VK_FORMAT_ASTC_4x4_SFLOAT_BLOCK,
	VK_FORMAT_ASTC_5x4_SFLOAT_BLOCK = VkFormat.VK_FORMAT_ASTC_5x4_SFLOAT_BLOCK,
	VK_FORMAT_ASTC_5x5_SFLOAT_BLOCK = VkFormat.VK_FORMAT_ASTC_5x5_SFLOAT_BLOCK,
	VK_FORMAT_ASTC_6x5_SFLOAT_BLOCK = VkFormat.VK_FORMAT_ASTC_6x5_SFLOAT_BLOCK,
	VK_FORMAT_ASTC_6x6_SFLOAT_BLOCK = VkFormat.VK_FORMAT_ASTC_6x6_SFLOAT_BLOCK,
	VK_FORMAT_ASTC_8x5_SFLOAT_BLOCK = VkFormat.VK_FORMAT_ASTC_8x5_SFLOAT_BLOCK,
	VK_FORMAT_ASTC_8x6_SFLOAT_BLOCK = VkFormat.VK_FORMAT_ASTC_8x6_SFLOAT_BLOCK,
	VK_FORMAT_ASTC_8x8_SFLOAT_BLOCK = VkFormat.VK_FORMAT_ASTC_8x8_SFLOAT_BLOCK,
	VK_FORMAT_ASTC_10x5_SFLOAT_BLOCK = VkFormat.VK_FORMAT_ASTC_10x5_SFLOAT_BLOCK,
	VK_FORMAT_ASTC_10x6_SFLOAT_BLOCK = VkFormat.VK_FORMAT_ASTC_10x6_SFLOAT_BLOCK,
	VK_FORMAT_ASTC_10x8_SFLOAT_BLOCK = VkFormat.VK_FORMAT_ASTC_10x8_SFLOAT_BLOCK,
	VK_FORMAT_ASTC_10x10_SFLOAT_BLOCK = VkFormat.VK_FORMAT_ASTC_10x10_SFLOAT_BLOCK,
	VK_FORMAT_ASTC_12x10_SFLOAT_BLOCK = VkFormat.VK_FORMAT_ASTC_12x10_SFLOAT_BLOCK,
	VK_FORMAT_ASTC_12x12_SFLOAT_BLOCK = VkFormat.VK_FORMAT_ASTC_12x12_SFLOAT_BLOCK,
	VK_FORMAT_PVRTC1_2BPP_UNORM_BLOCK_IMG = VkFormat.VK_FORMAT_PVRTC1_2BPP_UNORM_BLOCK_IMG,
	VK_FORMAT_PVRTC1_4BPP_UNORM_BLOCK_IMG = VkFormat.VK_FORMAT_PVRTC1_4BPP_UNORM_BLOCK_IMG,
	VK_FORMAT_PVRTC2_2BPP_UNORM_BLOCK_IMG = VkFormat.VK_FORMAT_PVRTC2_2BPP_UNORM_BLOCK_IMG,
	VK_FORMAT_PVRTC2_4BPP_UNORM_BLOCK_IMG = VkFormat.VK_FORMAT_PVRTC2_4BPP_UNORM_BLOCK_IMG,
	VK_FORMAT_PVRTC1_2BPP_SRGB_BLOCK_IMG = VkFormat.VK_FORMAT_PVRTC1_2BPP_SRGB_BLOCK_IMG,
	VK_FORMAT_PVRTC1_4BPP_SRGB_BLOCK_IMG = VkFormat.VK_FORMAT_PVRTC1_4BPP_SRGB_BLOCK_IMG,
	VK_FORMAT_PVRTC2_2BPP_SRGB_BLOCK_IMG = VkFormat.VK_FORMAT_PVRTC2_2BPP_SRGB_BLOCK_IMG,
	VK_FORMAT_PVRTC2_4BPP_SRGB_BLOCK_IMG = VkFormat.VK_FORMAT_PVRTC2_4BPP_SRGB_BLOCK_IMG,
	VK_FORMAT_ASTC_4x4_SFLOAT_BLOCK_EXT = VkFormat.VK_FORMAT_ASTC_4x4_SFLOAT_BLOCK_EXT,
	VK_FORMAT_ASTC_5x4_SFLOAT_BLOCK_EXT = VkFormat.VK_FORMAT_ASTC_5x4_SFLOAT_BLOCK_EXT,
	VK_FORMAT_ASTC_5x5_SFLOAT_BLOCK_EXT = VkFormat.VK_FORMAT_ASTC_5x5_SFLOAT_BLOCK_EXT,
	VK_FORMAT_ASTC_6x5_SFLOAT_BLOCK_EXT = VkFormat.VK_FORMAT_ASTC_6x5_SFLOAT_BLOCK_EXT,
	VK_FORMAT_ASTC_6x6_SFLOAT_BLOCK_EXT = VkFormat.VK_FORMAT_ASTC_6x6_SFLOAT_BLOCK_EXT,
	VK_FORMAT_ASTC_8x5_SFLOAT_BLOCK_EXT = VkFormat.VK_FORMAT_ASTC_8x5_SFLOAT_BLOCK_EXT,
	VK_FORMAT_ASTC_8x6_SFLOAT_BLOCK_EXT = VkFormat.VK_FORMAT_ASTC_8x6_SFLOAT_BLOCK_EXT,
	VK_FORMAT_ASTC_8x8_SFLOAT_BLOCK_EXT = VkFormat.VK_FORMAT_ASTC_8x8_SFLOAT_BLOCK_EXT,
	VK_FORMAT_ASTC_10x5_SFLOAT_BLOCK_EXT = VkFormat.VK_FORMAT_ASTC_10x5_SFLOAT_BLOCK_EXT,
	VK_FORMAT_ASTC_10x6_SFLOAT_BLOCK_EXT = VkFormat.VK_FORMAT_ASTC_10x6_SFLOAT_BLOCK_EXT,
	VK_FORMAT_ASTC_10x8_SFLOAT_BLOCK_EXT = VkFormat.VK_FORMAT_ASTC_10x8_SFLOAT_BLOCK_EXT,
	VK_FORMAT_ASTC_10x10_SFLOAT_BLOCK_EXT = VkFormat.VK_FORMAT_ASTC_10x10_SFLOAT_BLOCK_EXT,
	VK_FORMAT_ASTC_12x10_SFLOAT_BLOCK_EXT = VkFormat.VK_FORMAT_ASTC_12x10_SFLOAT_BLOCK_EXT,
	VK_FORMAT_ASTC_12x12_SFLOAT_BLOCK_EXT = VkFormat.VK_FORMAT_ASTC_12x12_SFLOAT_BLOCK_EXT,
	VK_FORMAT_G8B8G8R8_422_UNORM_KHR = VkFormat.VK_FORMAT_G8B8G8R8_422_UNORM_KHR,
	VK_FORMAT_B8G8R8G8_422_UNORM_KHR = VkFormat.VK_FORMAT_B8G8R8G8_422_UNORM_KHR,
	VK_FORMAT_G8_B8_R8_3PLANE_420_UNORM_KHR = VkFormat.VK_FORMAT_G8_B8_R8_3PLANE_420_UNORM_KHR,
	VK_FORMAT_G8_B8R8_2PLANE_420_UNORM_KHR = VkFormat.VK_FORMAT_G8_B8R8_2PLANE_420_UNORM_KHR,
	VK_FORMAT_G8_B8_R8_3PLANE_422_UNORM_KHR = VkFormat.VK_FORMAT_G8_B8_R8_3PLANE_422_UNORM_KHR,
	VK_FORMAT_G8_B8R8_2PLANE_422_UNORM_KHR = VkFormat.VK_FORMAT_G8_B8R8_2PLANE_422_UNORM_KHR,
	VK_FORMAT_G8_B8_R8_3PLANE_444_UNORM_KHR = VkFormat.VK_FORMAT_G8_B8_R8_3PLANE_444_UNORM_KHR,
	VK_FORMAT_R10X6_UNORM_PACK16_KHR = VkFormat.VK_FORMAT_R10X6_UNORM_PACK16_KHR,
	VK_FORMAT_R10X6G10X6_UNORM_2PACK16_KHR = VkFormat.VK_FORMAT_R10X6G10X6_UNORM_2PACK16_KHR,
	VK_FORMAT_R10X6G10X6B10X6A10X6_UNORM_4PACK16_KHR = VkFormat.VK_FORMAT_R10X6G10X6B10X6A10X6_UNORM_4PACK16_KHR,
	VK_FORMAT_G10X6B10X6G10X6R10X6_422_UNORM_4PACK16_KHR = VkFormat.VK_FORMAT_G10X6B10X6G10X6R10X6_422_UNORM_4PACK16_KHR,
	VK_FORMAT_B10X6G10X6R10X6G10X6_422_UNORM_4PACK16_KHR = VkFormat.VK_FORMAT_B10X6G10X6R10X6G10X6_422_UNORM_4PACK16_KHR,
	VK_FORMAT_G10X6_B10X6_R10X6_3PLANE_420_UNORM_3PACK16_KHR = VkFormat.VK_FORMAT_G10X6_B10X6_R10X6_3PLANE_420_UNORM_3PACK16_KHR,
	VK_FORMAT_G10X6_B10X6R10X6_2PLANE_420_UNORM_3PACK16_KHR = VkFormat.VK_FORMAT_G10X6_B10X6R10X6_2PLANE_420_UNORM_3PACK16_KHR,
	VK_FORMAT_G10X6_B10X6_R10X6_3PLANE_422_UNORM_3PACK16_KHR = VkFormat.VK_FORMAT_G10X6_B10X6_R10X6_3PLANE_422_UNORM_3PACK16_KHR,
	VK_FORMAT_G10X6_B10X6R10X6_2PLANE_422_UNORM_3PACK16_KHR = VkFormat.VK_FORMAT_G10X6_B10X6R10X6_2PLANE_422_UNORM_3PACK16_KHR,
	VK_FORMAT_G10X6_B10X6_R10X6_3PLANE_444_UNORM_3PACK16_KHR = VkFormat.VK_FORMAT_G10X6_B10X6_R10X6_3PLANE_444_UNORM_3PACK16_KHR,
	VK_FORMAT_R12X4_UNORM_PACK16_KHR = VkFormat.VK_FORMAT_R12X4_UNORM_PACK16_KHR,
	VK_FORMAT_R12X4G12X4_UNORM_2PACK16_KHR = VkFormat.VK_FORMAT_R12X4G12X4_UNORM_2PACK16_KHR,
	VK_FORMAT_R12X4G12X4B12X4A12X4_UNORM_4PACK16_KHR = VkFormat.VK_FORMAT_R12X4G12X4B12X4A12X4_UNORM_4PACK16_KHR,
	VK_FORMAT_G12X4B12X4G12X4R12X4_422_UNORM_4PACK16_KHR = VkFormat.VK_FORMAT_G12X4B12X4G12X4R12X4_422_UNORM_4PACK16_KHR,
	VK_FORMAT_B12X4G12X4R12X4G12X4_422_UNORM_4PACK16_KHR = VkFormat.VK_FORMAT_B12X4G12X4R12X4G12X4_422_UNORM_4PACK16_KHR,
	VK_FORMAT_G12X4_B12X4_R12X4_3PLANE_420_UNORM_3PACK16_KHR = VkFormat.VK_FORMAT_G12X4_B12X4_R12X4_3PLANE_420_UNORM_3PACK16_KHR,
	VK_FORMAT_G12X4_B12X4R12X4_2PLANE_420_UNORM_3PACK16_KHR = VkFormat.VK_FORMAT_G12X4_B12X4R12X4_2PLANE_420_UNORM_3PACK16_KHR,
	VK_FORMAT_G12X4_B12X4_R12X4_3PLANE_422_UNORM_3PACK16_KHR = VkFormat.VK_FORMAT_G12X4_B12X4_R12X4_3PLANE_422_UNORM_3PACK16_KHR,
	VK_FORMAT_G12X4_B12X4R12X4_2PLANE_422_UNORM_3PACK16_KHR = VkFormat.VK_FORMAT_G12X4_B12X4R12X4_2PLANE_422_UNORM_3PACK16_KHR,
	VK_FORMAT_G12X4_B12X4_R12X4_3PLANE_444_UNORM_3PACK16_KHR = VkFormat.VK_FORMAT_G12X4_B12X4_R12X4_3PLANE_444_UNORM_3PACK16_KHR,
	VK_FORMAT_G16B16G16R16_422_UNORM_KHR = VkFormat.VK_FORMAT_G16B16G16R16_422_UNORM_KHR,
	VK_FORMAT_B16G16R16G16_422_UNORM_KHR = VkFormat.VK_FORMAT_B16G16R16G16_422_UNORM_KHR,
	VK_FORMAT_G16_B16_R16_3PLANE_420_UNORM_KHR = VkFormat.VK_FORMAT_G16_B16_R16_3PLANE_420_UNORM_KHR,
	VK_FORMAT_G16_B16R16_2PLANE_420_UNORM_KHR = VkFormat.VK_FORMAT_G16_B16R16_2PLANE_420_UNORM_KHR,
	VK_FORMAT_G16_B16_R16_3PLANE_422_UNORM_KHR = VkFormat.VK_FORMAT_G16_B16_R16_3PLANE_422_UNORM_KHR,
	VK_FORMAT_G16_B16R16_2PLANE_422_UNORM_KHR = VkFormat.VK_FORMAT_G16_B16R16_2PLANE_422_UNORM_KHR,
	VK_FORMAT_G16_B16_R16_3PLANE_444_UNORM_KHR = VkFormat.VK_FORMAT_G16_B16_R16_3PLANE_444_UNORM_KHR,
	VK_FORMAT_G8_B8R8_2PLANE_444_UNORM_EXT = VkFormat.VK_FORMAT_G8_B8R8_2PLANE_444_UNORM_EXT,
	VK_FORMAT_G10X6_B10X6R10X6_2PLANE_444_UNORM_3PACK16_EXT = VkFormat.VK_FORMAT_G10X6_B10X6R10X6_2PLANE_444_UNORM_3PACK16_EXT,
	VK_FORMAT_G12X4_B12X4R12X4_2PLANE_444_UNORM_3PACK16_EXT = VkFormat.VK_FORMAT_G12X4_B12X4R12X4_2PLANE_444_UNORM_3PACK16_EXT,
	VK_FORMAT_G16_B16R16_2PLANE_444_UNORM_EXT = VkFormat.VK_FORMAT_G16_B16R16_2PLANE_444_UNORM_EXT,
	VK_FORMAT_A4R4G4B4_UNORM_PACK16_EXT = VkFormat.VK_FORMAT_A4R4G4B4_UNORM_PACK16_EXT,
	VK_FORMAT_A4B4G4R4_UNORM_PACK16_EXT = VkFormat.VK_FORMAT_A4B4G4R4_UNORM_PACK16_EXT,
	VK_FORMAT_MAX_ENUM = VkFormat.VK_FORMAT_MAX_ENUM,
}
enum VkFormatFeatureFlagBits {
	VK_FORMAT_FEATURE_SAMPLED_IMAGE_BIT = 0x00000001,
	VK_FORMAT_FEATURE_STORAGE_IMAGE_BIT = 0x00000002,
	VK_FORMAT_FEATURE_STORAGE_IMAGE_ATOMIC_BIT = 0x00000004,
	VK_FORMAT_FEATURE_UNIFORM_TEXEL_BUFFER_BIT = 0x00000008,
	VK_FORMAT_FEATURE_STORAGE_TEXEL_BUFFER_BIT = 0x00000010,
	VK_FORMAT_FEATURE_STORAGE_TEXEL_BUFFER_ATOMIC_BIT = 0x00000020,
	VK_FORMAT_FEATURE_VERTEX_BUFFER_BIT = 0x00000040,
	VK_FORMAT_FEATURE_COLOR_ATTACHMENT_BIT = 0x00000080,
	VK_FORMAT_FEATURE_COLOR_ATTACHMENT_BLEND_BIT = 0x00000100,
	VK_FORMAT_FEATURE_DEPTH_STENCIL_ATTACHMENT_BIT = 0x00000200,
	VK_FORMAT_FEATURE_BLIT_SRC_BIT = 0x00000400,
	VK_FORMAT_FEATURE_BLIT_DST_BIT = 0x00000800,
	VK_FORMAT_FEATURE_SAMPLED_IMAGE_FILTER_LINEAR_BIT = 0x00001000,
	VK_FORMAT_FEATURE_TRANSFER_SRC_BIT = 0x00004000,
	VK_FORMAT_FEATURE_TRANSFER_DST_BIT = 0x00008000,
	VK_FORMAT_FEATURE_MIDPOINT_CHROMA_SAMPLES_BIT = 0x00020000,
	VK_FORMAT_FEATURE_SAMPLED_IMAGE_YCBCR_CONVERSION_LINEAR_FILTER_BIT = 0x00040000,
	VK_FORMAT_FEATURE_SAMPLED_IMAGE_YCBCR_CONVERSION_SEPARATE_RECONSTRUCTION_FILTER_BIT = 0x00080000,
	VK_FORMAT_FEATURE_SAMPLED_IMAGE_YCBCR_CONVERSION_CHROMA_RECONSTRUCTION_EXPLICIT_BIT = 0x00100000,
	VK_FORMAT_FEATURE_SAMPLED_IMAGE_YCBCR_CONVERSION_CHROMA_RECONSTRUCTION_EXPLICIT_FORCEABLE_BIT = 0x00200000,
	VK_FORMAT_FEATURE_DISJOINT_BIT = 0x00400000,
	VK_FORMAT_FEATURE_COSITED_CHROMA_SAMPLES_BIT = 0x00800000,
	VK_FORMAT_FEATURE_SAMPLED_IMAGE_FILTER_MINMAX_BIT = 0x00010000,
	VK_FORMAT_FEATURE_SAMPLED_IMAGE_FILTER_CUBIC_BIT_IMG = 0x00002000,
	VK_FORMAT_FEATURE_ACCELERATION_STRUCTURE_VERTEX_BUFFER_BIT_KHR = 0x20000000,
	VK_FORMAT_FEATURE_FRAGMENT_DENSITY_MAP_BIT_EXT = 0x01000000,
	VK_FORMAT_FEATURE_FRAGMENT_SHADING_RATE_ATTACHMENT_BIT_KHR = 0x40000000,
	VK_FORMAT_FEATURE_TRANSFER_SRC_BIT_KHR = VK_FORMAT_FEATURE_TRANSFER_SRC_BIT,
	VK_FORMAT_FEATURE_TRANSFER_DST_BIT_KHR = VK_FORMAT_FEATURE_TRANSFER_DST_BIT,
	VK_FORMAT_FEATURE_SAMPLED_IMAGE_FILTER_MINMAX_BIT_EXT = VK_FORMAT_FEATURE_SAMPLED_IMAGE_FILTER_MINMAX_BIT,
	VK_FORMAT_FEATURE_MIDPOINT_CHROMA_SAMPLES_BIT_KHR = VK_FORMAT_FEATURE_MIDPOINT_CHROMA_SAMPLES_BIT,
	VK_FORMAT_FEATURE_SAMPLED_IMAGE_YCBCR_CONVERSION_LINEAR_FILTER_BIT_KHR = VK_FORMAT_FEATURE_SAMPLED_IMAGE_YCBCR_CONVERSION_LINEAR_FILTER_BIT,
	VK_FORMAT_FEATURE_SAMPLED_IMAGE_YCBCR_CONVERSION_SEPARATE_RECONSTRUCTION_FILTER_BIT_KHR = VK_FORMAT_FEATURE_SAMPLED_IMAGE_YCBCR_CONVERSION_SEPARATE_RECONSTRUCTION_FILTER_BIT,
	VK_FORMAT_FEATURE_SAMPLED_IMAGE_YCBCR_CONVERSION_CHROMA_RECONSTRUCTION_EXPLICIT_BIT_KHR = VK_FORMAT_FEATURE_SAMPLED_IMAGE_YCBCR_CONVERSION_CHROMA_RECONSTRUCTION_EXPLICIT_BIT,
	VK_FORMAT_FEATURE_SAMPLED_IMAGE_YCBCR_CONVERSION_CHROMA_RECONSTRUCTION_EXPLICIT_FORCEABLE_BIT_KHR = VK_FORMAT_FEATURE_SAMPLED_IMAGE_YCBCR_CONVERSION_CHROMA_RECONSTRUCTION_EXPLICIT_FORCEABLE_BIT,
	VK_FORMAT_FEATURE_DISJOINT_BIT_KHR = VK_FORMAT_FEATURE_DISJOINT_BIT,
	VK_FORMAT_FEATURE_COSITED_CHROMA_SAMPLES_BIT_KHR = VK_FORMAT_FEATURE_COSITED_CHROMA_SAMPLES_BIT,
	VK_FORMAT_FEATURE_SAMPLED_IMAGE_FILTER_CUBIC_BIT_EXT = VK_FORMAT_FEATURE_SAMPLED_IMAGE_FILTER_CUBIC_BIT_IMG,
	VK_FORMAT_FEATURE_FLAG_BITS_MAX_ENUM = 0x7FFFFFFF,
}
enum : VkFormatFeatureFlagBits {
	VK_FORMAT_FEATURE_SAMPLED_IMAGE_BIT = VkFormatFeatureFlagBits.VK_FORMAT_FEATURE_SAMPLED_IMAGE_BIT,
	VK_FORMAT_FEATURE_STORAGE_IMAGE_BIT = VkFormatFeatureFlagBits.VK_FORMAT_FEATURE_STORAGE_IMAGE_BIT,
	VK_FORMAT_FEATURE_STORAGE_IMAGE_ATOMIC_BIT = VkFormatFeatureFlagBits.VK_FORMAT_FEATURE_STORAGE_IMAGE_ATOMIC_BIT,
	VK_FORMAT_FEATURE_UNIFORM_TEXEL_BUFFER_BIT = VkFormatFeatureFlagBits.VK_FORMAT_FEATURE_UNIFORM_TEXEL_BUFFER_BIT,
	VK_FORMAT_FEATURE_STORAGE_TEXEL_BUFFER_BIT = VkFormatFeatureFlagBits.VK_FORMAT_FEATURE_STORAGE_TEXEL_BUFFER_BIT,
	VK_FORMAT_FEATURE_STORAGE_TEXEL_BUFFER_ATOMIC_BIT = VkFormatFeatureFlagBits.VK_FORMAT_FEATURE_STORAGE_TEXEL_BUFFER_ATOMIC_BIT,
	VK_FORMAT_FEATURE_VERTEX_BUFFER_BIT = VkFormatFeatureFlagBits.VK_FORMAT_FEATURE_VERTEX_BUFFER_BIT,
	VK_FORMAT_FEATURE_COLOR_ATTACHMENT_BIT = VkFormatFeatureFlagBits.VK_FORMAT_FEATURE_COLOR_ATTACHMENT_BIT,
	VK_FORMAT_FEATURE_COLOR_ATTACHMENT_BLEND_BIT = VkFormatFeatureFlagBits.VK_FORMAT_FEATURE_COLOR_ATTACHMENT_BLEND_BIT,
	VK_FORMAT_FEATURE_DEPTH_STENCIL_ATTACHMENT_BIT = VkFormatFeatureFlagBits.VK_FORMAT_FEATURE_DEPTH_STENCIL_ATTACHMENT_BIT,
	VK_FORMAT_FEATURE_BLIT_SRC_BIT = VkFormatFeatureFlagBits.VK_FORMAT_FEATURE_BLIT_SRC_BIT,
	VK_FORMAT_FEATURE_BLIT_DST_BIT = VkFormatFeatureFlagBits.VK_FORMAT_FEATURE_BLIT_DST_BIT,
	VK_FORMAT_FEATURE_SAMPLED_IMAGE_FILTER_LINEAR_BIT = VkFormatFeatureFlagBits.VK_FORMAT_FEATURE_SAMPLED_IMAGE_FILTER_LINEAR_BIT,
	VK_FORMAT_FEATURE_TRANSFER_SRC_BIT = VkFormatFeatureFlagBits.VK_FORMAT_FEATURE_TRANSFER_SRC_BIT,
	VK_FORMAT_FEATURE_TRANSFER_DST_BIT = VkFormatFeatureFlagBits.VK_FORMAT_FEATURE_TRANSFER_DST_BIT,
	VK_FORMAT_FEATURE_MIDPOINT_CHROMA_SAMPLES_BIT = VkFormatFeatureFlagBits.VK_FORMAT_FEATURE_MIDPOINT_CHROMA_SAMPLES_BIT,
	VK_FORMAT_FEATURE_SAMPLED_IMAGE_YCBCR_CONVERSION_LINEAR_FILTER_BIT = VkFormatFeatureFlagBits.VK_FORMAT_FEATURE_SAMPLED_IMAGE_YCBCR_CONVERSION_LINEAR_FILTER_BIT,
	VK_FORMAT_FEATURE_SAMPLED_IMAGE_YCBCR_CONVERSION_SEPARATE_RECONSTRUCTION_FILTER_BIT = VkFormatFeatureFlagBits.VK_FORMAT_FEATURE_SAMPLED_IMAGE_YCBCR_CONVERSION_SEPARATE_RECONSTRUCTION_FILTER_BIT,
	VK_FORMAT_FEATURE_SAMPLED_IMAGE_YCBCR_CONVERSION_CHROMA_RECONSTRUCTION_EXPLICIT_BIT = VkFormatFeatureFlagBits.VK_FORMAT_FEATURE_SAMPLED_IMAGE_YCBCR_CONVERSION_CHROMA_RECONSTRUCTION_EXPLICIT_BIT,
	VK_FORMAT_FEATURE_SAMPLED_IMAGE_YCBCR_CONVERSION_CHROMA_RECONSTRUCTION_EXPLICIT_FORCEABLE_BIT = VkFormatFeatureFlagBits.VK_FORMAT_FEATURE_SAMPLED_IMAGE_YCBCR_CONVERSION_CHROMA_RECONSTRUCTION_EXPLICIT_FORCEABLE_BIT,
	VK_FORMAT_FEATURE_DISJOINT_BIT = VkFormatFeatureFlagBits.VK_FORMAT_FEATURE_DISJOINT_BIT,
	VK_FORMAT_FEATURE_COSITED_CHROMA_SAMPLES_BIT = VkFormatFeatureFlagBits.VK_FORMAT_FEATURE_COSITED_CHROMA_SAMPLES_BIT,
	VK_FORMAT_FEATURE_SAMPLED_IMAGE_FILTER_MINMAX_BIT = VkFormatFeatureFlagBits.VK_FORMAT_FEATURE_SAMPLED_IMAGE_FILTER_MINMAX_BIT,
	VK_FORMAT_FEATURE_SAMPLED_IMAGE_FILTER_CUBIC_BIT_IMG = VkFormatFeatureFlagBits.VK_FORMAT_FEATURE_SAMPLED_IMAGE_FILTER_CUBIC_BIT_IMG,
	VK_FORMAT_FEATURE_ACCELERATION_STRUCTURE_VERTEX_BUFFER_BIT_KHR = VkFormatFeatureFlagBits.VK_FORMAT_FEATURE_ACCELERATION_STRUCTURE_VERTEX_BUFFER_BIT_KHR,
	VK_FORMAT_FEATURE_FRAGMENT_DENSITY_MAP_BIT_EXT = VkFormatFeatureFlagBits.VK_FORMAT_FEATURE_FRAGMENT_DENSITY_MAP_BIT_EXT,
	VK_FORMAT_FEATURE_FRAGMENT_SHADING_RATE_ATTACHMENT_BIT_KHR = VkFormatFeatureFlagBits.VK_FORMAT_FEATURE_FRAGMENT_SHADING_RATE_ATTACHMENT_BIT_KHR,
	VK_FORMAT_FEATURE_TRANSFER_SRC_BIT_KHR = VkFormatFeatureFlagBits.VK_FORMAT_FEATURE_TRANSFER_SRC_BIT_KHR,
	VK_FORMAT_FEATURE_TRANSFER_DST_BIT_KHR = VkFormatFeatureFlagBits.VK_FORMAT_FEATURE_TRANSFER_DST_BIT_KHR,
	VK_FORMAT_FEATURE_SAMPLED_IMAGE_FILTER_MINMAX_BIT_EXT = VkFormatFeatureFlagBits.VK_FORMAT_FEATURE_SAMPLED_IMAGE_FILTER_MINMAX_BIT_EXT,
	VK_FORMAT_FEATURE_MIDPOINT_CHROMA_SAMPLES_BIT_KHR = VkFormatFeatureFlagBits.VK_FORMAT_FEATURE_MIDPOINT_CHROMA_SAMPLES_BIT_KHR,
	VK_FORMAT_FEATURE_SAMPLED_IMAGE_YCBCR_CONVERSION_LINEAR_FILTER_BIT_KHR = VkFormatFeatureFlagBits.VK_FORMAT_FEATURE_SAMPLED_IMAGE_YCBCR_CONVERSION_LINEAR_FILTER_BIT_KHR,
	VK_FORMAT_FEATURE_SAMPLED_IMAGE_YCBCR_CONVERSION_SEPARATE_RECONSTRUCTION_FILTER_BIT_KHR = VkFormatFeatureFlagBits.VK_FORMAT_FEATURE_SAMPLED_IMAGE_YCBCR_CONVERSION_SEPARATE_RECONSTRUCTION_FILTER_BIT_KHR,
	VK_FORMAT_FEATURE_SAMPLED_IMAGE_YCBCR_CONVERSION_CHROMA_RECONSTRUCTION_EXPLICIT_BIT_KHR = VkFormatFeatureFlagBits.VK_FORMAT_FEATURE_SAMPLED_IMAGE_YCBCR_CONVERSION_CHROMA_RECONSTRUCTION_EXPLICIT_BIT_KHR,
	VK_FORMAT_FEATURE_SAMPLED_IMAGE_YCBCR_CONVERSION_CHROMA_RECONSTRUCTION_EXPLICIT_FORCEABLE_BIT_KHR = VkFormatFeatureFlagBits.VK_FORMAT_FEATURE_SAMPLED_IMAGE_YCBCR_CONVERSION_CHROMA_RECONSTRUCTION_EXPLICIT_FORCEABLE_BIT_KHR,
	VK_FORMAT_FEATURE_DISJOINT_BIT_KHR = VkFormatFeatureFlagBits.VK_FORMAT_FEATURE_DISJOINT_BIT_KHR,
	VK_FORMAT_FEATURE_COSITED_CHROMA_SAMPLES_BIT_KHR = VkFormatFeatureFlagBits.VK_FORMAT_FEATURE_COSITED_CHROMA_SAMPLES_BIT_KHR,
	VK_FORMAT_FEATURE_SAMPLED_IMAGE_FILTER_CUBIC_BIT_EXT = VkFormatFeatureFlagBits.VK_FORMAT_FEATURE_SAMPLED_IMAGE_FILTER_CUBIC_BIT_EXT,
	VK_FORMAT_FEATURE_FLAG_BITS_MAX_ENUM = VkFormatFeatureFlagBits.VK_FORMAT_FEATURE_FLAG_BITS_MAX_ENUM,
}
enum VkFragmentShadingRateCombinerOpKHR {
	VK_FRAGMENT_SHADING_RATE_COMBINER_OP_KEEP_KHR = 0,
	VK_FRAGMENT_SHADING_RATE_COMBINER_OP_REPLACE_KHR = 1,
	VK_FRAGMENT_SHADING_RATE_COMBINER_OP_MIN_KHR = 2,
	VK_FRAGMENT_SHADING_RATE_COMBINER_OP_MAX_KHR = 3,
	VK_FRAGMENT_SHADING_RATE_COMBINER_OP_MUL_KHR = 4,
	VK_FRAGMENT_SHADING_RATE_COMBINER_OP_MAX_ENUM_KHR = 0x7FFFFFFF,
}
enum : VkFragmentShadingRateCombinerOpKHR {
	VK_FRAGMENT_SHADING_RATE_COMBINER_OP_KEEP_KHR = VkFragmentShadingRateCombinerOpKHR.VK_FRAGMENT_SHADING_RATE_COMBINER_OP_KEEP_KHR,
	VK_FRAGMENT_SHADING_RATE_COMBINER_OP_REPLACE_KHR = VkFragmentShadingRateCombinerOpKHR.VK_FRAGMENT_SHADING_RATE_COMBINER_OP_REPLACE_KHR,
	VK_FRAGMENT_SHADING_RATE_COMBINER_OP_MIN_KHR = VkFragmentShadingRateCombinerOpKHR.VK_FRAGMENT_SHADING_RATE_COMBINER_OP_MIN_KHR,
	VK_FRAGMENT_SHADING_RATE_COMBINER_OP_MAX_KHR = VkFragmentShadingRateCombinerOpKHR.VK_FRAGMENT_SHADING_RATE_COMBINER_OP_MAX_KHR,
	VK_FRAGMENT_SHADING_RATE_COMBINER_OP_MUL_KHR = VkFragmentShadingRateCombinerOpKHR.VK_FRAGMENT_SHADING_RATE_COMBINER_OP_MUL_KHR,
	VK_FRAGMENT_SHADING_RATE_COMBINER_OP_MAX_ENUM_KHR = VkFragmentShadingRateCombinerOpKHR.VK_FRAGMENT_SHADING_RATE_COMBINER_OP_MAX_ENUM_KHR,
}
enum VkFragmentShadingRateNV {
	VK_FRAGMENT_SHADING_RATE_1_INVOCATION_PER_PIXEL_NV = 0,
	VK_FRAGMENT_SHADING_RATE_1_INVOCATION_PER_1X2_PIXELS_NV = 1,
	VK_FRAGMENT_SHADING_RATE_1_INVOCATION_PER_2X1_PIXELS_NV = 4,
	VK_FRAGMENT_SHADING_RATE_1_INVOCATION_PER_2X2_PIXELS_NV = 5,
	VK_FRAGMENT_SHADING_RATE_1_INVOCATION_PER_2X4_PIXELS_NV = 6,
	VK_FRAGMENT_SHADING_RATE_1_INVOCATION_PER_4X2_PIXELS_NV = 9,
	VK_FRAGMENT_SHADING_RATE_1_INVOCATION_PER_4X4_PIXELS_NV = 10,
	VK_FRAGMENT_SHADING_RATE_2_INVOCATIONS_PER_PIXEL_NV = 11,
	VK_FRAGMENT_SHADING_RATE_4_INVOCATIONS_PER_PIXEL_NV = 12,
	VK_FRAGMENT_SHADING_RATE_8_INVOCATIONS_PER_PIXEL_NV = 13,
	VK_FRAGMENT_SHADING_RATE_16_INVOCATIONS_PER_PIXEL_NV = 14,
	VK_FRAGMENT_SHADING_RATE_NO_INVOCATIONS_NV = 15,
	VK_FRAGMENT_SHADING_RATE_MAX_ENUM_NV = 0x7FFFFFFF,
}
enum : VkFragmentShadingRateNV {
	VK_FRAGMENT_SHADING_RATE_1_INVOCATION_PER_PIXEL_NV = VkFragmentShadingRateNV.VK_FRAGMENT_SHADING_RATE_1_INVOCATION_PER_PIXEL_NV,
	VK_FRAGMENT_SHADING_RATE_1_INVOCATION_PER_1X2_PIXELS_NV = VkFragmentShadingRateNV.VK_FRAGMENT_SHADING_RATE_1_INVOCATION_PER_1X2_PIXELS_NV,
	VK_FRAGMENT_SHADING_RATE_1_INVOCATION_PER_2X1_PIXELS_NV = VkFragmentShadingRateNV.VK_FRAGMENT_SHADING_RATE_1_INVOCATION_PER_2X1_PIXELS_NV,
	VK_FRAGMENT_SHADING_RATE_1_INVOCATION_PER_2X2_PIXELS_NV = VkFragmentShadingRateNV.VK_FRAGMENT_SHADING_RATE_1_INVOCATION_PER_2X2_PIXELS_NV,
	VK_FRAGMENT_SHADING_RATE_1_INVOCATION_PER_2X4_PIXELS_NV = VkFragmentShadingRateNV.VK_FRAGMENT_SHADING_RATE_1_INVOCATION_PER_2X4_PIXELS_NV,
	VK_FRAGMENT_SHADING_RATE_1_INVOCATION_PER_4X2_PIXELS_NV = VkFragmentShadingRateNV.VK_FRAGMENT_SHADING_RATE_1_INVOCATION_PER_4X2_PIXELS_NV,
	VK_FRAGMENT_SHADING_RATE_1_INVOCATION_PER_4X4_PIXELS_NV = VkFragmentShadingRateNV.VK_FRAGMENT_SHADING_RATE_1_INVOCATION_PER_4X4_PIXELS_NV,
	VK_FRAGMENT_SHADING_RATE_2_INVOCATIONS_PER_PIXEL_NV = VkFragmentShadingRateNV.VK_FRAGMENT_SHADING_RATE_2_INVOCATIONS_PER_PIXEL_NV,
	VK_FRAGMENT_SHADING_RATE_4_INVOCATIONS_PER_PIXEL_NV = VkFragmentShadingRateNV.VK_FRAGMENT_SHADING_RATE_4_INVOCATIONS_PER_PIXEL_NV,
	VK_FRAGMENT_SHADING_RATE_8_INVOCATIONS_PER_PIXEL_NV = VkFragmentShadingRateNV.VK_FRAGMENT_SHADING_RATE_8_INVOCATIONS_PER_PIXEL_NV,
	VK_FRAGMENT_SHADING_RATE_16_INVOCATIONS_PER_PIXEL_NV = VkFragmentShadingRateNV.VK_FRAGMENT_SHADING_RATE_16_INVOCATIONS_PER_PIXEL_NV,
	VK_FRAGMENT_SHADING_RATE_NO_INVOCATIONS_NV = VkFragmentShadingRateNV.VK_FRAGMENT_SHADING_RATE_NO_INVOCATIONS_NV,
	VK_FRAGMENT_SHADING_RATE_MAX_ENUM_NV = VkFragmentShadingRateNV.VK_FRAGMENT_SHADING_RATE_MAX_ENUM_NV,
}
enum VkFragmentShadingRateTypeNV {
	VK_FRAGMENT_SHADING_RATE_TYPE_FRAGMENT_SIZE_NV = 0,
	VK_FRAGMENT_SHADING_RATE_TYPE_ENUMS_NV = 1,
	VK_FRAGMENT_SHADING_RATE_TYPE_MAX_ENUM_NV = 0x7FFFFFFF,
}
enum : VkFragmentShadingRateTypeNV {
	VK_FRAGMENT_SHADING_RATE_TYPE_FRAGMENT_SIZE_NV = VkFragmentShadingRateTypeNV.VK_FRAGMENT_SHADING_RATE_TYPE_FRAGMENT_SIZE_NV,
	VK_FRAGMENT_SHADING_RATE_TYPE_ENUMS_NV = VkFragmentShadingRateTypeNV.VK_FRAGMENT_SHADING_RATE_TYPE_ENUMS_NV,
	VK_FRAGMENT_SHADING_RATE_TYPE_MAX_ENUM_NV = VkFragmentShadingRateTypeNV.VK_FRAGMENT_SHADING_RATE_TYPE_MAX_ENUM_NV,
}
enum VkFramebufferCreateFlagBits {
	VK_FRAMEBUFFER_CREATE_IMAGELESS_BIT = 0x00000001,
	VK_FRAMEBUFFER_CREATE_IMAGELESS_BIT_KHR = VK_FRAMEBUFFER_CREATE_IMAGELESS_BIT,
	VK_FRAMEBUFFER_CREATE_FLAG_BITS_MAX_ENUM = 0x7FFFFFFF,
}
enum : VkFramebufferCreateFlagBits {
	VK_FRAMEBUFFER_CREATE_IMAGELESS_BIT = VkFramebufferCreateFlagBits.VK_FRAMEBUFFER_CREATE_IMAGELESS_BIT,
	VK_FRAMEBUFFER_CREATE_IMAGELESS_BIT_KHR = VkFramebufferCreateFlagBits.VK_FRAMEBUFFER_CREATE_IMAGELESS_BIT_KHR,
	VK_FRAMEBUFFER_CREATE_FLAG_BITS_MAX_ENUM = VkFramebufferCreateFlagBits.VK_FRAMEBUFFER_CREATE_FLAG_BITS_MAX_ENUM,
}
enum VkFrontFace {
	VK_FRONT_FACE_COUNTER_CLOCKWISE = 0,
	VK_FRONT_FACE_CLOCKWISE = 1,
	VK_FRONT_FACE_MAX_ENUM = 0x7FFFFFFF,
}
enum : VkFrontFace {
	VK_FRONT_FACE_COUNTER_CLOCKWISE = VkFrontFace.VK_FRONT_FACE_COUNTER_CLOCKWISE,
	VK_FRONT_FACE_CLOCKWISE = VkFrontFace.VK_FRONT_FACE_CLOCKWISE,
	VK_FRONT_FACE_MAX_ENUM = VkFrontFace.VK_FRONT_FACE_MAX_ENUM,
}
enum VkFullScreenExclusiveEXT {
	VK_FULL_SCREEN_EXCLUSIVE_DEFAULT_EXT = 0,
	VK_FULL_SCREEN_EXCLUSIVE_ALLOWED_EXT = 1,
	VK_FULL_SCREEN_EXCLUSIVE_DISALLOWED_EXT = 2,
	VK_FULL_SCREEN_EXCLUSIVE_APPLICATION_CONTROLLED_EXT = 3,
	VK_FULL_SCREEN_EXCLUSIVE_MAX_ENUM_EXT = 0x7FFFFFFF,
}
enum : VkFullScreenExclusiveEXT {
	VK_FULL_SCREEN_EXCLUSIVE_DEFAULT_EXT = VkFullScreenExclusiveEXT.VK_FULL_SCREEN_EXCLUSIVE_DEFAULT_EXT,
	VK_FULL_SCREEN_EXCLUSIVE_ALLOWED_EXT = VkFullScreenExclusiveEXT.VK_FULL_SCREEN_EXCLUSIVE_ALLOWED_EXT,
	VK_FULL_SCREEN_EXCLUSIVE_DISALLOWED_EXT = VkFullScreenExclusiveEXT.VK_FULL_SCREEN_EXCLUSIVE_DISALLOWED_EXT,
	VK_FULL_SCREEN_EXCLUSIVE_APPLICATION_CONTROLLED_EXT = VkFullScreenExclusiveEXT.VK_FULL_SCREEN_EXCLUSIVE_APPLICATION_CONTROLLED_EXT,
	VK_FULL_SCREEN_EXCLUSIVE_MAX_ENUM_EXT = VkFullScreenExclusiveEXT.VK_FULL_SCREEN_EXCLUSIVE_MAX_ENUM_EXT,
}
enum VkGeometryFlagBitsKHR {
	VK_GEOMETRY_OPAQUE_BIT_KHR = 0x00000001,
	VK_GEOMETRY_NO_DUPLICATE_ANY_HIT_INVOCATION_BIT_KHR = 0x00000002,
	VK_GEOMETRY_OPAQUE_BIT_NV = VK_GEOMETRY_OPAQUE_BIT_KHR,
	VK_GEOMETRY_NO_DUPLICATE_ANY_HIT_INVOCATION_BIT_NV = VK_GEOMETRY_NO_DUPLICATE_ANY_HIT_INVOCATION_BIT_KHR,
	VK_GEOMETRY_FLAG_BITS_MAX_ENUM_KHR = 0x7FFFFFFF,
}
enum : VkGeometryFlagBitsKHR {
	VK_GEOMETRY_OPAQUE_BIT_KHR = VkGeometryFlagBitsKHR.VK_GEOMETRY_OPAQUE_BIT_KHR,
	VK_GEOMETRY_NO_DUPLICATE_ANY_HIT_INVOCATION_BIT_KHR = VkGeometryFlagBitsKHR.VK_GEOMETRY_NO_DUPLICATE_ANY_HIT_INVOCATION_BIT_KHR,
	VK_GEOMETRY_OPAQUE_BIT_NV = VkGeometryFlagBitsKHR.VK_GEOMETRY_OPAQUE_BIT_NV,
	VK_GEOMETRY_NO_DUPLICATE_ANY_HIT_INVOCATION_BIT_NV = VkGeometryFlagBitsKHR.VK_GEOMETRY_NO_DUPLICATE_ANY_HIT_INVOCATION_BIT_NV,
	VK_GEOMETRY_FLAG_BITS_MAX_ENUM_KHR = VkGeometryFlagBitsKHR.VK_GEOMETRY_FLAG_BITS_MAX_ENUM_KHR,
}
enum VkGeometryInstanceFlagBitsKHR {
	VK_GEOMETRY_INSTANCE_TRIANGLE_FACING_CULL_DISABLE_BIT_KHR = 0x00000001,
	VK_GEOMETRY_INSTANCE_TRIANGLE_FLIP_FACING_BIT_KHR = 0x00000002,
	VK_GEOMETRY_INSTANCE_FORCE_OPAQUE_BIT_KHR = 0x00000004,
	VK_GEOMETRY_INSTANCE_FORCE_NO_OPAQUE_BIT_KHR = 0x00000008,
	VK_GEOMETRY_INSTANCE_TRIANGLE_FRONT_COUNTERCLOCKWISE_BIT_KHR = VK_GEOMETRY_INSTANCE_TRIANGLE_FLIP_FACING_BIT_KHR,
	VK_GEOMETRY_INSTANCE_TRIANGLE_CULL_DISABLE_BIT_NV = VK_GEOMETRY_INSTANCE_TRIANGLE_FACING_CULL_DISABLE_BIT_KHR,
	VK_GEOMETRY_INSTANCE_TRIANGLE_FRONT_COUNTERCLOCKWISE_BIT_NV = VK_GEOMETRY_INSTANCE_TRIANGLE_FRONT_COUNTERCLOCKWISE_BIT_KHR,
	VK_GEOMETRY_INSTANCE_FORCE_OPAQUE_BIT_NV = VK_GEOMETRY_INSTANCE_FORCE_OPAQUE_BIT_KHR,
	VK_GEOMETRY_INSTANCE_FORCE_NO_OPAQUE_BIT_NV = VK_GEOMETRY_INSTANCE_FORCE_NO_OPAQUE_BIT_KHR,
	VK_GEOMETRY_INSTANCE_FLAG_BITS_MAX_ENUM_KHR = 0x7FFFFFFF,
}
enum : VkGeometryInstanceFlagBitsKHR {
	VK_GEOMETRY_INSTANCE_TRIANGLE_FACING_CULL_DISABLE_BIT_KHR = VkGeometryInstanceFlagBitsKHR.VK_GEOMETRY_INSTANCE_TRIANGLE_FACING_CULL_DISABLE_BIT_KHR,
	VK_GEOMETRY_INSTANCE_TRIANGLE_FLIP_FACING_BIT_KHR = VkGeometryInstanceFlagBitsKHR.VK_GEOMETRY_INSTANCE_TRIANGLE_FLIP_FACING_BIT_KHR,
	VK_GEOMETRY_INSTANCE_FORCE_OPAQUE_BIT_KHR = VkGeometryInstanceFlagBitsKHR.VK_GEOMETRY_INSTANCE_FORCE_OPAQUE_BIT_KHR,
	VK_GEOMETRY_INSTANCE_FORCE_NO_OPAQUE_BIT_KHR = VkGeometryInstanceFlagBitsKHR.VK_GEOMETRY_INSTANCE_FORCE_NO_OPAQUE_BIT_KHR,
	VK_GEOMETRY_INSTANCE_TRIANGLE_FRONT_COUNTERCLOCKWISE_BIT_KHR = VkGeometryInstanceFlagBitsKHR.VK_GEOMETRY_INSTANCE_TRIANGLE_FRONT_COUNTERCLOCKWISE_BIT_KHR,
	VK_GEOMETRY_INSTANCE_TRIANGLE_CULL_DISABLE_BIT_NV = VkGeometryInstanceFlagBitsKHR.VK_GEOMETRY_INSTANCE_TRIANGLE_CULL_DISABLE_BIT_NV,
	VK_GEOMETRY_INSTANCE_TRIANGLE_FRONT_COUNTERCLOCKWISE_BIT_NV = VkGeometryInstanceFlagBitsKHR.VK_GEOMETRY_INSTANCE_TRIANGLE_FRONT_COUNTERCLOCKWISE_BIT_NV,
	VK_GEOMETRY_INSTANCE_FORCE_OPAQUE_BIT_NV = VkGeometryInstanceFlagBitsKHR.VK_GEOMETRY_INSTANCE_FORCE_OPAQUE_BIT_NV,
	VK_GEOMETRY_INSTANCE_FORCE_NO_OPAQUE_BIT_NV = VkGeometryInstanceFlagBitsKHR.VK_GEOMETRY_INSTANCE_FORCE_NO_OPAQUE_BIT_NV,
	VK_GEOMETRY_INSTANCE_FLAG_BITS_MAX_ENUM_KHR = VkGeometryInstanceFlagBitsKHR.VK_GEOMETRY_INSTANCE_FLAG_BITS_MAX_ENUM_KHR,
}
enum VkGeometryTypeKHR {
	VK_GEOMETRY_TYPE_TRIANGLES_KHR = 0,
	VK_GEOMETRY_TYPE_AABBS_KHR = 1,
	VK_GEOMETRY_TYPE_INSTANCES_KHR = 2,
	VK_GEOMETRY_TYPE_TRIANGLES_NV = VK_GEOMETRY_TYPE_TRIANGLES_KHR,
	VK_GEOMETRY_TYPE_AABBS_NV = VK_GEOMETRY_TYPE_AABBS_KHR,
	VK_GEOMETRY_TYPE_MAX_ENUM_KHR = 0x7FFFFFFF,
}
enum : VkGeometryTypeKHR {
	VK_GEOMETRY_TYPE_TRIANGLES_KHR = VkGeometryTypeKHR.VK_GEOMETRY_TYPE_TRIANGLES_KHR,
	VK_GEOMETRY_TYPE_AABBS_KHR = VkGeometryTypeKHR.VK_GEOMETRY_TYPE_AABBS_KHR,
	VK_GEOMETRY_TYPE_INSTANCES_KHR = VkGeometryTypeKHR.VK_GEOMETRY_TYPE_INSTANCES_KHR,
	VK_GEOMETRY_TYPE_TRIANGLES_NV = VkGeometryTypeKHR.VK_GEOMETRY_TYPE_TRIANGLES_NV,
	VK_GEOMETRY_TYPE_AABBS_NV = VkGeometryTypeKHR.VK_GEOMETRY_TYPE_AABBS_NV,
	VK_GEOMETRY_TYPE_MAX_ENUM_KHR = VkGeometryTypeKHR.VK_GEOMETRY_TYPE_MAX_ENUM_KHR,
}
enum VkGraphicsPipelineLibraryFlagBitsEXT {
	VK_GRAPHICS_PIPELINE_LIBRARY_VERTEX_INPUT_INTERFACE_BIT_EXT = 0x00000001,
	VK_GRAPHICS_PIPELINE_LIBRARY_PRE_RASTERIZATION_SHADERS_BIT_EXT = 0x00000002,
	VK_GRAPHICS_PIPELINE_LIBRARY_FRAGMENT_SHADER_BIT_EXT = 0x00000004,
	VK_GRAPHICS_PIPELINE_LIBRARY_FRAGMENT_OUTPUT_INTERFACE_BIT_EXT = 0x00000008,
	VK_GRAPHICS_PIPELINE_LIBRARY_FLAG_BITS_MAX_ENUM_EXT = 0x7FFFFFFF,
}
enum : VkGraphicsPipelineLibraryFlagBitsEXT {
	VK_GRAPHICS_PIPELINE_LIBRARY_VERTEX_INPUT_INTERFACE_BIT_EXT = VkGraphicsPipelineLibraryFlagBitsEXT.VK_GRAPHICS_PIPELINE_LIBRARY_VERTEX_INPUT_INTERFACE_BIT_EXT,
	VK_GRAPHICS_PIPELINE_LIBRARY_PRE_RASTERIZATION_SHADERS_BIT_EXT = VkGraphicsPipelineLibraryFlagBitsEXT.VK_GRAPHICS_PIPELINE_LIBRARY_PRE_RASTERIZATION_SHADERS_BIT_EXT,
	VK_GRAPHICS_PIPELINE_LIBRARY_FRAGMENT_SHADER_BIT_EXT = VkGraphicsPipelineLibraryFlagBitsEXT.VK_GRAPHICS_PIPELINE_LIBRARY_FRAGMENT_SHADER_BIT_EXT,
	VK_GRAPHICS_PIPELINE_LIBRARY_FRAGMENT_OUTPUT_INTERFACE_BIT_EXT = VkGraphicsPipelineLibraryFlagBitsEXT.VK_GRAPHICS_PIPELINE_LIBRARY_FRAGMENT_OUTPUT_INTERFACE_BIT_EXT,
	VK_GRAPHICS_PIPELINE_LIBRARY_FLAG_BITS_MAX_ENUM_EXT = VkGraphicsPipelineLibraryFlagBitsEXT.VK_GRAPHICS_PIPELINE_LIBRARY_FLAG_BITS_MAX_ENUM_EXT,
}
enum VkImageAspectFlagBits {
	VK_IMAGE_ASPECT_COLOR_BIT = 0x00000001,
	VK_IMAGE_ASPECT_DEPTH_BIT = 0x00000002,
	VK_IMAGE_ASPECT_STENCIL_BIT = 0x00000004,
	VK_IMAGE_ASPECT_METADATA_BIT = 0x00000008,
	VK_IMAGE_ASPECT_PLANE_0_BIT = 0x00000010,
	VK_IMAGE_ASPECT_PLANE_1_BIT = 0x00000020,
	VK_IMAGE_ASPECT_PLANE_2_BIT = 0x00000040,
	VK_IMAGE_ASPECT_NONE = 0,
	VK_IMAGE_ASPECT_MEMORY_PLANE_0_BIT_EXT = 0x00000080,
	VK_IMAGE_ASPECT_MEMORY_PLANE_1_BIT_EXT = 0x00000100,
	VK_IMAGE_ASPECT_MEMORY_PLANE_2_BIT_EXT = 0x00000200,
	VK_IMAGE_ASPECT_MEMORY_PLANE_3_BIT_EXT = 0x00000400,
	VK_IMAGE_ASPECT_PLANE_0_BIT_KHR = VK_IMAGE_ASPECT_PLANE_0_BIT,
	VK_IMAGE_ASPECT_PLANE_1_BIT_KHR = VK_IMAGE_ASPECT_PLANE_1_BIT,
	VK_IMAGE_ASPECT_PLANE_2_BIT_KHR = VK_IMAGE_ASPECT_PLANE_2_BIT,
	VK_IMAGE_ASPECT_NONE_KHR = VK_IMAGE_ASPECT_NONE,
	VK_IMAGE_ASPECT_FLAG_BITS_MAX_ENUM = 0x7FFFFFFF,
}
enum : VkImageAspectFlagBits {
	VK_IMAGE_ASPECT_COLOR_BIT = VkImageAspectFlagBits.VK_IMAGE_ASPECT_COLOR_BIT,
	VK_IMAGE_ASPECT_DEPTH_BIT = VkImageAspectFlagBits.VK_IMAGE_ASPECT_DEPTH_BIT,
	VK_IMAGE_ASPECT_STENCIL_BIT = VkImageAspectFlagBits.VK_IMAGE_ASPECT_STENCIL_BIT,
	VK_IMAGE_ASPECT_METADATA_BIT = VkImageAspectFlagBits.VK_IMAGE_ASPECT_METADATA_BIT,
	VK_IMAGE_ASPECT_PLANE_0_BIT = VkImageAspectFlagBits.VK_IMAGE_ASPECT_PLANE_0_BIT,
	VK_IMAGE_ASPECT_PLANE_1_BIT = VkImageAspectFlagBits.VK_IMAGE_ASPECT_PLANE_1_BIT,
	VK_IMAGE_ASPECT_PLANE_2_BIT = VkImageAspectFlagBits.VK_IMAGE_ASPECT_PLANE_2_BIT,
	VK_IMAGE_ASPECT_NONE = VkImageAspectFlagBits.VK_IMAGE_ASPECT_NONE,
	VK_IMAGE_ASPECT_MEMORY_PLANE_0_BIT_EXT = VkImageAspectFlagBits.VK_IMAGE_ASPECT_MEMORY_PLANE_0_BIT_EXT,
	VK_IMAGE_ASPECT_MEMORY_PLANE_1_BIT_EXT = VkImageAspectFlagBits.VK_IMAGE_ASPECT_MEMORY_PLANE_1_BIT_EXT,
	VK_IMAGE_ASPECT_MEMORY_PLANE_2_BIT_EXT = VkImageAspectFlagBits.VK_IMAGE_ASPECT_MEMORY_PLANE_2_BIT_EXT,
	VK_IMAGE_ASPECT_MEMORY_PLANE_3_BIT_EXT = VkImageAspectFlagBits.VK_IMAGE_ASPECT_MEMORY_PLANE_3_BIT_EXT,
	VK_IMAGE_ASPECT_PLANE_0_BIT_KHR = VkImageAspectFlagBits.VK_IMAGE_ASPECT_PLANE_0_BIT_KHR,
	VK_IMAGE_ASPECT_PLANE_1_BIT_KHR = VkImageAspectFlagBits.VK_IMAGE_ASPECT_PLANE_1_BIT_KHR,
	VK_IMAGE_ASPECT_PLANE_2_BIT_KHR = VkImageAspectFlagBits.VK_IMAGE_ASPECT_PLANE_2_BIT_KHR,
	VK_IMAGE_ASPECT_NONE_KHR = VkImageAspectFlagBits.VK_IMAGE_ASPECT_NONE_KHR,
	VK_IMAGE_ASPECT_FLAG_BITS_MAX_ENUM = VkImageAspectFlagBits.VK_IMAGE_ASPECT_FLAG_BITS_MAX_ENUM,
}
enum VkImageCreateFlagBits {
	VK_IMAGE_CREATE_SPARSE_BINDING_BIT = 0x00000001,
	VK_IMAGE_CREATE_SPARSE_RESIDENCY_BIT = 0x00000002,
	VK_IMAGE_CREATE_SPARSE_ALIASED_BIT = 0x00000004,
	VK_IMAGE_CREATE_MUTABLE_FORMAT_BIT = 0x00000008,
	VK_IMAGE_CREATE_CUBE_COMPATIBLE_BIT = 0x00000010,
	VK_IMAGE_CREATE_ALIAS_BIT = 0x00000400,
	VK_IMAGE_CREATE_SPLIT_INSTANCE_BIND_REGIONS_BIT = 0x00000040,
	VK_IMAGE_CREATE_2D_ARRAY_COMPATIBLE_BIT = 0x00000020,
	VK_IMAGE_CREATE_BLOCK_TEXEL_VIEW_COMPATIBLE_BIT = 0x00000080,
	VK_IMAGE_CREATE_EXTENDED_USAGE_BIT = 0x00000100,
	VK_IMAGE_CREATE_PROTECTED_BIT = 0x00000800,
	VK_IMAGE_CREATE_DISJOINT_BIT = 0x00000200,
	VK_IMAGE_CREATE_CORNER_SAMPLED_BIT_NV = 0x00002000,
	VK_IMAGE_CREATE_SAMPLE_LOCATIONS_COMPATIBLE_DEPTH_BIT_EXT = 0x00001000,
	VK_IMAGE_CREATE_SUBSAMPLED_BIT_EXT = 0x00004000,
	VK_IMAGE_CREATE_2D_VIEW_COMPATIBLE_BIT_EXT = 0x00020000,
	VK_IMAGE_CREATE_FRAGMENT_DENSITY_MAP_OFFSET_BIT_QCOM = 0x00008000,
	VK_IMAGE_CREATE_SPLIT_INSTANCE_BIND_REGIONS_BIT_KHR = VK_IMAGE_CREATE_SPLIT_INSTANCE_BIND_REGIONS_BIT,
	VK_IMAGE_CREATE_2D_ARRAY_COMPATIBLE_BIT_KHR = VK_IMAGE_CREATE_2D_ARRAY_COMPATIBLE_BIT,
	VK_IMAGE_CREATE_BLOCK_TEXEL_VIEW_COMPATIBLE_BIT_KHR = VK_IMAGE_CREATE_BLOCK_TEXEL_VIEW_COMPATIBLE_BIT,
	VK_IMAGE_CREATE_EXTENDED_USAGE_BIT_KHR = VK_IMAGE_CREATE_EXTENDED_USAGE_BIT,
	VK_IMAGE_CREATE_DISJOINT_BIT_KHR = VK_IMAGE_CREATE_DISJOINT_BIT,
	VK_IMAGE_CREATE_ALIAS_BIT_KHR = VK_IMAGE_CREATE_ALIAS_BIT,
	VK_IMAGE_CREATE_FLAG_BITS_MAX_ENUM = 0x7FFFFFFF,
}
enum : VkImageCreateFlagBits {
	VK_IMAGE_CREATE_SPARSE_BINDING_BIT = VkImageCreateFlagBits.VK_IMAGE_CREATE_SPARSE_BINDING_BIT,
	VK_IMAGE_CREATE_SPARSE_RESIDENCY_BIT = VkImageCreateFlagBits.VK_IMAGE_CREATE_SPARSE_RESIDENCY_BIT,
	VK_IMAGE_CREATE_SPARSE_ALIASED_BIT = VkImageCreateFlagBits.VK_IMAGE_CREATE_SPARSE_ALIASED_BIT,
	VK_IMAGE_CREATE_MUTABLE_FORMAT_BIT = VkImageCreateFlagBits.VK_IMAGE_CREATE_MUTABLE_FORMAT_BIT,
	VK_IMAGE_CREATE_CUBE_COMPATIBLE_BIT = VkImageCreateFlagBits.VK_IMAGE_CREATE_CUBE_COMPATIBLE_BIT,
	VK_IMAGE_CREATE_ALIAS_BIT = VkImageCreateFlagBits.VK_IMAGE_CREATE_ALIAS_BIT,
	VK_IMAGE_CREATE_SPLIT_INSTANCE_BIND_REGIONS_BIT = VkImageCreateFlagBits.VK_IMAGE_CREATE_SPLIT_INSTANCE_BIND_REGIONS_BIT,
	VK_IMAGE_CREATE_2D_ARRAY_COMPATIBLE_BIT = VkImageCreateFlagBits.VK_IMAGE_CREATE_2D_ARRAY_COMPATIBLE_BIT,
	VK_IMAGE_CREATE_BLOCK_TEXEL_VIEW_COMPATIBLE_BIT = VkImageCreateFlagBits.VK_IMAGE_CREATE_BLOCK_TEXEL_VIEW_COMPATIBLE_BIT,
	VK_IMAGE_CREATE_EXTENDED_USAGE_BIT = VkImageCreateFlagBits.VK_IMAGE_CREATE_EXTENDED_USAGE_BIT,
	VK_IMAGE_CREATE_PROTECTED_BIT = VkImageCreateFlagBits.VK_IMAGE_CREATE_PROTECTED_BIT,
	VK_IMAGE_CREATE_DISJOINT_BIT = VkImageCreateFlagBits.VK_IMAGE_CREATE_DISJOINT_BIT,
	VK_IMAGE_CREATE_CORNER_SAMPLED_BIT_NV = VkImageCreateFlagBits.VK_IMAGE_CREATE_CORNER_SAMPLED_BIT_NV,
	VK_IMAGE_CREATE_SAMPLE_LOCATIONS_COMPATIBLE_DEPTH_BIT_EXT = VkImageCreateFlagBits.VK_IMAGE_CREATE_SAMPLE_LOCATIONS_COMPATIBLE_DEPTH_BIT_EXT,
	VK_IMAGE_CREATE_SUBSAMPLED_BIT_EXT = VkImageCreateFlagBits.VK_IMAGE_CREATE_SUBSAMPLED_BIT_EXT,
	VK_IMAGE_CREATE_2D_VIEW_COMPATIBLE_BIT_EXT = VkImageCreateFlagBits.VK_IMAGE_CREATE_2D_VIEW_COMPATIBLE_BIT_EXT,
	VK_IMAGE_CREATE_FRAGMENT_DENSITY_MAP_OFFSET_BIT_QCOM = VkImageCreateFlagBits.VK_IMAGE_CREATE_FRAGMENT_DENSITY_MAP_OFFSET_BIT_QCOM,
	VK_IMAGE_CREATE_SPLIT_INSTANCE_BIND_REGIONS_BIT_KHR = VkImageCreateFlagBits.VK_IMAGE_CREATE_SPLIT_INSTANCE_BIND_REGIONS_BIT_KHR,
	VK_IMAGE_CREATE_2D_ARRAY_COMPATIBLE_BIT_KHR = VkImageCreateFlagBits.VK_IMAGE_CREATE_2D_ARRAY_COMPATIBLE_BIT_KHR,
	VK_IMAGE_CREATE_BLOCK_TEXEL_VIEW_COMPATIBLE_BIT_KHR = VkImageCreateFlagBits.VK_IMAGE_CREATE_BLOCK_TEXEL_VIEW_COMPATIBLE_BIT_KHR,
	VK_IMAGE_CREATE_EXTENDED_USAGE_BIT_KHR = VkImageCreateFlagBits.VK_IMAGE_CREATE_EXTENDED_USAGE_BIT_KHR,
	VK_IMAGE_CREATE_DISJOINT_BIT_KHR = VkImageCreateFlagBits.VK_IMAGE_CREATE_DISJOINT_BIT_KHR,
	VK_IMAGE_CREATE_ALIAS_BIT_KHR = VkImageCreateFlagBits.VK_IMAGE_CREATE_ALIAS_BIT_KHR,
	VK_IMAGE_CREATE_FLAG_BITS_MAX_ENUM = VkImageCreateFlagBits.VK_IMAGE_CREATE_FLAG_BITS_MAX_ENUM,
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
	VK_IMAGE_LAYOUT_READ_ONLY_OPTIMAL = 1000314000,
	VK_IMAGE_LAYOUT_ATTACHMENT_OPTIMAL = 1000314001,
	VK_IMAGE_LAYOUT_PRESENT_SRC_KHR = 1000001002,
	VK_IMAGE_LAYOUT_SHARED_PRESENT_KHR = 1000111000,
	VK_IMAGE_LAYOUT_FRAGMENT_DENSITY_MAP_OPTIMAL_EXT = 1000218000,
	VK_IMAGE_LAYOUT_FRAGMENT_SHADING_RATE_ATTACHMENT_OPTIMAL_KHR = 1000164003,
	VK_IMAGE_LAYOUT_DEPTH_READ_ONLY_STENCIL_ATTACHMENT_OPTIMAL_KHR = VK_IMAGE_LAYOUT_DEPTH_READ_ONLY_STENCIL_ATTACHMENT_OPTIMAL,
	VK_IMAGE_LAYOUT_DEPTH_ATTACHMENT_STENCIL_READ_ONLY_OPTIMAL_KHR = VK_IMAGE_LAYOUT_DEPTH_ATTACHMENT_STENCIL_READ_ONLY_OPTIMAL,
	VK_IMAGE_LAYOUT_SHADING_RATE_OPTIMAL_NV = VK_IMAGE_LAYOUT_FRAGMENT_SHADING_RATE_ATTACHMENT_OPTIMAL_KHR,
	VK_IMAGE_LAYOUT_DEPTH_ATTACHMENT_OPTIMAL_KHR = VK_IMAGE_LAYOUT_DEPTH_ATTACHMENT_OPTIMAL,
	VK_IMAGE_LAYOUT_DEPTH_READ_ONLY_OPTIMAL_KHR = VK_IMAGE_LAYOUT_DEPTH_READ_ONLY_OPTIMAL,
	VK_IMAGE_LAYOUT_STENCIL_ATTACHMENT_OPTIMAL_KHR = VK_IMAGE_LAYOUT_STENCIL_ATTACHMENT_OPTIMAL,
	VK_IMAGE_LAYOUT_STENCIL_READ_ONLY_OPTIMAL_KHR = VK_IMAGE_LAYOUT_STENCIL_READ_ONLY_OPTIMAL,
	VK_IMAGE_LAYOUT_READ_ONLY_OPTIMAL_KHR = VK_IMAGE_LAYOUT_READ_ONLY_OPTIMAL,
	VK_IMAGE_LAYOUT_ATTACHMENT_OPTIMAL_KHR = VK_IMAGE_LAYOUT_ATTACHMENT_OPTIMAL,
	VK_IMAGE_LAYOUT_MAX_ENUM = 0x7FFFFFFF,
}
enum : VkImageLayout {
	VK_IMAGE_LAYOUT_UNDEFINED = VkImageLayout.VK_IMAGE_LAYOUT_UNDEFINED,
	VK_IMAGE_LAYOUT_GENERAL = VkImageLayout.VK_IMAGE_LAYOUT_GENERAL,
	VK_IMAGE_LAYOUT_COLOR_ATTACHMENT_OPTIMAL = VkImageLayout.VK_IMAGE_LAYOUT_COLOR_ATTACHMENT_OPTIMAL,
	VK_IMAGE_LAYOUT_DEPTH_STENCIL_ATTACHMENT_OPTIMAL = VkImageLayout.VK_IMAGE_LAYOUT_DEPTH_STENCIL_ATTACHMENT_OPTIMAL,
	VK_IMAGE_LAYOUT_DEPTH_STENCIL_READ_ONLY_OPTIMAL = VkImageLayout.VK_IMAGE_LAYOUT_DEPTH_STENCIL_READ_ONLY_OPTIMAL,
	VK_IMAGE_LAYOUT_SHADER_READ_ONLY_OPTIMAL = VkImageLayout.VK_IMAGE_LAYOUT_SHADER_READ_ONLY_OPTIMAL,
	VK_IMAGE_LAYOUT_TRANSFER_SRC_OPTIMAL = VkImageLayout.VK_IMAGE_LAYOUT_TRANSFER_SRC_OPTIMAL,
	VK_IMAGE_LAYOUT_TRANSFER_DST_OPTIMAL = VkImageLayout.VK_IMAGE_LAYOUT_TRANSFER_DST_OPTIMAL,
	VK_IMAGE_LAYOUT_PREINITIALIZED = VkImageLayout.VK_IMAGE_LAYOUT_PREINITIALIZED,
	VK_IMAGE_LAYOUT_DEPTH_READ_ONLY_STENCIL_ATTACHMENT_OPTIMAL = VkImageLayout.VK_IMAGE_LAYOUT_DEPTH_READ_ONLY_STENCIL_ATTACHMENT_OPTIMAL,
	VK_IMAGE_LAYOUT_DEPTH_ATTACHMENT_STENCIL_READ_ONLY_OPTIMAL = VkImageLayout.VK_IMAGE_LAYOUT_DEPTH_ATTACHMENT_STENCIL_READ_ONLY_OPTIMAL,
	VK_IMAGE_LAYOUT_DEPTH_ATTACHMENT_OPTIMAL = VkImageLayout.VK_IMAGE_LAYOUT_DEPTH_ATTACHMENT_OPTIMAL,
	VK_IMAGE_LAYOUT_DEPTH_READ_ONLY_OPTIMAL = VkImageLayout.VK_IMAGE_LAYOUT_DEPTH_READ_ONLY_OPTIMAL,
	VK_IMAGE_LAYOUT_STENCIL_ATTACHMENT_OPTIMAL = VkImageLayout.VK_IMAGE_LAYOUT_STENCIL_ATTACHMENT_OPTIMAL,
	VK_IMAGE_LAYOUT_STENCIL_READ_ONLY_OPTIMAL = VkImageLayout.VK_IMAGE_LAYOUT_STENCIL_READ_ONLY_OPTIMAL,
	VK_IMAGE_LAYOUT_READ_ONLY_OPTIMAL = VkImageLayout.VK_IMAGE_LAYOUT_READ_ONLY_OPTIMAL,
	VK_IMAGE_LAYOUT_ATTACHMENT_OPTIMAL = VkImageLayout.VK_IMAGE_LAYOUT_ATTACHMENT_OPTIMAL,
	VK_IMAGE_LAYOUT_PRESENT_SRC_KHR = VkImageLayout.VK_IMAGE_LAYOUT_PRESENT_SRC_KHR,
	VK_IMAGE_LAYOUT_SHARED_PRESENT_KHR = VkImageLayout.VK_IMAGE_LAYOUT_SHARED_PRESENT_KHR,
	VK_IMAGE_LAYOUT_FRAGMENT_DENSITY_MAP_OPTIMAL_EXT = VkImageLayout.VK_IMAGE_LAYOUT_FRAGMENT_DENSITY_MAP_OPTIMAL_EXT,
	VK_IMAGE_LAYOUT_FRAGMENT_SHADING_RATE_ATTACHMENT_OPTIMAL_KHR = VkImageLayout.VK_IMAGE_LAYOUT_FRAGMENT_SHADING_RATE_ATTACHMENT_OPTIMAL_KHR,
	VK_IMAGE_LAYOUT_DEPTH_READ_ONLY_STENCIL_ATTACHMENT_OPTIMAL_KHR = VkImageLayout.VK_IMAGE_LAYOUT_DEPTH_READ_ONLY_STENCIL_ATTACHMENT_OPTIMAL_KHR,
	VK_IMAGE_LAYOUT_DEPTH_ATTACHMENT_STENCIL_READ_ONLY_OPTIMAL_KHR = VkImageLayout.VK_IMAGE_LAYOUT_DEPTH_ATTACHMENT_STENCIL_READ_ONLY_OPTIMAL_KHR,
	VK_IMAGE_LAYOUT_SHADING_RATE_OPTIMAL_NV = VkImageLayout.VK_IMAGE_LAYOUT_SHADING_RATE_OPTIMAL_NV,
	VK_IMAGE_LAYOUT_DEPTH_ATTACHMENT_OPTIMAL_KHR = VkImageLayout.VK_IMAGE_LAYOUT_DEPTH_ATTACHMENT_OPTIMAL_KHR,
	VK_IMAGE_LAYOUT_DEPTH_READ_ONLY_OPTIMAL_KHR = VkImageLayout.VK_IMAGE_LAYOUT_DEPTH_READ_ONLY_OPTIMAL_KHR,
	VK_IMAGE_LAYOUT_STENCIL_ATTACHMENT_OPTIMAL_KHR = VkImageLayout.VK_IMAGE_LAYOUT_STENCIL_ATTACHMENT_OPTIMAL_KHR,
	VK_IMAGE_LAYOUT_STENCIL_READ_ONLY_OPTIMAL_KHR = VkImageLayout.VK_IMAGE_LAYOUT_STENCIL_READ_ONLY_OPTIMAL_KHR,
	VK_IMAGE_LAYOUT_READ_ONLY_OPTIMAL_KHR = VkImageLayout.VK_IMAGE_LAYOUT_READ_ONLY_OPTIMAL_KHR,
	VK_IMAGE_LAYOUT_ATTACHMENT_OPTIMAL_KHR = VkImageLayout.VK_IMAGE_LAYOUT_ATTACHMENT_OPTIMAL_KHR,
	VK_IMAGE_LAYOUT_MAX_ENUM = VkImageLayout.VK_IMAGE_LAYOUT_MAX_ENUM,
}
enum VkImageTiling {
	VK_IMAGE_TILING_OPTIMAL = 0,
	VK_IMAGE_TILING_LINEAR = 1,
	VK_IMAGE_TILING_DRM_FORMAT_MODIFIER_EXT = 1000158000,
	VK_IMAGE_TILING_MAX_ENUM = 0x7FFFFFFF,
}
enum : VkImageTiling {
	VK_IMAGE_TILING_OPTIMAL = VkImageTiling.VK_IMAGE_TILING_OPTIMAL,
	VK_IMAGE_TILING_LINEAR = VkImageTiling.VK_IMAGE_TILING_LINEAR,
	VK_IMAGE_TILING_DRM_FORMAT_MODIFIER_EXT = VkImageTiling.VK_IMAGE_TILING_DRM_FORMAT_MODIFIER_EXT,
	VK_IMAGE_TILING_MAX_ENUM = VkImageTiling.VK_IMAGE_TILING_MAX_ENUM,
}
enum VkImageType {
	VK_IMAGE_TYPE_1D = 0,
	VK_IMAGE_TYPE_2D = 1,
	VK_IMAGE_TYPE_3D = 2,
	VK_IMAGE_TYPE_MAX_ENUM = 0x7FFFFFFF,
}
enum : VkImageType {
	VK_IMAGE_TYPE_1D = VkImageType.VK_IMAGE_TYPE_1D,
	VK_IMAGE_TYPE_2D = VkImageType.VK_IMAGE_TYPE_2D,
	VK_IMAGE_TYPE_3D = VkImageType.VK_IMAGE_TYPE_3D,
	VK_IMAGE_TYPE_MAX_ENUM = VkImageType.VK_IMAGE_TYPE_MAX_ENUM,
}
enum VkImageUsageFlagBits {
	VK_IMAGE_USAGE_TRANSFER_SRC_BIT = 0x00000001,
	VK_IMAGE_USAGE_TRANSFER_DST_BIT = 0x00000002,
	VK_IMAGE_USAGE_SAMPLED_BIT = 0x00000004,
	VK_IMAGE_USAGE_STORAGE_BIT = 0x00000008,
	VK_IMAGE_USAGE_COLOR_ATTACHMENT_BIT = 0x00000010,
	VK_IMAGE_USAGE_DEPTH_STENCIL_ATTACHMENT_BIT = 0x00000020,
	VK_IMAGE_USAGE_TRANSIENT_ATTACHMENT_BIT = 0x00000040,
	VK_IMAGE_USAGE_INPUT_ATTACHMENT_BIT = 0x00000080,
	VK_IMAGE_USAGE_FRAGMENT_DENSITY_MAP_BIT_EXT = 0x00000200,
	VK_IMAGE_USAGE_FRAGMENT_SHADING_RATE_ATTACHMENT_BIT_KHR = 0x00000100,
	VK_IMAGE_USAGE_INVOCATION_MASK_BIT_HUAWEI = 0x00040000,
	VK_IMAGE_USAGE_SHADING_RATE_IMAGE_BIT_NV = VK_IMAGE_USAGE_FRAGMENT_SHADING_RATE_ATTACHMENT_BIT_KHR,
	VK_IMAGE_USAGE_FLAG_BITS_MAX_ENUM = 0x7FFFFFFF,
}
enum : VkImageUsageFlagBits {
	VK_IMAGE_USAGE_TRANSFER_SRC_BIT = VkImageUsageFlagBits.VK_IMAGE_USAGE_TRANSFER_SRC_BIT,
	VK_IMAGE_USAGE_TRANSFER_DST_BIT = VkImageUsageFlagBits.VK_IMAGE_USAGE_TRANSFER_DST_BIT,
	VK_IMAGE_USAGE_SAMPLED_BIT = VkImageUsageFlagBits.VK_IMAGE_USAGE_SAMPLED_BIT,
	VK_IMAGE_USAGE_STORAGE_BIT = VkImageUsageFlagBits.VK_IMAGE_USAGE_STORAGE_BIT,
	VK_IMAGE_USAGE_COLOR_ATTACHMENT_BIT = VkImageUsageFlagBits.VK_IMAGE_USAGE_COLOR_ATTACHMENT_BIT,
	VK_IMAGE_USAGE_DEPTH_STENCIL_ATTACHMENT_BIT = VkImageUsageFlagBits.VK_IMAGE_USAGE_DEPTH_STENCIL_ATTACHMENT_BIT,
	VK_IMAGE_USAGE_TRANSIENT_ATTACHMENT_BIT = VkImageUsageFlagBits.VK_IMAGE_USAGE_TRANSIENT_ATTACHMENT_BIT,
	VK_IMAGE_USAGE_INPUT_ATTACHMENT_BIT = VkImageUsageFlagBits.VK_IMAGE_USAGE_INPUT_ATTACHMENT_BIT,
	VK_IMAGE_USAGE_FRAGMENT_DENSITY_MAP_BIT_EXT = VkImageUsageFlagBits.VK_IMAGE_USAGE_FRAGMENT_DENSITY_MAP_BIT_EXT,
	VK_IMAGE_USAGE_FRAGMENT_SHADING_RATE_ATTACHMENT_BIT_KHR = VkImageUsageFlagBits.VK_IMAGE_USAGE_FRAGMENT_SHADING_RATE_ATTACHMENT_BIT_KHR,
	VK_IMAGE_USAGE_INVOCATION_MASK_BIT_HUAWEI = VkImageUsageFlagBits.VK_IMAGE_USAGE_INVOCATION_MASK_BIT_HUAWEI,
	VK_IMAGE_USAGE_SHADING_RATE_IMAGE_BIT_NV = VkImageUsageFlagBits.VK_IMAGE_USAGE_SHADING_RATE_IMAGE_BIT_NV,
	VK_IMAGE_USAGE_FLAG_BITS_MAX_ENUM = VkImageUsageFlagBits.VK_IMAGE_USAGE_FLAG_BITS_MAX_ENUM,
}
enum VkImageViewCreateFlagBits {
	VK_IMAGE_VIEW_CREATE_FRAGMENT_DENSITY_MAP_DYNAMIC_BIT_EXT = 0x00000001,
	VK_IMAGE_VIEW_CREATE_FRAGMENT_DENSITY_MAP_DEFERRED_BIT_EXT = 0x00000002,
	VK_IMAGE_VIEW_CREATE_FLAG_BITS_MAX_ENUM = 0x7FFFFFFF,
}
enum : VkImageViewCreateFlagBits {
	VK_IMAGE_VIEW_CREATE_FRAGMENT_DENSITY_MAP_DYNAMIC_BIT_EXT = VkImageViewCreateFlagBits.VK_IMAGE_VIEW_CREATE_FRAGMENT_DENSITY_MAP_DYNAMIC_BIT_EXT,
	VK_IMAGE_VIEW_CREATE_FRAGMENT_DENSITY_MAP_DEFERRED_BIT_EXT = VkImageViewCreateFlagBits.VK_IMAGE_VIEW_CREATE_FRAGMENT_DENSITY_MAP_DEFERRED_BIT_EXT,
	VK_IMAGE_VIEW_CREATE_FLAG_BITS_MAX_ENUM = VkImageViewCreateFlagBits.VK_IMAGE_VIEW_CREATE_FLAG_BITS_MAX_ENUM,
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
enum : VkImageViewType {
	VK_IMAGE_VIEW_TYPE_1D = VkImageViewType.VK_IMAGE_VIEW_TYPE_1D,
	VK_IMAGE_VIEW_TYPE_2D = VkImageViewType.VK_IMAGE_VIEW_TYPE_2D,
	VK_IMAGE_VIEW_TYPE_3D = VkImageViewType.VK_IMAGE_VIEW_TYPE_3D,
	VK_IMAGE_VIEW_TYPE_CUBE = VkImageViewType.VK_IMAGE_VIEW_TYPE_CUBE,
	VK_IMAGE_VIEW_TYPE_1D_ARRAY = VkImageViewType.VK_IMAGE_VIEW_TYPE_1D_ARRAY,
	VK_IMAGE_VIEW_TYPE_2D_ARRAY = VkImageViewType.VK_IMAGE_VIEW_TYPE_2D_ARRAY,
	VK_IMAGE_VIEW_TYPE_CUBE_ARRAY = VkImageViewType.VK_IMAGE_VIEW_TYPE_CUBE_ARRAY,
	VK_IMAGE_VIEW_TYPE_MAX_ENUM = VkImageViewType.VK_IMAGE_VIEW_TYPE_MAX_ENUM,
}
enum VkIndexType {
	VK_INDEX_TYPE_UINT16 = 0,
	VK_INDEX_TYPE_UINT32 = 1,
	VK_INDEX_TYPE_NONE_KHR = 1000165000,
	VK_INDEX_TYPE_UINT8_EXT = 1000265000,
	VK_INDEX_TYPE_NONE_NV = VK_INDEX_TYPE_NONE_KHR,
	VK_INDEX_TYPE_MAX_ENUM = 0x7FFFFFFF,
}
enum : VkIndexType {
	VK_INDEX_TYPE_UINT16 = VkIndexType.VK_INDEX_TYPE_UINT16,
	VK_INDEX_TYPE_UINT32 = VkIndexType.VK_INDEX_TYPE_UINT32,
	VK_INDEX_TYPE_NONE_KHR = VkIndexType.VK_INDEX_TYPE_NONE_KHR,
	VK_INDEX_TYPE_UINT8_EXT = VkIndexType.VK_INDEX_TYPE_UINT8_EXT,
	VK_INDEX_TYPE_NONE_NV = VkIndexType.VK_INDEX_TYPE_NONE_NV,
	VK_INDEX_TYPE_MAX_ENUM = VkIndexType.VK_INDEX_TYPE_MAX_ENUM,
}
enum VkIndirectCommandsLayoutUsageFlagBitsNV {
	VK_INDIRECT_COMMANDS_LAYOUT_USAGE_EXPLICIT_PREPROCESS_BIT_NV = 0x00000001,
	VK_INDIRECT_COMMANDS_LAYOUT_USAGE_INDEXED_SEQUENCES_BIT_NV = 0x00000002,
	VK_INDIRECT_COMMANDS_LAYOUT_USAGE_UNORDERED_SEQUENCES_BIT_NV = 0x00000004,
	VK_INDIRECT_COMMANDS_LAYOUT_USAGE_FLAG_BITS_MAX_ENUM_NV = 0x7FFFFFFF,
}
enum : VkIndirectCommandsLayoutUsageFlagBitsNV {
	VK_INDIRECT_COMMANDS_LAYOUT_USAGE_EXPLICIT_PREPROCESS_BIT_NV = VkIndirectCommandsLayoutUsageFlagBitsNV.VK_INDIRECT_COMMANDS_LAYOUT_USAGE_EXPLICIT_PREPROCESS_BIT_NV,
	VK_INDIRECT_COMMANDS_LAYOUT_USAGE_INDEXED_SEQUENCES_BIT_NV = VkIndirectCommandsLayoutUsageFlagBitsNV.VK_INDIRECT_COMMANDS_LAYOUT_USAGE_INDEXED_SEQUENCES_BIT_NV,
	VK_INDIRECT_COMMANDS_LAYOUT_USAGE_UNORDERED_SEQUENCES_BIT_NV = VkIndirectCommandsLayoutUsageFlagBitsNV.VK_INDIRECT_COMMANDS_LAYOUT_USAGE_UNORDERED_SEQUENCES_BIT_NV,
	VK_INDIRECT_COMMANDS_LAYOUT_USAGE_FLAG_BITS_MAX_ENUM_NV = VkIndirectCommandsLayoutUsageFlagBitsNV.VK_INDIRECT_COMMANDS_LAYOUT_USAGE_FLAG_BITS_MAX_ENUM_NV,
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
enum : VkIndirectCommandsTokenTypeNV {
	VK_INDIRECT_COMMANDS_TOKEN_TYPE_SHADER_GROUP_NV = VkIndirectCommandsTokenTypeNV.VK_INDIRECT_COMMANDS_TOKEN_TYPE_SHADER_GROUP_NV,
	VK_INDIRECT_COMMANDS_TOKEN_TYPE_STATE_FLAGS_NV = VkIndirectCommandsTokenTypeNV.VK_INDIRECT_COMMANDS_TOKEN_TYPE_STATE_FLAGS_NV,
	VK_INDIRECT_COMMANDS_TOKEN_TYPE_INDEX_BUFFER_NV = VkIndirectCommandsTokenTypeNV.VK_INDIRECT_COMMANDS_TOKEN_TYPE_INDEX_BUFFER_NV,
	VK_INDIRECT_COMMANDS_TOKEN_TYPE_VERTEX_BUFFER_NV = VkIndirectCommandsTokenTypeNV.VK_INDIRECT_COMMANDS_TOKEN_TYPE_VERTEX_BUFFER_NV,
	VK_INDIRECT_COMMANDS_TOKEN_TYPE_PUSH_CONSTANT_NV = VkIndirectCommandsTokenTypeNV.VK_INDIRECT_COMMANDS_TOKEN_TYPE_PUSH_CONSTANT_NV,
	VK_INDIRECT_COMMANDS_TOKEN_TYPE_DRAW_INDEXED_NV = VkIndirectCommandsTokenTypeNV.VK_INDIRECT_COMMANDS_TOKEN_TYPE_DRAW_INDEXED_NV,
	VK_INDIRECT_COMMANDS_TOKEN_TYPE_DRAW_NV = VkIndirectCommandsTokenTypeNV.VK_INDIRECT_COMMANDS_TOKEN_TYPE_DRAW_NV,
	VK_INDIRECT_COMMANDS_TOKEN_TYPE_DRAW_TASKS_NV = VkIndirectCommandsTokenTypeNV.VK_INDIRECT_COMMANDS_TOKEN_TYPE_DRAW_TASKS_NV,
	VK_INDIRECT_COMMANDS_TOKEN_TYPE_MAX_ENUM_NV = VkIndirectCommandsTokenTypeNV.VK_INDIRECT_COMMANDS_TOKEN_TYPE_MAX_ENUM_NV,
}
enum VkIndirectStateFlagBitsNV {
	VK_INDIRECT_STATE_FLAG_FRONTFACE_BIT_NV = 0x00000001,
	VK_INDIRECT_STATE_FLAG_BITS_MAX_ENUM_NV = 0x7FFFFFFF,
}
enum : VkIndirectStateFlagBitsNV {
	VK_INDIRECT_STATE_FLAG_FRONTFACE_BIT_NV = VkIndirectStateFlagBitsNV.VK_INDIRECT_STATE_FLAG_FRONTFACE_BIT_NV,
	VK_INDIRECT_STATE_FLAG_BITS_MAX_ENUM_NV = VkIndirectStateFlagBitsNV.VK_INDIRECT_STATE_FLAG_BITS_MAX_ENUM_NV,
}
enum VkInstanceCreateFlagBits {
	VK_INSTANCE_CREATE_ENUMERATE_PORTABILITY_BIT_KHR = 0x00000001,
	VK_INSTANCE_CREATE_FLAG_BITS_MAX_ENUM = 0x7FFFFFFF,
}
enum : VkInstanceCreateFlagBits {
	VK_INSTANCE_CREATE_ENUMERATE_PORTABILITY_BIT_KHR = VkInstanceCreateFlagBits.VK_INSTANCE_CREATE_ENUMERATE_PORTABILITY_BIT_KHR,
	VK_INSTANCE_CREATE_FLAG_BITS_MAX_ENUM = VkInstanceCreateFlagBits.VK_INSTANCE_CREATE_FLAG_BITS_MAX_ENUM,
}
enum VkInternalAllocationType {
	VK_INTERNAL_ALLOCATION_TYPE_EXECUTABLE = 0,
	VK_INTERNAL_ALLOCATION_TYPE_MAX_ENUM = 0x7FFFFFFF,
}
enum : VkInternalAllocationType {
	VK_INTERNAL_ALLOCATION_TYPE_EXECUTABLE = VkInternalAllocationType.VK_INTERNAL_ALLOCATION_TYPE_EXECUTABLE,
	VK_INTERNAL_ALLOCATION_TYPE_MAX_ENUM = VkInternalAllocationType.VK_INTERNAL_ALLOCATION_TYPE_MAX_ENUM,
}
enum VkLineRasterizationModeEXT {
	VK_LINE_RASTERIZATION_MODE_DEFAULT_EXT = 0,
	VK_LINE_RASTERIZATION_MODE_RECTANGULAR_EXT = 1,
	VK_LINE_RASTERIZATION_MODE_BRESENHAM_EXT = 2,
	VK_LINE_RASTERIZATION_MODE_RECTANGULAR_SMOOTH_EXT = 3,
	VK_LINE_RASTERIZATION_MODE_MAX_ENUM_EXT = 0x7FFFFFFF,
}
enum : VkLineRasterizationModeEXT {
	VK_LINE_RASTERIZATION_MODE_DEFAULT_EXT = VkLineRasterizationModeEXT.VK_LINE_RASTERIZATION_MODE_DEFAULT_EXT,
	VK_LINE_RASTERIZATION_MODE_RECTANGULAR_EXT = VkLineRasterizationModeEXT.VK_LINE_RASTERIZATION_MODE_RECTANGULAR_EXT,
	VK_LINE_RASTERIZATION_MODE_BRESENHAM_EXT = VkLineRasterizationModeEXT.VK_LINE_RASTERIZATION_MODE_BRESENHAM_EXT,
	VK_LINE_RASTERIZATION_MODE_RECTANGULAR_SMOOTH_EXT = VkLineRasterizationModeEXT.VK_LINE_RASTERIZATION_MODE_RECTANGULAR_SMOOTH_EXT,
	VK_LINE_RASTERIZATION_MODE_MAX_ENUM_EXT = VkLineRasterizationModeEXT.VK_LINE_RASTERIZATION_MODE_MAX_ENUM_EXT,
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
enum : VkLogicOp {
	VK_LOGIC_OP_CLEAR = VkLogicOp.VK_LOGIC_OP_CLEAR,
	VK_LOGIC_OP_AND = VkLogicOp.VK_LOGIC_OP_AND,
	VK_LOGIC_OP_AND_REVERSE = VkLogicOp.VK_LOGIC_OP_AND_REVERSE,
	VK_LOGIC_OP_COPY = VkLogicOp.VK_LOGIC_OP_COPY,
	VK_LOGIC_OP_AND_INVERTED = VkLogicOp.VK_LOGIC_OP_AND_INVERTED,
	VK_LOGIC_OP_NO_OP = VkLogicOp.VK_LOGIC_OP_NO_OP,
	VK_LOGIC_OP_XOR = VkLogicOp.VK_LOGIC_OP_XOR,
	VK_LOGIC_OP_OR = VkLogicOp.VK_LOGIC_OP_OR,
	VK_LOGIC_OP_NOR = VkLogicOp.VK_LOGIC_OP_NOR,
	VK_LOGIC_OP_EQUIVALENT = VkLogicOp.VK_LOGIC_OP_EQUIVALENT,
	VK_LOGIC_OP_INVERT = VkLogicOp.VK_LOGIC_OP_INVERT,
	VK_LOGIC_OP_OR_REVERSE = VkLogicOp.VK_LOGIC_OP_OR_REVERSE,
	VK_LOGIC_OP_COPY_INVERTED = VkLogicOp.VK_LOGIC_OP_COPY_INVERTED,
	VK_LOGIC_OP_OR_INVERTED = VkLogicOp.VK_LOGIC_OP_OR_INVERTED,
	VK_LOGIC_OP_NAND = VkLogicOp.VK_LOGIC_OP_NAND,
	VK_LOGIC_OP_SET = VkLogicOp.VK_LOGIC_OP_SET,
	VK_LOGIC_OP_MAX_ENUM = VkLogicOp.VK_LOGIC_OP_MAX_ENUM,
}
enum VkMemoryAllocateFlagBits {
	VK_MEMORY_ALLOCATE_DEVICE_MASK_BIT = 0x00000001,
	VK_MEMORY_ALLOCATE_DEVICE_ADDRESS_BIT = 0x00000002,
	VK_MEMORY_ALLOCATE_DEVICE_ADDRESS_CAPTURE_REPLAY_BIT = 0x00000004,
	VK_MEMORY_ALLOCATE_DEVICE_MASK_BIT_KHR = VK_MEMORY_ALLOCATE_DEVICE_MASK_BIT,
	VK_MEMORY_ALLOCATE_DEVICE_ADDRESS_BIT_KHR = VK_MEMORY_ALLOCATE_DEVICE_ADDRESS_BIT,
	VK_MEMORY_ALLOCATE_DEVICE_ADDRESS_CAPTURE_REPLAY_BIT_KHR = VK_MEMORY_ALLOCATE_DEVICE_ADDRESS_CAPTURE_REPLAY_BIT,
	VK_MEMORY_ALLOCATE_FLAG_BITS_MAX_ENUM = 0x7FFFFFFF,
}
enum : VkMemoryAllocateFlagBits {
	VK_MEMORY_ALLOCATE_DEVICE_MASK_BIT = VkMemoryAllocateFlagBits.VK_MEMORY_ALLOCATE_DEVICE_MASK_BIT,
	VK_MEMORY_ALLOCATE_DEVICE_ADDRESS_BIT = VkMemoryAllocateFlagBits.VK_MEMORY_ALLOCATE_DEVICE_ADDRESS_BIT,
	VK_MEMORY_ALLOCATE_DEVICE_ADDRESS_CAPTURE_REPLAY_BIT = VkMemoryAllocateFlagBits.VK_MEMORY_ALLOCATE_DEVICE_ADDRESS_CAPTURE_REPLAY_BIT,
	VK_MEMORY_ALLOCATE_DEVICE_MASK_BIT_KHR = VkMemoryAllocateFlagBits.VK_MEMORY_ALLOCATE_DEVICE_MASK_BIT_KHR,
	VK_MEMORY_ALLOCATE_DEVICE_ADDRESS_BIT_KHR = VkMemoryAllocateFlagBits.VK_MEMORY_ALLOCATE_DEVICE_ADDRESS_BIT_KHR,
	VK_MEMORY_ALLOCATE_DEVICE_ADDRESS_CAPTURE_REPLAY_BIT_KHR = VkMemoryAllocateFlagBits.VK_MEMORY_ALLOCATE_DEVICE_ADDRESS_CAPTURE_REPLAY_BIT_KHR,
	VK_MEMORY_ALLOCATE_FLAG_BITS_MAX_ENUM = VkMemoryAllocateFlagBits.VK_MEMORY_ALLOCATE_FLAG_BITS_MAX_ENUM,
}
enum VkMemoryHeapFlagBits {
	VK_MEMORY_HEAP_DEVICE_LOCAL_BIT = 0x00000001,
	VK_MEMORY_HEAP_MULTI_INSTANCE_BIT = 0x00000002,
	VK_MEMORY_HEAP_MULTI_INSTANCE_BIT_KHR = VK_MEMORY_HEAP_MULTI_INSTANCE_BIT,
	VK_MEMORY_HEAP_FLAG_BITS_MAX_ENUM = 0x7FFFFFFF,
}
enum : VkMemoryHeapFlagBits {
	VK_MEMORY_HEAP_DEVICE_LOCAL_BIT = VkMemoryHeapFlagBits.VK_MEMORY_HEAP_DEVICE_LOCAL_BIT,
	VK_MEMORY_HEAP_MULTI_INSTANCE_BIT = VkMemoryHeapFlagBits.VK_MEMORY_HEAP_MULTI_INSTANCE_BIT,
	VK_MEMORY_HEAP_MULTI_INSTANCE_BIT_KHR = VkMemoryHeapFlagBits.VK_MEMORY_HEAP_MULTI_INSTANCE_BIT_KHR,
	VK_MEMORY_HEAP_FLAG_BITS_MAX_ENUM = VkMemoryHeapFlagBits.VK_MEMORY_HEAP_FLAG_BITS_MAX_ENUM,
}
enum VkMemoryOverallocationBehaviorAMD {
	VK_MEMORY_OVERALLOCATION_BEHAVIOR_DEFAULT_AMD = 0,
	VK_MEMORY_OVERALLOCATION_BEHAVIOR_ALLOWED_AMD = 1,
	VK_MEMORY_OVERALLOCATION_BEHAVIOR_DISALLOWED_AMD = 2,
	VK_MEMORY_OVERALLOCATION_BEHAVIOR_MAX_ENUM_AMD = 0x7FFFFFFF,
}
enum : VkMemoryOverallocationBehaviorAMD {
	VK_MEMORY_OVERALLOCATION_BEHAVIOR_DEFAULT_AMD = VkMemoryOverallocationBehaviorAMD.VK_MEMORY_OVERALLOCATION_BEHAVIOR_DEFAULT_AMD,
	VK_MEMORY_OVERALLOCATION_BEHAVIOR_ALLOWED_AMD = VkMemoryOverallocationBehaviorAMD.VK_MEMORY_OVERALLOCATION_BEHAVIOR_ALLOWED_AMD,
	VK_MEMORY_OVERALLOCATION_BEHAVIOR_DISALLOWED_AMD = VkMemoryOverallocationBehaviorAMD.VK_MEMORY_OVERALLOCATION_BEHAVIOR_DISALLOWED_AMD,
	VK_MEMORY_OVERALLOCATION_BEHAVIOR_MAX_ENUM_AMD = VkMemoryOverallocationBehaviorAMD.VK_MEMORY_OVERALLOCATION_BEHAVIOR_MAX_ENUM_AMD,
}
enum VkMemoryPropertyFlagBits {
	VK_MEMORY_PROPERTY_DEVICE_LOCAL_BIT = 0x00000001,
	VK_MEMORY_PROPERTY_HOST_VISIBLE_BIT = 0x00000002,
	VK_MEMORY_PROPERTY_HOST_COHERENT_BIT = 0x00000004,
	VK_MEMORY_PROPERTY_HOST_CACHED_BIT = 0x00000008,
	VK_MEMORY_PROPERTY_LAZILY_ALLOCATED_BIT = 0x00000010,
	VK_MEMORY_PROPERTY_PROTECTED_BIT = 0x00000020,
	VK_MEMORY_PROPERTY_DEVICE_COHERENT_BIT_AMD = 0x00000040,
	VK_MEMORY_PROPERTY_DEVICE_UNCACHED_BIT_AMD = 0x00000080,
	VK_MEMORY_PROPERTY_RDMA_CAPABLE_BIT_NV = 0x00000100,
	VK_MEMORY_PROPERTY_FLAG_BITS_MAX_ENUM = 0x7FFFFFFF,
}
enum : VkMemoryPropertyFlagBits {
	VK_MEMORY_PROPERTY_DEVICE_LOCAL_BIT = VkMemoryPropertyFlagBits.VK_MEMORY_PROPERTY_DEVICE_LOCAL_BIT,
	VK_MEMORY_PROPERTY_HOST_VISIBLE_BIT = VkMemoryPropertyFlagBits.VK_MEMORY_PROPERTY_HOST_VISIBLE_BIT,
	VK_MEMORY_PROPERTY_HOST_COHERENT_BIT = VkMemoryPropertyFlagBits.VK_MEMORY_PROPERTY_HOST_COHERENT_BIT,
	VK_MEMORY_PROPERTY_HOST_CACHED_BIT = VkMemoryPropertyFlagBits.VK_MEMORY_PROPERTY_HOST_CACHED_BIT,
	VK_MEMORY_PROPERTY_LAZILY_ALLOCATED_BIT = VkMemoryPropertyFlagBits.VK_MEMORY_PROPERTY_LAZILY_ALLOCATED_BIT,
	VK_MEMORY_PROPERTY_PROTECTED_BIT = VkMemoryPropertyFlagBits.VK_MEMORY_PROPERTY_PROTECTED_BIT,
	VK_MEMORY_PROPERTY_DEVICE_COHERENT_BIT_AMD = VkMemoryPropertyFlagBits.VK_MEMORY_PROPERTY_DEVICE_COHERENT_BIT_AMD,
	VK_MEMORY_PROPERTY_DEVICE_UNCACHED_BIT_AMD = VkMemoryPropertyFlagBits.VK_MEMORY_PROPERTY_DEVICE_UNCACHED_BIT_AMD,
	VK_MEMORY_PROPERTY_RDMA_CAPABLE_BIT_NV = VkMemoryPropertyFlagBits.VK_MEMORY_PROPERTY_RDMA_CAPABLE_BIT_NV,
	VK_MEMORY_PROPERTY_FLAG_BITS_MAX_ENUM = VkMemoryPropertyFlagBits.VK_MEMORY_PROPERTY_FLAG_BITS_MAX_ENUM,
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
	VK_OBJECT_TYPE_PRIVATE_DATA_SLOT = 1000295000,
	VK_OBJECT_TYPE_SURFACE_KHR = 1000000000,
	VK_OBJECT_TYPE_SWAPCHAIN_KHR = 1000001000,
	VK_OBJECT_TYPE_DISPLAY_KHR = 1000002000,
	VK_OBJECT_TYPE_DISPLAY_MODE_KHR = 1000002001,
	VK_OBJECT_TYPE_DEBUG_REPORT_CALLBACK_EXT = 1000011000,
	VK_OBJECT_TYPE_CU_MODULE_NVX = 1000029000,
	VK_OBJECT_TYPE_CU_FUNCTION_NVX = 1000029001,
	VK_OBJECT_TYPE_DEBUG_UTILS_MESSENGER_EXT = 1000128000,
	VK_OBJECT_TYPE_ACCELERATION_STRUCTURE_KHR = 1000150000,
	VK_OBJECT_TYPE_VALIDATION_CACHE_EXT = 1000160000,
	VK_OBJECT_TYPE_ACCELERATION_STRUCTURE_NV = 1000165000,
	VK_OBJECT_TYPE_PERFORMANCE_CONFIGURATION_INTEL = 1000210000,
	VK_OBJECT_TYPE_DEFERRED_OPERATION_KHR = 1000268000,
	VK_OBJECT_TYPE_INDIRECT_COMMANDS_LAYOUT_NV = 1000277000,
	VK_OBJECT_TYPE_BUFFER_COLLECTION_FUCHSIA = 1000366000,
	VK_OBJECT_TYPE_DESCRIPTOR_UPDATE_TEMPLATE_KHR = VK_OBJECT_TYPE_DESCRIPTOR_UPDATE_TEMPLATE,
	VK_OBJECT_TYPE_SAMPLER_YCBCR_CONVERSION_KHR = VK_OBJECT_TYPE_SAMPLER_YCBCR_CONVERSION,
	VK_OBJECT_TYPE_PRIVATE_DATA_SLOT_EXT = VK_OBJECT_TYPE_PRIVATE_DATA_SLOT,
	VK_OBJECT_TYPE_MAX_ENUM = 0x7FFFFFFF,
}
enum : VkObjectType {
	VK_OBJECT_TYPE_UNKNOWN = VkObjectType.VK_OBJECT_TYPE_UNKNOWN,
	VK_OBJECT_TYPE_INSTANCE = VkObjectType.VK_OBJECT_TYPE_INSTANCE,
	VK_OBJECT_TYPE_PHYSICAL_DEVICE = VkObjectType.VK_OBJECT_TYPE_PHYSICAL_DEVICE,
	VK_OBJECT_TYPE_DEVICE = VkObjectType.VK_OBJECT_TYPE_DEVICE,
	VK_OBJECT_TYPE_QUEUE = VkObjectType.VK_OBJECT_TYPE_QUEUE,
	VK_OBJECT_TYPE_SEMAPHORE = VkObjectType.VK_OBJECT_TYPE_SEMAPHORE,
	VK_OBJECT_TYPE_COMMAND_BUFFER = VkObjectType.VK_OBJECT_TYPE_COMMAND_BUFFER,
	VK_OBJECT_TYPE_FENCE = VkObjectType.VK_OBJECT_TYPE_FENCE,
	VK_OBJECT_TYPE_DEVICE_MEMORY = VkObjectType.VK_OBJECT_TYPE_DEVICE_MEMORY,
	VK_OBJECT_TYPE_BUFFER = VkObjectType.VK_OBJECT_TYPE_BUFFER,
	VK_OBJECT_TYPE_IMAGE = VkObjectType.VK_OBJECT_TYPE_IMAGE,
	VK_OBJECT_TYPE_EVENT = VkObjectType.VK_OBJECT_TYPE_EVENT,
	VK_OBJECT_TYPE_QUERY_POOL = VkObjectType.VK_OBJECT_TYPE_QUERY_POOL,
	VK_OBJECT_TYPE_BUFFER_VIEW = VkObjectType.VK_OBJECT_TYPE_BUFFER_VIEW,
	VK_OBJECT_TYPE_IMAGE_VIEW = VkObjectType.VK_OBJECT_TYPE_IMAGE_VIEW,
	VK_OBJECT_TYPE_SHADER_MODULE = VkObjectType.VK_OBJECT_TYPE_SHADER_MODULE,
	VK_OBJECT_TYPE_PIPELINE_CACHE = VkObjectType.VK_OBJECT_TYPE_PIPELINE_CACHE,
	VK_OBJECT_TYPE_PIPELINE_LAYOUT = VkObjectType.VK_OBJECT_TYPE_PIPELINE_LAYOUT,
	VK_OBJECT_TYPE_RENDER_PASS = VkObjectType.VK_OBJECT_TYPE_RENDER_PASS,
	VK_OBJECT_TYPE_PIPELINE = VkObjectType.VK_OBJECT_TYPE_PIPELINE,
	VK_OBJECT_TYPE_DESCRIPTOR_SET_LAYOUT = VkObjectType.VK_OBJECT_TYPE_DESCRIPTOR_SET_LAYOUT,
	VK_OBJECT_TYPE_SAMPLER = VkObjectType.VK_OBJECT_TYPE_SAMPLER,
	VK_OBJECT_TYPE_DESCRIPTOR_POOL = VkObjectType.VK_OBJECT_TYPE_DESCRIPTOR_POOL,
	VK_OBJECT_TYPE_DESCRIPTOR_SET = VkObjectType.VK_OBJECT_TYPE_DESCRIPTOR_SET,
	VK_OBJECT_TYPE_FRAMEBUFFER = VkObjectType.VK_OBJECT_TYPE_FRAMEBUFFER,
	VK_OBJECT_TYPE_COMMAND_POOL = VkObjectType.VK_OBJECT_TYPE_COMMAND_POOL,
	VK_OBJECT_TYPE_SAMPLER_YCBCR_CONVERSION = VkObjectType.VK_OBJECT_TYPE_SAMPLER_YCBCR_CONVERSION,
	VK_OBJECT_TYPE_DESCRIPTOR_UPDATE_TEMPLATE = VkObjectType.VK_OBJECT_TYPE_DESCRIPTOR_UPDATE_TEMPLATE,
	VK_OBJECT_TYPE_PRIVATE_DATA_SLOT = VkObjectType.VK_OBJECT_TYPE_PRIVATE_DATA_SLOT,
	VK_OBJECT_TYPE_SURFACE_KHR = VkObjectType.VK_OBJECT_TYPE_SURFACE_KHR,
	VK_OBJECT_TYPE_SWAPCHAIN_KHR = VkObjectType.VK_OBJECT_TYPE_SWAPCHAIN_KHR,
	VK_OBJECT_TYPE_DISPLAY_KHR = VkObjectType.VK_OBJECT_TYPE_DISPLAY_KHR,
	VK_OBJECT_TYPE_DISPLAY_MODE_KHR = VkObjectType.VK_OBJECT_TYPE_DISPLAY_MODE_KHR,
	VK_OBJECT_TYPE_DEBUG_REPORT_CALLBACK_EXT = VkObjectType.VK_OBJECT_TYPE_DEBUG_REPORT_CALLBACK_EXT,
	VK_OBJECT_TYPE_CU_MODULE_NVX = VkObjectType.VK_OBJECT_TYPE_CU_MODULE_NVX,
	VK_OBJECT_TYPE_CU_FUNCTION_NVX = VkObjectType.VK_OBJECT_TYPE_CU_FUNCTION_NVX,
	VK_OBJECT_TYPE_DEBUG_UTILS_MESSENGER_EXT = VkObjectType.VK_OBJECT_TYPE_DEBUG_UTILS_MESSENGER_EXT,
	VK_OBJECT_TYPE_ACCELERATION_STRUCTURE_KHR = VkObjectType.VK_OBJECT_TYPE_ACCELERATION_STRUCTURE_KHR,
	VK_OBJECT_TYPE_VALIDATION_CACHE_EXT = VkObjectType.VK_OBJECT_TYPE_VALIDATION_CACHE_EXT,
	VK_OBJECT_TYPE_ACCELERATION_STRUCTURE_NV = VkObjectType.VK_OBJECT_TYPE_ACCELERATION_STRUCTURE_NV,
	VK_OBJECT_TYPE_PERFORMANCE_CONFIGURATION_INTEL = VkObjectType.VK_OBJECT_TYPE_PERFORMANCE_CONFIGURATION_INTEL,
	VK_OBJECT_TYPE_DEFERRED_OPERATION_KHR = VkObjectType.VK_OBJECT_TYPE_DEFERRED_OPERATION_KHR,
	VK_OBJECT_TYPE_INDIRECT_COMMANDS_LAYOUT_NV = VkObjectType.VK_OBJECT_TYPE_INDIRECT_COMMANDS_LAYOUT_NV,
	VK_OBJECT_TYPE_BUFFER_COLLECTION_FUCHSIA = VkObjectType.VK_OBJECT_TYPE_BUFFER_COLLECTION_FUCHSIA,
	VK_OBJECT_TYPE_DESCRIPTOR_UPDATE_TEMPLATE_KHR = VkObjectType.VK_OBJECT_TYPE_DESCRIPTOR_UPDATE_TEMPLATE_KHR,
	VK_OBJECT_TYPE_SAMPLER_YCBCR_CONVERSION_KHR = VkObjectType.VK_OBJECT_TYPE_SAMPLER_YCBCR_CONVERSION_KHR,
	VK_OBJECT_TYPE_PRIVATE_DATA_SLOT_EXT = VkObjectType.VK_OBJECT_TYPE_PRIVATE_DATA_SLOT_EXT,
	VK_OBJECT_TYPE_MAX_ENUM = VkObjectType.VK_OBJECT_TYPE_MAX_ENUM,
}
enum VkPeerMemoryFeatureFlagBits {
	VK_PEER_MEMORY_FEATURE_COPY_SRC_BIT = 0x00000001,
	VK_PEER_MEMORY_FEATURE_COPY_DST_BIT = 0x00000002,
	VK_PEER_MEMORY_FEATURE_GENERIC_SRC_BIT = 0x00000004,
	VK_PEER_MEMORY_FEATURE_GENERIC_DST_BIT = 0x00000008,
	VK_PEER_MEMORY_FEATURE_COPY_SRC_BIT_KHR = VK_PEER_MEMORY_FEATURE_COPY_SRC_BIT,
	VK_PEER_MEMORY_FEATURE_COPY_DST_BIT_KHR = VK_PEER_MEMORY_FEATURE_COPY_DST_BIT,
	VK_PEER_MEMORY_FEATURE_GENERIC_SRC_BIT_KHR = VK_PEER_MEMORY_FEATURE_GENERIC_SRC_BIT,
	VK_PEER_MEMORY_FEATURE_GENERIC_DST_BIT_KHR = VK_PEER_MEMORY_FEATURE_GENERIC_DST_BIT,
	VK_PEER_MEMORY_FEATURE_FLAG_BITS_MAX_ENUM = 0x7FFFFFFF,
}
enum : VkPeerMemoryFeatureFlagBits {
	VK_PEER_MEMORY_FEATURE_COPY_SRC_BIT = VkPeerMemoryFeatureFlagBits.VK_PEER_MEMORY_FEATURE_COPY_SRC_BIT,
	VK_PEER_MEMORY_FEATURE_COPY_DST_BIT = VkPeerMemoryFeatureFlagBits.VK_PEER_MEMORY_FEATURE_COPY_DST_BIT,
	VK_PEER_MEMORY_FEATURE_GENERIC_SRC_BIT = VkPeerMemoryFeatureFlagBits.VK_PEER_MEMORY_FEATURE_GENERIC_SRC_BIT,
	VK_PEER_MEMORY_FEATURE_GENERIC_DST_BIT = VkPeerMemoryFeatureFlagBits.VK_PEER_MEMORY_FEATURE_GENERIC_DST_BIT,
	VK_PEER_MEMORY_FEATURE_COPY_SRC_BIT_KHR = VkPeerMemoryFeatureFlagBits.VK_PEER_MEMORY_FEATURE_COPY_SRC_BIT_KHR,
	VK_PEER_MEMORY_FEATURE_COPY_DST_BIT_KHR = VkPeerMemoryFeatureFlagBits.VK_PEER_MEMORY_FEATURE_COPY_DST_BIT_KHR,
	VK_PEER_MEMORY_FEATURE_GENERIC_SRC_BIT_KHR = VkPeerMemoryFeatureFlagBits.VK_PEER_MEMORY_FEATURE_GENERIC_SRC_BIT_KHR,
	VK_PEER_MEMORY_FEATURE_GENERIC_DST_BIT_KHR = VkPeerMemoryFeatureFlagBits.VK_PEER_MEMORY_FEATURE_GENERIC_DST_BIT_KHR,
	VK_PEER_MEMORY_FEATURE_FLAG_BITS_MAX_ENUM = VkPeerMemoryFeatureFlagBits.VK_PEER_MEMORY_FEATURE_FLAG_BITS_MAX_ENUM,
}
enum VkPerformanceConfigurationTypeINTEL {
	VK_PERFORMANCE_CONFIGURATION_TYPE_COMMAND_QUEUE_METRICS_DISCOVERY_ACTIVATED_INTEL = 0,
	VK_PERFORMANCE_CONFIGURATION_TYPE_MAX_ENUM_INTEL = 0x7FFFFFFF,
}
enum : VkPerformanceConfigurationTypeINTEL {
	VK_PERFORMANCE_CONFIGURATION_TYPE_COMMAND_QUEUE_METRICS_DISCOVERY_ACTIVATED_INTEL = VkPerformanceConfigurationTypeINTEL.VK_PERFORMANCE_CONFIGURATION_TYPE_COMMAND_QUEUE_METRICS_DISCOVERY_ACTIVATED_INTEL,
	VK_PERFORMANCE_CONFIGURATION_TYPE_MAX_ENUM_INTEL = VkPerformanceConfigurationTypeINTEL.VK_PERFORMANCE_CONFIGURATION_TYPE_MAX_ENUM_INTEL,
}
enum VkPerformanceCounterDescriptionFlagBitsKHR {
	VK_PERFORMANCE_COUNTER_DESCRIPTION_PERFORMANCE_IMPACTING_BIT_KHR = 0x00000001,
	VK_PERFORMANCE_COUNTER_DESCRIPTION_CONCURRENTLY_IMPACTED_BIT_KHR = 0x00000002,
	VK_PERFORMANCE_COUNTER_DESCRIPTION_PERFORMANCE_IMPACTING_KHR = VK_PERFORMANCE_COUNTER_DESCRIPTION_PERFORMANCE_IMPACTING_BIT_KHR,
	VK_PERFORMANCE_COUNTER_DESCRIPTION_CONCURRENTLY_IMPACTED_KHR = VK_PERFORMANCE_COUNTER_DESCRIPTION_CONCURRENTLY_IMPACTED_BIT_KHR,
	VK_PERFORMANCE_COUNTER_DESCRIPTION_FLAG_BITS_MAX_ENUM_KHR = 0x7FFFFFFF,
}
enum : VkPerformanceCounterDescriptionFlagBitsKHR {
	VK_PERFORMANCE_COUNTER_DESCRIPTION_PERFORMANCE_IMPACTING_BIT_KHR = VkPerformanceCounterDescriptionFlagBitsKHR.VK_PERFORMANCE_COUNTER_DESCRIPTION_PERFORMANCE_IMPACTING_BIT_KHR,
	VK_PERFORMANCE_COUNTER_DESCRIPTION_CONCURRENTLY_IMPACTED_BIT_KHR = VkPerformanceCounterDescriptionFlagBitsKHR.VK_PERFORMANCE_COUNTER_DESCRIPTION_CONCURRENTLY_IMPACTED_BIT_KHR,
	VK_PERFORMANCE_COUNTER_DESCRIPTION_PERFORMANCE_IMPACTING_KHR = VkPerformanceCounterDescriptionFlagBitsKHR.VK_PERFORMANCE_COUNTER_DESCRIPTION_PERFORMANCE_IMPACTING_KHR,
	VK_PERFORMANCE_COUNTER_DESCRIPTION_CONCURRENTLY_IMPACTED_KHR = VkPerformanceCounterDescriptionFlagBitsKHR.VK_PERFORMANCE_COUNTER_DESCRIPTION_CONCURRENTLY_IMPACTED_KHR,
	VK_PERFORMANCE_COUNTER_DESCRIPTION_FLAG_BITS_MAX_ENUM_KHR = VkPerformanceCounterDescriptionFlagBitsKHR.VK_PERFORMANCE_COUNTER_DESCRIPTION_FLAG_BITS_MAX_ENUM_KHR,
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
enum : VkPerformanceCounterScopeKHR {
	VK_PERFORMANCE_COUNTER_SCOPE_COMMAND_BUFFER_KHR = VkPerformanceCounterScopeKHR.VK_PERFORMANCE_COUNTER_SCOPE_COMMAND_BUFFER_KHR,
	VK_PERFORMANCE_COUNTER_SCOPE_RENDER_PASS_KHR = VkPerformanceCounterScopeKHR.VK_PERFORMANCE_COUNTER_SCOPE_RENDER_PASS_KHR,
	VK_PERFORMANCE_COUNTER_SCOPE_COMMAND_KHR = VkPerformanceCounterScopeKHR.VK_PERFORMANCE_COUNTER_SCOPE_COMMAND_KHR,
	VK_QUERY_SCOPE_COMMAND_BUFFER_KHR = VkPerformanceCounterScopeKHR.VK_QUERY_SCOPE_COMMAND_BUFFER_KHR,
	VK_QUERY_SCOPE_RENDER_PASS_KHR = VkPerformanceCounterScopeKHR.VK_QUERY_SCOPE_RENDER_PASS_KHR,
	VK_QUERY_SCOPE_COMMAND_KHR = VkPerformanceCounterScopeKHR.VK_QUERY_SCOPE_COMMAND_KHR,
	VK_PERFORMANCE_COUNTER_SCOPE_MAX_ENUM_KHR = VkPerformanceCounterScopeKHR.VK_PERFORMANCE_COUNTER_SCOPE_MAX_ENUM_KHR,
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
enum : VkPerformanceCounterStorageKHR {
	VK_PERFORMANCE_COUNTER_STORAGE_INT32_KHR = VkPerformanceCounterStorageKHR.VK_PERFORMANCE_COUNTER_STORAGE_INT32_KHR,
	VK_PERFORMANCE_COUNTER_STORAGE_INT64_KHR = VkPerformanceCounterStorageKHR.VK_PERFORMANCE_COUNTER_STORAGE_INT64_KHR,
	VK_PERFORMANCE_COUNTER_STORAGE_UINT32_KHR = VkPerformanceCounterStorageKHR.VK_PERFORMANCE_COUNTER_STORAGE_UINT32_KHR,
	VK_PERFORMANCE_COUNTER_STORAGE_UINT64_KHR = VkPerformanceCounterStorageKHR.VK_PERFORMANCE_COUNTER_STORAGE_UINT64_KHR,
	VK_PERFORMANCE_COUNTER_STORAGE_FLOAT32_KHR = VkPerformanceCounterStorageKHR.VK_PERFORMANCE_COUNTER_STORAGE_FLOAT32_KHR,
	VK_PERFORMANCE_COUNTER_STORAGE_FLOAT64_KHR = VkPerformanceCounterStorageKHR.VK_PERFORMANCE_COUNTER_STORAGE_FLOAT64_KHR,
	VK_PERFORMANCE_COUNTER_STORAGE_MAX_ENUM_KHR = VkPerformanceCounterStorageKHR.VK_PERFORMANCE_COUNTER_STORAGE_MAX_ENUM_KHR,
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
enum : VkPerformanceCounterUnitKHR {
	VK_PERFORMANCE_COUNTER_UNIT_GENERIC_KHR = VkPerformanceCounterUnitKHR.VK_PERFORMANCE_COUNTER_UNIT_GENERIC_KHR,
	VK_PERFORMANCE_COUNTER_UNIT_PERCENTAGE_KHR = VkPerformanceCounterUnitKHR.VK_PERFORMANCE_COUNTER_UNIT_PERCENTAGE_KHR,
	VK_PERFORMANCE_COUNTER_UNIT_NANOSECONDS_KHR = VkPerformanceCounterUnitKHR.VK_PERFORMANCE_COUNTER_UNIT_NANOSECONDS_KHR,
	VK_PERFORMANCE_COUNTER_UNIT_BYTES_KHR = VkPerformanceCounterUnitKHR.VK_PERFORMANCE_COUNTER_UNIT_BYTES_KHR,
	VK_PERFORMANCE_COUNTER_UNIT_BYTES_PER_SECOND_KHR = VkPerformanceCounterUnitKHR.VK_PERFORMANCE_COUNTER_UNIT_BYTES_PER_SECOND_KHR,
	VK_PERFORMANCE_COUNTER_UNIT_KELVIN_KHR = VkPerformanceCounterUnitKHR.VK_PERFORMANCE_COUNTER_UNIT_KELVIN_KHR,
	VK_PERFORMANCE_COUNTER_UNIT_WATTS_KHR = VkPerformanceCounterUnitKHR.VK_PERFORMANCE_COUNTER_UNIT_WATTS_KHR,
	VK_PERFORMANCE_COUNTER_UNIT_VOLTS_KHR = VkPerformanceCounterUnitKHR.VK_PERFORMANCE_COUNTER_UNIT_VOLTS_KHR,
	VK_PERFORMANCE_COUNTER_UNIT_AMPS_KHR = VkPerformanceCounterUnitKHR.VK_PERFORMANCE_COUNTER_UNIT_AMPS_KHR,
	VK_PERFORMANCE_COUNTER_UNIT_HERTZ_KHR = VkPerformanceCounterUnitKHR.VK_PERFORMANCE_COUNTER_UNIT_HERTZ_KHR,
	VK_PERFORMANCE_COUNTER_UNIT_CYCLES_KHR = VkPerformanceCounterUnitKHR.VK_PERFORMANCE_COUNTER_UNIT_CYCLES_KHR,
	VK_PERFORMANCE_COUNTER_UNIT_MAX_ENUM_KHR = VkPerformanceCounterUnitKHR.VK_PERFORMANCE_COUNTER_UNIT_MAX_ENUM_KHR,
}
enum VkPerformanceOverrideTypeINTEL {
	VK_PERFORMANCE_OVERRIDE_TYPE_NULL_HARDWARE_INTEL = 0,
	VK_PERFORMANCE_OVERRIDE_TYPE_FLUSH_GPU_CACHES_INTEL = 1,
	VK_PERFORMANCE_OVERRIDE_TYPE_MAX_ENUM_INTEL = 0x7FFFFFFF,
}
enum : VkPerformanceOverrideTypeINTEL {
	VK_PERFORMANCE_OVERRIDE_TYPE_NULL_HARDWARE_INTEL = VkPerformanceOverrideTypeINTEL.VK_PERFORMANCE_OVERRIDE_TYPE_NULL_HARDWARE_INTEL,
	VK_PERFORMANCE_OVERRIDE_TYPE_FLUSH_GPU_CACHES_INTEL = VkPerformanceOverrideTypeINTEL.VK_PERFORMANCE_OVERRIDE_TYPE_FLUSH_GPU_CACHES_INTEL,
	VK_PERFORMANCE_OVERRIDE_TYPE_MAX_ENUM_INTEL = VkPerformanceOverrideTypeINTEL.VK_PERFORMANCE_OVERRIDE_TYPE_MAX_ENUM_INTEL,
}
enum VkPerformanceParameterTypeINTEL {
	VK_PERFORMANCE_PARAMETER_TYPE_HW_COUNTERS_SUPPORTED_INTEL = 0,
	VK_PERFORMANCE_PARAMETER_TYPE_STREAM_MARKER_VALID_BITS_INTEL = 1,
	VK_PERFORMANCE_PARAMETER_TYPE_MAX_ENUM_INTEL = 0x7FFFFFFF,
}
enum : VkPerformanceParameterTypeINTEL {
	VK_PERFORMANCE_PARAMETER_TYPE_HW_COUNTERS_SUPPORTED_INTEL = VkPerformanceParameterTypeINTEL.VK_PERFORMANCE_PARAMETER_TYPE_HW_COUNTERS_SUPPORTED_INTEL,
	VK_PERFORMANCE_PARAMETER_TYPE_STREAM_MARKER_VALID_BITS_INTEL = VkPerformanceParameterTypeINTEL.VK_PERFORMANCE_PARAMETER_TYPE_STREAM_MARKER_VALID_BITS_INTEL,
	VK_PERFORMANCE_PARAMETER_TYPE_MAX_ENUM_INTEL = VkPerformanceParameterTypeINTEL.VK_PERFORMANCE_PARAMETER_TYPE_MAX_ENUM_INTEL,
}
enum VkPerformanceValueTypeINTEL {
	VK_PERFORMANCE_VALUE_TYPE_UINT32_INTEL = 0,
	VK_PERFORMANCE_VALUE_TYPE_UINT64_INTEL = 1,
	VK_PERFORMANCE_VALUE_TYPE_FLOAT_INTEL = 2,
	VK_PERFORMANCE_VALUE_TYPE_BOOL_INTEL = 3,
	VK_PERFORMANCE_VALUE_TYPE_STRING_INTEL = 4,
	VK_PERFORMANCE_VALUE_TYPE_MAX_ENUM_INTEL = 0x7FFFFFFF,
}
enum : VkPerformanceValueTypeINTEL {
	VK_PERFORMANCE_VALUE_TYPE_UINT32_INTEL = VkPerformanceValueTypeINTEL.VK_PERFORMANCE_VALUE_TYPE_UINT32_INTEL,
	VK_PERFORMANCE_VALUE_TYPE_UINT64_INTEL = VkPerformanceValueTypeINTEL.VK_PERFORMANCE_VALUE_TYPE_UINT64_INTEL,
	VK_PERFORMANCE_VALUE_TYPE_FLOAT_INTEL = VkPerformanceValueTypeINTEL.VK_PERFORMANCE_VALUE_TYPE_FLOAT_INTEL,
	VK_PERFORMANCE_VALUE_TYPE_BOOL_INTEL = VkPerformanceValueTypeINTEL.VK_PERFORMANCE_VALUE_TYPE_BOOL_INTEL,
	VK_PERFORMANCE_VALUE_TYPE_STRING_INTEL = VkPerformanceValueTypeINTEL.VK_PERFORMANCE_VALUE_TYPE_STRING_INTEL,
	VK_PERFORMANCE_VALUE_TYPE_MAX_ENUM_INTEL = VkPerformanceValueTypeINTEL.VK_PERFORMANCE_VALUE_TYPE_MAX_ENUM_INTEL,
}
enum VkPhysicalDeviceType {
	VK_PHYSICAL_DEVICE_TYPE_OTHER = 0,
	VK_PHYSICAL_DEVICE_TYPE_INTEGRATED_GPU = 1,
	VK_PHYSICAL_DEVICE_TYPE_DISCRETE_GPU = 2,
	VK_PHYSICAL_DEVICE_TYPE_VIRTUAL_GPU = 3,
	VK_PHYSICAL_DEVICE_TYPE_CPU = 4,
	VK_PHYSICAL_DEVICE_TYPE_MAX_ENUM = 0x7FFFFFFF,
}
enum : VkPhysicalDeviceType {
	VK_PHYSICAL_DEVICE_TYPE_OTHER = VkPhysicalDeviceType.VK_PHYSICAL_DEVICE_TYPE_OTHER,
	VK_PHYSICAL_DEVICE_TYPE_INTEGRATED_GPU = VkPhysicalDeviceType.VK_PHYSICAL_DEVICE_TYPE_INTEGRATED_GPU,
	VK_PHYSICAL_DEVICE_TYPE_DISCRETE_GPU = VkPhysicalDeviceType.VK_PHYSICAL_DEVICE_TYPE_DISCRETE_GPU,
	VK_PHYSICAL_DEVICE_TYPE_VIRTUAL_GPU = VkPhysicalDeviceType.VK_PHYSICAL_DEVICE_TYPE_VIRTUAL_GPU,
	VK_PHYSICAL_DEVICE_TYPE_CPU = VkPhysicalDeviceType.VK_PHYSICAL_DEVICE_TYPE_CPU,
	VK_PHYSICAL_DEVICE_TYPE_MAX_ENUM = VkPhysicalDeviceType.VK_PHYSICAL_DEVICE_TYPE_MAX_ENUM,
}
enum VkPipelineBindPoint {
	VK_PIPELINE_BIND_POINT_GRAPHICS = 0,
	VK_PIPELINE_BIND_POINT_COMPUTE = 1,
	VK_PIPELINE_BIND_POINT_RAY_TRACING_KHR = 1000165000,
	VK_PIPELINE_BIND_POINT_SUBPASS_SHADING_HUAWEI = 1000369003,
	VK_PIPELINE_BIND_POINT_RAY_TRACING_NV = VK_PIPELINE_BIND_POINT_RAY_TRACING_KHR,
	VK_PIPELINE_BIND_POINT_MAX_ENUM = 0x7FFFFFFF,
}
enum : VkPipelineBindPoint {
	VK_PIPELINE_BIND_POINT_GRAPHICS = VkPipelineBindPoint.VK_PIPELINE_BIND_POINT_GRAPHICS,
	VK_PIPELINE_BIND_POINT_COMPUTE = VkPipelineBindPoint.VK_PIPELINE_BIND_POINT_COMPUTE,
	VK_PIPELINE_BIND_POINT_RAY_TRACING_KHR = VkPipelineBindPoint.VK_PIPELINE_BIND_POINT_RAY_TRACING_KHR,
	VK_PIPELINE_BIND_POINT_SUBPASS_SHADING_HUAWEI = VkPipelineBindPoint.VK_PIPELINE_BIND_POINT_SUBPASS_SHADING_HUAWEI,
	VK_PIPELINE_BIND_POINT_RAY_TRACING_NV = VkPipelineBindPoint.VK_PIPELINE_BIND_POINT_RAY_TRACING_NV,
	VK_PIPELINE_BIND_POINT_MAX_ENUM = VkPipelineBindPoint.VK_PIPELINE_BIND_POINT_MAX_ENUM,
}
enum VkPipelineCacheCreateFlagBits {
	VK_PIPELINE_CACHE_CREATE_EXTERNALLY_SYNCHRONIZED_BIT = 0x00000001,
	VK_PIPELINE_CACHE_CREATE_EXTERNALLY_SYNCHRONIZED_BIT_EXT = VK_PIPELINE_CACHE_CREATE_EXTERNALLY_SYNCHRONIZED_BIT,
	VK_PIPELINE_CACHE_CREATE_FLAG_BITS_MAX_ENUM = 0x7FFFFFFF,
}
enum : VkPipelineCacheCreateFlagBits {
	VK_PIPELINE_CACHE_CREATE_EXTERNALLY_SYNCHRONIZED_BIT = VkPipelineCacheCreateFlagBits.VK_PIPELINE_CACHE_CREATE_EXTERNALLY_SYNCHRONIZED_BIT,
	VK_PIPELINE_CACHE_CREATE_EXTERNALLY_SYNCHRONIZED_BIT_EXT = VkPipelineCacheCreateFlagBits.VK_PIPELINE_CACHE_CREATE_EXTERNALLY_SYNCHRONIZED_BIT_EXT,
	VK_PIPELINE_CACHE_CREATE_FLAG_BITS_MAX_ENUM = VkPipelineCacheCreateFlagBits.VK_PIPELINE_CACHE_CREATE_FLAG_BITS_MAX_ENUM,
}
enum VkPipelineCacheHeaderVersion {
	VK_PIPELINE_CACHE_HEADER_VERSION_ONE = 1,
	VK_PIPELINE_CACHE_HEADER_VERSION_MAX_ENUM = 0x7FFFFFFF,
}
enum : VkPipelineCacheHeaderVersion {
	VK_PIPELINE_CACHE_HEADER_VERSION_ONE = VkPipelineCacheHeaderVersion.VK_PIPELINE_CACHE_HEADER_VERSION_ONE,
	VK_PIPELINE_CACHE_HEADER_VERSION_MAX_ENUM = VkPipelineCacheHeaderVersion.VK_PIPELINE_CACHE_HEADER_VERSION_MAX_ENUM,
}
enum VkPipelineColorBlendStateCreateFlagBits {
	VK_PIPELINE_COLOR_BLEND_STATE_CREATE_RASTERIZATION_ORDER_ATTACHMENT_ACCESS_BIT_ARM = 0x00000001,
	VK_PIPELINE_COLOR_BLEND_STATE_CREATE_FLAG_BITS_MAX_ENUM = 0x7FFFFFFF,
}
enum : VkPipelineColorBlendStateCreateFlagBits {
	VK_PIPELINE_COLOR_BLEND_STATE_CREATE_RASTERIZATION_ORDER_ATTACHMENT_ACCESS_BIT_ARM = VkPipelineColorBlendStateCreateFlagBits.VK_PIPELINE_COLOR_BLEND_STATE_CREATE_RASTERIZATION_ORDER_ATTACHMENT_ACCESS_BIT_ARM,
	VK_PIPELINE_COLOR_BLEND_STATE_CREATE_FLAG_BITS_MAX_ENUM = VkPipelineColorBlendStateCreateFlagBits.VK_PIPELINE_COLOR_BLEND_STATE_CREATE_FLAG_BITS_MAX_ENUM,
}
enum VkPipelineCompilerControlFlagBitsAMD {
	VK_PIPELINE_COMPILER_CONTROL_FLAG_BITS_MAX_ENUM_AMD = 0x7FFFFFFF,
}
enum : VkPipelineCompilerControlFlagBitsAMD {
	VK_PIPELINE_COMPILER_CONTROL_FLAG_BITS_MAX_ENUM_AMD = VkPipelineCompilerControlFlagBitsAMD.VK_PIPELINE_COMPILER_CONTROL_FLAG_BITS_MAX_ENUM_AMD,
}
enum VkPipelineCreateFlagBits {
	VK_PIPELINE_CREATE_DISABLE_OPTIMIZATION_BIT = 0x00000001,
	VK_PIPELINE_CREATE_ALLOW_DERIVATIVES_BIT = 0x00000002,
	VK_PIPELINE_CREATE_DERIVATIVE_BIT = 0x00000004,
	VK_PIPELINE_CREATE_VIEW_INDEX_FROM_DEVICE_INDEX_BIT = 0x00000008,
	VK_PIPELINE_CREATE_DISPATCH_BASE_BIT = 0x00000010,
	VK_PIPELINE_CREATE_FAIL_ON_PIPELINE_COMPILE_REQUIRED_BIT = 0x00000100,
	VK_PIPELINE_CREATE_EARLY_RETURN_ON_FAILURE_BIT = 0x00000200,
	VK_PIPELINE_CREATE_RENDERING_FRAGMENT_SHADING_RATE_ATTACHMENT_BIT_KHR = 0x00200000,
	VK_PIPELINE_CREATE_RENDERING_FRAGMENT_DENSITY_MAP_ATTACHMENT_BIT_EXT = 0x00400000,
	VK_PIPELINE_CREATE_RAY_TRACING_NO_NULL_ANY_HIT_SHADERS_BIT_KHR = 0x00004000,
	VK_PIPELINE_CREATE_RAY_TRACING_NO_NULL_CLOSEST_HIT_SHADERS_BIT_KHR = 0x00008000,
	VK_PIPELINE_CREATE_RAY_TRACING_NO_NULL_MISS_SHADERS_BIT_KHR = 0x00010000,
	VK_PIPELINE_CREATE_RAY_TRACING_NO_NULL_INTERSECTION_SHADERS_BIT_KHR = 0x00020000,
	VK_PIPELINE_CREATE_RAY_TRACING_SKIP_TRIANGLES_BIT_KHR = 0x00001000,
	VK_PIPELINE_CREATE_RAY_TRACING_SKIP_AABBS_BIT_KHR = 0x00002000,
	VK_PIPELINE_CREATE_RAY_TRACING_SHADER_GROUP_HANDLE_CAPTURE_REPLAY_BIT_KHR = 0x00080000,
	VK_PIPELINE_CREATE_DEFER_COMPILE_BIT_NV = 0x00000020,
	VK_PIPELINE_CREATE_CAPTURE_STATISTICS_BIT_KHR = 0x00000040,
	VK_PIPELINE_CREATE_CAPTURE_INTERNAL_REPRESENTATIONS_BIT_KHR = 0x00000080,
	VK_PIPELINE_CREATE_INDIRECT_BINDABLE_BIT_NV = 0x00040000,
	VK_PIPELINE_CREATE_LIBRARY_BIT_KHR = 0x00000800,
	VK_PIPELINE_CREATE_RETAIN_LINK_TIME_OPTIMIZATION_INFO_BIT_EXT = 0x00800000,
	VK_PIPELINE_CREATE_LINK_TIME_OPTIMIZATION_BIT_EXT = 0x00000400,
	VK_PIPELINE_CREATE_RAY_TRACING_ALLOW_MOTION_BIT_NV = 0x00100000,
	VK_PIPELINE_CREATE_DISPATCH_BASE = VK_PIPELINE_CREATE_DISPATCH_BASE_BIT,
	VK_PIPELINE_RASTERIZATION_STATE_CREATE_FRAGMENT_SHADING_RATE_ATTACHMENT_BIT_KHR = VK_PIPELINE_CREATE_RENDERING_FRAGMENT_SHADING_RATE_ATTACHMENT_BIT_KHR,
	VK_PIPELINE_RASTERIZATION_STATE_CREATE_FRAGMENT_DENSITY_MAP_ATTACHMENT_BIT_EXT = VK_PIPELINE_CREATE_RENDERING_FRAGMENT_DENSITY_MAP_ATTACHMENT_BIT_EXT,
	VK_PIPELINE_CREATE_VIEW_INDEX_FROM_DEVICE_INDEX_BIT_KHR = VK_PIPELINE_CREATE_VIEW_INDEX_FROM_DEVICE_INDEX_BIT,
	VK_PIPELINE_CREATE_DISPATCH_BASE_KHR = VK_PIPELINE_CREATE_DISPATCH_BASE,
	VK_PIPELINE_CREATE_FAIL_ON_PIPELINE_COMPILE_REQUIRED_BIT_EXT = VK_PIPELINE_CREATE_FAIL_ON_PIPELINE_COMPILE_REQUIRED_BIT,
	VK_PIPELINE_CREATE_EARLY_RETURN_ON_FAILURE_BIT_EXT = VK_PIPELINE_CREATE_EARLY_RETURN_ON_FAILURE_BIT,
	VK_PIPELINE_CREATE_FLAG_BITS_MAX_ENUM = 0x7FFFFFFF,
}
enum : VkPipelineCreateFlagBits {
	VK_PIPELINE_CREATE_DISABLE_OPTIMIZATION_BIT = VkPipelineCreateFlagBits.VK_PIPELINE_CREATE_DISABLE_OPTIMIZATION_BIT,
	VK_PIPELINE_CREATE_ALLOW_DERIVATIVES_BIT = VkPipelineCreateFlagBits.VK_PIPELINE_CREATE_ALLOW_DERIVATIVES_BIT,
	VK_PIPELINE_CREATE_DERIVATIVE_BIT = VkPipelineCreateFlagBits.VK_PIPELINE_CREATE_DERIVATIVE_BIT,
	VK_PIPELINE_CREATE_VIEW_INDEX_FROM_DEVICE_INDEX_BIT = VkPipelineCreateFlagBits.VK_PIPELINE_CREATE_VIEW_INDEX_FROM_DEVICE_INDEX_BIT,
	VK_PIPELINE_CREATE_DISPATCH_BASE_BIT = VkPipelineCreateFlagBits.VK_PIPELINE_CREATE_DISPATCH_BASE_BIT,
	VK_PIPELINE_CREATE_FAIL_ON_PIPELINE_COMPILE_REQUIRED_BIT = VkPipelineCreateFlagBits.VK_PIPELINE_CREATE_FAIL_ON_PIPELINE_COMPILE_REQUIRED_BIT,
	VK_PIPELINE_CREATE_EARLY_RETURN_ON_FAILURE_BIT = VkPipelineCreateFlagBits.VK_PIPELINE_CREATE_EARLY_RETURN_ON_FAILURE_BIT,
	VK_PIPELINE_CREATE_RENDERING_FRAGMENT_SHADING_RATE_ATTACHMENT_BIT_KHR = VkPipelineCreateFlagBits.VK_PIPELINE_CREATE_RENDERING_FRAGMENT_SHADING_RATE_ATTACHMENT_BIT_KHR,
	VK_PIPELINE_CREATE_RENDERING_FRAGMENT_DENSITY_MAP_ATTACHMENT_BIT_EXT = VkPipelineCreateFlagBits.VK_PIPELINE_CREATE_RENDERING_FRAGMENT_DENSITY_MAP_ATTACHMENT_BIT_EXT,
	VK_PIPELINE_CREATE_RAY_TRACING_NO_NULL_ANY_HIT_SHADERS_BIT_KHR = VkPipelineCreateFlagBits.VK_PIPELINE_CREATE_RAY_TRACING_NO_NULL_ANY_HIT_SHADERS_BIT_KHR,
	VK_PIPELINE_CREATE_RAY_TRACING_NO_NULL_CLOSEST_HIT_SHADERS_BIT_KHR = VkPipelineCreateFlagBits.VK_PIPELINE_CREATE_RAY_TRACING_NO_NULL_CLOSEST_HIT_SHADERS_BIT_KHR,
	VK_PIPELINE_CREATE_RAY_TRACING_NO_NULL_MISS_SHADERS_BIT_KHR = VkPipelineCreateFlagBits.VK_PIPELINE_CREATE_RAY_TRACING_NO_NULL_MISS_SHADERS_BIT_KHR,
	VK_PIPELINE_CREATE_RAY_TRACING_NO_NULL_INTERSECTION_SHADERS_BIT_KHR = VkPipelineCreateFlagBits.VK_PIPELINE_CREATE_RAY_TRACING_NO_NULL_INTERSECTION_SHADERS_BIT_KHR,
	VK_PIPELINE_CREATE_RAY_TRACING_SKIP_TRIANGLES_BIT_KHR = VkPipelineCreateFlagBits.VK_PIPELINE_CREATE_RAY_TRACING_SKIP_TRIANGLES_BIT_KHR,
	VK_PIPELINE_CREATE_RAY_TRACING_SKIP_AABBS_BIT_KHR = VkPipelineCreateFlagBits.VK_PIPELINE_CREATE_RAY_TRACING_SKIP_AABBS_BIT_KHR,
	VK_PIPELINE_CREATE_RAY_TRACING_SHADER_GROUP_HANDLE_CAPTURE_REPLAY_BIT_KHR = VkPipelineCreateFlagBits.VK_PIPELINE_CREATE_RAY_TRACING_SHADER_GROUP_HANDLE_CAPTURE_REPLAY_BIT_KHR,
	VK_PIPELINE_CREATE_DEFER_COMPILE_BIT_NV = VkPipelineCreateFlagBits.VK_PIPELINE_CREATE_DEFER_COMPILE_BIT_NV,
	VK_PIPELINE_CREATE_CAPTURE_STATISTICS_BIT_KHR = VkPipelineCreateFlagBits.VK_PIPELINE_CREATE_CAPTURE_STATISTICS_BIT_KHR,
	VK_PIPELINE_CREATE_CAPTURE_INTERNAL_REPRESENTATIONS_BIT_KHR = VkPipelineCreateFlagBits.VK_PIPELINE_CREATE_CAPTURE_INTERNAL_REPRESENTATIONS_BIT_KHR,
	VK_PIPELINE_CREATE_INDIRECT_BINDABLE_BIT_NV = VkPipelineCreateFlagBits.VK_PIPELINE_CREATE_INDIRECT_BINDABLE_BIT_NV,
	VK_PIPELINE_CREATE_LIBRARY_BIT_KHR = VkPipelineCreateFlagBits.VK_PIPELINE_CREATE_LIBRARY_BIT_KHR,
	VK_PIPELINE_CREATE_RETAIN_LINK_TIME_OPTIMIZATION_INFO_BIT_EXT = VkPipelineCreateFlagBits.VK_PIPELINE_CREATE_RETAIN_LINK_TIME_OPTIMIZATION_INFO_BIT_EXT,
	VK_PIPELINE_CREATE_LINK_TIME_OPTIMIZATION_BIT_EXT = VkPipelineCreateFlagBits.VK_PIPELINE_CREATE_LINK_TIME_OPTIMIZATION_BIT_EXT,
	VK_PIPELINE_CREATE_RAY_TRACING_ALLOW_MOTION_BIT_NV = VkPipelineCreateFlagBits.VK_PIPELINE_CREATE_RAY_TRACING_ALLOW_MOTION_BIT_NV,
	VK_PIPELINE_CREATE_DISPATCH_BASE = VkPipelineCreateFlagBits.VK_PIPELINE_CREATE_DISPATCH_BASE,
	VK_PIPELINE_RASTERIZATION_STATE_CREATE_FRAGMENT_SHADING_RATE_ATTACHMENT_BIT_KHR = VkPipelineCreateFlagBits.VK_PIPELINE_RASTERIZATION_STATE_CREATE_FRAGMENT_SHADING_RATE_ATTACHMENT_BIT_KHR,
	VK_PIPELINE_RASTERIZATION_STATE_CREATE_FRAGMENT_DENSITY_MAP_ATTACHMENT_BIT_EXT = VkPipelineCreateFlagBits.VK_PIPELINE_RASTERIZATION_STATE_CREATE_FRAGMENT_DENSITY_MAP_ATTACHMENT_BIT_EXT,
	VK_PIPELINE_CREATE_VIEW_INDEX_FROM_DEVICE_INDEX_BIT_KHR = VkPipelineCreateFlagBits.VK_PIPELINE_CREATE_VIEW_INDEX_FROM_DEVICE_INDEX_BIT_KHR,
	VK_PIPELINE_CREATE_DISPATCH_BASE_KHR = VkPipelineCreateFlagBits.VK_PIPELINE_CREATE_DISPATCH_BASE_KHR,
	VK_PIPELINE_CREATE_FAIL_ON_PIPELINE_COMPILE_REQUIRED_BIT_EXT = VkPipelineCreateFlagBits.VK_PIPELINE_CREATE_FAIL_ON_PIPELINE_COMPILE_REQUIRED_BIT_EXT,
	VK_PIPELINE_CREATE_EARLY_RETURN_ON_FAILURE_BIT_EXT = VkPipelineCreateFlagBits.VK_PIPELINE_CREATE_EARLY_RETURN_ON_FAILURE_BIT_EXT,
	VK_PIPELINE_CREATE_FLAG_BITS_MAX_ENUM = VkPipelineCreateFlagBits.VK_PIPELINE_CREATE_FLAG_BITS_MAX_ENUM,
}
enum VkPipelineCreationFeedbackFlagBits {
	VK_PIPELINE_CREATION_FEEDBACK_VALID_BIT = 0x00000001,
	VK_PIPELINE_CREATION_FEEDBACK_APPLICATION_PIPELINE_CACHE_HIT_BIT = 0x00000002,
	VK_PIPELINE_CREATION_FEEDBACK_BASE_PIPELINE_ACCELERATION_BIT = 0x00000004,
	VK_PIPELINE_CREATION_FEEDBACK_VALID_BIT_EXT = VK_PIPELINE_CREATION_FEEDBACK_VALID_BIT,
	VK_PIPELINE_CREATION_FEEDBACK_APPLICATION_PIPELINE_CACHE_HIT_BIT_EXT = VK_PIPELINE_CREATION_FEEDBACK_APPLICATION_PIPELINE_CACHE_HIT_BIT,
	VK_PIPELINE_CREATION_FEEDBACK_BASE_PIPELINE_ACCELERATION_BIT_EXT = VK_PIPELINE_CREATION_FEEDBACK_BASE_PIPELINE_ACCELERATION_BIT,
	VK_PIPELINE_CREATION_FEEDBACK_FLAG_BITS_MAX_ENUM = 0x7FFFFFFF,
}
enum : VkPipelineCreationFeedbackFlagBits {
	VK_PIPELINE_CREATION_FEEDBACK_VALID_BIT = VkPipelineCreationFeedbackFlagBits.VK_PIPELINE_CREATION_FEEDBACK_VALID_BIT,
	VK_PIPELINE_CREATION_FEEDBACK_APPLICATION_PIPELINE_CACHE_HIT_BIT = VkPipelineCreationFeedbackFlagBits.VK_PIPELINE_CREATION_FEEDBACK_APPLICATION_PIPELINE_CACHE_HIT_BIT,
	VK_PIPELINE_CREATION_FEEDBACK_BASE_PIPELINE_ACCELERATION_BIT = VkPipelineCreationFeedbackFlagBits.VK_PIPELINE_CREATION_FEEDBACK_BASE_PIPELINE_ACCELERATION_BIT,
	VK_PIPELINE_CREATION_FEEDBACK_VALID_BIT_EXT = VkPipelineCreationFeedbackFlagBits.VK_PIPELINE_CREATION_FEEDBACK_VALID_BIT_EXT,
	VK_PIPELINE_CREATION_FEEDBACK_APPLICATION_PIPELINE_CACHE_HIT_BIT_EXT = VkPipelineCreationFeedbackFlagBits.VK_PIPELINE_CREATION_FEEDBACK_APPLICATION_PIPELINE_CACHE_HIT_BIT_EXT,
	VK_PIPELINE_CREATION_FEEDBACK_BASE_PIPELINE_ACCELERATION_BIT_EXT = VkPipelineCreationFeedbackFlagBits.VK_PIPELINE_CREATION_FEEDBACK_BASE_PIPELINE_ACCELERATION_BIT_EXT,
	VK_PIPELINE_CREATION_FEEDBACK_FLAG_BITS_MAX_ENUM = VkPipelineCreationFeedbackFlagBits.VK_PIPELINE_CREATION_FEEDBACK_FLAG_BITS_MAX_ENUM,
}
enum VkPipelineDepthStencilStateCreateFlagBits {
	VK_PIPELINE_DEPTH_STENCIL_STATE_CREATE_RASTERIZATION_ORDER_ATTACHMENT_DEPTH_ACCESS_BIT_ARM = 0x00000001,
	VK_PIPELINE_DEPTH_STENCIL_STATE_CREATE_RASTERIZATION_ORDER_ATTACHMENT_STENCIL_ACCESS_BIT_ARM = 0x00000002,
	VK_PIPELINE_DEPTH_STENCIL_STATE_CREATE_FLAG_BITS_MAX_ENUM = 0x7FFFFFFF,
}
enum : VkPipelineDepthStencilStateCreateFlagBits {
	VK_PIPELINE_DEPTH_STENCIL_STATE_CREATE_RASTERIZATION_ORDER_ATTACHMENT_DEPTH_ACCESS_BIT_ARM = VkPipelineDepthStencilStateCreateFlagBits.VK_PIPELINE_DEPTH_STENCIL_STATE_CREATE_RASTERIZATION_ORDER_ATTACHMENT_DEPTH_ACCESS_BIT_ARM,
	VK_PIPELINE_DEPTH_STENCIL_STATE_CREATE_RASTERIZATION_ORDER_ATTACHMENT_STENCIL_ACCESS_BIT_ARM = VkPipelineDepthStencilStateCreateFlagBits.VK_PIPELINE_DEPTH_STENCIL_STATE_CREATE_RASTERIZATION_ORDER_ATTACHMENT_STENCIL_ACCESS_BIT_ARM,
	VK_PIPELINE_DEPTH_STENCIL_STATE_CREATE_FLAG_BITS_MAX_ENUM = VkPipelineDepthStencilStateCreateFlagBits.VK_PIPELINE_DEPTH_STENCIL_STATE_CREATE_FLAG_BITS_MAX_ENUM,
}
enum VkPipelineExecutableStatisticFormatKHR {
	VK_PIPELINE_EXECUTABLE_STATISTIC_FORMAT_BOOL32_KHR = 0,
	VK_PIPELINE_EXECUTABLE_STATISTIC_FORMAT_INT64_KHR = 1,
	VK_PIPELINE_EXECUTABLE_STATISTIC_FORMAT_UINT64_KHR = 2,
	VK_PIPELINE_EXECUTABLE_STATISTIC_FORMAT_FLOAT64_KHR = 3,
	VK_PIPELINE_EXECUTABLE_STATISTIC_FORMAT_MAX_ENUM_KHR = 0x7FFFFFFF,
}
enum : VkPipelineExecutableStatisticFormatKHR {
	VK_PIPELINE_EXECUTABLE_STATISTIC_FORMAT_BOOL32_KHR = VkPipelineExecutableStatisticFormatKHR.VK_PIPELINE_EXECUTABLE_STATISTIC_FORMAT_BOOL32_KHR,
	VK_PIPELINE_EXECUTABLE_STATISTIC_FORMAT_INT64_KHR = VkPipelineExecutableStatisticFormatKHR.VK_PIPELINE_EXECUTABLE_STATISTIC_FORMAT_INT64_KHR,
	VK_PIPELINE_EXECUTABLE_STATISTIC_FORMAT_UINT64_KHR = VkPipelineExecutableStatisticFormatKHR.VK_PIPELINE_EXECUTABLE_STATISTIC_FORMAT_UINT64_KHR,
	VK_PIPELINE_EXECUTABLE_STATISTIC_FORMAT_FLOAT64_KHR = VkPipelineExecutableStatisticFormatKHR.VK_PIPELINE_EXECUTABLE_STATISTIC_FORMAT_FLOAT64_KHR,
	VK_PIPELINE_EXECUTABLE_STATISTIC_FORMAT_MAX_ENUM_KHR = VkPipelineExecutableStatisticFormatKHR.VK_PIPELINE_EXECUTABLE_STATISTIC_FORMAT_MAX_ENUM_KHR,
}
enum VkPipelineLayoutCreateFlagBits {
	VK_PIPELINE_LAYOUT_CREATE_INDEPENDENT_SETS_BIT_EXT = 0x00000002,
	VK_PIPELINE_LAYOUT_CREATE_FLAG_BITS_MAX_ENUM = 0x7FFFFFFF,
}
enum : VkPipelineLayoutCreateFlagBits {
	VK_PIPELINE_LAYOUT_CREATE_INDEPENDENT_SETS_BIT_EXT = VkPipelineLayoutCreateFlagBits.VK_PIPELINE_LAYOUT_CREATE_INDEPENDENT_SETS_BIT_EXT,
	VK_PIPELINE_LAYOUT_CREATE_FLAG_BITS_MAX_ENUM = VkPipelineLayoutCreateFlagBits.VK_PIPELINE_LAYOUT_CREATE_FLAG_BITS_MAX_ENUM,
}
enum VkPipelineShaderStageCreateFlagBits {
	VK_PIPELINE_SHADER_STAGE_CREATE_ALLOW_VARYING_SUBGROUP_SIZE_BIT = 0x00000001,
	VK_PIPELINE_SHADER_STAGE_CREATE_REQUIRE_FULL_SUBGROUPS_BIT = 0x00000002,
	VK_PIPELINE_SHADER_STAGE_CREATE_ALLOW_VARYING_SUBGROUP_SIZE_BIT_EXT = VK_PIPELINE_SHADER_STAGE_CREATE_ALLOW_VARYING_SUBGROUP_SIZE_BIT,
	VK_PIPELINE_SHADER_STAGE_CREATE_REQUIRE_FULL_SUBGROUPS_BIT_EXT = VK_PIPELINE_SHADER_STAGE_CREATE_REQUIRE_FULL_SUBGROUPS_BIT,
	VK_PIPELINE_SHADER_STAGE_CREATE_FLAG_BITS_MAX_ENUM = 0x7FFFFFFF,
}
enum : VkPipelineShaderStageCreateFlagBits {
	VK_PIPELINE_SHADER_STAGE_CREATE_ALLOW_VARYING_SUBGROUP_SIZE_BIT = VkPipelineShaderStageCreateFlagBits.VK_PIPELINE_SHADER_STAGE_CREATE_ALLOW_VARYING_SUBGROUP_SIZE_BIT,
	VK_PIPELINE_SHADER_STAGE_CREATE_REQUIRE_FULL_SUBGROUPS_BIT = VkPipelineShaderStageCreateFlagBits.VK_PIPELINE_SHADER_STAGE_CREATE_REQUIRE_FULL_SUBGROUPS_BIT,
	VK_PIPELINE_SHADER_STAGE_CREATE_ALLOW_VARYING_SUBGROUP_SIZE_BIT_EXT = VkPipelineShaderStageCreateFlagBits.VK_PIPELINE_SHADER_STAGE_CREATE_ALLOW_VARYING_SUBGROUP_SIZE_BIT_EXT,
	VK_PIPELINE_SHADER_STAGE_CREATE_REQUIRE_FULL_SUBGROUPS_BIT_EXT = VkPipelineShaderStageCreateFlagBits.VK_PIPELINE_SHADER_STAGE_CREATE_REQUIRE_FULL_SUBGROUPS_BIT_EXT,
	VK_PIPELINE_SHADER_STAGE_CREATE_FLAG_BITS_MAX_ENUM = VkPipelineShaderStageCreateFlagBits.VK_PIPELINE_SHADER_STAGE_CREATE_FLAG_BITS_MAX_ENUM,
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
	VK_PIPELINE_STAGE_NONE = 0,
	VK_PIPELINE_STAGE_TRANSFORM_FEEDBACK_BIT_EXT = 0x01000000,
	VK_PIPELINE_STAGE_CONDITIONAL_RENDERING_BIT_EXT = 0x00040000,
	VK_PIPELINE_STAGE_ACCELERATION_STRUCTURE_BUILD_BIT_KHR = 0x02000000,
	VK_PIPELINE_STAGE_RAY_TRACING_SHADER_BIT_KHR = 0x00200000,
	VK_PIPELINE_STAGE_TASK_SHADER_BIT_NV = 0x00080000,
	VK_PIPELINE_STAGE_MESH_SHADER_BIT_NV = 0x00100000,
	VK_PIPELINE_STAGE_FRAGMENT_DENSITY_PROCESS_BIT_EXT = 0x00800000,
	VK_PIPELINE_STAGE_FRAGMENT_SHADING_RATE_ATTACHMENT_BIT_KHR = 0x00400000,
	VK_PIPELINE_STAGE_COMMAND_PREPROCESS_BIT_NV = 0x00020000,
	VK_PIPELINE_STAGE_SHADING_RATE_IMAGE_BIT_NV = VK_PIPELINE_STAGE_FRAGMENT_SHADING_RATE_ATTACHMENT_BIT_KHR,
	VK_PIPELINE_STAGE_RAY_TRACING_SHADER_BIT_NV = VK_PIPELINE_STAGE_RAY_TRACING_SHADER_BIT_KHR,
	VK_PIPELINE_STAGE_ACCELERATION_STRUCTURE_BUILD_BIT_NV = VK_PIPELINE_STAGE_ACCELERATION_STRUCTURE_BUILD_BIT_KHR,
	VK_PIPELINE_STAGE_NONE_KHR = VK_PIPELINE_STAGE_NONE,
	VK_PIPELINE_STAGE_FLAG_BITS_MAX_ENUM = 0x7FFFFFFF,
}
enum : VkPipelineStageFlagBits {
	VK_PIPELINE_STAGE_TOP_OF_PIPE_BIT = VkPipelineStageFlagBits.VK_PIPELINE_STAGE_TOP_OF_PIPE_BIT,
	VK_PIPELINE_STAGE_DRAW_INDIRECT_BIT = VkPipelineStageFlagBits.VK_PIPELINE_STAGE_DRAW_INDIRECT_BIT,
	VK_PIPELINE_STAGE_VERTEX_INPUT_BIT = VkPipelineStageFlagBits.VK_PIPELINE_STAGE_VERTEX_INPUT_BIT,
	VK_PIPELINE_STAGE_VERTEX_SHADER_BIT = VkPipelineStageFlagBits.VK_PIPELINE_STAGE_VERTEX_SHADER_BIT,
	VK_PIPELINE_STAGE_TESSELLATION_CONTROL_SHADER_BIT = VkPipelineStageFlagBits.VK_PIPELINE_STAGE_TESSELLATION_CONTROL_SHADER_BIT,
	VK_PIPELINE_STAGE_TESSELLATION_EVALUATION_SHADER_BIT = VkPipelineStageFlagBits.VK_PIPELINE_STAGE_TESSELLATION_EVALUATION_SHADER_BIT,
	VK_PIPELINE_STAGE_GEOMETRY_SHADER_BIT = VkPipelineStageFlagBits.VK_PIPELINE_STAGE_GEOMETRY_SHADER_BIT,
	VK_PIPELINE_STAGE_FRAGMENT_SHADER_BIT = VkPipelineStageFlagBits.VK_PIPELINE_STAGE_FRAGMENT_SHADER_BIT,
	VK_PIPELINE_STAGE_EARLY_FRAGMENT_TESTS_BIT = VkPipelineStageFlagBits.VK_PIPELINE_STAGE_EARLY_FRAGMENT_TESTS_BIT,
	VK_PIPELINE_STAGE_LATE_FRAGMENT_TESTS_BIT = VkPipelineStageFlagBits.VK_PIPELINE_STAGE_LATE_FRAGMENT_TESTS_BIT,
	VK_PIPELINE_STAGE_COLOR_ATTACHMENT_OUTPUT_BIT = VkPipelineStageFlagBits.VK_PIPELINE_STAGE_COLOR_ATTACHMENT_OUTPUT_BIT,
	VK_PIPELINE_STAGE_COMPUTE_SHADER_BIT = VkPipelineStageFlagBits.VK_PIPELINE_STAGE_COMPUTE_SHADER_BIT,
	VK_PIPELINE_STAGE_TRANSFER_BIT = VkPipelineStageFlagBits.VK_PIPELINE_STAGE_TRANSFER_BIT,
	VK_PIPELINE_STAGE_BOTTOM_OF_PIPE_BIT = VkPipelineStageFlagBits.VK_PIPELINE_STAGE_BOTTOM_OF_PIPE_BIT,
	VK_PIPELINE_STAGE_HOST_BIT = VkPipelineStageFlagBits.VK_PIPELINE_STAGE_HOST_BIT,
	VK_PIPELINE_STAGE_ALL_GRAPHICS_BIT = VkPipelineStageFlagBits.VK_PIPELINE_STAGE_ALL_GRAPHICS_BIT,
	VK_PIPELINE_STAGE_ALL_COMMANDS_BIT = VkPipelineStageFlagBits.VK_PIPELINE_STAGE_ALL_COMMANDS_BIT,
	VK_PIPELINE_STAGE_NONE = VkPipelineStageFlagBits.VK_PIPELINE_STAGE_NONE,
	VK_PIPELINE_STAGE_TRANSFORM_FEEDBACK_BIT_EXT = VkPipelineStageFlagBits.VK_PIPELINE_STAGE_TRANSFORM_FEEDBACK_BIT_EXT,
	VK_PIPELINE_STAGE_CONDITIONAL_RENDERING_BIT_EXT = VkPipelineStageFlagBits.VK_PIPELINE_STAGE_CONDITIONAL_RENDERING_BIT_EXT,
	VK_PIPELINE_STAGE_ACCELERATION_STRUCTURE_BUILD_BIT_KHR = VkPipelineStageFlagBits.VK_PIPELINE_STAGE_ACCELERATION_STRUCTURE_BUILD_BIT_KHR,
	VK_PIPELINE_STAGE_RAY_TRACING_SHADER_BIT_KHR = VkPipelineStageFlagBits.VK_PIPELINE_STAGE_RAY_TRACING_SHADER_BIT_KHR,
	VK_PIPELINE_STAGE_TASK_SHADER_BIT_NV = VkPipelineStageFlagBits.VK_PIPELINE_STAGE_TASK_SHADER_BIT_NV,
	VK_PIPELINE_STAGE_MESH_SHADER_BIT_NV = VkPipelineStageFlagBits.VK_PIPELINE_STAGE_MESH_SHADER_BIT_NV,
	VK_PIPELINE_STAGE_FRAGMENT_DENSITY_PROCESS_BIT_EXT = VkPipelineStageFlagBits.VK_PIPELINE_STAGE_FRAGMENT_DENSITY_PROCESS_BIT_EXT,
	VK_PIPELINE_STAGE_FRAGMENT_SHADING_RATE_ATTACHMENT_BIT_KHR = VkPipelineStageFlagBits.VK_PIPELINE_STAGE_FRAGMENT_SHADING_RATE_ATTACHMENT_BIT_KHR,
	VK_PIPELINE_STAGE_COMMAND_PREPROCESS_BIT_NV = VkPipelineStageFlagBits.VK_PIPELINE_STAGE_COMMAND_PREPROCESS_BIT_NV,
	VK_PIPELINE_STAGE_SHADING_RATE_IMAGE_BIT_NV = VkPipelineStageFlagBits.VK_PIPELINE_STAGE_SHADING_RATE_IMAGE_BIT_NV,
	VK_PIPELINE_STAGE_RAY_TRACING_SHADER_BIT_NV = VkPipelineStageFlagBits.VK_PIPELINE_STAGE_RAY_TRACING_SHADER_BIT_NV,
	VK_PIPELINE_STAGE_ACCELERATION_STRUCTURE_BUILD_BIT_NV = VkPipelineStageFlagBits.VK_PIPELINE_STAGE_ACCELERATION_STRUCTURE_BUILD_BIT_NV,
	VK_PIPELINE_STAGE_NONE_KHR = VkPipelineStageFlagBits.VK_PIPELINE_STAGE_NONE_KHR,
	VK_PIPELINE_STAGE_FLAG_BITS_MAX_ENUM = VkPipelineStageFlagBits.VK_PIPELINE_STAGE_FLAG_BITS_MAX_ENUM,
}
enum VkPointClippingBehavior {
	VK_POINT_CLIPPING_BEHAVIOR_ALL_CLIP_PLANES = 0,
	VK_POINT_CLIPPING_BEHAVIOR_USER_CLIP_PLANES_ONLY = 1,
	VK_POINT_CLIPPING_BEHAVIOR_ALL_CLIP_PLANES_KHR = VK_POINT_CLIPPING_BEHAVIOR_ALL_CLIP_PLANES,
	VK_POINT_CLIPPING_BEHAVIOR_USER_CLIP_PLANES_ONLY_KHR = VK_POINT_CLIPPING_BEHAVIOR_USER_CLIP_PLANES_ONLY,
	VK_POINT_CLIPPING_BEHAVIOR_MAX_ENUM = 0x7FFFFFFF,
}
enum : VkPointClippingBehavior {
	VK_POINT_CLIPPING_BEHAVIOR_ALL_CLIP_PLANES = VkPointClippingBehavior.VK_POINT_CLIPPING_BEHAVIOR_ALL_CLIP_PLANES,
	VK_POINT_CLIPPING_BEHAVIOR_USER_CLIP_PLANES_ONLY = VkPointClippingBehavior.VK_POINT_CLIPPING_BEHAVIOR_USER_CLIP_PLANES_ONLY,
	VK_POINT_CLIPPING_BEHAVIOR_ALL_CLIP_PLANES_KHR = VkPointClippingBehavior.VK_POINT_CLIPPING_BEHAVIOR_ALL_CLIP_PLANES_KHR,
	VK_POINT_CLIPPING_BEHAVIOR_USER_CLIP_PLANES_ONLY_KHR = VkPointClippingBehavior.VK_POINT_CLIPPING_BEHAVIOR_USER_CLIP_PLANES_ONLY_KHR,
	VK_POINT_CLIPPING_BEHAVIOR_MAX_ENUM = VkPointClippingBehavior.VK_POINT_CLIPPING_BEHAVIOR_MAX_ENUM,
}
enum VkPolygonMode {
	VK_POLYGON_MODE_FILL = 0,
	VK_POLYGON_MODE_LINE = 1,
	VK_POLYGON_MODE_POINT = 2,
	VK_POLYGON_MODE_FILL_RECTANGLE_NV = 1000153000,
	VK_POLYGON_MODE_MAX_ENUM = 0x7FFFFFFF,
}
enum : VkPolygonMode {
	VK_POLYGON_MODE_FILL = VkPolygonMode.VK_POLYGON_MODE_FILL,
	VK_POLYGON_MODE_LINE = VkPolygonMode.VK_POLYGON_MODE_LINE,
	VK_POLYGON_MODE_POINT = VkPolygonMode.VK_POLYGON_MODE_POINT,
	VK_POLYGON_MODE_FILL_RECTANGLE_NV = VkPolygonMode.VK_POLYGON_MODE_FILL_RECTANGLE_NV,
	VK_POLYGON_MODE_MAX_ENUM = VkPolygonMode.VK_POLYGON_MODE_MAX_ENUM,
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
enum : VkPresentModeKHR {
	VK_PRESENT_MODE_IMMEDIATE_KHR = VkPresentModeKHR.VK_PRESENT_MODE_IMMEDIATE_KHR,
	VK_PRESENT_MODE_MAILBOX_KHR = VkPresentModeKHR.VK_PRESENT_MODE_MAILBOX_KHR,
	VK_PRESENT_MODE_FIFO_KHR = VkPresentModeKHR.VK_PRESENT_MODE_FIFO_KHR,
	VK_PRESENT_MODE_FIFO_RELAXED_KHR = VkPresentModeKHR.VK_PRESENT_MODE_FIFO_RELAXED_KHR,
	VK_PRESENT_MODE_SHARED_DEMAND_REFRESH_KHR = VkPresentModeKHR.VK_PRESENT_MODE_SHARED_DEMAND_REFRESH_KHR,
	VK_PRESENT_MODE_SHARED_CONTINUOUS_REFRESH_KHR = VkPresentModeKHR.VK_PRESENT_MODE_SHARED_CONTINUOUS_REFRESH_KHR,
	VK_PRESENT_MODE_MAX_ENUM_KHR = VkPresentModeKHR.VK_PRESENT_MODE_MAX_ENUM_KHR,
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
enum : VkPrimitiveTopology {
	VK_PRIMITIVE_TOPOLOGY_POINT_LIST = VkPrimitiveTopology.VK_PRIMITIVE_TOPOLOGY_POINT_LIST,
	VK_PRIMITIVE_TOPOLOGY_LINE_LIST = VkPrimitiveTopology.VK_PRIMITIVE_TOPOLOGY_LINE_LIST,
	VK_PRIMITIVE_TOPOLOGY_LINE_STRIP = VkPrimitiveTopology.VK_PRIMITIVE_TOPOLOGY_LINE_STRIP,
	VK_PRIMITIVE_TOPOLOGY_TRIANGLE_LIST = VkPrimitiveTopology.VK_PRIMITIVE_TOPOLOGY_TRIANGLE_LIST,
	VK_PRIMITIVE_TOPOLOGY_TRIANGLE_STRIP = VkPrimitiveTopology.VK_PRIMITIVE_TOPOLOGY_TRIANGLE_STRIP,
	VK_PRIMITIVE_TOPOLOGY_TRIANGLE_FAN = VkPrimitiveTopology.VK_PRIMITIVE_TOPOLOGY_TRIANGLE_FAN,
	VK_PRIMITIVE_TOPOLOGY_LINE_LIST_WITH_ADJACENCY = VkPrimitiveTopology.VK_PRIMITIVE_TOPOLOGY_LINE_LIST_WITH_ADJACENCY,
	VK_PRIMITIVE_TOPOLOGY_LINE_STRIP_WITH_ADJACENCY = VkPrimitiveTopology.VK_PRIMITIVE_TOPOLOGY_LINE_STRIP_WITH_ADJACENCY,
	VK_PRIMITIVE_TOPOLOGY_TRIANGLE_LIST_WITH_ADJACENCY = VkPrimitiveTopology.VK_PRIMITIVE_TOPOLOGY_TRIANGLE_LIST_WITH_ADJACENCY,
	VK_PRIMITIVE_TOPOLOGY_TRIANGLE_STRIP_WITH_ADJACENCY = VkPrimitiveTopology.VK_PRIMITIVE_TOPOLOGY_TRIANGLE_STRIP_WITH_ADJACENCY,
	VK_PRIMITIVE_TOPOLOGY_PATCH_LIST = VkPrimitiveTopology.VK_PRIMITIVE_TOPOLOGY_PATCH_LIST,
	VK_PRIMITIVE_TOPOLOGY_MAX_ENUM = VkPrimitiveTopology.VK_PRIMITIVE_TOPOLOGY_MAX_ENUM,
}
enum VkProvokingVertexModeEXT {
	VK_PROVOKING_VERTEX_MODE_FIRST_VERTEX_EXT = 0,
	VK_PROVOKING_VERTEX_MODE_LAST_VERTEX_EXT = 1,
	VK_PROVOKING_VERTEX_MODE_MAX_ENUM_EXT = 0x7FFFFFFF,
}
enum : VkProvokingVertexModeEXT {
	VK_PROVOKING_VERTEX_MODE_FIRST_VERTEX_EXT = VkProvokingVertexModeEXT.VK_PROVOKING_VERTEX_MODE_FIRST_VERTEX_EXT,
	VK_PROVOKING_VERTEX_MODE_LAST_VERTEX_EXT = VkProvokingVertexModeEXT.VK_PROVOKING_VERTEX_MODE_LAST_VERTEX_EXT,
	VK_PROVOKING_VERTEX_MODE_MAX_ENUM_EXT = VkProvokingVertexModeEXT.VK_PROVOKING_VERTEX_MODE_MAX_ENUM_EXT,
}
enum VkQueryControlFlagBits {
	VK_QUERY_CONTROL_PRECISE_BIT = 0x00000001,
	VK_QUERY_CONTROL_FLAG_BITS_MAX_ENUM = 0x7FFFFFFF,
}
enum : VkQueryControlFlagBits {
	VK_QUERY_CONTROL_PRECISE_BIT = VkQueryControlFlagBits.VK_QUERY_CONTROL_PRECISE_BIT,
	VK_QUERY_CONTROL_FLAG_BITS_MAX_ENUM = VkQueryControlFlagBits.VK_QUERY_CONTROL_FLAG_BITS_MAX_ENUM,
}
enum VkQueryPipelineStatisticFlagBits {
	VK_QUERY_PIPELINE_STATISTIC_INPUT_ASSEMBLY_VERTICES_BIT = 0x00000001,
	VK_QUERY_PIPELINE_STATISTIC_INPUT_ASSEMBLY_PRIMITIVES_BIT = 0x00000002,
	VK_QUERY_PIPELINE_STATISTIC_VERTEX_SHADER_INVOCATIONS_BIT = 0x00000004,
	VK_QUERY_PIPELINE_STATISTIC_GEOMETRY_SHADER_INVOCATIONS_BIT = 0x00000008,
	VK_QUERY_PIPELINE_STATISTIC_GEOMETRY_SHADER_PRIMITIVES_BIT = 0x00000010,
	VK_QUERY_PIPELINE_STATISTIC_CLIPPING_INVOCATIONS_BIT = 0x00000020,
	VK_QUERY_PIPELINE_STATISTIC_CLIPPING_PRIMITIVES_BIT = 0x00000040,
	VK_QUERY_PIPELINE_STATISTIC_FRAGMENT_SHADER_INVOCATIONS_BIT = 0x00000080,
	VK_QUERY_PIPELINE_STATISTIC_TESSELLATION_CONTROL_SHADER_PATCHES_BIT = 0x00000100,
	VK_QUERY_PIPELINE_STATISTIC_TESSELLATION_EVALUATION_SHADER_INVOCATIONS_BIT = 0x00000200,
	VK_QUERY_PIPELINE_STATISTIC_COMPUTE_SHADER_INVOCATIONS_BIT = 0x00000400,
	VK_QUERY_PIPELINE_STATISTIC_FLAG_BITS_MAX_ENUM = 0x7FFFFFFF,
}
enum : VkQueryPipelineStatisticFlagBits {
	VK_QUERY_PIPELINE_STATISTIC_INPUT_ASSEMBLY_VERTICES_BIT = VkQueryPipelineStatisticFlagBits.VK_QUERY_PIPELINE_STATISTIC_INPUT_ASSEMBLY_VERTICES_BIT,
	VK_QUERY_PIPELINE_STATISTIC_INPUT_ASSEMBLY_PRIMITIVES_BIT = VkQueryPipelineStatisticFlagBits.VK_QUERY_PIPELINE_STATISTIC_INPUT_ASSEMBLY_PRIMITIVES_BIT,
	VK_QUERY_PIPELINE_STATISTIC_VERTEX_SHADER_INVOCATIONS_BIT = VkQueryPipelineStatisticFlagBits.VK_QUERY_PIPELINE_STATISTIC_VERTEX_SHADER_INVOCATIONS_BIT,
	VK_QUERY_PIPELINE_STATISTIC_GEOMETRY_SHADER_INVOCATIONS_BIT = VkQueryPipelineStatisticFlagBits.VK_QUERY_PIPELINE_STATISTIC_GEOMETRY_SHADER_INVOCATIONS_BIT,
	VK_QUERY_PIPELINE_STATISTIC_GEOMETRY_SHADER_PRIMITIVES_BIT = VkQueryPipelineStatisticFlagBits.VK_QUERY_PIPELINE_STATISTIC_GEOMETRY_SHADER_PRIMITIVES_BIT,
	VK_QUERY_PIPELINE_STATISTIC_CLIPPING_INVOCATIONS_BIT = VkQueryPipelineStatisticFlagBits.VK_QUERY_PIPELINE_STATISTIC_CLIPPING_INVOCATIONS_BIT,
	VK_QUERY_PIPELINE_STATISTIC_CLIPPING_PRIMITIVES_BIT = VkQueryPipelineStatisticFlagBits.VK_QUERY_PIPELINE_STATISTIC_CLIPPING_PRIMITIVES_BIT,
	VK_QUERY_PIPELINE_STATISTIC_FRAGMENT_SHADER_INVOCATIONS_BIT = VkQueryPipelineStatisticFlagBits.VK_QUERY_PIPELINE_STATISTIC_FRAGMENT_SHADER_INVOCATIONS_BIT,
	VK_QUERY_PIPELINE_STATISTIC_TESSELLATION_CONTROL_SHADER_PATCHES_BIT = VkQueryPipelineStatisticFlagBits.VK_QUERY_PIPELINE_STATISTIC_TESSELLATION_CONTROL_SHADER_PATCHES_BIT,
	VK_QUERY_PIPELINE_STATISTIC_TESSELLATION_EVALUATION_SHADER_INVOCATIONS_BIT = VkQueryPipelineStatisticFlagBits.VK_QUERY_PIPELINE_STATISTIC_TESSELLATION_EVALUATION_SHADER_INVOCATIONS_BIT,
	VK_QUERY_PIPELINE_STATISTIC_COMPUTE_SHADER_INVOCATIONS_BIT = VkQueryPipelineStatisticFlagBits.VK_QUERY_PIPELINE_STATISTIC_COMPUTE_SHADER_INVOCATIONS_BIT,
	VK_QUERY_PIPELINE_STATISTIC_FLAG_BITS_MAX_ENUM = VkQueryPipelineStatisticFlagBits.VK_QUERY_PIPELINE_STATISTIC_FLAG_BITS_MAX_ENUM,
}
enum VkQueryPoolSamplingModeINTEL {
	VK_QUERY_POOL_SAMPLING_MODE_MANUAL_INTEL = 0,
	VK_QUERY_POOL_SAMPLING_MODE_MAX_ENUM_INTEL = 0x7FFFFFFF,
}
enum : VkQueryPoolSamplingModeINTEL {
	VK_QUERY_POOL_SAMPLING_MODE_MANUAL_INTEL = VkQueryPoolSamplingModeINTEL.VK_QUERY_POOL_SAMPLING_MODE_MANUAL_INTEL,
	VK_QUERY_POOL_SAMPLING_MODE_MAX_ENUM_INTEL = VkQueryPoolSamplingModeINTEL.VK_QUERY_POOL_SAMPLING_MODE_MAX_ENUM_INTEL,
}
enum VkQueryResultFlagBits {
	VK_QUERY_RESULT_64_BIT = 0x00000001,
	VK_QUERY_RESULT_WAIT_BIT = 0x00000002,
	VK_QUERY_RESULT_WITH_AVAILABILITY_BIT = 0x00000004,
	VK_QUERY_RESULT_PARTIAL_BIT = 0x00000008,
	VK_QUERY_RESULT_FLAG_BITS_MAX_ENUM = 0x7FFFFFFF,
}
enum : VkQueryResultFlagBits {
	VK_QUERY_RESULT_64_BIT = VkQueryResultFlagBits.VK_QUERY_RESULT_64_BIT,
	VK_QUERY_RESULT_WAIT_BIT = VkQueryResultFlagBits.VK_QUERY_RESULT_WAIT_BIT,
	VK_QUERY_RESULT_WITH_AVAILABILITY_BIT = VkQueryResultFlagBits.VK_QUERY_RESULT_WITH_AVAILABILITY_BIT,
	VK_QUERY_RESULT_PARTIAL_BIT = VkQueryResultFlagBits.VK_QUERY_RESULT_PARTIAL_BIT,
	VK_QUERY_RESULT_FLAG_BITS_MAX_ENUM = VkQueryResultFlagBits.VK_QUERY_RESULT_FLAG_BITS_MAX_ENUM,
}
enum VkQueryType {
	VK_QUERY_TYPE_OCCLUSION = 0,
	VK_QUERY_TYPE_PIPELINE_STATISTICS = 1,
	VK_QUERY_TYPE_TIMESTAMP = 2,
	VK_QUERY_TYPE_TRANSFORM_FEEDBACK_STREAM_EXT = 1000028004,
	VK_QUERY_TYPE_PERFORMANCE_QUERY_KHR = 1000116000,
	VK_QUERY_TYPE_ACCELERATION_STRUCTURE_COMPACTED_SIZE_KHR = 1000150000,
	VK_QUERY_TYPE_ACCELERATION_STRUCTURE_SERIALIZATION_SIZE_KHR = 1000150001,
	VK_QUERY_TYPE_ACCELERATION_STRUCTURE_COMPACTED_SIZE_NV = 1000165000,
	VK_QUERY_TYPE_PERFORMANCE_QUERY_INTEL = 1000210000,
	VK_QUERY_TYPE_PRIMITIVES_GENERATED_EXT = 1000382000,
	VK_QUERY_TYPE_MAX_ENUM = 0x7FFFFFFF,
}
enum : VkQueryType {
	VK_QUERY_TYPE_OCCLUSION = VkQueryType.VK_QUERY_TYPE_OCCLUSION,
	VK_QUERY_TYPE_PIPELINE_STATISTICS = VkQueryType.VK_QUERY_TYPE_PIPELINE_STATISTICS,
	VK_QUERY_TYPE_TIMESTAMP = VkQueryType.VK_QUERY_TYPE_TIMESTAMP,
	VK_QUERY_TYPE_TRANSFORM_FEEDBACK_STREAM_EXT = VkQueryType.VK_QUERY_TYPE_TRANSFORM_FEEDBACK_STREAM_EXT,
	VK_QUERY_TYPE_PERFORMANCE_QUERY_KHR = VkQueryType.VK_QUERY_TYPE_PERFORMANCE_QUERY_KHR,
	VK_QUERY_TYPE_ACCELERATION_STRUCTURE_COMPACTED_SIZE_KHR = VkQueryType.VK_QUERY_TYPE_ACCELERATION_STRUCTURE_COMPACTED_SIZE_KHR,
	VK_QUERY_TYPE_ACCELERATION_STRUCTURE_SERIALIZATION_SIZE_KHR = VkQueryType.VK_QUERY_TYPE_ACCELERATION_STRUCTURE_SERIALIZATION_SIZE_KHR,
	VK_QUERY_TYPE_ACCELERATION_STRUCTURE_COMPACTED_SIZE_NV = VkQueryType.VK_QUERY_TYPE_ACCELERATION_STRUCTURE_COMPACTED_SIZE_NV,
	VK_QUERY_TYPE_PERFORMANCE_QUERY_INTEL = VkQueryType.VK_QUERY_TYPE_PERFORMANCE_QUERY_INTEL,
	VK_QUERY_TYPE_PRIMITIVES_GENERATED_EXT = VkQueryType.VK_QUERY_TYPE_PRIMITIVES_GENERATED_EXT,
	VK_QUERY_TYPE_MAX_ENUM = VkQueryType.VK_QUERY_TYPE_MAX_ENUM,
}
enum VkQueueFlagBits {
	VK_QUEUE_GRAPHICS_BIT = 0x00000001,
	VK_QUEUE_COMPUTE_BIT = 0x00000002,
	VK_QUEUE_TRANSFER_BIT = 0x00000004,
	VK_QUEUE_SPARSE_BINDING_BIT = 0x00000008,
	VK_QUEUE_PROTECTED_BIT = 0x00000010,
	VK_QUEUE_FLAG_BITS_MAX_ENUM = 0x7FFFFFFF,
}
enum : VkQueueFlagBits {
	VK_QUEUE_GRAPHICS_BIT = VkQueueFlagBits.VK_QUEUE_GRAPHICS_BIT,
	VK_QUEUE_COMPUTE_BIT = VkQueueFlagBits.VK_QUEUE_COMPUTE_BIT,
	VK_QUEUE_TRANSFER_BIT = VkQueueFlagBits.VK_QUEUE_TRANSFER_BIT,
	VK_QUEUE_SPARSE_BINDING_BIT = VkQueueFlagBits.VK_QUEUE_SPARSE_BINDING_BIT,
	VK_QUEUE_PROTECTED_BIT = VkQueueFlagBits.VK_QUEUE_PROTECTED_BIT,
	VK_QUEUE_FLAG_BITS_MAX_ENUM = VkQueueFlagBits.VK_QUEUE_FLAG_BITS_MAX_ENUM,
}
enum VkQueueGlobalPriorityKHR {
	VK_QUEUE_GLOBAL_PRIORITY_LOW_KHR = 128,
	VK_QUEUE_GLOBAL_PRIORITY_MEDIUM_KHR = 256,
	VK_QUEUE_GLOBAL_PRIORITY_HIGH_KHR = 512,
	VK_QUEUE_GLOBAL_PRIORITY_REALTIME_KHR = 1024,
	VK_QUEUE_GLOBAL_PRIORITY_LOW_EXT = VK_QUEUE_GLOBAL_PRIORITY_LOW_KHR,
	VK_QUEUE_GLOBAL_PRIORITY_MEDIUM_EXT = VK_QUEUE_GLOBAL_PRIORITY_MEDIUM_KHR,
	VK_QUEUE_GLOBAL_PRIORITY_HIGH_EXT = VK_QUEUE_GLOBAL_PRIORITY_HIGH_KHR,
	VK_QUEUE_GLOBAL_PRIORITY_REALTIME_EXT = VK_QUEUE_GLOBAL_PRIORITY_REALTIME_KHR,
	VK_QUEUE_GLOBAL_PRIORITY_MAX_ENUM_KHR = 0x7FFFFFFF,
}
enum : VkQueueGlobalPriorityKHR {
	VK_QUEUE_GLOBAL_PRIORITY_LOW_KHR = VkQueueGlobalPriorityKHR.VK_QUEUE_GLOBAL_PRIORITY_LOW_KHR,
	VK_QUEUE_GLOBAL_PRIORITY_MEDIUM_KHR = VkQueueGlobalPriorityKHR.VK_QUEUE_GLOBAL_PRIORITY_MEDIUM_KHR,
	VK_QUEUE_GLOBAL_PRIORITY_HIGH_KHR = VkQueueGlobalPriorityKHR.VK_QUEUE_GLOBAL_PRIORITY_HIGH_KHR,
	VK_QUEUE_GLOBAL_PRIORITY_REALTIME_KHR = VkQueueGlobalPriorityKHR.VK_QUEUE_GLOBAL_PRIORITY_REALTIME_KHR,
	VK_QUEUE_GLOBAL_PRIORITY_LOW_EXT = VkQueueGlobalPriorityKHR.VK_QUEUE_GLOBAL_PRIORITY_LOW_EXT,
	VK_QUEUE_GLOBAL_PRIORITY_MEDIUM_EXT = VkQueueGlobalPriorityKHR.VK_QUEUE_GLOBAL_PRIORITY_MEDIUM_EXT,
	VK_QUEUE_GLOBAL_PRIORITY_HIGH_EXT = VkQueueGlobalPriorityKHR.VK_QUEUE_GLOBAL_PRIORITY_HIGH_EXT,
	VK_QUEUE_GLOBAL_PRIORITY_REALTIME_EXT = VkQueueGlobalPriorityKHR.VK_QUEUE_GLOBAL_PRIORITY_REALTIME_EXT,
	VK_QUEUE_GLOBAL_PRIORITY_MAX_ENUM_KHR = VkQueueGlobalPriorityKHR.VK_QUEUE_GLOBAL_PRIORITY_MAX_ENUM_KHR,
}
enum VkRasterizationOrderAMD {
	VK_RASTERIZATION_ORDER_STRICT_AMD = 0,
	VK_RASTERIZATION_ORDER_RELAXED_AMD = 1,
	VK_RASTERIZATION_ORDER_MAX_ENUM_AMD = 0x7FFFFFFF,
}
enum : VkRasterizationOrderAMD {
	VK_RASTERIZATION_ORDER_STRICT_AMD = VkRasterizationOrderAMD.VK_RASTERIZATION_ORDER_STRICT_AMD,
	VK_RASTERIZATION_ORDER_RELAXED_AMD = VkRasterizationOrderAMD.VK_RASTERIZATION_ORDER_RELAXED_AMD,
	VK_RASTERIZATION_ORDER_MAX_ENUM_AMD = VkRasterizationOrderAMD.VK_RASTERIZATION_ORDER_MAX_ENUM_AMD,
}
enum VkRayTracingShaderGroupTypeKHR {
	VK_RAY_TRACING_SHADER_GROUP_TYPE_GENERAL_KHR = 0,
	VK_RAY_TRACING_SHADER_GROUP_TYPE_TRIANGLES_HIT_GROUP_KHR = 1,
	VK_RAY_TRACING_SHADER_GROUP_TYPE_PROCEDURAL_HIT_GROUP_KHR = 2,
	VK_RAY_TRACING_SHADER_GROUP_TYPE_GENERAL_NV = VK_RAY_TRACING_SHADER_GROUP_TYPE_GENERAL_KHR,
	VK_RAY_TRACING_SHADER_GROUP_TYPE_TRIANGLES_HIT_GROUP_NV = VK_RAY_TRACING_SHADER_GROUP_TYPE_TRIANGLES_HIT_GROUP_KHR,
	VK_RAY_TRACING_SHADER_GROUP_TYPE_PROCEDURAL_HIT_GROUP_NV = VK_RAY_TRACING_SHADER_GROUP_TYPE_PROCEDURAL_HIT_GROUP_KHR,
	VK_RAY_TRACING_SHADER_GROUP_TYPE_MAX_ENUM_KHR = 0x7FFFFFFF,
}
enum : VkRayTracingShaderGroupTypeKHR {
	VK_RAY_TRACING_SHADER_GROUP_TYPE_GENERAL_KHR = VkRayTracingShaderGroupTypeKHR.VK_RAY_TRACING_SHADER_GROUP_TYPE_GENERAL_KHR,
	VK_RAY_TRACING_SHADER_GROUP_TYPE_TRIANGLES_HIT_GROUP_KHR = VkRayTracingShaderGroupTypeKHR.VK_RAY_TRACING_SHADER_GROUP_TYPE_TRIANGLES_HIT_GROUP_KHR,
	VK_RAY_TRACING_SHADER_GROUP_TYPE_PROCEDURAL_HIT_GROUP_KHR = VkRayTracingShaderGroupTypeKHR.VK_RAY_TRACING_SHADER_GROUP_TYPE_PROCEDURAL_HIT_GROUP_KHR,
	VK_RAY_TRACING_SHADER_GROUP_TYPE_GENERAL_NV = VkRayTracingShaderGroupTypeKHR.VK_RAY_TRACING_SHADER_GROUP_TYPE_GENERAL_NV,
	VK_RAY_TRACING_SHADER_GROUP_TYPE_TRIANGLES_HIT_GROUP_NV = VkRayTracingShaderGroupTypeKHR.VK_RAY_TRACING_SHADER_GROUP_TYPE_TRIANGLES_HIT_GROUP_NV,
	VK_RAY_TRACING_SHADER_GROUP_TYPE_PROCEDURAL_HIT_GROUP_NV = VkRayTracingShaderGroupTypeKHR.VK_RAY_TRACING_SHADER_GROUP_TYPE_PROCEDURAL_HIT_GROUP_NV,
	VK_RAY_TRACING_SHADER_GROUP_TYPE_MAX_ENUM_KHR = VkRayTracingShaderGroupTypeKHR.VK_RAY_TRACING_SHADER_GROUP_TYPE_MAX_ENUM_KHR,
}
enum VkRenderPassCreateFlagBits {
	VK_RENDER_PASS_CREATE_TRANSFORM_BIT_QCOM = 0x00000002,
	VK_RENDER_PASS_CREATE_FLAG_BITS_MAX_ENUM = 0x7FFFFFFF,
}
enum : VkRenderPassCreateFlagBits {
	VK_RENDER_PASS_CREATE_TRANSFORM_BIT_QCOM = VkRenderPassCreateFlagBits.VK_RENDER_PASS_CREATE_TRANSFORM_BIT_QCOM,
	VK_RENDER_PASS_CREATE_FLAG_BITS_MAX_ENUM = VkRenderPassCreateFlagBits.VK_RENDER_PASS_CREATE_FLAG_BITS_MAX_ENUM,
}
enum VkRenderingFlagBits {
	VK_RENDERING_CONTENTS_SECONDARY_COMMAND_BUFFERS_BIT = 0x00000001,
	VK_RENDERING_SUSPENDING_BIT = 0x00000002,
	VK_RENDERING_RESUMING_BIT = 0x00000004,
	VK_RENDERING_CONTENTS_SECONDARY_COMMAND_BUFFERS_BIT_KHR = VK_RENDERING_CONTENTS_SECONDARY_COMMAND_BUFFERS_BIT,
	VK_RENDERING_SUSPENDING_BIT_KHR = VK_RENDERING_SUSPENDING_BIT,
	VK_RENDERING_RESUMING_BIT_KHR = VK_RENDERING_RESUMING_BIT,
	VK_RENDERING_FLAG_BITS_MAX_ENUM = 0x7FFFFFFF,
}
enum : VkRenderingFlagBits {
	VK_RENDERING_CONTENTS_SECONDARY_COMMAND_BUFFERS_BIT = VkRenderingFlagBits.VK_RENDERING_CONTENTS_SECONDARY_COMMAND_BUFFERS_BIT,
	VK_RENDERING_SUSPENDING_BIT = VkRenderingFlagBits.VK_RENDERING_SUSPENDING_BIT,
	VK_RENDERING_RESUMING_BIT = VkRenderingFlagBits.VK_RENDERING_RESUMING_BIT,
	VK_RENDERING_CONTENTS_SECONDARY_COMMAND_BUFFERS_BIT_KHR = VkRenderingFlagBits.VK_RENDERING_CONTENTS_SECONDARY_COMMAND_BUFFERS_BIT_KHR,
	VK_RENDERING_SUSPENDING_BIT_KHR = VkRenderingFlagBits.VK_RENDERING_SUSPENDING_BIT_KHR,
	VK_RENDERING_RESUMING_BIT_KHR = VkRenderingFlagBits.VK_RENDERING_RESUMING_BIT_KHR,
	VK_RENDERING_FLAG_BITS_MAX_ENUM = VkRenderingFlagBits.VK_RENDERING_FLAG_BITS_MAX_ENUM,
}
enum VkResolveModeFlagBits {
	VK_RESOLVE_MODE_NONE = 0,
	VK_RESOLVE_MODE_SAMPLE_ZERO_BIT = 0x00000001,
	VK_RESOLVE_MODE_AVERAGE_BIT = 0x00000002,
	VK_RESOLVE_MODE_MIN_BIT = 0x00000004,
	VK_RESOLVE_MODE_MAX_BIT = 0x00000008,
	VK_RESOLVE_MODE_NONE_KHR = VK_RESOLVE_MODE_NONE,
	VK_RESOLVE_MODE_SAMPLE_ZERO_BIT_KHR = VK_RESOLVE_MODE_SAMPLE_ZERO_BIT,
	VK_RESOLVE_MODE_AVERAGE_BIT_KHR = VK_RESOLVE_MODE_AVERAGE_BIT,
	VK_RESOLVE_MODE_MIN_BIT_KHR = VK_RESOLVE_MODE_MIN_BIT,
	VK_RESOLVE_MODE_MAX_BIT_KHR = VK_RESOLVE_MODE_MAX_BIT,
	VK_RESOLVE_MODE_FLAG_BITS_MAX_ENUM = 0x7FFFFFFF,
}
enum : VkResolveModeFlagBits {
	VK_RESOLVE_MODE_NONE = VkResolveModeFlagBits.VK_RESOLVE_MODE_NONE,
	VK_RESOLVE_MODE_SAMPLE_ZERO_BIT = VkResolveModeFlagBits.VK_RESOLVE_MODE_SAMPLE_ZERO_BIT,
	VK_RESOLVE_MODE_AVERAGE_BIT = VkResolveModeFlagBits.VK_RESOLVE_MODE_AVERAGE_BIT,
	VK_RESOLVE_MODE_MIN_BIT = VkResolveModeFlagBits.VK_RESOLVE_MODE_MIN_BIT,
	VK_RESOLVE_MODE_MAX_BIT = VkResolveModeFlagBits.VK_RESOLVE_MODE_MAX_BIT,
	VK_RESOLVE_MODE_NONE_KHR = VkResolveModeFlagBits.VK_RESOLVE_MODE_NONE_KHR,
	VK_RESOLVE_MODE_SAMPLE_ZERO_BIT_KHR = VkResolveModeFlagBits.VK_RESOLVE_MODE_SAMPLE_ZERO_BIT_KHR,
	VK_RESOLVE_MODE_AVERAGE_BIT_KHR = VkResolveModeFlagBits.VK_RESOLVE_MODE_AVERAGE_BIT_KHR,
	VK_RESOLVE_MODE_MIN_BIT_KHR = VkResolveModeFlagBits.VK_RESOLVE_MODE_MIN_BIT_KHR,
	VK_RESOLVE_MODE_MAX_BIT_KHR = VkResolveModeFlagBits.VK_RESOLVE_MODE_MAX_BIT_KHR,
	VK_RESOLVE_MODE_FLAG_BITS_MAX_ENUM = VkResolveModeFlagBits.VK_RESOLVE_MODE_FLAG_BITS_MAX_ENUM,
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
	VK_PIPELINE_COMPILE_REQUIRED = 1000297000,
	VK_ERROR_SURFACE_LOST_KHR = -1000000000,
	VK_ERROR_NATIVE_WINDOW_IN_USE_KHR = -1000000001,
	VK_SUBOPTIMAL_KHR = 1000001003,
	VK_ERROR_OUT_OF_DATE_KHR = -1000001004,
	VK_ERROR_INCOMPATIBLE_DISPLAY_KHR = -1000003001,
	VK_ERROR_VALIDATION_FAILED_EXT = -1000011001,
	VK_ERROR_INVALID_SHADER_NV = -1000012000,
	VK_ERROR_INVALID_DRM_FORMAT_MODIFIER_PLANE_LAYOUT_EXT = -1000158000,
	VK_ERROR_NOT_PERMITTED_KHR = -1000174001,
	VK_ERROR_FULL_SCREEN_EXCLUSIVE_MODE_LOST_EXT = -1000255000,
	VK_THREAD_IDLE_KHR = 1000268000,
	VK_THREAD_DONE_KHR = 1000268001,
	VK_OPERATION_DEFERRED_KHR = 1000268002,
	VK_OPERATION_NOT_DEFERRED_KHR = 1000268003,
	VK_ERROR_OUT_OF_POOL_MEMORY_KHR = VK_ERROR_OUT_OF_POOL_MEMORY,
	VK_ERROR_INVALID_EXTERNAL_HANDLE_KHR = VK_ERROR_INVALID_EXTERNAL_HANDLE,
	VK_ERROR_FRAGMENTATION_EXT = VK_ERROR_FRAGMENTATION,
	VK_ERROR_NOT_PERMITTED_EXT = VK_ERROR_NOT_PERMITTED_KHR,
	VK_ERROR_INVALID_DEVICE_ADDRESS_EXT = VK_ERROR_INVALID_OPAQUE_CAPTURE_ADDRESS,
	VK_ERROR_INVALID_OPAQUE_CAPTURE_ADDRESS_KHR = VK_ERROR_INVALID_OPAQUE_CAPTURE_ADDRESS,
	VK_PIPELINE_COMPILE_REQUIRED_EXT = VK_PIPELINE_COMPILE_REQUIRED,
	VK_ERROR_PIPELINE_COMPILE_REQUIRED_EXT = VK_PIPELINE_COMPILE_REQUIRED,
	VK_RESULT_MAX_ENUM = 0x7FFFFFFF,
}
enum : VkResult {
	VK_SUCCESS = VkResult.VK_SUCCESS,
	VK_NOT_READY = VkResult.VK_NOT_READY,
	VK_TIMEOUT = VkResult.VK_TIMEOUT,
	VK_EVENT_SET = VkResult.VK_EVENT_SET,
	VK_EVENT_RESET = VkResult.VK_EVENT_RESET,
	VK_INCOMPLETE = VkResult.VK_INCOMPLETE,
	VK_ERROR_OUT_OF_HOST_MEMORY = VkResult.VK_ERROR_OUT_OF_HOST_MEMORY,
	VK_ERROR_OUT_OF_DEVICE_MEMORY = VkResult.VK_ERROR_OUT_OF_DEVICE_MEMORY,
	VK_ERROR_INITIALIZATION_FAILED = VkResult.VK_ERROR_INITIALIZATION_FAILED,
	VK_ERROR_DEVICE_LOST = VkResult.VK_ERROR_DEVICE_LOST,
	VK_ERROR_MEMORY_MAP_FAILED = VkResult.VK_ERROR_MEMORY_MAP_FAILED,
	VK_ERROR_LAYER_NOT_PRESENT = VkResult.VK_ERROR_LAYER_NOT_PRESENT,
	VK_ERROR_EXTENSION_NOT_PRESENT = VkResult.VK_ERROR_EXTENSION_NOT_PRESENT,
	VK_ERROR_FEATURE_NOT_PRESENT = VkResult.VK_ERROR_FEATURE_NOT_PRESENT,
	VK_ERROR_INCOMPATIBLE_DRIVER = VkResult.VK_ERROR_INCOMPATIBLE_DRIVER,
	VK_ERROR_TOO_MANY_OBJECTS = VkResult.VK_ERROR_TOO_MANY_OBJECTS,
	VK_ERROR_FORMAT_NOT_SUPPORTED = VkResult.VK_ERROR_FORMAT_NOT_SUPPORTED,
	VK_ERROR_FRAGMENTED_POOL = VkResult.VK_ERROR_FRAGMENTED_POOL,
	VK_ERROR_UNKNOWN = VkResult.VK_ERROR_UNKNOWN,
	VK_ERROR_OUT_OF_POOL_MEMORY = VkResult.VK_ERROR_OUT_OF_POOL_MEMORY,
	VK_ERROR_INVALID_EXTERNAL_HANDLE = VkResult.VK_ERROR_INVALID_EXTERNAL_HANDLE,
	VK_ERROR_FRAGMENTATION = VkResult.VK_ERROR_FRAGMENTATION,
	VK_ERROR_INVALID_OPAQUE_CAPTURE_ADDRESS = VkResult.VK_ERROR_INVALID_OPAQUE_CAPTURE_ADDRESS,
	VK_PIPELINE_COMPILE_REQUIRED = VkResult.VK_PIPELINE_COMPILE_REQUIRED,
	VK_ERROR_SURFACE_LOST_KHR = VkResult.VK_ERROR_SURFACE_LOST_KHR,
	VK_ERROR_NATIVE_WINDOW_IN_USE_KHR = VkResult.VK_ERROR_NATIVE_WINDOW_IN_USE_KHR,
	VK_SUBOPTIMAL_KHR = VkResult.VK_SUBOPTIMAL_KHR,
	VK_ERROR_OUT_OF_DATE_KHR = VkResult.VK_ERROR_OUT_OF_DATE_KHR,
	VK_ERROR_INCOMPATIBLE_DISPLAY_KHR = VkResult.VK_ERROR_INCOMPATIBLE_DISPLAY_KHR,
	VK_ERROR_VALIDATION_FAILED_EXT = VkResult.VK_ERROR_VALIDATION_FAILED_EXT,
	VK_ERROR_INVALID_SHADER_NV = VkResult.VK_ERROR_INVALID_SHADER_NV,
	VK_ERROR_INVALID_DRM_FORMAT_MODIFIER_PLANE_LAYOUT_EXT = VkResult.VK_ERROR_INVALID_DRM_FORMAT_MODIFIER_PLANE_LAYOUT_EXT,
	VK_ERROR_NOT_PERMITTED_KHR = VkResult.VK_ERROR_NOT_PERMITTED_KHR,
	VK_ERROR_FULL_SCREEN_EXCLUSIVE_MODE_LOST_EXT = VkResult.VK_ERROR_FULL_SCREEN_EXCLUSIVE_MODE_LOST_EXT,
	VK_THREAD_IDLE_KHR = VkResult.VK_THREAD_IDLE_KHR,
	VK_THREAD_DONE_KHR = VkResult.VK_THREAD_DONE_KHR,
	VK_OPERATION_DEFERRED_KHR = VkResult.VK_OPERATION_DEFERRED_KHR,
	VK_OPERATION_NOT_DEFERRED_KHR = VkResult.VK_OPERATION_NOT_DEFERRED_KHR,
	VK_ERROR_OUT_OF_POOL_MEMORY_KHR = VkResult.VK_ERROR_OUT_OF_POOL_MEMORY_KHR,
	VK_ERROR_INVALID_EXTERNAL_HANDLE_KHR = VkResult.VK_ERROR_INVALID_EXTERNAL_HANDLE_KHR,
	VK_ERROR_FRAGMENTATION_EXT = VkResult.VK_ERROR_FRAGMENTATION_EXT,
	VK_ERROR_NOT_PERMITTED_EXT = VkResult.VK_ERROR_NOT_PERMITTED_EXT,
	VK_ERROR_INVALID_DEVICE_ADDRESS_EXT = VkResult.VK_ERROR_INVALID_DEVICE_ADDRESS_EXT,
	VK_ERROR_INVALID_OPAQUE_CAPTURE_ADDRESS_KHR = VkResult.VK_ERROR_INVALID_OPAQUE_CAPTURE_ADDRESS_KHR,
	VK_PIPELINE_COMPILE_REQUIRED_EXT = VkResult.VK_PIPELINE_COMPILE_REQUIRED_EXT,
	VK_ERROR_PIPELINE_COMPILE_REQUIRED_EXT = VkResult.VK_ERROR_PIPELINE_COMPILE_REQUIRED_EXT,
	VK_RESULT_MAX_ENUM = VkResult.VK_RESULT_MAX_ENUM,
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
enum : VkSampleCountFlagBits {
	VK_SAMPLE_COUNT_1_BIT = VkSampleCountFlagBits.VK_SAMPLE_COUNT_1_BIT,
	VK_SAMPLE_COUNT_2_BIT = VkSampleCountFlagBits.VK_SAMPLE_COUNT_2_BIT,
	VK_SAMPLE_COUNT_4_BIT = VkSampleCountFlagBits.VK_SAMPLE_COUNT_4_BIT,
	VK_SAMPLE_COUNT_8_BIT = VkSampleCountFlagBits.VK_SAMPLE_COUNT_8_BIT,
	VK_SAMPLE_COUNT_16_BIT = VkSampleCountFlagBits.VK_SAMPLE_COUNT_16_BIT,
	VK_SAMPLE_COUNT_32_BIT = VkSampleCountFlagBits.VK_SAMPLE_COUNT_32_BIT,
	VK_SAMPLE_COUNT_64_BIT = VkSampleCountFlagBits.VK_SAMPLE_COUNT_64_BIT,
	VK_SAMPLE_COUNT_FLAG_BITS_MAX_ENUM = VkSampleCountFlagBits.VK_SAMPLE_COUNT_FLAG_BITS_MAX_ENUM,
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
enum : VkSamplerAddressMode {
	VK_SAMPLER_ADDRESS_MODE_REPEAT = VkSamplerAddressMode.VK_SAMPLER_ADDRESS_MODE_REPEAT,
	VK_SAMPLER_ADDRESS_MODE_MIRRORED_REPEAT = VkSamplerAddressMode.VK_SAMPLER_ADDRESS_MODE_MIRRORED_REPEAT,
	VK_SAMPLER_ADDRESS_MODE_CLAMP_TO_EDGE = VkSamplerAddressMode.VK_SAMPLER_ADDRESS_MODE_CLAMP_TO_EDGE,
	VK_SAMPLER_ADDRESS_MODE_CLAMP_TO_BORDER = VkSamplerAddressMode.VK_SAMPLER_ADDRESS_MODE_CLAMP_TO_BORDER,
	VK_SAMPLER_ADDRESS_MODE_MIRROR_CLAMP_TO_EDGE = VkSamplerAddressMode.VK_SAMPLER_ADDRESS_MODE_MIRROR_CLAMP_TO_EDGE,
	VK_SAMPLER_ADDRESS_MODE_MIRROR_CLAMP_TO_EDGE_KHR = VkSamplerAddressMode.VK_SAMPLER_ADDRESS_MODE_MIRROR_CLAMP_TO_EDGE_KHR,
	VK_SAMPLER_ADDRESS_MODE_MAX_ENUM = VkSamplerAddressMode.VK_SAMPLER_ADDRESS_MODE_MAX_ENUM,
}
enum VkSamplerCreateFlagBits {
	VK_SAMPLER_CREATE_SUBSAMPLED_BIT_EXT = 0x00000001,
	VK_SAMPLER_CREATE_SUBSAMPLED_COARSE_RECONSTRUCTION_BIT_EXT = 0x00000002,
	VK_SAMPLER_CREATE_FLAG_BITS_MAX_ENUM = 0x7FFFFFFF,
}
enum : VkSamplerCreateFlagBits {
	VK_SAMPLER_CREATE_SUBSAMPLED_BIT_EXT = VkSamplerCreateFlagBits.VK_SAMPLER_CREATE_SUBSAMPLED_BIT_EXT,
	VK_SAMPLER_CREATE_SUBSAMPLED_COARSE_RECONSTRUCTION_BIT_EXT = VkSamplerCreateFlagBits.VK_SAMPLER_CREATE_SUBSAMPLED_COARSE_RECONSTRUCTION_BIT_EXT,
	VK_SAMPLER_CREATE_FLAG_BITS_MAX_ENUM = VkSamplerCreateFlagBits.VK_SAMPLER_CREATE_FLAG_BITS_MAX_ENUM,
}
enum VkSamplerMipmapMode {
	VK_SAMPLER_MIPMAP_MODE_NEAREST = 0,
	VK_SAMPLER_MIPMAP_MODE_LINEAR = 1,
	VK_SAMPLER_MIPMAP_MODE_MAX_ENUM = 0x7FFFFFFF,
}
enum : VkSamplerMipmapMode {
	VK_SAMPLER_MIPMAP_MODE_NEAREST = VkSamplerMipmapMode.VK_SAMPLER_MIPMAP_MODE_NEAREST,
	VK_SAMPLER_MIPMAP_MODE_LINEAR = VkSamplerMipmapMode.VK_SAMPLER_MIPMAP_MODE_LINEAR,
	VK_SAMPLER_MIPMAP_MODE_MAX_ENUM = VkSamplerMipmapMode.VK_SAMPLER_MIPMAP_MODE_MAX_ENUM,
}
enum VkSamplerReductionMode {
	VK_SAMPLER_REDUCTION_MODE_WEIGHTED_AVERAGE = 0,
	VK_SAMPLER_REDUCTION_MODE_MIN = 1,
	VK_SAMPLER_REDUCTION_MODE_MAX = 2,
	VK_SAMPLER_REDUCTION_MODE_WEIGHTED_AVERAGE_EXT = VK_SAMPLER_REDUCTION_MODE_WEIGHTED_AVERAGE,
	VK_SAMPLER_REDUCTION_MODE_MIN_EXT = VK_SAMPLER_REDUCTION_MODE_MIN,
	VK_SAMPLER_REDUCTION_MODE_MAX_EXT = VK_SAMPLER_REDUCTION_MODE_MAX,
	VK_SAMPLER_REDUCTION_MODE_MAX_ENUM = 0x7FFFFFFF,
}
enum : VkSamplerReductionMode {
	VK_SAMPLER_REDUCTION_MODE_WEIGHTED_AVERAGE = VkSamplerReductionMode.VK_SAMPLER_REDUCTION_MODE_WEIGHTED_AVERAGE,
	VK_SAMPLER_REDUCTION_MODE_MIN = VkSamplerReductionMode.VK_SAMPLER_REDUCTION_MODE_MIN,
	VK_SAMPLER_REDUCTION_MODE_MAX = VkSamplerReductionMode.VK_SAMPLER_REDUCTION_MODE_MAX,
	VK_SAMPLER_REDUCTION_MODE_WEIGHTED_AVERAGE_EXT = VkSamplerReductionMode.VK_SAMPLER_REDUCTION_MODE_WEIGHTED_AVERAGE_EXT,
	VK_SAMPLER_REDUCTION_MODE_MIN_EXT = VkSamplerReductionMode.VK_SAMPLER_REDUCTION_MODE_MIN_EXT,
	VK_SAMPLER_REDUCTION_MODE_MAX_EXT = VkSamplerReductionMode.VK_SAMPLER_REDUCTION_MODE_MAX_EXT,
	VK_SAMPLER_REDUCTION_MODE_MAX_ENUM = VkSamplerReductionMode.VK_SAMPLER_REDUCTION_MODE_MAX_ENUM,
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
enum : VkSamplerYcbcrModelConversion {
	VK_SAMPLER_YCBCR_MODEL_CONVERSION_RGB_IDENTITY = VkSamplerYcbcrModelConversion.VK_SAMPLER_YCBCR_MODEL_CONVERSION_RGB_IDENTITY,
	VK_SAMPLER_YCBCR_MODEL_CONVERSION_YCBCR_IDENTITY = VkSamplerYcbcrModelConversion.VK_SAMPLER_YCBCR_MODEL_CONVERSION_YCBCR_IDENTITY,
	VK_SAMPLER_YCBCR_MODEL_CONVERSION_YCBCR_709 = VkSamplerYcbcrModelConversion.VK_SAMPLER_YCBCR_MODEL_CONVERSION_YCBCR_709,
	VK_SAMPLER_YCBCR_MODEL_CONVERSION_YCBCR_601 = VkSamplerYcbcrModelConversion.VK_SAMPLER_YCBCR_MODEL_CONVERSION_YCBCR_601,
	VK_SAMPLER_YCBCR_MODEL_CONVERSION_YCBCR_2020 = VkSamplerYcbcrModelConversion.VK_SAMPLER_YCBCR_MODEL_CONVERSION_YCBCR_2020,
	VK_SAMPLER_YCBCR_MODEL_CONVERSION_RGB_IDENTITY_KHR = VkSamplerYcbcrModelConversion.VK_SAMPLER_YCBCR_MODEL_CONVERSION_RGB_IDENTITY_KHR,
	VK_SAMPLER_YCBCR_MODEL_CONVERSION_YCBCR_IDENTITY_KHR = VkSamplerYcbcrModelConversion.VK_SAMPLER_YCBCR_MODEL_CONVERSION_YCBCR_IDENTITY_KHR,
	VK_SAMPLER_YCBCR_MODEL_CONVERSION_YCBCR_709_KHR = VkSamplerYcbcrModelConversion.VK_SAMPLER_YCBCR_MODEL_CONVERSION_YCBCR_709_KHR,
	VK_SAMPLER_YCBCR_MODEL_CONVERSION_YCBCR_601_KHR = VkSamplerYcbcrModelConversion.VK_SAMPLER_YCBCR_MODEL_CONVERSION_YCBCR_601_KHR,
	VK_SAMPLER_YCBCR_MODEL_CONVERSION_YCBCR_2020_KHR = VkSamplerYcbcrModelConversion.VK_SAMPLER_YCBCR_MODEL_CONVERSION_YCBCR_2020_KHR,
	VK_SAMPLER_YCBCR_MODEL_CONVERSION_MAX_ENUM = VkSamplerYcbcrModelConversion.VK_SAMPLER_YCBCR_MODEL_CONVERSION_MAX_ENUM,
}
enum VkSamplerYcbcrRange {
	VK_SAMPLER_YCBCR_RANGE_ITU_FULL = 0,
	VK_SAMPLER_YCBCR_RANGE_ITU_NARROW = 1,
	VK_SAMPLER_YCBCR_RANGE_ITU_FULL_KHR = VK_SAMPLER_YCBCR_RANGE_ITU_FULL,
	VK_SAMPLER_YCBCR_RANGE_ITU_NARROW_KHR = VK_SAMPLER_YCBCR_RANGE_ITU_NARROW,
	VK_SAMPLER_YCBCR_RANGE_MAX_ENUM = 0x7FFFFFFF,
}
enum : VkSamplerYcbcrRange {
	VK_SAMPLER_YCBCR_RANGE_ITU_FULL = VkSamplerYcbcrRange.VK_SAMPLER_YCBCR_RANGE_ITU_FULL,
	VK_SAMPLER_YCBCR_RANGE_ITU_NARROW = VkSamplerYcbcrRange.VK_SAMPLER_YCBCR_RANGE_ITU_NARROW,
	VK_SAMPLER_YCBCR_RANGE_ITU_FULL_KHR = VkSamplerYcbcrRange.VK_SAMPLER_YCBCR_RANGE_ITU_FULL_KHR,
	VK_SAMPLER_YCBCR_RANGE_ITU_NARROW_KHR = VkSamplerYcbcrRange.VK_SAMPLER_YCBCR_RANGE_ITU_NARROW_KHR,
	VK_SAMPLER_YCBCR_RANGE_MAX_ENUM = VkSamplerYcbcrRange.VK_SAMPLER_YCBCR_RANGE_MAX_ENUM,
}
enum VkScopeNV {
	VK_SCOPE_DEVICE_NV = 1,
	VK_SCOPE_WORKGROUP_NV = 2,
	VK_SCOPE_SUBGROUP_NV = 3,
	VK_SCOPE_QUEUE_FAMILY_NV = 5,
	VK_SCOPE_MAX_ENUM_NV = 0x7FFFFFFF,
}
enum : VkScopeNV {
	VK_SCOPE_DEVICE_NV = VkScopeNV.VK_SCOPE_DEVICE_NV,
	VK_SCOPE_WORKGROUP_NV = VkScopeNV.VK_SCOPE_WORKGROUP_NV,
	VK_SCOPE_SUBGROUP_NV = VkScopeNV.VK_SCOPE_SUBGROUP_NV,
	VK_SCOPE_QUEUE_FAMILY_NV = VkScopeNV.VK_SCOPE_QUEUE_FAMILY_NV,
	VK_SCOPE_MAX_ENUM_NV = VkScopeNV.VK_SCOPE_MAX_ENUM_NV,
}
enum VkSemaphoreImportFlagBits {
	VK_SEMAPHORE_IMPORT_TEMPORARY_BIT = 0x00000001,
	VK_SEMAPHORE_IMPORT_TEMPORARY_BIT_KHR = VK_SEMAPHORE_IMPORT_TEMPORARY_BIT,
	VK_SEMAPHORE_IMPORT_FLAG_BITS_MAX_ENUM = 0x7FFFFFFF,
}
enum : VkSemaphoreImportFlagBits {
	VK_SEMAPHORE_IMPORT_TEMPORARY_BIT = VkSemaphoreImportFlagBits.VK_SEMAPHORE_IMPORT_TEMPORARY_BIT,
	VK_SEMAPHORE_IMPORT_TEMPORARY_BIT_KHR = VkSemaphoreImportFlagBits.VK_SEMAPHORE_IMPORT_TEMPORARY_BIT_KHR,
	VK_SEMAPHORE_IMPORT_FLAG_BITS_MAX_ENUM = VkSemaphoreImportFlagBits.VK_SEMAPHORE_IMPORT_FLAG_BITS_MAX_ENUM,
}
enum VkSemaphoreType {
	VK_SEMAPHORE_TYPE_BINARY = 0,
	VK_SEMAPHORE_TYPE_TIMELINE = 1,
	VK_SEMAPHORE_TYPE_BINARY_KHR = VK_SEMAPHORE_TYPE_BINARY,
	VK_SEMAPHORE_TYPE_TIMELINE_KHR = VK_SEMAPHORE_TYPE_TIMELINE,
	VK_SEMAPHORE_TYPE_MAX_ENUM = 0x7FFFFFFF,
}
enum : VkSemaphoreType {
	VK_SEMAPHORE_TYPE_BINARY = VkSemaphoreType.VK_SEMAPHORE_TYPE_BINARY,
	VK_SEMAPHORE_TYPE_TIMELINE = VkSemaphoreType.VK_SEMAPHORE_TYPE_TIMELINE,
	VK_SEMAPHORE_TYPE_BINARY_KHR = VkSemaphoreType.VK_SEMAPHORE_TYPE_BINARY_KHR,
	VK_SEMAPHORE_TYPE_TIMELINE_KHR = VkSemaphoreType.VK_SEMAPHORE_TYPE_TIMELINE_KHR,
	VK_SEMAPHORE_TYPE_MAX_ENUM = VkSemaphoreType.VK_SEMAPHORE_TYPE_MAX_ENUM,
}
enum VkSemaphoreWaitFlagBits {
	VK_SEMAPHORE_WAIT_ANY_BIT = 0x00000001,
	VK_SEMAPHORE_WAIT_ANY_BIT_KHR = VK_SEMAPHORE_WAIT_ANY_BIT,
	VK_SEMAPHORE_WAIT_FLAG_BITS_MAX_ENUM = 0x7FFFFFFF,
}
enum : VkSemaphoreWaitFlagBits {
	VK_SEMAPHORE_WAIT_ANY_BIT = VkSemaphoreWaitFlagBits.VK_SEMAPHORE_WAIT_ANY_BIT,
	VK_SEMAPHORE_WAIT_ANY_BIT_KHR = VkSemaphoreWaitFlagBits.VK_SEMAPHORE_WAIT_ANY_BIT_KHR,
	VK_SEMAPHORE_WAIT_FLAG_BITS_MAX_ENUM = VkSemaphoreWaitFlagBits.VK_SEMAPHORE_WAIT_FLAG_BITS_MAX_ENUM,
}
enum VkShaderCorePropertiesFlagBitsAMD {
	VK_SHADER_CORE_PROPERTIES_FLAG_BITS_MAX_ENUM_AMD = 0x7FFFFFFF,
}
enum : VkShaderCorePropertiesFlagBitsAMD {
	VK_SHADER_CORE_PROPERTIES_FLAG_BITS_MAX_ENUM_AMD = VkShaderCorePropertiesFlagBitsAMD.VK_SHADER_CORE_PROPERTIES_FLAG_BITS_MAX_ENUM_AMD,
}
enum VkShaderFloatControlsIndependence {
	VK_SHADER_FLOAT_CONTROLS_INDEPENDENCE_32_BIT_ONLY = 0,
	VK_SHADER_FLOAT_CONTROLS_INDEPENDENCE_ALL = 1,
	VK_SHADER_FLOAT_CONTROLS_INDEPENDENCE_NONE = 2,
	VK_SHADER_FLOAT_CONTROLS_INDEPENDENCE_32_BIT_ONLY_KHR = VK_SHADER_FLOAT_CONTROLS_INDEPENDENCE_32_BIT_ONLY,
	VK_SHADER_FLOAT_CONTROLS_INDEPENDENCE_ALL_KHR = VK_SHADER_FLOAT_CONTROLS_INDEPENDENCE_ALL,
	VK_SHADER_FLOAT_CONTROLS_INDEPENDENCE_NONE_KHR = VK_SHADER_FLOAT_CONTROLS_INDEPENDENCE_NONE,
	VK_SHADER_FLOAT_CONTROLS_INDEPENDENCE_MAX_ENUM = 0x7FFFFFFF,
}
enum : VkShaderFloatControlsIndependence {
	VK_SHADER_FLOAT_CONTROLS_INDEPENDENCE_32_BIT_ONLY = VkShaderFloatControlsIndependence.VK_SHADER_FLOAT_CONTROLS_INDEPENDENCE_32_BIT_ONLY,
	VK_SHADER_FLOAT_CONTROLS_INDEPENDENCE_ALL = VkShaderFloatControlsIndependence.VK_SHADER_FLOAT_CONTROLS_INDEPENDENCE_ALL,
	VK_SHADER_FLOAT_CONTROLS_INDEPENDENCE_NONE = VkShaderFloatControlsIndependence.VK_SHADER_FLOAT_CONTROLS_INDEPENDENCE_NONE,
	VK_SHADER_FLOAT_CONTROLS_INDEPENDENCE_32_BIT_ONLY_KHR = VkShaderFloatControlsIndependence.VK_SHADER_FLOAT_CONTROLS_INDEPENDENCE_32_BIT_ONLY_KHR,
	VK_SHADER_FLOAT_CONTROLS_INDEPENDENCE_ALL_KHR = VkShaderFloatControlsIndependence.VK_SHADER_FLOAT_CONTROLS_INDEPENDENCE_ALL_KHR,
	VK_SHADER_FLOAT_CONTROLS_INDEPENDENCE_NONE_KHR = VkShaderFloatControlsIndependence.VK_SHADER_FLOAT_CONTROLS_INDEPENDENCE_NONE_KHR,
	VK_SHADER_FLOAT_CONTROLS_INDEPENDENCE_MAX_ENUM = VkShaderFloatControlsIndependence.VK_SHADER_FLOAT_CONTROLS_INDEPENDENCE_MAX_ENUM,
}
enum VkShaderGroupShaderKHR {
	VK_SHADER_GROUP_SHADER_GENERAL_KHR = 0,
	VK_SHADER_GROUP_SHADER_CLOSEST_HIT_KHR = 1,
	VK_SHADER_GROUP_SHADER_ANY_HIT_KHR = 2,
	VK_SHADER_GROUP_SHADER_INTERSECTION_KHR = 3,
	VK_SHADER_GROUP_SHADER_MAX_ENUM_KHR = 0x7FFFFFFF,
}
enum : VkShaderGroupShaderKHR {
	VK_SHADER_GROUP_SHADER_GENERAL_KHR = VkShaderGroupShaderKHR.VK_SHADER_GROUP_SHADER_GENERAL_KHR,
	VK_SHADER_GROUP_SHADER_CLOSEST_HIT_KHR = VkShaderGroupShaderKHR.VK_SHADER_GROUP_SHADER_CLOSEST_HIT_KHR,
	VK_SHADER_GROUP_SHADER_ANY_HIT_KHR = VkShaderGroupShaderKHR.VK_SHADER_GROUP_SHADER_ANY_HIT_KHR,
	VK_SHADER_GROUP_SHADER_INTERSECTION_KHR = VkShaderGroupShaderKHR.VK_SHADER_GROUP_SHADER_INTERSECTION_KHR,
	VK_SHADER_GROUP_SHADER_MAX_ENUM_KHR = VkShaderGroupShaderKHR.VK_SHADER_GROUP_SHADER_MAX_ENUM_KHR,
}
enum VkShaderInfoTypeAMD {
	VK_SHADER_INFO_TYPE_STATISTICS_AMD = 0,
	VK_SHADER_INFO_TYPE_BINARY_AMD = 1,
	VK_SHADER_INFO_TYPE_DISASSEMBLY_AMD = 2,
	VK_SHADER_INFO_TYPE_MAX_ENUM_AMD = 0x7FFFFFFF,
}
enum : VkShaderInfoTypeAMD {
	VK_SHADER_INFO_TYPE_STATISTICS_AMD = VkShaderInfoTypeAMD.VK_SHADER_INFO_TYPE_STATISTICS_AMD,
	VK_SHADER_INFO_TYPE_BINARY_AMD = VkShaderInfoTypeAMD.VK_SHADER_INFO_TYPE_BINARY_AMD,
	VK_SHADER_INFO_TYPE_DISASSEMBLY_AMD = VkShaderInfoTypeAMD.VK_SHADER_INFO_TYPE_DISASSEMBLY_AMD,
	VK_SHADER_INFO_TYPE_MAX_ENUM_AMD = VkShaderInfoTypeAMD.VK_SHADER_INFO_TYPE_MAX_ENUM_AMD,
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
	VK_SHADER_STAGE_SUBPASS_SHADING_BIT_HUAWEI = 0x00004000,
	VK_SHADER_STAGE_RAYGEN_BIT_NV = VK_SHADER_STAGE_RAYGEN_BIT_KHR,
	VK_SHADER_STAGE_ANY_HIT_BIT_NV = VK_SHADER_STAGE_ANY_HIT_BIT_KHR,
	VK_SHADER_STAGE_CLOSEST_HIT_BIT_NV = VK_SHADER_STAGE_CLOSEST_HIT_BIT_KHR,
	VK_SHADER_STAGE_MISS_BIT_NV = VK_SHADER_STAGE_MISS_BIT_KHR,
	VK_SHADER_STAGE_INTERSECTION_BIT_NV = VK_SHADER_STAGE_INTERSECTION_BIT_KHR,
	VK_SHADER_STAGE_CALLABLE_BIT_NV = VK_SHADER_STAGE_CALLABLE_BIT_KHR,
	VK_SHADER_STAGE_FLAG_BITS_MAX_ENUM = 0x7FFFFFFF,
}
enum : VkShaderStageFlagBits {
	VK_SHADER_STAGE_VERTEX_BIT = VkShaderStageFlagBits.VK_SHADER_STAGE_VERTEX_BIT,
	VK_SHADER_STAGE_TESSELLATION_CONTROL_BIT = VkShaderStageFlagBits.VK_SHADER_STAGE_TESSELLATION_CONTROL_BIT,
	VK_SHADER_STAGE_TESSELLATION_EVALUATION_BIT = VkShaderStageFlagBits.VK_SHADER_STAGE_TESSELLATION_EVALUATION_BIT,
	VK_SHADER_STAGE_GEOMETRY_BIT = VkShaderStageFlagBits.VK_SHADER_STAGE_GEOMETRY_BIT,
	VK_SHADER_STAGE_FRAGMENT_BIT = VkShaderStageFlagBits.VK_SHADER_STAGE_FRAGMENT_BIT,
	VK_SHADER_STAGE_COMPUTE_BIT = VkShaderStageFlagBits.VK_SHADER_STAGE_COMPUTE_BIT,
	VK_SHADER_STAGE_ALL_GRAPHICS = VkShaderStageFlagBits.VK_SHADER_STAGE_ALL_GRAPHICS,
	VK_SHADER_STAGE_ALL = VkShaderStageFlagBits.VK_SHADER_STAGE_ALL,
	VK_SHADER_STAGE_RAYGEN_BIT_KHR = VkShaderStageFlagBits.VK_SHADER_STAGE_RAYGEN_BIT_KHR,
	VK_SHADER_STAGE_ANY_HIT_BIT_KHR = VkShaderStageFlagBits.VK_SHADER_STAGE_ANY_HIT_BIT_KHR,
	VK_SHADER_STAGE_CLOSEST_HIT_BIT_KHR = VkShaderStageFlagBits.VK_SHADER_STAGE_CLOSEST_HIT_BIT_KHR,
	VK_SHADER_STAGE_MISS_BIT_KHR = VkShaderStageFlagBits.VK_SHADER_STAGE_MISS_BIT_KHR,
	VK_SHADER_STAGE_INTERSECTION_BIT_KHR = VkShaderStageFlagBits.VK_SHADER_STAGE_INTERSECTION_BIT_KHR,
	VK_SHADER_STAGE_CALLABLE_BIT_KHR = VkShaderStageFlagBits.VK_SHADER_STAGE_CALLABLE_BIT_KHR,
	VK_SHADER_STAGE_TASK_BIT_NV = VkShaderStageFlagBits.VK_SHADER_STAGE_TASK_BIT_NV,
	VK_SHADER_STAGE_MESH_BIT_NV = VkShaderStageFlagBits.VK_SHADER_STAGE_MESH_BIT_NV,
	VK_SHADER_STAGE_SUBPASS_SHADING_BIT_HUAWEI = VkShaderStageFlagBits.VK_SHADER_STAGE_SUBPASS_SHADING_BIT_HUAWEI,
	VK_SHADER_STAGE_RAYGEN_BIT_NV = VkShaderStageFlagBits.VK_SHADER_STAGE_RAYGEN_BIT_NV,
	VK_SHADER_STAGE_ANY_HIT_BIT_NV = VkShaderStageFlagBits.VK_SHADER_STAGE_ANY_HIT_BIT_NV,
	VK_SHADER_STAGE_CLOSEST_HIT_BIT_NV = VkShaderStageFlagBits.VK_SHADER_STAGE_CLOSEST_HIT_BIT_NV,
	VK_SHADER_STAGE_MISS_BIT_NV = VkShaderStageFlagBits.VK_SHADER_STAGE_MISS_BIT_NV,
	VK_SHADER_STAGE_INTERSECTION_BIT_NV = VkShaderStageFlagBits.VK_SHADER_STAGE_INTERSECTION_BIT_NV,
	VK_SHADER_STAGE_CALLABLE_BIT_NV = VkShaderStageFlagBits.VK_SHADER_STAGE_CALLABLE_BIT_NV,
	VK_SHADER_STAGE_FLAG_BITS_MAX_ENUM = VkShaderStageFlagBits.VK_SHADER_STAGE_FLAG_BITS_MAX_ENUM,
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
enum : VkShadingRatePaletteEntryNV {
	VK_SHADING_RATE_PALETTE_ENTRY_NO_INVOCATIONS_NV = VkShadingRatePaletteEntryNV.VK_SHADING_RATE_PALETTE_ENTRY_NO_INVOCATIONS_NV,
	VK_SHADING_RATE_PALETTE_ENTRY_16_INVOCATIONS_PER_PIXEL_NV = VkShadingRatePaletteEntryNV.VK_SHADING_RATE_PALETTE_ENTRY_16_INVOCATIONS_PER_PIXEL_NV,
	VK_SHADING_RATE_PALETTE_ENTRY_8_INVOCATIONS_PER_PIXEL_NV = VkShadingRatePaletteEntryNV.VK_SHADING_RATE_PALETTE_ENTRY_8_INVOCATIONS_PER_PIXEL_NV,
	VK_SHADING_RATE_PALETTE_ENTRY_4_INVOCATIONS_PER_PIXEL_NV = VkShadingRatePaletteEntryNV.VK_SHADING_RATE_PALETTE_ENTRY_4_INVOCATIONS_PER_PIXEL_NV,
	VK_SHADING_RATE_PALETTE_ENTRY_2_INVOCATIONS_PER_PIXEL_NV = VkShadingRatePaletteEntryNV.VK_SHADING_RATE_PALETTE_ENTRY_2_INVOCATIONS_PER_PIXEL_NV,
	VK_SHADING_RATE_PALETTE_ENTRY_1_INVOCATION_PER_PIXEL_NV = VkShadingRatePaletteEntryNV.VK_SHADING_RATE_PALETTE_ENTRY_1_INVOCATION_PER_PIXEL_NV,
	VK_SHADING_RATE_PALETTE_ENTRY_1_INVOCATION_PER_2X1_PIXELS_NV = VkShadingRatePaletteEntryNV.VK_SHADING_RATE_PALETTE_ENTRY_1_INVOCATION_PER_2X1_PIXELS_NV,
	VK_SHADING_RATE_PALETTE_ENTRY_1_INVOCATION_PER_1X2_PIXELS_NV = VkShadingRatePaletteEntryNV.VK_SHADING_RATE_PALETTE_ENTRY_1_INVOCATION_PER_1X2_PIXELS_NV,
	VK_SHADING_RATE_PALETTE_ENTRY_1_INVOCATION_PER_2X2_PIXELS_NV = VkShadingRatePaletteEntryNV.VK_SHADING_RATE_PALETTE_ENTRY_1_INVOCATION_PER_2X2_PIXELS_NV,
	VK_SHADING_RATE_PALETTE_ENTRY_1_INVOCATION_PER_4X2_PIXELS_NV = VkShadingRatePaletteEntryNV.VK_SHADING_RATE_PALETTE_ENTRY_1_INVOCATION_PER_4X2_PIXELS_NV,
	VK_SHADING_RATE_PALETTE_ENTRY_1_INVOCATION_PER_2X4_PIXELS_NV = VkShadingRatePaletteEntryNV.VK_SHADING_RATE_PALETTE_ENTRY_1_INVOCATION_PER_2X4_PIXELS_NV,
	VK_SHADING_RATE_PALETTE_ENTRY_1_INVOCATION_PER_4X4_PIXELS_NV = VkShadingRatePaletteEntryNV.VK_SHADING_RATE_PALETTE_ENTRY_1_INVOCATION_PER_4X4_PIXELS_NV,
	VK_SHADING_RATE_PALETTE_ENTRY_MAX_ENUM_NV = VkShadingRatePaletteEntryNV.VK_SHADING_RATE_PALETTE_ENTRY_MAX_ENUM_NV,
}
enum VkSharingMode {
	VK_SHARING_MODE_EXCLUSIVE = 0,
	VK_SHARING_MODE_CONCURRENT = 1,
	VK_SHARING_MODE_MAX_ENUM = 0x7FFFFFFF,
}
enum : VkSharingMode {
	VK_SHARING_MODE_EXCLUSIVE = VkSharingMode.VK_SHARING_MODE_EXCLUSIVE,
	VK_SHARING_MODE_CONCURRENT = VkSharingMode.VK_SHARING_MODE_CONCURRENT,
	VK_SHARING_MODE_MAX_ENUM = VkSharingMode.VK_SHARING_MODE_MAX_ENUM,
}
enum VkSparseImageFormatFlagBits {
	VK_SPARSE_IMAGE_FORMAT_SINGLE_MIPTAIL_BIT = 0x00000001,
	VK_SPARSE_IMAGE_FORMAT_ALIGNED_MIP_SIZE_BIT = 0x00000002,
	VK_SPARSE_IMAGE_FORMAT_NONSTANDARD_BLOCK_SIZE_BIT = 0x00000004,
	VK_SPARSE_IMAGE_FORMAT_FLAG_BITS_MAX_ENUM = 0x7FFFFFFF,
}
enum : VkSparseImageFormatFlagBits {
	VK_SPARSE_IMAGE_FORMAT_SINGLE_MIPTAIL_BIT = VkSparseImageFormatFlagBits.VK_SPARSE_IMAGE_FORMAT_SINGLE_MIPTAIL_BIT,
	VK_SPARSE_IMAGE_FORMAT_ALIGNED_MIP_SIZE_BIT = VkSparseImageFormatFlagBits.VK_SPARSE_IMAGE_FORMAT_ALIGNED_MIP_SIZE_BIT,
	VK_SPARSE_IMAGE_FORMAT_NONSTANDARD_BLOCK_SIZE_BIT = VkSparseImageFormatFlagBits.VK_SPARSE_IMAGE_FORMAT_NONSTANDARD_BLOCK_SIZE_BIT,
	VK_SPARSE_IMAGE_FORMAT_FLAG_BITS_MAX_ENUM = VkSparseImageFormatFlagBits.VK_SPARSE_IMAGE_FORMAT_FLAG_BITS_MAX_ENUM,
}
enum VkSparseMemoryBindFlagBits {
	VK_SPARSE_MEMORY_BIND_METADATA_BIT = 0x00000001,
	VK_SPARSE_MEMORY_BIND_FLAG_BITS_MAX_ENUM = 0x7FFFFFFF,
}
enum : VkSparseMemoryBindFlagBits {
	VK_SPARSE_MEMORY_BIND_METADATA_BIT = VkSparseMemoryBindFlagBits.VK_SPARSE_MEMORY_BIND_METADATA_BIT,
	VK_SPARSE_MEMORY_BIND_FLAG_BITS_MAX_ENUM = VkSparseMemoryBindFlagBits.VK_SPARSE_MEMORY_BIND_FLAG_BITS_MAX_ENUM,
}
enum VkStencilFaceFlagBits {
	VK_STENCIL_FACE_FRONT_BIT = 0x00000001,
	VK_STENCIL_FACE_BACK_BIT = 0x00000002,
	VK_STENCIL_FACE_FRONT_AND_BACK = 0x00000003,
	VK_STENCIL_FRONT_AND_BACK = VK_STENCIL_FACE_FRONT_AND_BACK,
	VK_STENCIL_FACE_FLAG_BITS_MAX_ENUM = 0x7FFFFFFF,
}
enum : VkStencilFaceFlagBits {
	VK_STENCIL_FACE_FRONT_BIT = VkStencilFaceFlagBits.VK_STENCIL_FACE_FRONT_BIT,
	VK_STENCIL_FACE_BACK_BIT = VkStencilFaceFlagBits.VK_STENCIL_FACE_BACK_BIT,
	VK_STENCIL_FACE_FRONT_AND_BACK = VkStencilFaceFlagBits.VK_STENCIL_FACE_FRONT_AND_BACK,
	VK_STENCIL_FRONT_AND_BACK = VkStencilFaceFlagBits.VK_STENCIL_FRONT_AND_BACK,
	VK_STENCIL_FACE_FLAG_BITS_MAX_ENUM = VkStencilFaceFlagBits.VK_STENCIL_FACE_FLAG_BITS_MAX_ENUM,
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
enum : VkStencilOp {
	VK_STENCIL_OP_KEEP = VkStencilOp.VK_STENCIL_OP_KEEP,
	VK_STENCIL_OP_ZERO = VkStencilOp.VK_STENCIL_OP_ZERO,
	VK_STENCIL_OP_REPLACE = VkStencilOp.VK_STENCIL_OP_REPLACE,
	VK_STENCIL_OP_INCREMENT_AND_CLAMP = VkStencilOp.VK_STENCIL_OP_INCREMENT_AND_CLAMP,
	VK_STENCIL_OP_DECREMENT_AND_CLAMP = VkStencilOp.VK_STENCIL_OP_DECREMENT_AND_CLAMP,
	VK_STENCIL_OP_INVERT = VkStencilOp.VK_STENCIL_OP_INVERT,
	VK_STENCIL_OP_INCREMENT_AND_WRAP = VkStencilOp.VK_STENCIL_OP_INCREMENT_AND_WRAP,
	VK_STENCIL_OP_DECREMENT_AND_WRAP = VkStencilOp.VK_STENCIL_OP_DECREMENT_AND_WRAP,
	VK_STENCIL_OP_MAX_ENUM = VkStencilOp.VK_STENCIL_OP_MAX_ENUM,
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
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VULKAN_1_3_FEATURES = 53,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VULKAN_1_3_PROPERTIES = 54,
	VK_STRUCTURE_TYPE_PIPELINE_CREATION_FEEDBACK_CREATE_INFO = 1000192000,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_TERMINATE_INVOCATION_FEATURES = 1000215000,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TOOL_PROPERTIES = 1000245000,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_DEMOTE_TO_HELPER_INVOCATION_FEATURES = 1000276000,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PRIVATE_DATA_FEATURES = 1000295000,
	VK_STRUCTURE_TYPE_DEVICE_PRIVATE_DATA_CREATE_INFO = 1000295001,
	VK_STRUCTURE_TYPE_PRIVATE_DATA_SLOT_CREATE_INFO = 1000295002,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PIPELINE_CREATION_CACHE_CONTROL_FEATURES = 1000297000,
	VK_STRUCTURE_TYPE_MEMORY_BARRIER_2 = 1000314000,
	VK_STRUCTURE_TYPE_BUFFER_MEMORY_BARRIER_2 = 1000314001,
	VK_STRUCTURE_TYPE_IMAGE_MEMORY_BARRIER_2 = 1000314002,
	VK_STRUCTURE_TYPE_DEPENDENCY_INFO = 1000314003,
	VK_STRUCTURE_TYPE_SUBMIT_INFO_2 = 1000314004,
	VK_STRUCTURE_TYPE_SEMAPHORE_SUBMIT_INFO = 1000314005,
	VK_STRUCTURE_TYPE_COMMAND_BUFFER_SUBMIT_INFO = 1000314006,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SYNCHRONIZATION_2_FEATURES = 1000314007,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ZERO_INITIALIZE_WORKGROUP_MEMORY_FEATURES = 1000325000,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_ROBUSTNESS_FEATURES = 1000335000,
	VK_STRUCTURE_TYPE_COPY_BUFFER_INFO_2 = 1000337000,
	VK_STRUCTURE_TYPE_COPY_IMAGE_INFO_2 = 1000337001,
	VK_STRUCTURE_TYPE_COPY_BUFFER_TO_IMAGE_INFO_2 = 1000337002,
	VK_STRUCTURE_TYPE_COPY_IMAGE_TO_BUFFER_INFO_2 = 1000337003,
	VK_STRUCTURE_TYPE_BLIT_IMAGE_INFO_2 = 1000337004,
	VK_STRUCTURE_TYPE_RESOLVE_IMAGE_INFO_2 = 1000337005,
	VK_STRUCTURE_TYPE_BUFFER_COPY_2 = 1000337006,
	VK_STRUCTURE_TYPE_IMAGE_COPY_2 = 1000337007,
	VK_STRUCTURE_TYPE_IMAGE_BLIT_2 = 1000337008,
	VK_STRUCTURE_TYPE_BUFFER_IMAGE_COPY_2 = 1000337009,
	VK_STRUCTURE_TYPE_IMAGE_RESOLVE_2 = 1000337010,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SUBGROUP_SIZE_CONTROL_PROPERTIES = 1000225000,
	VK_STRUCTURE_TYPE_PIPELINE_SHADER_STAGE_REQUIRED_SUBGROUP_SIZE_CREATE_INFO = 1000225001,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SUBGROUP_SIZE_CONTROL_FEATURES = 1000225002,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_INLINE_UNIFORM_BLOCK_FEATURES = 1000138000,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_INLINE_UNIFORM_BLOCK_PROPERTIES = 1000138001,
	VK_STRUCTURE_TYPE_WRITE_DESCRIPTOR_SET_INLINE_UNIFORM_BLOCK = 1000138002,
	VK_STRUCTURE_TYPE_DESCRIPTOR_POOL_INLINE_UNIFORM_BLOCK_CREATE_INFO = 1000138003,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TEXTURE_COMPRESSION_ASTC_HDR_FEATURES = 1000066000,
	VK_STRUCTURE_TYPE_RENDERING_INFO = 1000044000,
	VK_STRUCTURE_TYPE_RENDERING_ATTACHMENT_INFO = 1000044001,
	VK_STRUCTURE_TYPE_PIPELINE_RENDERING_CREATE_INFO = 1000044002,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DYNAMIC_RENDERING_FEATURES = 1000044003,
	VK_STRUCTURE_TYPE_COMMAND_BUFFER_INHERITANCE_RENDERING_INFO = 1000044004,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_INTEGER_DOT_PRODUCT_FEATURES = 1000280000,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_INTEGER_DOT_PRODUCT_PROPERTIES = 1000280001,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TEXEL_BUFFER_ALIGNMENT_PROPERTIES = 1000281001,
	VK_STRUCTURE_TYPE_FORMAT_PROPERTIES_3 = 1000360000,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_4_FEATURES = 1000413000,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_4_PROPERTIES = 1000413001,
	VK_STRUCTURE_TYPE_DEVICE_BUFFER_MEMORY_REQUIREMENTS = 1000413002,
	VK_STRUCTURE_TYPE_DEVICE_IMAGE_MEMORY_REQUIREMENTS = 1000413003,
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
	VK_STRUCTURE_TYPE_CU_MODULE_CREATE_INFO_NVX = 1000029000,
	VK_STRUCTURE_TYPE_CU_FUNCTION_CREATE_INFO_NVX = 1000029001,
	VK_STRUCTURE_TYPE_CU_LAUNCH_INFO_NVX = 1000029002,
	VK_STRUCTURE_TYPE_IMAGE_VIEW_HANDLE_INFO_NVX = 1000030000,
	VK_STRUCTURE_TYPE_IMAGE_VIEW_ADDRESS_PROPERTIES_NVX = 1000030001,
	VK_STRUCTURE_TYPE_TEXTURE_LOD_GATHER_FORMAT_PROPERTIES_AMD = 1000041000,
	VK_STRUCTURE_TYPE_RENDERING_FRAGMENT_SHADING_RATE_ATTACHMENT_INFO_KHR = 1000044006,
	VK_STRUCTURE_TYPE_RENDERING_FRAGMENT_DENSITY_MAP_ATTACHMENT_INFO_EXT = 1000044007,
	VK_STRUCTURE_TYPE_ATTACHMENT_SAMPLE_COUNT_INFO_AMD = 1000044008,
	VK_STRUCTURE_TYPE_MULTIVIEW_PER_VIEW_ATTRIBUTES_INFO_NVX = 1000044009,
	VK_STRUCTURE_TYPE_STREAM_DESCRIPTOR_SURFACE_CREATE_INFO_GGP = 1000049000,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_CORNER_SAMPLED_IMAGE_FEATURES_NV = 1000050000,
	VK_STRUCTURE_TYPE_EXTERNAL_MEMORY_IMAGE_CREATE_INFO_NV = 1000056000,
	VK_STRUCTURE_TYPE_EXPORT_MEMORY_ALLOCATE_INFO_NV = 1000056001,
	VK_STRUCTURE_TYPE_IMPORT_MEMORY_WIN32_HANDLE_INFO_NV = 1000057000,
	VK_STRUCTURE_TYPE_EXPORT_MEMORY_WIN32_HANDLE_INFO_NV = 1000057001,
	VK_STRUCTURE_TYPE_WIN32_KEYED_MUTEX_ACQUIRE_RELEASE_INFO_NV = 1000058000,
	VK_STRUCTURE_TYPE_VALIDATION_FLAGS_EXT = 1000061000,
	VK_STRUCTURE_TYPE_VI_SURFACE_CREATE_INFO_NN = 1000062000,
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
	VK_STRUCTURE_TYPE_ANDROID_HARDWARE_BUFFER_FORMAT_PROPERTIES_2_ANDROID = 1000129006,
	VK_STRUCTURE_TYPE_SAMPLE_LOCATIONS_INFO_EXT = 1000143000,
	VK_STRUCTURE_TYPE_RENDER_PASS_SAMPLE_LOCATIONS_BEGIN_INFO_EXT = 1000143001,
	VK_STRUCTURE_TYPE_PIPELINE_SAMPLE_LOCATIONS_STATE_CREATE_INFO_EXT = 1000143002,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SAMPLE_LOCATIONS_PROPERTIES_EXT = 1000143003,
	VK_STRUCTURE_TYPE_MULTISAMPLE_PROPERTIES_EXT = 1000143004,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_BLEND_OPERATION_ADVANCED_FEATURES_EXT = 1000148000,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_BLEND_OPERATION_ADVANCED_PROPERTIES_EXT = 1000148001,
	VK_STRUCTURE_TYPE_PIPELINE_COLOR_BLEND_ADVANCED_STATE_CREATE_INFO_EXT = 1000148002,
	VK_STRUCTURE_TYPE_PIPELINE_COVERAGE_TO_COLOR_STATE_CREATE_INFO_NV = 1000149000,
	VK_STRUCTURE_TYPE_WRITE_DESCRIPTOR_SET_ACCELERATION_STRUCTURE_KHR = 1000150007,
	VK_STRUCTURE_TYPE_ACCELERATION_STRUCTURE_BUILD_GEOMETRY_INFO_KHR = 1000150000,
	VK_STRUCTURE_TYPE_ACCELERATION_STRUCTURE_DEVICE_ADDRESS_INFO_KHR = 1000150002,
	VK_STRUCTURE_TYPE_ACCELERATION_STRUCTURE_GEOMETRY_AABBS_DATA_KHR = 1000150003,
	VK_STRUCTURE_TYPE_ACCELERATION_STRUCTURE_GEOMETRY_INSTANCES_DATA_KHR = 1000150004,
	VK_STRUCTURE_TYPE_ACCELERATION_STRUCTURE_GEOMETRY_TRIANGLES_DATA_KHR = 1000150005,
	VK_STRUCTURE_TYPE_ACCELERATION_STRUCTURE_GEOMETRY_KHR = 1000150006,
	VK_STRUCTURE_TYPE_ACCELERATION_STRUCTURE_VERSION_INFO_KHR = 1000150009,
	VK_STRUCTURE_TYPE_COPY_ACCELERATION_STRUCTURE_INFO_KHR = 1000150010,
	VK_STRUCTURE_TYPE_COPY_ACCELERATION_STRUCTURE_TO_MEMORY_INFO_KHR = 1000150011,
	VK_STRUCTURE_TYPE_COPY_MEMORY_TO_ACCELERATION_STRUCTURE_INFO_KHR = 1000150012,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ACCELERATION_STRUCTURE_FEATURES_KHR = 1000150013,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ACCELERATION_STRUCTURE_PROPERTIES_KHR = 1000150014,
	VK_STRUCTURE_TYPE_ACCELERATION_STRUCTURE_CREATE_INFO_KHR = 1000150017,
	VK_STRUCTURE_TYPE_ACCELERATION_STRUCTURE_BUILD_SIZES_INFO_KHR = 1000150020,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RAY_TRACING_PIPELINE_FEATURES_KHR = 1000347000,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RAY_TRACING_PIPELINE_PROPERTIES_KHR = 1000347001,
	VK_STRUCTURE_TYPE_RAY_TRACING_PIPELINE_CREATE_INFO_KHR = 1000150015,
	VK_STRUCTURE_TYPE_RAY_TRACING_SHADER_GROUP_CREATE_INFO_KHR = 1000150016,
	VK_STRUCTURE_TYPE_RAY_TRACING_PIPELINE_INTERFACE_CREATE_INFO_KHR = 1000150018,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RAY_QUERY_FEATURES_KHR = 1000348013,
	VK_STRUCTURE_TYPE_PIPELINE_COVERAGE_MODULATION_STATE_CREATE_INFO_NV = 1000152000,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_SM_BUILTINS_FEATURES_NV = 1000154000,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_SM_BUILTINS_PROPERTIES_NV = 1000154001,
	VK_STRUCTURE_TYPE_DRM_FORMAT_MODIFIER_PROPERTIES_LIST_EXT = 1000158000,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_DRM_FORMAT_MODIFIER_INFO_EXT = 1000158002,
	VK_STRUCTURE_TYPE_IMAGE_DRM_FORMAT_MODIFIER_LIST_CREATE_INFO_EXT = 1000158003,
	VK_STRUCTURE_TYPE_IMAGE_DRM_FORMAT_MODIFIER_EXPLICIT_CREATE_INFO_EXT = 1000158004,
	VK_STRUCTURE_TYPE_IMAGE_DRM_FORMAT_MODIFIER_PROPERTIES_EXT = 1000158005,
	VK_STRUCTURE_TYPE_DRM_FORMAT_MODIFIER_PROPERTIES_LIST_2_EXT = 1000158006,
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
	VK_STRUCTURE_TYPE_BIND_ACCELERATION_STRUCTURE_MEMORY_INFO_NV = 1000165006,
	VK_STRUCTURE_TYPE_WRITE_DESCRIPTOR_SET_ACCELERATION_STRUCTURE_NV = 1000165007,
	VK_STRUCTURE_TYPE_ACCELERATION_STRUCTURE_MEMORY_REQUIREMENTS_INFO_NV = 1000165008,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RAY_TRACING_PROPERTIES_NV = 1000165009,
	VK_STRUCTURE_TYPE_RAY_TRACING_SHADER_GROUP_CREATE_INFO_NV = 1000165011,
	VK_STRUCTURE_TYPE_ACCELERATION_STRUCTURE_INFO_NV = 1000165012,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_REPRESENTATIVE_FRAGMENT_TEST_FEATURES_NV = 1000166000,
	VK_STRUCTURE_TYPE_PIPELINE_REPRESENTATIVE_FRAGMENT_TEST_STATE_CREATE_INFO_NV = 1000166001,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_VIEW_IMAGE_FORMAT_INFO_EXT = 1000170000,
	VK_STRUCTURE_TYPE_FILTER_CUBIC_IMAGE_VIEW_IMAGE_FORMAT_PROPERTIES_EXT = 1000170001,
	VK_STRUCTURE_TYPE_IMPORT_MEMORY_HOST_POINTER_INFO_EXT = 1000178000,
	VK_STRUCTURE_TYPE_MEMORY_HOST_POINTER_PROPERTIES_EXT = 1000178001,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_EXTERNAL_MEMORY_HOST_PROPERTIES_EXT = 1000178002,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_CLOCK_FEATURES_KHR = 1000181000,
	VK_STRUCTURE_TYPE_PIPELINE_COMPILER_CONTROL_CREATE_INFO_AMD = 1000183000,
	VK_STRUCTURE_TYPE_CALIBRATED_TIMESTAMP_INFO_EXT = 1000184000,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_CORE_PROPERTIES_AMD = 1000185000,
	VK_STRUCTURE_TYPE_DEVICE_QUEUE_GLOBAL_PRIORITY_CREATE_INFO_KHR = 1000174000,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_GLOBAL_PRIORITY_QUERY_FEATURES_KHR = 1000388000,
	VK_STRUCTURE_TYPE_QUEUE_FAMILY_GLOBAL_PRIORITY_PROPERTIES_KHR = 1000388001,
	VK_STRUCTURE_TYPE_DEVICE_MEMORY_OVERALLOCATION_CREATE_INFO_AMD = 1000189000,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VERTEX_ATTRIBUTE_DIVISOR_PROPERTIES_EXT = 1000190000,
	VK_STRUCTURE_TYPE_PIPELINE_VERTEX_INPUT_DIVISOR_STATE_CREATE_INFO_EXT = 1000190001,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VERTEX_ATTRIBUTE_DIVISOR_FEATURES_EXT = 1000190002,
	VK_STRUCTURE_TYPE_PRESENT_FRAME_TOKEN_GGP = 1000191000,
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
	VK_STRUCTURE_TYPE_FRAGMENT_SHADING_RATE_ATTACHMENT_INFO_KHR = 1000226000,
	VK_STRUCTURE_TYPE_PIPELINE_FRAGMENT_SHADING_RATE_STATE_CREATE_INFO_KHR = 1000226001,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_SHADING_RATE_PROPERTIES_KHR = 1000226002,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_SHADING_RATE_FEATURES_KHR = 1000226003,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_SHADING_RATE_KHR = 1000226004,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_CORE_PROPERTIES_2_AMD = 1000227000,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_COHERENT_MEMORY_FEATURES_AMD = 1000229000,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_IMAGE_ATOMIC_INT64_FEATURES_EXT = 1000234000,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MEMORY_BUDGET_PROPERTIES_EXT = 1000237000,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MEMORY_PRIORITY_FEATURES_EXT = 1000238000,
	VK_STRUCTURE_TYPE_MEMORY_PRIORITY_ALLOCATE_INFO_EXT = 1000238001,
	VK_STRUCTURE_TYPE_SURFACE_PROTECTED_CAPABILITIES_KHR = 1000239000,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DEDICATED_ALLOCATION_IMAGE_ALIASING_FEATURES_NV = 1000240000,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_BUFFER_DEVICE_ADDRESS_FEATURES_EXT = 1000244000,
	VK_STRUCTURE_TYPE_BUFFER_DEVICE_ADDRESS_CREATE_INFO_EXT = 1000244002,
	VK_STRUCTURE_TYPE_VALIDATION_FEATURES_EXT = 1000247000,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PRESENT_WAIT_FEATURES_KHR = 1000248000,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_COOPERATIVE_MATRIX_FEATURES_NV = 1000249000,
	VK_STRUCTURE_TYPE_COOPERATIVE_MATRIX_PROPERTIES_NV = 1000249001,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_COOPERATIVE_MATRIX_PROPERTIES_NV = 1000249002,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_COVERAGE_REDUCTION_MODE_FEATURES_NV = 1000250000,
	VK_STRUCTURE_TYPE_PIPELINE_COVERAGE_REDUCTION_STATE_CREATE_INFO_NV = 1000250001,
	VK_STRUCTURE_TYPE_FRAMEBUFFER_MIXED_SAMPLES_COMBINATION_NV = 1000250002,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_SHADER_INTERLOCK_FEATURES_EXT = 1000251000,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_YCBCR_IMAGE_ARRAYS_FEATURES_EXT = 1000252000,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PROVOKING_VERTEX_FEATURES_EXT = 1000254000,
	VK_STRUCTURE_TYPE_PIPELINE_RASTERIZATION_PROVOKING_VERTEX_STATE_CREATE_INFO_EXT = 1000254001,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PROVOKING_VERTEX_PROPERTIES_EXT = 1000254002,
	VK_STRUCTURE_TYPE_SURFACE_FULL_SCREEN_EXCLUSIVE_INFO_EXT = 1000255000,
	VK_STRUCTURE_TYPE_SURFACE_CAPABILITIES_FULL_SCREEN_EXCLUSIVE_EXT = 1000255002,
	VK_STRUCTURE_TYPE_SURFACE_FULL_SCREEN_EXCLUSIVE_WIN32_INFO_EXT = 1000255001,
	VK_STRUCTURE_TYPE_HEADLESS_SURFACE_CREATE_INFO_EXT = 1000256000,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LINE_RASTERIZATION_FEATURES_EXT = 1000259000,
	VK_STRUCTURE_TYPE_PIPELINE_RASTERIZATION_LINE_STATE_CREATE_INFO_EXT = 1000259001,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LINE_RASTERIZATION_PROPERTIES_EXT = 1000259002,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_ATOMIC_FLOAT_FEATURES_EXT = 1000260000,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_INDEX_TYPE_UINT8_FEATURES_EXT = 1000265000,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_EXTENDED_DYNAMIC_STATE_FEATURES_EXT = 1000267000,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PIPELINE_EXECUTABLE_PROPERTIES_FEATURES_KHR = 1000269000,
	VK_STRUCTURE_TYPE_PIPELINE_INFO_KHR = 1000269001,
	VK_STRUCTURE_TYPE_PIPELINE_EXECUTABLE_PROPERTIES_KHR = 1000269002,
	VK_STRUCTURE_TYPE_PIPELINE_EXECUTABLE_INFO_KHR = 1000269003,
	VK_STRUCTURE_TYPE_PIPELINE_EXECUTABLE_STATISTIC_KHR = 1000269004,
	VK_STRUCTURE_TYPE_PIPELINE_EXECUTABLE_INTERNAL_REPRESENTATION_KHR = 1000269005,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_ATOMIC_FLOAT_2_FEATURES_EXT = 1000273000,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DEVICE_GENERATED_COMMANDS_PROPERTIES_NV = 1000277000,
	VK_STRUCTURE_TYPE_GRAPHICS_SHADER_GROUP_CREATE_INFO_NV = 1000277001,
	VK_STRUCTURE_TYPE_GRAPHICS_PIPELINE_SHADER_GROUPS_CREATE_INFO_NV = 1000277002,
	VK_STRUCTURE_TYPE_INDIRECT_COMMANDS_LAYOUT_TOKEN_NV = 1000277003,
	VK_STRUCTURE_TYPE_INDIRECT_COMMANDS_LAYOUT_CREATE_INFO_NV = 1000277004,
	VK_STRUCTURE_TYPE_GENERATED_COMMANDS_INFO_NV = 1000277005,
	VK_STRUCTURE_TYPE_GENERATED_COMMANDS_MEMORY_REQUIREMENTS_INFO_NV = 1000277006,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DEVICE_GENERATED_COMMANDS_FEATURES_NV = 1000277007,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_INHERITED_VIEWPORT_SCISSOR_FEATURES_NV = 1000278000,
	VK_STRUCTURE_TYPE_COMMAND_BUFFER_INHERITANCE_VIEWPORT_SCISSOR_INFO_NV = 1000278001,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TEXEL_BUFFER_ALIGNMENT_FEATURES_EXT = 1000281000,
	VK_STRUCTURE_TYPE_COMMAND_BUFFER_INHERITANCE_RENDER_PASS_TRANSFORM_INFO_QCOM = 1000282000,
	VK_STRUCTURE_TYPE_RENDER_PASS_TRANSFORM_BEGIN_INFO_QCOM = 1000282001,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DEVICE_MEMORY_REPORT_FEATURES_EXT = 1000284000,
	VK_STRUCTURE_TYPE_DEVICE_DEVICE_MEMORY_REPORT_CREATE_INFO_EXT = 1000284001,
	VK_STRUCTURE_TYPE_DEVICE_MEMORY_REPORT_CALLBACK_DATA_EXT = 1000284002,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ROBUSTNESS_2_FEATURES_EXT = 1000286000,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ROBUSTNESS_2_PROPERTIES_EXT = 1000286001,
	VK_STRUCTURE_TYPE_SAMPLER_CUSTOM_BORDER_COLOR_CREATE_INFO_EXT = 1000287000,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_CUSTOM_BORDER_COLOR_PROPERTIES_EXT = 1000287001,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_CUSTOM_BORDER_COLOR_FEATURES_EXT = 1000287002,
	VK_STRUCTURE_TYPE_PIPELINE_LIBRARY_CREATE_INFO_KHR = 1000290000,
	VK_STRUCTURE_TYPE_PRESENT_ID_KHR = 1000294000,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PRESENT_ID_FEATURES_KHR = 1000294001,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DIAGNOSTICS_CONFIG_FEATURES_NV = 1000300000,
	VK_STRUCTURE_TYPE_DEVICE_DIAGNOSTICS_CONFIG_CREATE_INFO_NV = 1000300001,
	VK_STRUCTURE_TYPE_QUEUE_FAMILY_CHECKPOINT_PROPERTIES_2_NV = 1000314008,
	VK_STRUCTURE_TYPE_CHECKPOINT_DATA_2_NV = 1000314009,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_GRAPHICS_PIPELINE_LIBRARY_FEATURES_EXT = 1000320000,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_GRAPHICS_PIPELINE_LIBRARY_PROPERTIES_EXT = 1000320001,
	VK_STRUCTURE_TYPE_GRAPHICS_PIPELINE_LIBRARY_CREATE_INFO_EXT = 1000320002,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_SUBGROUP_UNIFORM_CONTROL_FLOW_FEATURES_KHR = 1000323000,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_SHADING_RATE_ENUMS_PROPERTIES_NV = 1000326000,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_SHADING_RATE_ENUMS_FEATURES_NV = 1000326001,
	VK_STRUCTURE_TYPE_PIPELINE_FRAGMENT_SHADING_RATE_ENUM_STATE_CREATE_INFO_NV = 1000326002,
	VK_STRUCTURE_TYPE_ACCELERATION_STRUCTURE_GEOMETRY_MOTION_TRIANGLES_DATA_NV = 1000327000,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RAY_TRACING_MOTION_BLUR_FEATURES_NV = 1000327001,
	VK_STRUCTURE_TYPE_ACCELERATION_STRUCTURE_MOTION_INFO_NV = 1000327002,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_YCBCR_2_PLANE_444_FORMATS_FEATURES_EXT = 1000330000,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_2_FEATURES_EXT = 1000332000,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_2_PROPERTIES_EXT = 1000332001,
	VK_STRUCTURE_TYPE_COPY_COMMAND_TRANSFORM_INFO_QCOM = 1000333000,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_WORKGROUP_MEMORY_EXPLICIT_LAYOUT_FEATURES_KHR = 1000336000,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_4444_FORMATS_FEATURES_EXT = 1000340000,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RASTERIZATION_ORDER_ATTACHMENT_ACCESS_FEATURES_ARM = 1000342000,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RGBA10X6_FORMATS_FEATURES_EXT = 1000344000,
	VK_STRUCTURE_TYPE_DIRECTFB_SURFACE_CREATE_INFO_EXT = 1000346000,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MUTABLE_DESCRIPTOR_TYPE_FEATURES_VALVE = 1000351000,
	VK_STRUCTURE_TYPE_MUTABLE_DESCRIPTOR_TYPE_CREATE_INFO_VALVE = 1000351002,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VERTEX_INPUT_DYNAMIC_STATE_FEATURES_EXT = 1000352000,
	VK_STRUCTURE_TYPE_VERTEX_INPUT_BINDING_DESCRIPTION_2_EXT = 1000352001,
	VK_STRUCTURE_TYPE_VERTEX_INPUT_ATTRIBUTE_DESCRIPTION_2_EXT = 1000352002,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DRM_PROPERTIES_EXT = 1000353000,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DEPTH_CLIP_CONTROL_FEATURES_EXT = 1000355000,
	VK_STRUCTURE_TYPE_PIPELINE_VIEWPORT_DEPTH_CLIP_CONTROL_CREATE_INFO_EXT = 1000355001,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PRIMITIVE_TOPOLOGY_LIST_RESTART_FEATURES_EXT = 1000356000,
	VK_STRUCTURE_TYPE_IMPORT_MEMORY_ZIRCON_HANDLE_INFO_FUCHSIA = 1000364000,
	VK_STRUCTURE_TYPE_MEMORY_ZIRCON_HANDLE_PROPERTIES_FUCHSIA = 1000364001,
	VK_STRUCTURE_TYPE_MEMORY_GET_ZIRCON_HANDLE_INFO_FUCHSIA = 1000364002,
	VK_STRUCTURE_TYPE_IMPORT_SEMAPHORE_ZIRCON_HANDLE_INFO_FUCHSIA = 1000365000,
	VK_STRUCTURE_TYPE_SEMAPHORE_GET_ZIRCON_HANDLE_INFO_FUCHSIA = 1000365001,
	VK_STRUCTURE_TYPE_BUFFER_COLLECTION_CREATE_INFO_FUCHSIA = 1000366000,
	VK_STRUCTURE_TYPE_IMPORT_MEMORY_BUFFER_COLLECTION_FUCHSIA = 1000366001,
	VK_STRUCTURE_TYPE_BUFFER_COLLECTION_IMAGE_CREATE_INFO_FUCHSIA = 1000366002,
	VK_STRUCTURE_TYPE_BUFFER_COLLECTION_PROPERTIES_FUCHSIA = 1000366003,
	VK_STRUCTURE_TYPE_BUFFER_CONSTRAINTS_INFO_FUCHSIA = 1000366004,
	VK_STRUCTURE_TYPE_BUFFER_COLLECTION_BUFFER_CREATE_INFO_FUCHSIA = 1000366005,
	VK_STRUCTURE_TYPE_IMAGE_CONSTRAINTS_INFO_FUCHSIA = 1000366006,
	VK_STRUCTURE_TYPE_IMAGE_FORMAT_CONSTRAINTS_INFO_FUCHSIA = 1000366007,
	VK_STRUCTURE_TYPE_SYSMEM_COLOR_SPACE_FUCHSIA = 1000366008,
	VK_STRUCTURE_TYPE_BUFFER_COLLECTION_CONSTRAINTS_INFO_FUCHSIA = 1000366009,
	VK_STRUCTURE_TYPE_SUBPASS_SHADING_PIPELINE_CREATE_INFO_HUAWEI = 1000369000,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SUBPASS_SHADING_FEATURES_HUAWEI = 1000369001,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SUBPASS_SHADING_PROPERTIES_HUAWEI = 1000369002,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_INVOCATION_MASK_FEATURES_HUAWEI = 1000370000,
	VK_STRUCTURE_TYPE_MEMORY_GET_REMOTE_ADDRESS_INFO_NV = 1000371000,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_EXTERNAL_MEMORY_RDMA_FEATURES_NV = 1000371001,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_EXTENDED_DYNAMIC_STATE_2_FEATURES_EXT = 1000377000,
	VK_STRUCTURE_TYPE_SCREEN_SURFACE_CREATE_INFO_QNX = 1000378000,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_COLOR_WRITE_ENABLE_FEATURES_EXT = 1000381000,
	VK_STRUCTURE_TYPE_PIPELINE_COLOR_WRITE_CREATE_INFO_EXT = 1000381001,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PRIMITIVES_GENERATED_QUERY_FEATURES_EXT = 1000382000,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_VIEW_MIN_LOD_FEATURES_EXT = 1000391000,
	VK_STRUCTURE_TYPE_IMAGE_VIEW_MIN_LOD_CREATE_INFO_EXT = 1000391001,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MULTI_DRAW_FEATURES_EXT = 1000392000,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MULTI_DRAW_PROPERTIES_EXT = 1000392001,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_2D_VIEW_OF_3D_FEATURES_EXT = 1000393000,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_BORDER_COLOR_SWIZZLE_FEATURES_EXT = 1000411000,
	VK_STRUCTURE_TYPE_SAMPLER_BORDER_COLOR_COMPONENT_MAPPING_CREATE_INFO_EXT = 1000411001,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PAGEABLE_DEVICE_LOCAL_MEMORY_FEATURES_EXT = 1000412000,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DESCRIPTOR_SET_HOST_MAPPING_FEATURES_VALVE = 1000420000,
	VK_STRUCTURE_TYPE_DESCRIPTOR_SET_BINDING_REFERENCE_VALVE = 1000420001,
	VK_STRUCTURE_TYPE_DESCRIPTOR_SET_LAYOUT_HOST_MAPPING_INFO_VALVE = 1000420002,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_OFFSET_FEATURES_QCOM = 1000425000,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_OFFSET_PROPERTIES_QCOM = 1000425001,
	VK_STRUCTURE_TYPE_SUBPASS_FRAGMENT_DENSITY_MAP_OFFSET_END_INFO_QCOM = 1000425002,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LINEAR_COLOR_ATTACHMENT_FEATURES_NV = 1000430000,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VARIABLE_POINTER_FEATURES = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VARIABLE_POINTERS_FEATURES,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_DRAW_PARAMETER_FEATURES = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_DRAW_PARAMETERS_FEATURES,
	VK_STRUCTURE_TYPE_DEBUG_REPORT_CREATE_INFO_EXT = VK_STRUCTURE_TYPE_DEBUG_REPORT_CALLBACK_CREATE_INFO_EXT,
	VK_STRUCTURE_TYPE_RENDERING_INFO_KHR = VK_STRUCTURE_TYPE_RENDERING_INFO,
	VK_STRUCTURE_TYPE_RENDERING_ATTACHMENT_INFO_KHR = VK_STRUCTURE_TYPE_RENDERING_ATTACHMENT_INFO,
	VK_STRUCTURE_TYPE_PIPELINE_RENDERING_CREATE_INFO_KHR = VK_STRUCTURE_TYPE_PIPELINE_RENDERING_CREATE_INFO,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DYNAMIC_RENDERING_FEATURES_KHR = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DYNAMIC_RENDERING_FEATURES,
	VK_STRUCTURE_TYPE_COMMAND_BUFFER_INHERITANCE_RENDERING_INFO_KHR = VK_STRUCTURE_TYPE_COMMAND_BUFFER_INHERITANCE_RENDERING_INFO,
	VK_STRUCTURE_TYPE_ATTACHMENT_SAMPLE_COUNT_INFO_NV = VK_STRUCTURE_TYPE_ATTACHMENT_SAMPLE_COUNT_INFO_AMD,
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
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TEXTURE_COMPRESSION_ASTC_HDR_FEATURES_EXT = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TEXTURE_COMPRESSION_ASTC_HDR_FEATURES,
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
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_INLINE_UNIFORM_BLOCK_FEATURES_EXT = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_INLINE_UNIFORM_BLOCK_FEATURES,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_INLINE_UNIFORM_BLOCK_PROPERTIES_EXT = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_INLINE_UNIFORM_BLOCK_PROPERTIES,
	VK_STRUCTURE_TYPE_WRITE_DESCRIPTOR_SET_INLINE_UNIFORM_BLOCK_EXT = VK_STRUCTURE_TYPE_WRITE_DESCRIPTOR_SET_INLINE_UNIFORM_BLOCK,
	VK_STRUCTURE_TYPE_DESCRIPTOR_POOL_INLINE_UNIFORM_BLOCK_CREATE_INFO_EXT = VK_STRUCTURE_TYPE_DESCRIPTOR_POOL_INLINE_UNIFORM_BLOCK_CREATE_INFO,
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
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_3_PROPERTIES_KHR = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_3_PROPERTIES,
	VK_STRUCTURE_TYPE_DESCRIPTOR_SET_LAYOUT_SUPPORT_KHR = VK_STRUCTURE_TYPE_DESCRIPTOR_SET_LAYOUT_SUPPORT,
	VK_STRUCTURE_TYPE_DEVICE_QUEUE_GLOBAL_PRIORITY_CREATE_INFO_EXT = VK_STRUCTURE_TYPE_DEVICE_QUEUE_GLOBAL_PRIORITY_CREATE_INFO_KHR,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_SUBGROUP_EXTENDED_TYPES_FEATURES_KHR = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_SUBGROUP_EXTENDED_TYPES_FEATURES,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_8BIT_STORAGE_FEATURES_KHR = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_8BIT_STORAGE_FEATURES,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_ATOMIC_INT64_FEATURES_KHR = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_ATOMIC_INT64_FEATURES,
	VK_STRUCTURE_TYPE_PIPELINE_CREATION_FEEDBACK_CREATE_INFO_EXT = VK_STRUCTURE_TYPE_PIPELINE_CREATION_FEEDBACK_CREATE_INFO,
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
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_TERMINATE_INVOCATION_FEATURES_KHR = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_TERMINATE_INVOCATION_FEATURES,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SCALAR_BLOCK_LAYOUT_FEATURES_EXT = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SCALAR_BLOCK_LAYOUT_FEATURES,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SUBGROUP_SIZE_CONTROL_PROPERTIES_EXT = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SUBGROUP_SIZE_CONTROL_PROPERTIES,
	VK_STRUCTURE_TYPE_PIPELINE_SHADER_STAGE_REQUIRED_SUBGROUP_SIZE_CREATE_INFO_EXT = VK_STRUCTURE_TYPE_PIPELINE_SHADER_STAGE_REQUIRED_SUBGROUP_SIZE_CREATE_INFO,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SUBGROUP_SIZE_CONTROL_FEATURES_EXT = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SUBGROUP_SIZE_CONTROL_FEATURES,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SEPARATE_DEPTH_STENCIL_LAYOUTS_FEATURES_KHR = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SEPARATE_DEPTH_STENCIL_LAYOUTS_FEATURES,
	VK_STRUCTURE_TYPE_ATTACHMENT_REFERENCE_STENCIL_LAYOUT_KHR = VK_STRUCTURE_TYPE_ATTACHMENT_REFERENCE_STENCIL_LAYOUT,
	VK_STRUCTURE_TYPE_ATTACHMENT_DESCRIPTION_STENCIL_LAYOUT_KHR = VK_STRUCTURE_TYPE_ATTACHMENT_DESCRIPTION_STENCIL_LAYOUT,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_BUFFER_ADDRESS_FEATURES_EXT = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_BUFFER_DEVICE_ADDRESS_FEATURES_EXT,
	VK_STRUCTURE_TYPE_BUFFER_DEVICE_ADDRESS_INFO_EXT = VK_STRUCTURE_TYPE_BUFFER_DEVICE_ADDRESS_INFO,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TOOL_PROPERTIES_EXT = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TOOL_PROPERTIES,
	VK_STRUCTURE_TYPE_IMAGE_STENCIL_USAGE_CREATE_INFO_EXT = VK_STRUCTURE_TYPE_IMAGE_STENCIL_USAGE_CREATE_INFO,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_UNIFORM_BUFFER_STANDARD_LAYOUT_FEATURES_KHR = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_UNIFORM_BUFFER_STANDARD_LAYOUT_FEATURES,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_BUFFER_DEVICE_ADDRESS_FEATURES_KHR = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_BUFFER_DEVICE_ADDRESS_FEATURES,
	VK_STRUCTURE_TYPE_BUFFER_DEVICE_ADDRESS_INFO_KHR = VK_STRUCTURE_TYPE_BUFFER_DEVICE_ADDRESS_INFO,
	VK_STRUCTURE_TYPE_BUFFER_OPAQUE_CAPTURE_ADDRESS_CREATE_INFO_KHR = VK_STRUCTURE_TYPE_BUFFER_OPAQUE_CAPTURE_ADDRESS_CREATE_INFO,
	VK_STRUCTURE_TYPE_MEMORY_OPAQUE_CAPTURE_ADDRESS_ALLOCATE_INFO_KHR = VK_STRUCTURE_TYPE_MEMORY_OPAQUE_CAPTURE_ADDRESS_ALLOCATE_INFO,
	VK_STRUCTURE_TYPE_DEVICE_MEMORY_OPAQUE_CAPTURE_ADDRESS_INFO_KHR = VK_STRUCTURE_TYPE_DEVICE_MEMORY_OPAQUE_CAPTURE_ADDRESS_INFO,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_HOST_QUERY_RESET_FEATURES_EXT = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_HOST_QUERY_RESET_FEATURES,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_DEMOTE_TO_HELPER_INVOCATION_FEATURES_EXT = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_DEMOTE_TO_HELPER_INVOCATION_FEATURES,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_INTEGER_DOT_PRODUCT_FEATURES_KHR = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_INTEGER_DOT_PRODUCT_FEATURES,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_INTEGER_DOT_PRODUCT_PROPERTIES_KHR = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_INTEGER_DOT_PRODUCT_PROPERTIES,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TEXEL_BUFFER_ALIGNMENT_PROPERTIES_EXT = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TEXEL_BUFFER_ALIGNMENT_PROPERTIES,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PRIVATE_DATA_FEATURES_EXT = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PRIVATE_DATA_FEATURES,
	VK_STRUCTURE_TYPE_DEVICE_PRIVATE_DATA_CREATE_INFO_EXT = VK_STRUCTURE_TYPE_DEVICE_PRIVATE_DATA_CREATE_INFO,
	VK_STRUCTURE_TYPE_PRIVATE_DATA_SLOT_CREATE_INFO_EXT = VK_STRUCTURE_TYPE_PRIVATE_DATA_SLOT_CREATE_INFO,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PIPELINE_CREATION_CACHE_CONTROL_FEATURES_EXT = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PIPELINE_CREATION_CACHE_CONTROL_FEATURES,
	VK_STRUCTURE_TYPE_MEMORY_BARRIER_2_KHR = VK_STRUCTURE_TYPE_MEMORY_BARRIER_2,
	VK_STRUCTURE_TYPE_BUFFER_MEMORY_BARRIER_2_KHR = VK_STRUCTURE_TYPE_BUFFER_MEMORY_BARRIER_2,
	VK_STRUCTURE_TYPE_IMAGE_MEMORY_BARRIER_2_KHR = VK_STRUCTURE_TYPE_IMAGE_MEMORY_BARRIER_2,
	VK_STRUCTURE_TYPE_DEPENDENCY_INFO_KHR = VK_STRUCTURE_TYPE_DEPENDENCY_INFO,
	VK_STRUCTURE_TYPE_SUBMIT_INFO_2_KHR = VK_STRUCTURE_TYPE_SUBMIT_INFO_2,
	VK_STRUCTURE_TYPE_SEMAPHORE_SUBMIT_INFO_KHR = VK_STRUCTURE_TYPE_SEMAPHORE_SUBMIT_INFO,
	VK_STRUCTURE_TYPE_COMMAND_BUFFER_SUBMIT_INFO_KHR = VK_STRUCTURE_TYPE_COMMAND_BUFFER_SUBMIT_INFO,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SYNCHRONIZATION_2_FEATURES_KHR = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SYNCHRONIZATION_2_FEATURES,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ZERO_INITIALIZE_WORKGROUP_MEMORY_FEATURES_KHR = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ZERO_INITIALIZE_WORKGROUP_MEMORY_FEATURES,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_ROBUSTNESS_FEATURES_EXT = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_ROBUSTNESS_FEATURES,
	VK_STRUCTURE_TYPE_COPY_BUFFER_INFO_2_KHR = VK_STRUCTURE_TYPE_COPY_BUFFER_INFO_2,
	VK_STRUCTURE_TYPE_COPY_IMAGE_INFO_2_KHR = VK_STRUCTURE_TYPE_COPY_IMAGE_INFO_2,
	VK_STRUCTURE_TYPE_COPY_BUFFER_TO_IMAGE_INFO_2_KHR = VK_STRUCTURE_TYPE_COPY_BUFFER_TO_IMAGE_INFO_2,
	VK_STRUCTURE_TYPE_COPY_IMAGE_TO_BUFFER_INFO_2_KHR = VK_STRUCTURE_TYPE_COPY_IMAGE_TO_BUFFER_INFO_2,
	VK_STRUCTURE_TYPE_BLIT_IMAGE_INFO_2_KHR = VK_STRUCTURE_TYPE_BLIT_IMAGE_INFO_2,
	VK_STRUCTURE_TYPE_RESOLVE_IMAGE_INFO_2_KHR = VK_STRUCTURE_TYPE_RESOLVE_IMAGE_INFO_2,
	VK_STRUCTURE_TYPE_BUFFER_COPY_2_KHR = VK_STRUCTURE_TYPE_BUFFER_COPY_2,
	VK_STRUCTURE_TYPE_IMAGE_COPY_2_KHR = VK_STRUCTURE_TYPE_IMAGE_COPY_2,
	VK_STRUCTURE_TYPE_IMAGE_BLIT_2_KHR = VK_STRUCTURE_TYPE_IMAGE_BLIT_2,
	VK_STRUCTURE_TYPE_BUFFER_IMAGE_COPY_2_KHR = VK_STRUCTURE_TYPE_BUFFER_IMAGE_COPY_2,
	VK_STRUCTURE_TYPE_IMAGE_RESOLVE_2_KHR = VK_STRUCTURE_TYPE_IMAGE_RESOLVE_2,
	VK_STRUCTURE_TYPE_FORMAT_PROPERTIES_3_KHR = VK_STRUCTURE_TYPE_FORMAT_PROPERTIES_3,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_GLOBAL_PRIORITY_QUERY_FEATURES_EXT = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_GLOBAL_PRIORITY_QUERY_FEATURES_KHR,
	VK_STRUCTURE_TYPE_QUEUE_FAMILY_GLOBAL_PRIORITY_PROPERTIES_EXT = VK_STRUCTURE_TYPE_QUEUE_FAMILY_GLOBAL_PRIORITY_PROPERTIES_KHR,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_4_FEATURES_KHR = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_4_FEATURES,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_4_PROPERTIES_KHR = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_4_PROPERTIES,
	VK_STRUCTURE_TYPE_DEVICE_BUFFER_MEMORY_REQUIREMENTS_KHR = VK_STRUCTURE_TYPE_DEVICE_BUFFER_MEMORY_REQUIREMENTS,
	VK_STRUCTURE_TYPE_DEVICE_IMAGE_MEMORY_REQUIREMENTS_KHR = VK_STRUCTURE_TYPE_DEVICE_IMAGE_MEMORY_REQUIREMENTS,
	VK_STRUCTURE_TYPE_MAX_ENUM = 0x7FFFFFFF,
}
enum : VkStructureType {
	VK_STRUCTURE_TYPE_APPLICATION_INFO = VkStructureType.VK_STRUCTURE_TYPE_APPLICATION_INFO,
	VK_STRUCTURE_TYPE_INSTANCE_CREATE_INFO = VkStructureType.VK_STRUCTURE_TYPE_INSTANCE_CREATE_INFO,
	VK_STRUCTURE_TYPE_DEVICE_QUEUE_CREATE_INFO = VkStructureType.VK_STRUCTURE_TYPE_DEVICE_QUEUE_CREATE_INFO,
	VK_STRUCTURE_TYPE_DEVICE_CREATE_INFO = VkStructureType.VK_STRUCTURE_TYPE_DEVICE_CREATE_INFO,
	VK_STRUCTURE_TYPE_SUBMIT_INFO = VkStructureType.VK_STRUCTURE_TYPE_SUBMIT_INFO,
	VK_STRUCTURE_TYPE_MEMORY_ALLOCATE_INFO = VkStructureType.VK_STRUCTURE_TYPE_MEMORY_ALLOCATE_INFO,
	VK_STRUCTURE_TYPE_MAPPED_MEMORY_RANGE = VkStructureType.VK_STRUCTURE_TYPE_MAPPED_MEMORY_RANGE,
	VK_STRUCTURE_TYPE_BIND_SPARSE_INFO = VkStructureType.VK_STRUCTURE_TYPE_BIND_SPARSE_INFO,
	VK_STRUCTURE_TYPE_FENCE_CREATE_INFO = VkStructureType.VK_STRUCTURE_TYPE_FENCE_CREATE_INFO,
	VK_STRUCTURE_TYPE_SEMAPHORE_CREATE_INFO = VkStructureType.VK_STRUCTURE_TYPE_SEMAPHORE_CREATE_INFO,
	VK_STRUCTURE_TYPE_EVENT_CREATE_INFO = VkStructureType.VK_STRUCTURE_TYPE_EVENT_CREATE_INFO,
	VK_STRUCTURE_TYPE_QUERY_POOL_CREATE_INFO = VkStructureType.VK_STRUCTURE_TYPE_QUERY_POOL_CREATE_INFO,
	VK_STRUCTURE_TYPE_BUFFER_CREATE_INFO = VkStructureType.VK_STRUCTURE_TYPE_BUFFER_CREATE_INFO,
	VK_STRUCTURE_TYPE_BUFFER_VIEW_CREATE_INFO = VkStructureType.VK_STRUCTURE_TYPE_BUFFER_VIEW_CREATE_INFO,
	VK_STRUCTURE_TYPE_IMAGE_CREATE_INFO = VkStructureType.VK_STRUCTURE_TYPE_IMAGE_CREATE_INFO,
	VK_STRUCTURE_TYPE_IMAGE_VIEW_CREATE_INFO = VkStructureType.VK_STRUCTURE_TYPE_IMAGE_VIEW_CREATE_INFO,
	VK_STRUCTURE_TYPE_SHADER_MODULE_CREATE_INFO = VkStructureType.VK_STRUCTURE_TYPE_SHADER_MODULE_CREATE_INFO,
	VK_STRUCTURE_TYPE_PIPELINE_CACHE_CREATE_INFO = VkStructureType.VK_STRUCTURE_TYPE_PIPELINE_CACHE_CREATE_INFO,
	VK_STRUCTURE_TYPE_PIPELINE_SHADER_STAGE_CREATE_INFO = VkStructureType.VK_STRUCTURE_TYPE_PIPELINE_SHADER_STAGE_CREATE_INFO,
	VK_STRUCTURE_TYPE_PIPELINE_VERTEX_INPUT_STATE_CREATE_INFO = VkStructureType.VK_STRUCTURE_TYPE_PIPELINE_VERTEX_INPUT_STATE_CREATE_INFO,
	VK_STRUCTURE_TYPE_PIPELINE_INPUT_ASSEMBLY_STATE_CREATE_INFO = VkStructureType.VK_STRUCTURE_TYPE_PIPELINE_INPUT_ASSEMBLY_STATE_CREATE_INFO,
	VK_STRUCTURE_TYPE_PIPELINE_TESSELLATION_STATE_CREATE_INFO = VkStructureType.VK_STRUCTURE_TYPE_PIPELINE_TESSELLATION_STATE_CREATE_INFO,
	VK_STRUCTURE_TYPE_PIPELINE_VIEWPORT_STATE_CREATE_INFO = VkStructureType.VK_STRUCTURE_TYPE_PIPELINE_VIEWPORT_STATE_CREATE_INFO,
	VK_STRUCTURE_TYPE_PIPELINE_RASTERIZATION_STATE_CREATE_INFO = VkStructureType.VK_STRUCTURE_TYPE_PIPELINE_RASTERIZATION_STATE_CREATE_INFO,
	VK_STRUCTURE_TYPE_PIPELINE_MULTISAMPLE_STATE_CREATE_INFO = VkStructureType.VK_STRUCTURE_TYPE_PIPELINE_MULTISAMPLE_STATE_CREATE_INFO,
	VK_STRUCTURE_TYPE_PIPELINE_DEPTH_STENCIL_STATE_CREATE_INFO = VkStructureType.VK_STRUCTURE_TYPE_PIPELINE_DEPTH_STENCIL_STATE_CREATE_INFO,
	VK_STRUCTURE_TYPE_PIPELINE_COLOR_BLEND_STATE_CREATE_INFO = VkStructureType.VK_STRUCTURE_TYPE_PIPELINE_COLOR_BLEND_STATE_CREATE_INFO,
	VK_STRUCTURE_TYPE_PIPELINE_DYNAMIC_STATE_CREATE_INFO = VkStructureType.VK_STRUCTURE_TYPE_PIPELINE_DYNAMIC_STATE_CREATE_INFO,
	VK_STRUCTURE_TYPE_GRAPHICS_PIPELINE_CREATE_INFO = VkStructureType.VK_STRUCTURE_TYPE_GRAPHICS_PIPELINE_CREATE_INFO,
	VK_STRUCTURE_TYPE_COMPUTE_PIPELINE_CREATE_INFO = VkStructureType.VK_STRUCTURE_TYPE_COMPUTE_PIPELINE_CREATE_INFO,
	VK_STRUCTURE_TYPE_PIPELINE_LAYOUT_CREATE_INFO = VkStructureType.VK_STRUCTURE_TYPE_PIPELINE_LAYOUT_CREATE_INFO,
	VK_STRUCTURE_TYPE_SAMPLER_CREATE_INFO = VkStructureType.VK_STRUCTURE_TYPE_SAMPLER_CREATE_INFO,
	VK_STRUCTURE_TYPE_DESCRIPTOR_SET_LAYOUT_CREATE_INFO = VkStructureType.VK_STRUCTURE_TYPE_DESCRIPTOR_SET_LAYOUT_CREATE_INFO,
	VK_STRUCTURE_TYPE_DESCRIPTOR_POOL_CREATE_INFO = VkStructureType.VK_STRUCTURE_TYPE_DESCRIPTOR_POOL_CREATE_INFO,
	VK_STRUCTURE_TYPE_DESCRIPTOR_SET_ALLOCATE_INFO = VkStructureType.VK_STRUCTURE_TYPE_DESCRIPTOR_SET_ALLOCATE_INFO,
	VK_STRUCTURE_TYPE_WRITE_DESCRIPTOR_SET = VkStructureType.VK_STRUCTURE_TYPE_WRITE_DESCRIPTOR_SET,
	VK_STRUCTURE_TYPE_COPY_DESCRIPTOR_SET = VkStructureType.VK_STRUCTURE_TYPE_COPY_DESCRIPTOR_SET,
	VK_STRUCTURE_TYPE_FRAMEBUFFER_CREATE_INFO = VkStructureType.VK_STRUCTURE_TYPE_FRAMEBUFFER_CREATE_INFO,
	VK_STRUCTURE_TYPE_RENDER_PASS_CREATE_INFO = VkStructureType.VK_STRUCTURE_TYPE_RENDER_PASS_CREATE_INFO,
	VK_STRUCTURE_TYPE_COMMAND_POOL_CREATE_INFO = VkStructureType.VK_STRUCTURE_TYPE_COMMAND_POOL_CREATE_INFO,
	VK_STRUCTURE_TYPE_COMMAND_BUFFER_ALLOCATE_INFO = VkStructureType.VK_STRUCTURE_TYPE_COMMAND_BUFFER_ALLOCATE_INFO,
	VK_STRUCTURE_TYPE_COMMAND_BUFFER_INHERITANCE_INFO = VkStructureType.VK_STRUCTURE_TYPE_COMMAND_BUFFER_INHERITANCE_INFO,
	VK_STRUCTURE_TYPE_COMMAND_BUFFER_BEGIN_INFO = VkStructureType.VK_STRUCTURE_TYPE_COMMAND_BUFFER_BEGIN_INFO,
	VK_STRUCTURE_TYPE_RENDER_PASS_BEGIN_INFO = VkStructureType.VK_STRUCTURE_TYPE_RENDER_PASS_BEGIN_INFO,
	VK_STRUCTURE_TYPE_BUFFER_MEMORY_BARRIER = VkStructureType.VK_STRUCTURE_TYPE_BUFFER_MEMORY_BARRIER,
	VK_STRUCTURE_TYPE_IMAGE_MEMORY_BARRIER = VkStructureType.VK_STRUCTURE_TYPE_IMAGE_MEMORY_BARRIER,
	VK_STRUCTURE_TYPE_MEMORY_BARRIER = VkStructureType.VK_STRUCTURE_TYPE_MEMORY_BARRIER,
	VK_STRUCTURE_TYPE_LOADER_INSTANCE_CREATE_INFO = VkStructureType.VK_STRUCTURE_TYPE_LOADER_INSTANCE_CREATE_INFO,
	VK_STRUCTURE_TYPE_LOADER_DEVICE_CREATE_INFO = VkStructureType.VK_STRUCTURE_TYPE_LOADER_DEVICE_CREATE_INFO,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SUBGROUP_PROPERTIES = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SUBGROUP_PROPERTIES,
	VK_STRUCTURE_TYPE_BIND_BUFFER_MEMORY_INFO = VkStructureType.VK_STRUCTURE_TYPE_BIND_BUFFER_MEMORY_INFO,
	VK_STRUCTURE_TYPE_BIND_IMAGE_MEMORY_INFO = VkStructureType.VK_STRUCTURE_TYPE_BIND_IMAGE_MEMORY_INFO,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_16BIT_STORAGE_FEATURES = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_16BIT_STORAGE_FEATURES,
	VK_STRUCTURE_TYPE_MEMORY_DEDICATED_REQUIREMENTS = VkStructureType.VK_STRUCTURE_TYPE_MEMORY_DEDICATED_REQUIREMENTS,
	VK_STRUCTURE_TYPE_MEMORY_DEDICATED_ALLOCATE_INFO = VkStructureType.VK_STRUCTURE_TYPE_MEMORY_DEDICATED_ALLOCATE_INFO,
	VK_STRUCTURE_TYPE_MEMORY_ALLOCATE_FLAGS_INFO = VkStructureType.VK_STRUCTURE_TYPE_MEMORY_ALLOCATE_FLAGS_INFO,
	VK_STRUCTURE_TYPE_DEVICE_GROUP_RENDER_PASS_BEGIN_INFO = VkStructureType.VK_STRUCTURE_TYPE_DEVICE_GROUP_RENDER_PASS_BEGIN_INFO,
	VK_STRUCTURE_TYPE_DEVICE_GROUP_COMMAND_BUFFER_BEGIN_INFO = VkStructureType.VK_STRUCTURE_TYPE_DEVICE_GROUP_COMMAND_BUFFER_BEGIN_INFO,
	VK_STRUCTURE_TYPE_DEVICE_GROUP_SUBMIT_INFO = VkStructureType.VK_STRUCTURE_TYPE_DEVICE_GROUP_SUBMIT_INFO,
	VK_STRUCTURE_TYPE_DEVICE_GROUP_BIND_SPARSE_INFO = VkStructureType.VK_STRUCTURE_TYPE_DEVICE_GROUP_BIND_SPARSE_INFO,
	VK_STRUCTURE_TYPE_BIND_BUFFER_MEMORY_DEVICE_GROUP_INFO = VkStructureType.VK_STRUCTURE_TYPE_BIND_BUFFER_MEMORY_DEVICE_GROUP_INFO,
	VK_STRUCTURE_TYPE_BIND_IMAGE_MEMORY_DEVICE_GROUP_INFO = VkStructureType.VK_STRUCTURE_TYPE_BIND_IMAGE_MEMORY_DEVICE_GROUP_INFO,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_GROUP_PROPERTIES = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_GROUP_PROPERTIES,
	VK_STRUCTURE_TYPE_DEVICE_GROUP_DEVICE_CREATE_INFO = VkStructureType.VK_STRUCTURE_TYPE_DEVICE_GROUP_DEVICE_CREATE_INFO,
	VK_STRUCTURE_TYPE_BUFFER_MEMORY_REQUIREMENTS_INFO_2 = VkStructureType.VK_STRUCTURE_TYPE_BUFFER_MEMORY_REQUIREMENTS_INFO_2,
	VK_STRUCTURE_TYPE_IMAGE_MEMORY_REQUIREMENTS_INFO_2 = VkStructureType.VK_STRUCTURE_TYPE_IMAGE_MEMORY_REQUIREMENTS_INFO_2,
	VK_STRUCTURE_TYPE_IMAGE_SPARSE_MEMORY_REQUIREMENTS_INFO_2 = VkStructureType.VK_STRUCTURE_TYPE_IMAGE_SPARSE_MEMORY_REQUIREMENTS_INFO_2,
	VK_STRUCTURE_TYPE_MEMORY_REQUIREMENTS_2 = VkStructureType.VK_STRUCTURE_TYPE_MEMORY_REQUIREMENTS_2,
	VK_STRUCTURE_TYPE_SPARSE_IMAGE_MEMORY_REQUIREMENTS_2 = VkStructureType.VK_STRUCTURE_TYPE_SPARSE_IMAGE_MEMORY_REQUIREMENTS_2,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FEATURES_2 = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FEATURES_2,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PROPERTIES_2 = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PROPERTIES_2,
	VK_STRUCTURE_TYPE_FORMAT_PROPERTIES_2 = VkStructureType.VK_STRUCTURE_TYPE_FORMAT_PROPERTIES_2,
	VK_STRUCTURE_TYPE_IMAGE_FORMAT_PROPERTIES_2 = VkStructureType.VK_STRUCTURE_TYPE_IMAGE_FORMAT_PROPERTIES_2,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_FORMAT_INFO_2 = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_FORMAT_INFO_2,
	VK_STRUCTURE_TYPE_QUEUE_FAMILY_PROPERTIES_2 = VkStructureType.VK_STRUCTURE_TYPE_QUEUE_FAMILY_PROPERTIES_2,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MEMORY_PROPERTIES_2 = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MEMORY_PROPERTIES_2,
	VK_STRUCTURE_TYPE_SPARSE_IMAGE_FORMAT_PROPERTIES_2 = VkStructureType.VK_STRUCTURE_TYPE_SPARSE_IMAGE_FORMAT_PROPERTIES_2,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SPARSE_IMAGE_FORMAT_INFO_2 = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SPARSE_IMAGE_FORMAT_INFO_2,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_POINT_CLIPPING_PROPERTIES = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_POINT_CLIPPING_PROPERTIES,
	VK_STRUCTURE_TYPE_RENDER_PASS_INPUT_ATTACHMENT_ASPECT_CREATE_INFO = VkStructureType.VK_STRUCTURE_TYPE_RENDER_PASS_INPUT_ATTACHMENT_ASPECT_CREATE_INFO,
	VK_STRUCTURE_TYPE_IMAGE_VIEW_USAGE_CREATE_INFO = VkStructureType.VK_STRUCTURE_TYPE_IMAGE_VIEW_USAGE_CREATE_INFO,
	VK_STRUCTURE_TYPE_PIPELINE_TESSELLATION_DOMAIN_ORIGIN_STATE_CREATE_INFO = VkStructureType.VK_STRUCTURE_TYPE_PIPELINE_TESSELLATION_DOMAIN_ORIGIN_STATE_CREATE_INFO,
	VK_STRUCTURE_TYPE_RENDER_PASS_MULTIVIEW_CREATE_INFO = VkStructureType.VK_STRUCTURE_TYPE_RENDER_PASS_MULTIVIEW_CREATE_INFO,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MULTIVIEW_FEATURES = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MULTIVIEW_FEATURES,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MULTIVIEW_PROPERTIES = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MULTIVIEW_PROPERTIES,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VARIABLE_POINTERS_FEATURES = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VARIABLE_POINTERS_FEATURES,
	VK_STRUCTURE_TYPE_PROTECTED_SUBMIT_INFO = VkStructureType.VK_STRUCTURE_TYPE_PROTECTED_SUBMIT_INFO,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PROTECTED_MEMORY_FEATURES = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PROTECTED_MEMORY_FEATURES,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PROTECTED_MEMORY_PROPERTIES = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PROTECTED_MEMORY_PROPERTIES,
	VK_STRUCTURE_TYPE_DEVICE_QUEUE_INFO_2 = VkStructureType.VK_STRUCTURE_TYPE_DEVICE_QUEUE_INFO_2,
	VK_STRUCTURE_TYPE_SAMPLER_YCBCR_CONVERSION_CREATE_INFO = VkStructureType.VK_STRUCTURE_TYPE_SAMPLER_YCBCR_CONVERSION_CREATE_INFO,
	VK_STRUCTURE_TYPE_SAMPLER_YCBCR_CONVERSION_INFO = VkStructureType.VK_STRUCTURE_TYPE_SAMPLER_YCBCR_CONVERSION_INFO,
	VK_STRUCTURE_TYPE_BIND_IMAGE_PLANE_MEMORY_INFO = VkStructureType.VK_STRUCTURE_TYPE_BIND_IMAGE_PLANE_MEMORY_INFO,
	VK_STRUCTURE_TYPE_IMAGE_PLANE_MEMORY_REQUIREMENTS_INFO = VkStructureType.VK_STRUCTURE_TYPE_IMAGE_PLANE_MEMORY_REQUIREMENTS_INFO,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SAMPLER_YCBCR_CONVERSION_FEATURES = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SAMPLER_YCBCR_CONVERSION_FEATURES,
	VK_STRUCTURE_TYPE_SAMPLER_YCBCR_CONVERSION_IMAGE_FORMAT_PROPERTIES = VkStructureType.VK_STRUCTURE_TYPE_SAMPLER_YCBCR_CONVERSION_IMAGE_FORMAT_PROPERTIES,
	VK_STRUCTURE_TYPE_DESCRIPTOR_UPDATE_TEMPLATE_CREATE_INFO = VkStructureType.VK_STRUCTURE_TYPE_DESCRIPTOR_UPDATE_TEMPLATE_CREATE_INFO,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_EXTERNAL_IMAGE_FORMAT_INFO = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_EXTERNAL_IMAGE_FORMAT_INFO,
	VK_STRUCTURE_TYPE_EXTERNAL_IMAGE_FORMAT_PROPERTIES = VkStructureType.VK_STRUCTURE_TYPE_EXTERNAL_IMAGE_FORMAT_PROPERTIES,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_EXTERNAL_BUFFER_INFO = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_EXTERNAL_BUFFER_INFO,
	VK_STRUCTURE_TYPE_EXTERNAL_BUFFER_PROPERTIES = VkStructureType.VK_STRUCTURE_TYPE_EXTERNAL_BUFFER_PROPERTIES,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ID_PROPERTIES = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ID_PROPERTIES,
	VK_STRUCTURE_TYPE_EXTERNAL_MEMORY_BUFFER_CREATE_INFO = VkStructureType.VK_STRUCTURE_TYPE_EXTERNAL_MEMORY_BUFFER_CREATE_INFO,
	VK_STRUCTURE_TYPE_EXTERNAL_MEMORY_IMAGE_CREATE_INFO = VkStructureType.VK_STRUCTURE_TYPE_EXTERNAL_MEMORY_IMAGE_CREATE_INFO,
	VK_STRUCTURE_TYPE_EXPORT_MEMORY_ALLOCATE_INFO = VkStructureType.VK_STRUCTURE_TYPE_EXPORT_MEMORY_ALLOCATE_INFO,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_EXTERNAL_FENCE_INFO = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_EXTERNAL_FENCE_INFO,
	VK_STRUCTURE_TYPE_EXTERNAL_FENCE_PROPERTIES = VkStructureType.VK_STRUCTURE_TYPE_EXTERNAL_FENCE_PROPERTIES,
	VK_STRUCTURE_TYPE_EXPORT_FENCE_CREATE_INFO = VkStructureType.VK_STRUCTURE_TYPE_EXPORT_FENCE_CREATE_INFO,
	VK_STRUCTURE_TYPE_EXPORT_SEMAPHORE_CREATE_INFO = VkStructureType.VK_STRUCTURE_TYPE_EXPORT_SEMAPHORE_CREATE_INFO,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_EXTERNAL_SEMAPHORE_INFO = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_EXTERNAL_SEMAPHORE_INFO,
	VK_STRUCTURE_TYPE_EXTERNAL_SEMAPHORE_PROPERTIES = VkStructureType.VK_STRUCTURE_TYPE_EXTERNAL_SEMAPHORE_PROPERTIES,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_3_PROPERTIES = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_3_PROPERTIES,
	VK_STRUCTURE_TYPE_DESCRIPTOR_SET_LAYOUT_SUPPORT = VkStructureType.VK_STRUCTURE_TYPE_DESCRIPTOR_SET_LAYOUT_SUPPORT,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_DRAW_PARAMETERS_FEATURES = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_DRAW_PARAMETERS_FEATURES,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VULKAN_1_1_FEATURES = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VULKAN_1_1_FEATURES,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VULKAN_1_1_PROPERTIES = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VULKAN_1_1_PROPERTIES,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VULKAN_1_2_FEATURES = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VULKAN_1_2_FEATURES,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VULKAN_1_2_PROPERTIES = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VULKAN_1_2_PROPERTIES,
	VK_STRUCTURE_TYPE_IMAGE_FORMAT_LIST_CREATE_INFO = VkStructureType.VK_STRUCTURE_TYPE_IMAGE_FORMAT_LIST_CREATE_INFO,
	VK_STRUCTURE_TYPE_ATTACHMENT_DESCRIPTION_2 = VkStructureType.VK_STRUCTURE_TYPE_ATTACHMENT_DESCRIPTION_2,
	VK_STRUCTURE_TYPE_ATTACHMENT_REFERENCE_2 = VkStructureType.VK_STRUCTURE_TYPE_ATTACHMENT_REFERENCE_2,
	VK_STRUCTURE_TYPE_SUBPASS_DESCRIPTION_2 = VkStructureType.VK_STRUCTURE_TYPE_SUBPASS_DESCRIPTION_2,
	VK_STRUCTURE_TYPE_SUBPASS_DEPENDENCY_2 = VkStructureType.VK_STRUCTURE_TYPE_SUBPASS_DEPENDENCY_2,
	VK_STRUCTURE_TYPE_RENDER_PASS_CREATE_INFO_2 = VkStructureType.VK_STRUCTURE_TYPE_RENDER_PASS_CREATE_INFO_2,
	VK_STRUCTURE_TYPE_SUBPASS_BEGIN_INFO = VkStructureType.VK_STRUCTURE_TYPE_SUBPASS_BEGIN_INFO,
	VK_STRUCTURE_TYPE_SUBPASS_END_INFO = VkStructureType.VK_STRUCTURE_TYPE_SUBPASS_END_INFO,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_8BIT_STORAGE_FEATURES = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_8BIT_STORAGE_FEATURES,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DRIVER_PROPERTIES = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DRIVER_PROPERTIES,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_ATOMIC_INT64_FEATURES = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_ATOMIC_INT64_FEATURES,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_FLOAT16_INT8_FEATURES = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_FLOAT16_INT8_FEATURES,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FLOAT_CONTROLS_PROPERTIES = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FLOAT_CONTROLS_PROPERTIES,
	VK_STRUCTURE_TYPE_DESCRIPTOR_SET_LAYOUT_BINDING_FLAGS_CREATE_INFO = VkStructureType.VK_STRUCTURE_TYPE_DESCRIPTOR_SET_LAYOUT_BINDING_FLAGS_CREATE_INFO,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DESCRIPTOR_INDEXING_FEATURES = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DESCRIPTOR_INDEXING_FEATURES,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DESCRIPTOR_INDEXING_PROPERTIES = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DESCRIPTOR_INDEXING_PROPERTIES,
	VK_STRUCTURE_TYPE_DESCRIPTOR_SET_VARIABLE_DESCRIPTOR_COUNT_ALLOCATE_INFO = VkStructureType.VK_STRUCTURE_TYPE_DESCRIPTOR_SET_VARIABLE_DESCRIPTOR_COUNT_ALLOCATE_INFO,
	VK_STRUCTURE_TYPE_DESCRIPTOR_SET_VARIABLE_DESCRIPTOR_COUNT_LAYOUT_SUPPORT = VkStructureType.VK_STRUCTURE_TYPE_DESCRIPTOR_SET_VARIABLE_DESCRIPTOR_COUNT_LAYOUT_SUPPORT,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DEPTH_STENCIL_RESOLVE_PROPERTIES = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DEPTH_STENCIL_RESOLVE_PROPERTIES,
	VK_STRUCTURE_TYPE_SUBPASS_DESCRIPTION_DEPTH_STENCIL_RESOLVE = VkStructureType.VK_STRUCTURE_TYPE_SUBPASS_DESCRIPTION_DEPTH_STENCIL_RESOLVE,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SCALAR_BLOCK_LAYOUT_FEATURES = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SCALAR_BLOCK_LAYOUT_FEATURES,
	VK_STRUCTURE_TYPE_IMAGE_STENCIL_USAGE_CREATE_INFO = VkStructureType.VK_STRUCTURE_TYPE_IMAGE_STENCIL_USAGE_CREATE_INFO,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SAMPLER_FILTER_MINMAX_PROPERTIES = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SAMPLER_FILTER_MINMAX_PROPERTIES,
	VK_STRUCTURE_TYPE_SAMPLER_REDUCTION_MODE_CREATE_INFO = VkStructureType.VK_STRUCTURE_TYPE_SAMPLER_REDUCTION_MODE_CREATE_INFO,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VULKAN_MEMORY_MODEL_FEATURES = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VULKAN_MEMORY_MODEL_FEATURES,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGELESS_FRAMEBUFFER_FEATURES = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGELESS_FRAMEBUFFER_FEATURES,
	VK_STRUCTURE_TYPE_FRAMEBUFFER_ATTACHMENTS_CREATE_INFO = VkStructureType.VK_STRUCTURE_TYPE_FRAMEBUFFER_ATTACHMENTS_CREATE_INFO,
	VK_STRUCTURE_TYPE_FRAMEBUFFER_ATTACHMENT_IMAGE_INFO = VkStructureType.VK_STRUCTURE_TYPE_FRAMEBUFFER_ATTACHMENT_IMAGE_INFO,
	VK_STRUCTURE_TYPE_RENDER_PASS_ATTACHMENT_BEGIN_INFO = VkStructureType.VK_STRUCTURE_TYPE_RENDER_PASS_ATTACHMENT_BEGIN_INFO,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_UNIFORM_BUFFER_STANDARD_LAYOUT_FEATURES = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_UNIFORM_BUFFER_STANDARD_LAYOUT_FEATURES,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_SUBGROUP_EXTENDED_TYPES_FEATURES = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_SUBGROUP_EXTENDED_TYPES_FEATURES,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SEPARATE_DEPTH_STENCIL_LAYOUTS_FEATURES = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SEPARATE_DEPTH_STENCIL_LAYOUTS_FEATURES,
	VK_STRUCTURE_TYPE_ATTACHMENT_REFERENCE_STENCIL_LAYOUT = VkStructureType.VK_STRUCTURE_TYPE_ATTACHMENT_REFERENCE_STENCIL_LAYOUT,
	VK_STRUCTURE_TYPE_ATTACHMENT_DESCRIPTION_STENCIL_LAYOUT = VkStructureType.VK_STRUCTURE_TYPE_ATTACHMENT_DESCRIPTION_STENCIL_LAYOUT,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_HOST_QUERY_RESET_FEATURES = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_HOST_QUERY_RESET_FEATURES,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TIMELINE_SEMAPHORE_FEATURES = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TIMELINE_SEMAPHORE_FEATURES,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TIMELINE_SEMAPHORE_PROPERTIES = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TIMELINE_SEMAPHORE_PROPERTIES,
	VK_STRUCTURE_TYPE_SEMAPHORE_TYPE_CREATE_INFO = VkStructureType.VK_STRUCTURE_TYPE_SEMAPHORE_TYPE_CREATE_INFO,
	VK_STRUCTURE_TYPE_TIMELINE_SEMAPHORE_SUBMIT_INFO = VkStructureType.VK_STRUCTURE_TYPE_TIMELINE_SEMAPHORE_SUBMIT_INFO,
	VK_STRUCTURE_TYPE_SEMAPHORE_WAIT_INFO = VkStructureType.VK_STRUCTURE_TYPE_SEMAPHORE_WAIT_INFO,
	VK_STRUCTURE_TYPE_SEMAPHORE_SIGNAL_INFO = VkStructureType.VK_STRUCTURE_TYPE_SEMAPHORE_SIGNAL_INFO,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_BUFFER_DEVICE_ADDRESS_FEATURES = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_BUFFER_DEVICE_ADDRESS_FEATURES,
	VK_STRUCTURE_TYPE_BUFFER_DEVICE_ADDRESS_INFO = VkStructureType.VK_STRUCTURE_TYPE_BUFFER_DEVICE_ADDRESS_INFO,
	VK_STRUCTURE_TYPE_BUFFER_OPAQUE_CAPTURE_ADDRESS_CREATE_INFO = VkStructureType.VK_STRUCTURE_TYPE_BUFFER_OPAQUE_CAPTURE_ADDRESS_CREATE_INFO,
	VK_STRUCTURE_TYPE_MEMORY_OPAQUE_CAPTURE_ADDRESS_ALLOCATE_INFO = VkStructureType.VK_STRUCTURE_TYPE_MEMORY_OPAQUE_CAPTURE_ADDRESS_ALLOCATE_INFO,
	VK_STRUCTURE_TYPE_DEVICE_MEMORY_OPAQUE_CAPTURE_ADDRESS_INFO = VkStructureType.VK_STRUCTURE_TYPE_DEVICE_MEMORY_OPAQUE_CAPTURE_ADDRESS_INFO,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VULKAN_1_3_FEATURES = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VULKAN_1_3_FEATURES,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VULKAN_1_3_PROPERTIES = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VULKAN_1_3_PROPERTIES,
	VK_STRUCTURE_TYPE_PIPELINE_CREATION_FEEDBACK_CREATE_INFO = VkStructureType.VK_STRUCTURE_TYPE_PIPELINE_CREATION_FEEDBACK_CREATE_INFO,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_TERMINATE_INVOCATION_FEATURES = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_TERMINATE_INVOCATION_FEATURES,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TOOL_PROPERTIES = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TOOL_PROPERTIES,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_DEMOTE_TO_HELPER_INVOCATION_FEATURES = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_DEMOTE_TO_HELPER_INVOCATION_FEATURES,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PRIVATE_DATA_FEATURES = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PRIVATE_DATA_FEATURES,
	VK_STRUCTURE_TYPE_DEVICE_PRIVATE_DATA_CREATE_INFO = VkStructureType.VK_STRUCTURE_TYPE_DEVICE_PRIVATE_DATA_CREATE_INFO,
	VK_STRUCTURE_TYPE_PRIVATE_DATA_SLOT_CREATE_INFO = VkStructureType.VK_STRUCTURE_TYPE_PRIVATE_DATA_SLOT_CREATE_INFO,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PIPELINE_CREATION_CACHE_CONTROL_FEATURES = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PIPELINE_CREATION_CACHE_CONTROL_FEATURES,
	VK_STRUCTURE_TYPE_MEMORY_BARRIER_2 = VkStructureType.VK_STRUCTURE_TYPE_MEMORY_BARRIER_2,
	VK_STRUCTURE_TYPE_BUFFER_MEMORY_BARRIER_2 = VkStructureType.VK_STRUCTURE_TYPE_BUFFER_MEMORY_BARRIER_2,
	VK_STRUCTURE_TYPE_IMAGE_MEMORY_BARRIER_2 = VkStructureType.VK_STRUCTURE_TYPE_IMAGE_MEMORY_BARRIER_2,
	VK_STRUCTURE_TYPE_DEPENDENCY_INFO = VkStructureType.VK_STRUCTURE_TYPE_DEPENDENCY_INFO,
	VK_STRUCTURE_TYPE_SUBMIT_INFO_2 = VkStructureType.VK_STRUCTURE_TYPE_SUBMIT_INFO_2,
	VK_STRUCTURE_TYPE_SEMAPHORE_SUBMIT_INFO = VkStructureType.VK_STRUCTURE_TYPE_SEMAPHORE_SUBMIT_INFO,
	VK_STRUCTURE_TYPE_COMMAND_BUFFER_SUBMIT_INFO = VkStructureType.VK_STRUCTURE_TYPE_COMMAND_BUFFER_SUBMIT_INFO,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SYNCHRONIZATION_2_FEATURES = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SYNCHRONIZATION_2_FEATURES,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ZERO_INITIALIZE_WORKGROUP_MEMORY_FEATURES = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ZERO_INITIALIZE_WORKGROUP_MEMORY_FEATURES,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_ROBUSTNESS_FEATURES = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_ROBUSTNESS_FEATURES,
	VK_STRUCTURE_TYPE_COPY_BUFFER_INFO_2 = VkStructureType.VK_STRUCTURE_TYPE_COPY_BUFFER_INFO_2,
	VK_STRUCTURE_TYPE_COPY_IMAGE_INFO_2 = VkStructureType.VK_STRUCTURE_TYPE_COPY_IMAGE_INFO_2,
	VK_STRUCTURE_TYPE_COPY_BUFFER_TO_IMAGE_INFO_2 = VkStructureType.VK_STRUCTURE_TYPE_COPY_BUFFER_TO_IMAGE_INFO_2,
	VK_STRUCTURE_TYPE_COPY_IMAGE_TO_BUFFER_INFO_2 = VkStructureType.VK_STRUCTURE_TYPE_COPY_IMAGE_TO_BUFFER_INFO_2,
	VK_STRUCTURE_TYPE_BLIT_IMAGE_INFO_2 = VkStructureType.VK_STRUCTURE_TYPE_BLIT_IMAGE_INFO_2,
	VK_STRUCTURE_TYPE_RESOLVE_IMAGE_INFO_2 = VkStructureType.VK_STRUCTURE_TYPE_RESOLVE_IMAGE_INFO_2,
	VK_STRUCTURE_TYPE_BUFFER_COPY_2 = VkStructureType.VK_STRUCTURE_TYPE_BUFFER_COPY_2,
	VK_STRUCTURE_TYPE_IMAGE_COPY_2 = VkStructureType.VK_STRUCTURE_TYPE_IMAGE_COPY_2,
	VK_STRUCTURE_TYPE_IMAGE_BLIT_2 = VkStructureType.VK_STRUCTURE_TYPE_IMAGE_BLIT_2,
	VK_STRUCTURE_TYPE_BUFFER_IMAGE_COPY_2 = VkStructureType.VK_STRUCTURE_TYPE_BUFFER_IMAGE_COPY_2,
	VK_STRUCTURE_TYPE_IMAGE_RESOLVE_2 = VkStructureType.VK_STRUCTURE_TYPE_IMAGE_RESOLVE_2,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SUBGROUP_SIZE_CONTROL_PROPERTIES = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SUBGROUP_SIZE_CONTROL_PROPERTIES,
	VK_STRUCTURE_TYPE_PIPELINE_SHADER_STAGE_REQUIRED_SUBGROUP_SIZE_CREATE_INFO = VkStructureType.VK_STRUCTURE_TYPE_PIPELINE_SHADER_STAGE_REQUIRED_SUBGROUP_SIZE_CREATE_INFO,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SUBGROUP_SIZE_CONTROL_FEATURES = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SUBGROUP_SIZE_CONTROL_FEATURES,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_INLINE_UNIFORM_BLOCK_FEATURES = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_INLINE_UNIFORM_BLOCK_FEATURES,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_INLINE_UNIFORM_BLOCK_PROPERTIES = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_INLINE_UNIFORM_BLOCK_PROPERTIES,
	VK_STRUCTURE_TYPE_WRITE_DESCRIPTOR_SET_INLINE_UNIFORM_BLOCK = VkStructureType.VK_STRUCTURE_TYPE_WRITE_DESCRIPTOR_SET_INLINE_UNIFORM_BLOCK,
	VK_STRUCTURE_TYPE_DESCRIPTOR_POOL_INLINE_UNIFORM_BLOCK_CREATE_INFO = VkStructureType.VK_STRUCTURE_TYPE_DESCRIPTOR_POOL_INLINE_UNIFORM_BLOCK_CREATE_INFO,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TEXTURE_COMPRESSION_ASTC_HDR_FEATURES = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TEXTURE_COMPRESSION_ASTC_HDR_FEATURES,
	VK_STRUCTURE_TYPE_RENDERING_INFO = VkStructureType.VK_STRUCTURE_TYPE_RENDERING_INFO,
	VK_STRUCTURE_TYPE_RENDERING_ATTACHMENT_INFO = VkStructureType.VK_STRUCTURE_TYPE_RENDERING_ATTACHMENT_INFO,
	VK_STRUCTURE_TYPE_PIPELINE_RENDERING_CREATE_INFO = VkStructureType.VK_STRUCTURE_TYPE_PIPELINE_RENDERING_CREATE_INFO,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DYNAMIC_RENDERING_FEATURES = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DYNAMIC_RENDERING_FEATURES,
	VK_STRUCTURE_TYPE_COMMAND_BUFFER_INHERITANCE_RENDERING_INFO = VkStructureType.VK_STRUCTURE_TYPE_COMMAND_BUFFER_INHERITANCE_RENDERING_INFO,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_INTEGER_DOT_PRODUCT_FEATURES = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_INTEGER_DOT_PRODUCT_FEATURES,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_INTEGER_DOT_PRODUCT_PROPERTIES = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_INTEGER_DOT_PRODUCT_PROPERTIES,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TEXEL_BUFFER_ALIGNMENT_PROPERTIES = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TEXEL_BUFFER_ALIGNMENT_PROPERTIES,
	VK_STRUCTURE_TYPE_FORMAT_PROPERTIES_3 = VkStructureType.VK_STRUCTURE_TYPE_FORMAT_PROPERTIES_3,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_4_FEATURES = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_4_FEATURES,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_4_PROPERTIES = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_4_PROPERTIES,
	VK_STRUCTURE_TYPE_DEVICE_BUFFER_MEMORY_REQUIREMENTS = VkStructureType.VK_STRUCTURE_TYPE_DEVICE_BUFFER_MEMORY_REQUIREMENTS,
	VK_STRUCTURE_TYPE_DEVICE_IMAGE_MEMORY_REQUIREMENTS = VkStructureType.VK_STRUCTURE_TYPE_DEVICE_IMAGE_MEMORY_REQUIREMENTS,
	VK_STRUCTURE_TYPE_SWAPCHAIN_CREATE_INFO_KHR = VkStructureType.VK_STRUCTURE_TYPE_SWAPCHAIN_CREATE_INFO_KHR,
	VK_STRUCTURE_TYPE_PRESENT_INFO_KHR = VkStructureType.VK_STRUCTURE_TYPE_PRESENT_INFO_KHR,
	VK_STRUCTURE_TYPE_DEVICE_GROUP_PRESENT_CAPABILITIES_KHR = VkStructureType.VK_STRUCTURE_TYPE_DEVICE_GROUP_PRESENT_CAPABILITIES_KHR,
	VK_STRUCTURE_TYPE_IMAGE_SWAPCHAIN_CREATE_INFO_KHR = VkStructureType.VK_STRUCTURE_TYPE_IMAGE_SWAPCHAIN_CREATE_INFO_KHR,
	VK_STRUCTURE_TYPE_BIND_IMAGE_MEMORY_SWAPCHAIN_INFO_KHR = VkStructureType.VK_STRUCTURE_TYPE_BIND_IMAGE_MEMORY_SWAPCHAIN_INFO_KHR,
	VK_STRUCTURE_TYPE_ACQUIRE_NEXT_IMAGE_INFO_KHR = VkStructureType.VK_STRUCTURE_TYPE_ACQUIRE_NEXT_IMAGE_INFO_KHR,
	VK_STRUCTURE_TYPE_DEVICE_GROUP_PRESENT_INFO_KHR = VkStructureType.VK_STRUCTURE_TYPE_DEVICE_GROUP_PRESENT_INFO_KHR,
	VK_STRUCTURE_TYPE_DEVICE_GROUP_SWAPCHAIN_CREATE_INFO_KHR = VkStructureType.VK_STRUCTURE_TYPE_DEVICE_GROUP_SWAPCHAIN_CREATE_INFO_KHR,
	VK_STRUCTURE_TYPE_DISPLAY_MODE_CREATE_INFO_KHR = VkStructureType.VK_STRUCTURE_TYPE_DISPLAY_MODE_CREATE_INFO_KHR,
	VK_STRUCTURE_TYPE_DISPLAY_SURFACE_CREATE_INFO_KHR = VkStructureType.VK_STRUCTURE_TYPE_DISPLAY_SURFACE_CREATE_INFO_KHR,
	VK_STRUCTURE_TYPE_DISPLAY_PRESENT_INFO_KHR = VkStructureType.VK_STRUCTURE_TYPE_DISPLAY_PRESENT_INFO_KHR,
	VK_STRUCTURE_TYPE_XLIB_SURFACE_CREATE_INFO_KHR = VkStructureType.VK_STRUCTURE_TYPE_XLIB_SURFACE_CREATE_INFO_KHR,
	VK_STRUCTURE_TYPE_XCB_SURFACE_CREATE_INFO_KHR = VkStructureType.VK_STRUCTURE_TYPE_XCB_SURFACE_CREATE_INFO_KHR,
	VK_STRUCTURE_TYPE_WAYLAND_SURFACE_CREATE_INFO_KHR = VkStructureType.VK_STRUCTURE_TYPE_WAYLAND_SURFACE_CREATE_INFO_KHR,
	VK_STRUCTURE_TYPE_ANDROID_SURFACE_CREATE_INFO_KHR = VkStructureType.VK_STRUCTURE_TYPE_ANDROID_SURFACE_CREATE_INFO_KHR,
	VK_STRUCTURE_TYPE_WIN32_SURFACE_CREATE_INFO_KHR = VkStructureType.VK_STRUCTURE_TYPE_WIN32_SURFACE_CREATE_INFO_KHR,
	VK_STRUCTURE_TYPE_DEBUG_REPORT_CALLBACK_CREATE_INFO_EXT = VkStructureType.VK_STRUCTURE_TYPE_DEBUG_REPORT_CALLBACK_CREATE_INFO_EXT,
	VK_STRUCTURE_TYPE_PIPELINE_RASTERIZATION_STATE_RASTERIZATION_ORDER_AMD = VkStructureType.VK_STRUCTURE_TYPE_PIPELINE_RASTERIZATION_STATE_RASTERIZATION_ORDER_AMD,
	VK_STRUCTURE_TYPE_DEBUG_MARKER_OBJECT_NAME_INFO_EXT = VkStructureType.VK_STRUCTURE_TYPE_DEBUG_MARKER_OBJECT_NAME_INFO_EXT,
	VK_STRUCTURE_TYPE_DEBUG_MARKER_OBJECT_TAG_INFO_EXT = VkStructureType.VK_STRUCTURE_TYPE_DEBUG_MARKER_OBJECT_TAG_INFO_EXT,
	VK_STRUCTURE_TYPE_DEBUG_MARKER_MARKER_INFO_EXT = VkStructureType.VK_STRUCTURE_TYPE_DEBUG_MARKER_MARKER_INFO_EXT,
	VK_STRUCTURE_TYPE_DEDICATED_ALLOCATION_IMAGE_CREATE_INFO_NV = VkStructureType.VK_STRUCTURE_TYPE_DEDICATED_ALLOCATION_IMAGE_CREATE_INFO_NV,
	VK_STRUCTURE_TYPE_DEDICATED_ALLOCATION_BUFFER_CREATE_INFO_NV = VkStructureType.VK_STRUCTURE_TYPE_DEDICATED_ALLOCATION_BUFFER_CREATE_INFO_NV,
	VK_STRUCTURE_TYPE_DEDICATED_ALLOCATION_MEMORY_ALLOCATE_INFO_NV = VkStructureType.VK_STRUCTURE_TYPE_DEDICATED_ALLOCATION_MEMORY_ALLOCATE_INFO_NV,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TRANSFORM_FEEDBACK_FEATURES_EXT = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TRANSFORM_FEEDBACK_FEATURES_EXT,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TRANSFORM_FEEDBACK_PROPERTIES_EXT = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TRANSFORM_FEEDBACK_PROPERTIES_EXT,
	VK_STRUCTURE_TYPE_PIPELINE_RASTERIZATION_STATE_STREAM_CREATE_INFO_EXT = VkStructureType.VK_STRUCTURE_TYPE_PIPELINE_RASTERIZATION_STATE_STREAM_CREATE_INFO_EXT,
	VK_STRUCTURE_TYPE_CU_MODULE_CREATE_INFO_NVX = VkStructureType.VK_STRUCTURE_TYPE_CU_MODULE_CREATE_INFO_NVX,
	VK_STRUCTURE_TYPE_CU_FUNCTION_CREATE_INFO_NVX = VkStructureType.VK_STRUCTURE_TYPE_CU_FUNCTION_CREATE_INFO_NVX,
	VK_STRUCTURE_TYPE_CU_LAUNCH_INFO_NVX = VkStructureType.VK_STRUCTURE_TYPE_CU_LAUNCH_INFO_NVX,
	VK_STRUCTURE_TYPE_IMAGE_VIEW_HANDLE_INFO_NVX = VkStructureType.VK_STRUCTURE_TYPE_IMAGE_VIEW_HANDLE_INFO_NVX,
	VK_STRUCTURE_TYPE_IMAGE_VIEW_ADDRESS_PROPERTIES_NVX = VkStructureType.VK_STRUCTURE_TYPE_IMAGE_VIEW_ADDRESS_PROPERTIES_NVX,
	VK_STRUCTURE_TYPE_TEXTURE_LOD_GATHER_FORMAT_PROPERTIES_AMD = VkStructureType.VK_STRUCTURE_TYPE_TEXTURE_LOD_GATHER_FORMAT_PROPERTIES_AMD,
	VK_STRUCTURE_TYPE_RENDERING_FRAGMENT_SHADING_RATE_ATTACHMENT_INFO_KHR = VkStructureType.VK_STRUCTURE_TYPE_RENDERING_FRAGMENT_SHADING_RATE_ATTACHMENT_INFO_KHR,
	VK_STRUCTURE_TYPE_RENDERING_FRAGMENT_DENSITY_MAP_ATTACHMENT_INFO_EXT = VkStructureType.VK_STRUCTURE_TYPE_RENDERING_FRAGMENT_DENSITY_MAP_ATTACHMENT_INFO_EXT,
	VK_STRUCTURE_TYPE_ATTACHMENT_SAMPLE_COUNT_INFO_AMD = VkStructureType.VK_STRUCTURE_TYPE_ATTACHMENT_SAMPLE_COUNT_INFO_AMD,
	VK_STRUCTURE_TYPE_MULTIVIEW_PER_VIEW_ATTRIBUTES_INFO_NVX = VkStructureType.VK_STRUCTURE_TYPE_MULTIVIEW_PER_VIEW_ATTRIBUTES_INFO_NVX,
	VK_STRUCTURE_TYPE_STREAM_DESCRIPTOR_SURFACE_CREATE_INFO_GGP = VkStructureType.VK_STRUCTURE_TYPE_STREAM_DESCRIPTOR_SURFACE_CREATE_INFO_GGP,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_CORNER_SAMPLED_IMAGE_FEATURES_NV = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_CORNER_SAMPLED_IMAGE_FEATURES_NV,
	VK_STRUCTURE_TYPE_EXTERNAL_MEMORY_IMAGE_CREATE_INFO_NV = VkStructureType.VK_STRUCTURE_TYPE_EXTERNAL_MEMORY_IMAGE_CREATE_INFO_NV,
	VK_STRUCTURE_TYPE_EXPORT_MEMORY_ALLOCATE_INFO_NV = VkStructureType.VK_STRUCTURE_TYPE_EXPORT_MEMORY_ALLOCATE_INFO_NV,
	VK_STRUCTURE_TYPE_IMPORT_MEMORY_WIN32_HANDLE_INFO_NV = VkStructureType.VK_STRUCTURE_TYPE_IMPORT_MEMORY_WIN32_HANDLE_INFO_NV,
	VK_STRUCTURE_TYPE_EXPORT_MEMORY_WIN32_HANDLE_INFO_NV = VkStructureType.VK_STRUCTURE_TYPE_EXPORT_MEMORY_WIN32_HANDLE_INFO_NV,
	VK_STRUCTURE_TYPE_WIN32_KEYED_MUTEX_ACQUIRE_RELEASE_INFO_NV = VkStructureType.VK_STRUCTURE_TYPE_WIN32_KEYED_MUTEX_ACQUIRE_RELEASE_INFO_NV,
	VK_STRUCTURE_TYPE_VALIDATION_FLAGS_EXT = VkStructureType.VK_STRUCTURE_TYPE_VALIDATION_FLAGS_EXT,
	VK_STRUCTURE_TYPE_VI_SURFACE_CREATE_INFO_NN = VkStructureType.VK_STRUCTURE_TYPE_VI_SURFACE_CREATE_INFO_NN,
	VK_STRUCTURE_TYPE_IMAGE_VIEW_ASTC_DECODE_MODE_EXT = VkStructureType.VK_STRUCTURE_TYPE_IMAGE_VIEW_ASTC_DECODE_MODE_EXT,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ASTC_DECODE_FEATURES_EXT = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ASTC_DECODE_FEATURES_EXT,
	VK_STRUCTURE_TYPE_IMPORT_MEMORY_WIN32_HANDLE_INFO_KHR = VkStructureType.VK_STRUCTURE_TYPE_IMPORT_MEMORY_WIN32_HANDLE_INFO_KHR,
	VK_STRUCTURE_TYPE_EXPORT_MEMORY_WIN32_HANDLE_INFO_KHR = VkStructureType.VK_STRUCTURE_TYPE_EXPORT_MEMORY_WIN32_HANDLE_INFO_KHR,
	VK_STRUCTURE_TYPE_MEMORY_WIN32_HANDLE_PROPERTIES_KHR = VkStructureType.VK_STRUCTURE_TYPE_MEMORY_WIN32_HANDLE_PROPERTIES_KHR,
	VK_STRUCTURE_TYPE_MEMORY_GET_WIN32_HANDLE_INFO_KHR = VkStructureType.VK_STRUCTURE_TYPE_MEMORY_GET_WIN32_HANDLE_INFO_KHR,
	VK_STRUCTURE_TYPE_IMPORT_MEMORY_FD_INFO_KHR = VkStructureType.VK_STRUCTURE_TYPE_IMPORT_MEMORY_FD_INFO_KHR,
	VK_STRUCTURE_TYPE_MEMORY_FD_PROPERTIES_KHR = VkStructureType.VK_STRUCTURE_TYPE_MEMORY_FD_PROPERTIES_KHR,
	VK_STRUCTURE_TYPE_MEMORY_GET_FD_INFO_KHR = VkStructureType.VK_STRUCTURE_TYPE_MEMORY_GET_FD_INFO_KHR,
	VK_STRUCTURE_TYPE_WIN32_KEYED_MUTEX_ACQUIRE_RELEASE_INFO_KHR = VkStructureType.VK_STRUCTURE_TYPE_WIN32_KEYED_MUTEX_ACQUIRE_RELEASE_INFO_KHR,
	VK_STRUCTURE_TYPE_IMPORT_SEMAPHORE_WIN32_HANDLE_INFO_KHR = VkStructureType.VK_STRUCTURE_TYPE_IMPORT_SEMAPHORE_WIN32_HANDLE_INFO_KHR,
	VK_STRUCTURE_TYPE_EXPORT_SEMAPHORE_WIN32_HANDLE_INFO_KHR = VkStructureType.VK_STRUCTURE_TYPE_EXPORT_SEMAPHORE_WIN32_HANDLE_INFO_KHR,
	VK_STRUCTURE_TYPE_D3D12_FENCE_SUBMIT_INFO_KHR = VkStructureType.VK_STRUCTURE_TYPE_D3D12_FENCE_SUBMIT_INFO_KHR,
	VK_STRUCTURE_TYPE_SEMAPHORE_GET_WIN32_HANDLE_INFO_KHR = VkStructureType.VK_STRUCTURE_TYPE_SEMAPHORE_GET_WIN32_HANDLE_INFO_KHR,
	VK_STRUCTURE_TYPE_IMPORT_SEMAPHORE_FD_INFO_KHR = VkStructureType.VK_STRUCTURE_TYPE_IMPORT_SEMAPHORE_FD_INFO_KHR,
	VK_STRUCTURE_TYPE_SEMAPHORE_GET_FD_INFO_KHR = VkStructureType.VK_STRUCTURE_TYPE_SEMAPHORE_GET_FD_INFO_KHR,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PUSH_DESCRIPTOR_PROPERTIES_KHR = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PUSH_DESCRIPTOR_PROPERTIES_KHR,
	VK_STRUCTURE_TYPE_COMMAND_BUFFER_INHERITANCE_CONDITIONAL_RENDERING_INFO_EXT = VkStructureType.VK_STRUCTURE_TYPE_COMMAND_BUFFER_INHERITANCE_CONDITIONAL_RENDERING_INFO_EXT,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_CONDITIONAL_RENDERING_FEATURES_EXT = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_CONDITIONAL_RENDERING_FEATURES_EXT,
	VK_STRUCTURE_TYPE_CONDITIONAL_RENDERING_BEGIN_INFO_EXT = VkStructureType.VK_STRUCTURE_TYPE_CONDITIONAL_RENDERING_BEGIN_INFO_EXT,
	VK_STRUCTURE_TYPE_PRESENT_REGIONS_KHR = VkStructureType.VK_STRUCTURE_TYPE_PRESENT_REGIONS_KHR,
	VK_STRUCTURE_TYPE_PIPELINE_VIEWPORT_W_SCALING_STATE_CREATE_INFO_NV = VkStructureType.VK_STRUCTURE_TYPE_PIPELINE_VIEWPORT_W_SCALING_STATE_CREATE_INFO_NV,
	VK_STRUCTURE_TYPE_SURFACE_CAPABILITIES_2_EXT = VkStructureType.VK_STRUCTURE_TYPE_SURFACE_CAPABILITIES_2_EXT,
	VK_STRUCTURE_TYPE_DISPLAY_POWER_INFO_EXT = VkStructureType.VK_STRUCTURE_TYPE_DISPLAY_POWER_INFO_EXT,
	VK_STRUCTURE_TYPE_DEVICE_EVENT_INFO_EXT = VkStructureType.VK_STRUCTURE_TYPE_DEVICE_EVENT_INFO_EXT,
	VK_STRUCTURE_TYPE_DISPLAY_EVENT_INFO_EXT = VkStructureType.VK_STRUCTURE_TYPE_DISPLAY_EVENT_INFO_EXT,
	VK_STRUCTURE_TYPE_SWAPCHAIN_COUNTER_CREATE_INFO_EXT = VkStructureType.VK_STRUCTURE_TYPE_SWAPCHAIN_COUNTER_CREATE_INFO_EXT,
	VK_STRUCTURE_TYPE_PRESENT_TIMES_INFO_GOOGLE = VkStructureType.VK_STRUCTURE_TYPE_PRESENT_TIMES_INFO_GOOGLE,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MULTIVIEW_PER_VIEW_ATTRIBUTES_PROPERTIES_NVX = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MULTIVIEW_PER_VIEW_ATTRIBUTES_PROPERTIES_NVX,
	VK_STRUCTURE_TYPE_PIPELINE_VIEWPORT_SWIZZLE_STATE_CREATE_INFO_NV = VkStructureType.VK_STRUCTURE_TYPE_PIPELINE_VIEWPORT_SWIZZLE_STATE_CREATE_INFO_NV,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DISCARD_RECTANGLE_PROPERTIES_EXT = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DISCARD_RECTANGLE_PROPERTIES_EXT,
	VK_STRUCTURE_TYPE_PIPELINE_DISCARD_RECTANGLE_STATE_CREATE_INFO_EXT = VkStructureType.VK_STRUCTURE_TYPE_PIPELINE_DISCARD_RECTANGLE_STATE_CREATE_INFO_EXT,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_CONSERVATIVE_RASTERIZATION_PROPERTIES_EXT = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_CONSERVATIVE_RASTERIZATION_PROPERTIES_EXT,
	VK_STRUCTURE_TYPE_PIPELINE_RASTERIZATION_CONSERVATIVE_STATE_CREATE_INFO_EXT = VkStructureType.VK_STRUCTURE_TYPE_PIPELINE_RASTERIZATION_CONSERVATIVE_STATE_CREATE_INFO_EXT,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DEPTH_CLIP_ENABLE_FEATURES_EXT = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DEPTH_CLIP_ENABLE_FEATURES_EXT,
	VK_STRUCTURE_TYPE_PIPELINE_RASTERIZATION_DEPTH_CLIP_STATE_CREATE_INFO_EXT = VkStructureType.VK_STRUCTURE_TYPE_PIPELINE_RASTERIZATION_DEPTH_CLIP_STATE_CREATE_INFO_EXT,
	VK_STRUCTURE_TYPE_HDR_METADATA_EXT = VkStructureType.VK_STRUCTURE_TYPE_HDR_METADATA_EXT,
	VK_STRUCTURE_TYPE_SHARED_PRESENT_SURFACE_CAPABILITIES_KHR = VkStructureType.VK_STRUCTURE_TYPE_SHARED_PRESENT_SURFACE_CAPABILITIES_KHR,
	VK_STRUCTURE_TYPE_IMPORT_FENCE_WIN32_HANDLE_INFO_KHR = VkStructureType.VK_STRUCTURE_TYPE_IMPORT_FENCE_WIN32_HANDLE_INFO_KHR,
	VK_STRUCTURE_TYPE_EXPORT_FENCE_WIN32_HANDLE_INFO_KHR = VkStructureType.VK_STRUCTURE_TYPE_EXPORT_FENCE_WIN32_HANDLE_INFO_KHR,
	VK_STRUCTURE_TYPE_FENCE_GET_WIN32_HANDLE_INFO_KHR = VkStructureType.VK_STRUCTURE_TYPE_FENCE_GET_WIN32_HANDLE_INFO_KHR,
	VK_STRUCTURE_TYPE_IMPORT_FENCE_FD_INFO_KHR = VkStructureType.VK_STRUCTURE_TYPE_IMPORT_FENCE_FD_INFO_KHR,
	VK_STRUCTURE_TYPE_FENCE_GET_FD_INFO_KHR = VkStructureType.VK_STRUCTURE_TYPE_FENCE_GET_FD_INFO_KHR,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PERFORMANCE_QUERY_FEATURES_KHR = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PERFORMANCE_QUERY_FEATURES_KHR,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PERFORMANCE_QUERY_PROPERTIES_KHR = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PERFORMANCE_QUERY_PROPERTIES_KHR,
	VK_STRUCTURE_TYPE_QUERY_POOL_PERFORMANCE_CREATE_INFO_KHR = VkStructureType.VK_STRUCTURE_TYPE_QUERY_POOL_PERFORMANCE_CREATE_INFO_KHR,
	VK_STRUCTURE_TYPE_PERFORMANCE_QUERY_SUBMIT_INFO_KHR = VkStructureType.VK_STRUCTURE_TYPE_PERFORMANCE_QUERY_SUBMIT_INFO_KHR,
	VK_STRUCTURE_TYPE_ACQUIRE_PROFILING_LOCK_INFO_KHR = VkStructureType.VK_STRUCTURE_TYPE_ACQUIRE_PROFILING_LOCK_INFO_KHR,
	VK_STRUCTURE_TYPE_PERFORMANCE_COUNTER_KHR = VkStructureType.VK_STRUCTURE_TYPE_PERFORMANCE_COUNTER_KHR,
	VK_STRUCTURE_TYPE_PERFORMANCE_COUNTER_DESCRIPTION_KHR = VkStructureType.VK_STRUCTURE_TYPE_PERFORMANCE_COUNTER_DESCRIPTION_KHR,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SURFACE_INFO_2_KHR = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SURFACE_INFO_2_KHR,
	VK_STRUCTURE_TYPE_SURFACE_CAPABILITIES_2_KHR = VkStructureType.VK_STRUCTURE_TYPE_SURFACE_CAPABILITIES_2_KHR,
	VK_STRUCTURE_TYPE_SURFACE_FORMAT_2_KHR = VkStructureType.VK_STRUCTURE_TYPE_SURFACE_FORMAT_2_KHR,
	VK_STRUCTURE_TYPE_DISPLAY_PROPERTIES_2_KHR = VkStructureType.VK_STRUCTURE_TYPE_DISPLAY_PROPERTIES_2_KHR,
	VK_STRUCTURE_TYPE_DISPLAY_PLANE_PROPERTIES_2_KHR = VkStructureType.VK_STRUCTURE_TYPE_DISPLAY_PLANE_PROPERTIES_2_KHR,
	VK_STRUCTURE_TYPE_DISPLAY_MODE_PROPERTIES_2_KHR = VkStructureType.VK_STRUCTURE_TYPE_DISPLAY_MODE_PROPERTIES_2_KHR,
	VK_STRUCTURE_TYPE_DISPLAY_PLANE_INFO_2_KHR = VkStructureType.VK_STRUCTURE_TYPE_DISPLAY_PLANE_INFO_2_KHR,
	VK_STRUCTURE_TYPE_DISPLAY_PLANE_CAPABILITIES_2_KHR = VkStructureType.VK_STRUCTURE_TYPE_DISPLAY_PLANE_CAPABILITIES_2_KHR,
	VK_STRUCTURE_TYPE_IOS_SURFACE_CREATE_INFO_MVK = VkStructureType.VK_STRUCTURE_TYPE_IOS_SURFACE_CREATE_INFO_MVK,
	VK_STRUCTURE_TYPE_MACOS_SURFACE_CREATE_INFO_MVK = VkStructureType.VK_STRUCTURE_TYPE_MACOS_SURFACE_CREATE_INFO_MVK,
	VK_STRUCTURE_TYPE_DEBUG_UTILS_OBJECT_NAME_INFO_EXT = VkStructureType.VK_STRUCTURE_TYPE_DEBUG_UTILS_OBJECT_NAME_INFO_EXT,
	VK_STRUCTURE_TYPE_DEBUG_UTILS_OBJECT_TAG_INFO_EXT = VkStructureType.VK_STRUCTURE_TYPE_DEBUG_UTILS_OBJECT_TAG_INFO_EXT,
	VK_STRUCTURE_TYPE_DEBUG_UTILS_LABEL_EXT = VkStructureType.VK_STRUCTURE_TYPE_DEBUG_UTILS_LABEL_EXT,
	VK_STRUCTURE_TYPE_DEBUG_UTILS_MESSENGER_CALLBACK_DATA_EXT = VkStructureType.VK_STRUCTURE_TYPE_DEBUG_UTILS_MESSENGER_CALLBACK_DATA_EXT,
	VK_STRUCTURE_TYPE_DEBUG_UTILS_MESSENGER_CREATE_INFO_EXT = VkStructureType.VK_STRUCTURE_TYPE_DEBUG_UTILS_MESSENGER_CREATE_INFO_EXT,
	VK_STRUCTURE_TYPE_ANDROID_HARDWARE_BUFFER_USAGE_ANDROID = VkStructureType.VK_STRUCTURE_TYPE_ANDROID_HARDWARE_BUFFER_USAGE_ANDROID,
	VK_STRUCTURE_TYPE_ANDROID_HARDWARE_BUFFER_PROPERTIES_ANDROID = VkStructureType.VK_STRUCTURE_TYPE_ANDROID_HARDWARE_BUFFER_PROPERTIES_ANDROID,
	VK_STRUCTURE_TYPE_ANDROID_HARDWARE_BUFFER_FORMAT_PROPERTIES_ANDROID = VkStructureType.VK_STRUCTURE_TYPE_ANDROID_HARDWARE_BUFFER_FORMAT_PROPERTIES_ANDROID,
	VK_STRUCTURE_TYPE_IMPORT_ANDROID_HARDWARE_BUFFER_INFO_ANDROID = VkStructureType.VK_STRUCTURE_TYPE_IMPORT_ANDROID_HARDWARE_BUFFER_INFO_ANDROID,
	VK_STRUCTURE_TYPE_MEMORY_GET_ANDROID_HARDWARE_BUFFER_INFO_ANDROID = VkStructureType.VK_STRUCTURE_TYPE_MEMORY_GET_ANDROID_HARDWARE_BUFFER_INFO_ANDROID,
	VK_STRUCTURE_TYPE_EXTERNAL_FORMAT_ANDROID = VkStructureType.VK_STRUCTURE_TYPE_EXTERNAL_FORMAT_ANDROID,
	VK_STRUCTURE_TYPE_ANDROID_HARDWARE_BUFFER_FORMAT_PROPERTIES_2_ANDROID = VkStructureType.VK_STRUCTURE_TYPE_ANDROID_HARDWARE_BUFFER_FORMAT_PROPERTIES_2_ANDROID,
	VK_STRUCTURE_TYPE_SAMPLE_LOCATIONS_INFO_EXT = VkStructureType.VK_STRUCTURE_TYPE_SAMPLE_LOCATIONS_INFO_EXT,
	VK_STRUCTURE_TYPE_RENDER_PASS_SAMPLE_LOCATIONS_BEGIN_INFO_EXT = VkStructureType.VK_STRUCTURE_TYPE_RENDER_PASS_SAMPLE_LOCATIONS_BEGIN_INFO_EXT,
	VK_STRUCTURE_TYPE_PIPELINE_SAMPLE_LOCATIONS_STATE_CREATE_INFO_EXT = VkStructureType.VK_STRUCTURE_TYPE_PIPELINE_SAMPLE_LOCATIONS_STATE_CREATE_INFO_EXT,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SAMPLE_LOCATIONS_PROPERTIES_EXT = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SAMPLE_LOCATIONS_PROPERTIES_EXT,
	VK_STRUCTURE_TYPE_MULTISAMPLE_PROPERTIES_EXT = VkStructureType.VK_STRUCTURE_TYPE_MULTISAMPLE_PROPERTIES_EXT,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_BLEND_OPERATION_ADVANCED_FEATURES_EXT = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_BLEND_OPERATION_ADVANCED_FEATURES_EXT,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_BLEND_OPERATION_ADVANCED_PROPERTIES_EXT = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_BLEND_OPERATION_ADVANCED_PROPERTIES_EXT,
	VK_STRUCTURE_TYPE_PIPELINE_COLOR_BLEND_ADVANCED_STATE_CREATE_INFO_EXT = VkStructureType.VK_STRUCTURE_TYPE_PIPELINE_COLOR_BLEND_ADVANCED_STATE_CREATE_INFO_EXT,
	VK_STRUCTURE_TYPE_PIPELINE_COVERAGE_TO_COLOR_STATE_CREATE_INFO_NV = VkStructureType.VK_STRUCTURE_TYPE_PIPELINE_COVERAGE_TO_COLOR_STATE_CREATE_INFO_NV,
	VK_STRUCTURE_TYPE_WRITE_DESCRIPTOR_SET_ACCELERATION_STRUCTURE_KHR = VkStructureType.VK_STRUCTURE_TYPE_WRITE_DESCRIPTOR_SET_ACCELERATION_STRUCTURE_KHR,
	VK_STRUCTURE_TYPE_ACCELERATION_STRUCTURE_BUILD_GEOMETRY_INFO_KHR = VkStructureType.VK_STRUCTURE_TYPE_ACCELERATION_STRUCTURE_BUILD_GEOMETRY_INFO_KHR,
	VK_STRUCTURE_TYPE_ACCELERATION_STRUCTURE_DEVICE_ADDRESS_INFO_KHR = VkStructureType.VK_STRUCTURE_TYPE_ACCELERATION_STRUCTURE_DEVICE_ADDRESS_INFO_KHR,
	VK_STRUCTURE_TYPE_ACCELERATION_STRUCTURE_GEOMETRY_AABBS_DATA_KHR = VkStructureType.VK_STRUCTURE_TYPE_ACCELERATION_STRUCTURE_GEOMETRY_AABBS_DATA_KHR,
	VK_STRUCTURE_TYPE_ACCELERATION_STRUCTURE_GEOMETRY_INSTANCES_DATA_KHR = VkStructureType.VK_STRUCTURE_TYPE_ACCELERATION_STRUCTURE_GEOMETRY_INSTANCES_DATA_KHR,
	VK_STRUCTURE_TYPE_ACCELERATION_STRUCTURE_GEOMETRY_TRIANGLES_DATA_KHR = VkStructureType.VK_STRUCTURE_TYPE_ACCELERATION_STRUCTURE_GEOMETRY_TRIANGLES_DATA_KHR,
	VK_STRUCTURE_TYPE_ACCELERATION_STRUCTURE_GEOMETRY_KHR = VkStructureType.VK_STRUCTURE_TYPE_ACCELERATION_STRUCTURE_GEOMETRY_KHR,
	VK_STRUCTURE_TYPE_ACCELERATION_STRUCTURE_VERSION_INFO_KHR = VkStructureType.VK_STRUCTURE_TYPE_ACCELERATION_STRUCTURE_VERSION_INFO_KHR,
	VK_STRUCTURE_TYPE_COPY_ACCELERATION_STRUCTURE_INFO_KHR = VkStructureType.VK_STRUCTURE_TYPE_COPY_ACCELERATION_STRUCTURE_INFO_KHR,
	VK_STRUCTURE_TYPE_COPY_ACCELERATION_STRUCTURE_TO_MEMORY_INFO_KHR = VkStructureType.VK_STRUCTURE_TYPE_COPY_ACCELERATION_STRUCTURE_TO_MEMORY_INFO_KHR,
	VK_STRUCTURE_TYPE_COPY_MEMORY_TO_ACCELERATION_STRUCTURE_INFO_KHR = VkStructureType.VK_STRUCTURE_TYPE_COPY_MEMORY_TO_ACCELERATION_STRUCTURE_INFO_KHR,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ACCELERATION_STRUCTURE_FEATURES_KHR = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ACCELERATION_STRUCTURE_FEATURES_KHR,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ACCELERATION_STRUCTURE_PROPERTIES_KHR = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ACCELERATION_STRUCTURE_PROPERTIES_KHR,
	VK_STRUCTURE_TYPE_ACCELERATION_STRUCTURE_CREATE_INFO_KHR = VkStructureType.VK_STRUCTURE_TYPE_ACCELERATION_STRUCTURE_CREATE_INFO_KHR,
	VK_STRUCTURE_TYPE_ACCELERATION_STRUCTURE_BUILD_SIZES_INFO_KHR = VkStructureType.VK_STRUCTURE_TYPE_ACCELERATION_STRUCTURE_BUILD_SIZES_INFO_KHR,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RAY_TRACING_PIPELINE_FEATURES_KHR = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RAY_TRACING_PIPELINE_FEATURES_KHR,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RAY_TRACING_PIPELINE_PROPERTIES_KHR = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RAY_TRACING_PIPELINE_PROPERTIES_KHR,
	VK_STRUCTURE_TYPE_RAY_TRACING_PIPELINE_CREATE_INFO_KHR = VkStructureType.VK_STRUCTURE_TYPE_RAY_TRACING_PIPELINE_CREATE_INFO_KHR,
	VK_STRUCTURE_TYPE_RAY_TRACING_SHADER_GROUP_CREATE_INFO_KHR = VkStructureType.VK_STRUCTURE_TYPE_RAY_TRACING_SHADER_GROUP_CREATE_INFO_KHR,
	VK_STRUCTURE_TYPE_RAY_TRACING_PIPELINE_INTERFACE_CREATE_INFO_KHR = VkStructureType.VK_STRUCTURE_TYPE_RAY_TRACING_PIPELINE_INTERFACE_CREATE_INFO_KHR,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RAY_QUERY_FEATURES_KHR = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RAY_QUERY_FEATURES_KHR,
	VK_STRUCTURE_TYPE_PIPELINE_COVERAGE_MODULATION_STATE_CREATE_INFO_NV = VkStructureType.VK_STRUCTURE_TYPE_PIPELINE_COVERAGE_MODULATION_STATE_CREATE_INFO_NV,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_SM_BUILTINS_FEATURES_NV = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_SM_BUILTINS_FEATURES_NV,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_SM_BUILTINS_PROPERTIES_NV = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_SM_BUILTINS_PROPERTIES_NV,
	VK_STRUCTURE_TYPE_DRM_FORMAT_MODIFIER_PROPERTIES_LIST_EXT = VkStructureType.VK_STRUCTURE_TYPE_DRM_FORMAT_MODIFIER_PROPERTIES_LIST_EXT,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_DRM_FORMAT_MODIFIER_INFO_EXT = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_DRM_FORMAT_MODIFIER_INFO_EXT,
	VK_STRUCTURE_TYPE_IMAGE_DRM_FORMAT_MODIFIER_LIST_CREATE_INFO_EXT = VkStructureType.VK_STRUCTURE_TYPE_IMAGE_DRM_FORMAT_MODIFIER_LIST_CREATE_INFO_EXT,
	VK_STRUCTURE_TYPE_IMAGE_DRM_FORMAT_MODIFIER_EXPLICIT_CREATE_INFO_EXT = VkStructureType.VK_STRUCTURE_TYPE_IMAGE_DRM_FORMAT_MODIFIER_EXPLICIT_CREATE_INFO_EXT,
	VK_STRUCTURE_TYPE_IMAGE_DRM_FORMAT_MODIFIER_PROPERTIES_EXT = VkStructureType.VK_STRUCTURE_TYPE_IMAGE_DRM_FORMAT_MODIFIER_PROPERTIES_EXT,
	VK_STRUCTURE_TYPE_DRM_FORMAT_MODIFIER_PROPERTIES_LIST_2_EXT = VkStructureType.VK_STRUCTURE_TYPE_DRM_FORMAT_MODIFIER_PROPERTIES_LIST_2_EXT,
	VK_STRUCTURE_TYPE_VALIDATION_CACHE_CREATE_INFO_EXT = VkStructureType.VK_STRUCTURE_TYPE_VALIDATION_CACHE_CREATE_INFO_EXT,
	VK_STRUCTURE_TYPE_SHADER_MODULE_VALIDATION_CACHE_CREATE_INFO_EXT = VkStructureType.VK_STRUCTURE_TYPE_SHADER_MODULE_VALIDATION_CACHE_CREATE_INFO_EXT,
	VK_STRUCTURE_TYPE_PIPELINE_VIEWPORT_SHADING_RATE_IMAGE_STATE_CREATE_INFO_NV = VkStructureType.VK_STRUCTURE_TYPE_PIPELINE_VIEWPORT_SHADING_RATE_IMAGE_STATE_CREATE_INFO_NV,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADING_RATE_IMAGE_FEATURES_NV = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADING_RATE_IMAGE_FEATURES_NV,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADING_RATE_IMAGE_PROPERTIES_NV = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADING_RATE_IMAGE_PROPERTIES_NV,
	VK_STRUCTURE_TYPE_PIPELINE_VIEWPORT_COARSE_SAMPLE_ORDER_STATE_CREATE_INFO_NV = VkStructureType.VK_STRUCTURE_TYPE_PIPELINE_VIEWPORT_COARSE_SAMPLE_ORDER_STATE_CREATE_INFO_NV,
	VK_STRUCTURE_TYPE_RAY_TRACING_PIPELINE_CREATE_INFO_NV = VkStructureType.VK_STRUCTURE_TYPE_RAY_TRACING_PIPELINE_CREATE_INFO_NV,
	VK_STRUCTURE_TYPE_ACCELERATION_STRUCTURE_CREATE_INFO_NV = VkStructureType.VK_STRUCTURE_TYPE_ACCELERATION_STRUCTURE_CREATE_INFO_NV,
	VK_STRUCTURE_TYPE_GEOMETRY_NV = VkStructureType.VK_STRUCTURE_TYPE_GEOMETRY_NV,
	VK_STRUCTURE_TYPE_GEOMETRY_TRIANGLES_NV = VkStructureType.VK_STRUCTURE_TYPE_GEOMETRY_TRIANGLES_NV,
	VK_STRUCTURE_TYPE_GEOMETRY_AABB_NV = VkStructureType.VK_STRUCTURE_TYPE_GEOMETRY_AABB_NV,
	VK_STRUCTURE_TYPE_BIND_ACCELERATION_STRUCTURE_MEMORY_INFO_NV = VkStructureType.VK_STRUCTURE_TYPE_BIND_ACCELERATION_STRUCTURE_MEMORY_INFO_NV,
	VK_STRUCTURE_TYPE_WRITE_DESCRIPTOR_SET_ACCELERATION_STRUCTURE_NV = VkStructureType.VK_STRUCTURE_TYPE_WRITE_DESCRIPTOR_SET_ACCELERATION_STRUCTURE_NV,
	VK_STRUCTURE_TYPE_ACCELERATION_STRUCTURE_MEMORY_REQUIREMENTS_INFO_NV = VkStructureType.VK_STRUCTURE_TYPE_ACCELERATION_STRUCTURE_MEMORY_REQUIREMENTS_INFO_NV,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RAY_TRACING_PROPERTIES_NV = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RAY_TRACING_PROPERTIES_NV,
	VK_STRUCTURE_TYPE_RAY_TRACING_SHADER_GROUP_CREATE_INFO_NV = VkStructureType.VK_STRUCTURE_TYPE_RAY_TRACING_SHADER_GROUP_CREATE_INFO_NV,
	VK_STRUCTURE_TYPE_ACCELERATION_STRUCTURE_INFO_NV = VkStructureType.VK_STRUCTURE_TYPE_ACCELERATION_STRUCTURE_INFO_NV,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_REPRESENTATIVE_FRAGMENT_TEST_FEATURES_NV = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_REPRESENTATIVE_FRAGMENT_TEST_FEATURES_NV,
	VK_STRUCTURE_TYPE_PIPELINE_REPRESENTATIVE_FRAGMENT_TEST_STATE_CREATE_INFO_NV = VkStructureType.VK_STRUCTURE_TYPE_PIPELINE_REPRESENTATIVE_FRAGMENT_TEST_STATE_CREATE_INFO_NV,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_VIEW_IMAGE_FORMAT_INFO_EXT = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_VIEW_IMAGE_FORMAT_INFO_EXT,
	VK_STRUCTURE_TYPE_FILTER_CUBIC_IMAGE_VIEW_IMAGE_FORMAT_PROPERTIES_EXT = VkStructureType.VK_STRUCTURE_TYPE_FILTER_CUBIC_IMAGE_VIEW_IMAGE_FORMAT_PROPERTIES_EXT,
	VK_STRUCTURE_TYPE_IMPORT_MEMORY_HOST_POINTER_INFO_EXT = VkStructureType.VK_STRUCTURE_TYPE_IMPORT_MEMORY_HOST_POINTER_INFO_EXT,
	VK_STRUCTURE_TYPE_MEMORY_HOST_POINTER_PROPERTIES_EXT = VkStructureType.VK_STRUCTURE_TYPE_MEMORY_HOST_POINTER_PROPERTIES_EXT,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_EXTERNAL_MEMORY_HOST_PROPERTIES_EXT = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_EXTERNAL_MEMORY_HOST_PROPERTIES_EXT,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_CLOCK_FEATURES_KHR = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_CLOCK_FEATURES_KHR,
	VK_STRUCTURE_TYPE_PIPELINE_COMPILER_CONTROL_CREATE_INFO_AMD = VkStructureType.VK_STRUCTURE_TYPE_PIPELINE_COMPILER_CONTROL_CREATE_INFO_AMD,
	VK_STRUCTURE_TYPE_CALIBRATED_TIMESTAMP_INFO_EXT = VkStructureType.VK_STRUCTURE_TYPE_CALIBRATED_TIMESTAMP_INFO_EXT,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_CORE_PROPERTIES_AMD = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_CORE_PROPERTIES_AMD,
	VK_STRUCTURE_TYPE_DEVICE_QUEUE_GLOBAL_PRIORITY_CREATE_INFO_KHR = VkStructureType.VK_STRUCTURE_TYPE_DEVICE_QUEUE_GLOBAL_PRIORITY_CREATE_INFO_KHR,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_GLOBAL_PRIORITY_QUERY_FEATURES_KHR = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_GLOBAL_PRIORITY_QUERY_FEATURES_KHR,
	VK_STRUCTURE_TYPE_QUEUE_FAMILY_GLOBAL_PRIORITY_PROPERTIES_KHR = VkStructureType.VK_STRUCTURE_TYPE_QUEUE_FAMILY_GLOBAL_PRIORITY_PROPERTIES_KHR,
	VK_STRUCTURE_TYPE_DEVICE_MEMORY_OVERALLOCATION_CREATE_INFO_AMD = VkStructureType.VK_STRUCTURE_TYPE_DEVICE_MEMORY_OVERALLOCATION_CREATE_INFO_AMD,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VERTEX_ATTRIBUTE_DIVISOR_PROPERTIES_EXT = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VERTEX_ATTRIBUTE_DIVISOR_PROPERTIES_EXT,
	VK_STRUCTURE_TYPE_PIPELINE_VERTEX_INPUT_DIVISOR_STATE_CREATE_INFO_EXT = VkStructureType.VK_STRUCTURE_TYPE_PIPELINE_VERTEX_INPUT_DIVISOR_STATE_CREATE_INFO_EXT,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VERTEX_ATTRIBUTE_DIVISOR_FEATURES_EXT = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VERTEX_ATTRIBUTE_DIVISOR_FEATURES_EXT,
	VK_STRUCTURE_TYPE_PRESENT_FRAME_TOKEN_GGP = VkStructureType.VK_STRUCTURE_TYPE_PRESENT_FRAME_TOKEN_GGP,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_COMPUTE_SHADER_DERIVATIVES_FEATURES_NV = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_COMPUTE_SHADER_DERIVATIVES_FEATURES_NV,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MESH_SHADER_FEATURES_NV = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MESH_SHADER_FEATURES_NV,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MESH_SHADER_PROPERTIES_NV = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MESH_SHADER_PROPERTIES_NV,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_SHADER_BARYCENTRIC_FEATURES_NV = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_SHADER_BARYCENTRIC_FEATURES_NV,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_IMAGE_FOOTPRINT_FEATURES_NV = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_IMAGE_FOOTPRINT_FEATURES_NV,
	VK_STRUCTURE_TYPE_PIPELINE_VIEWPORT_EXCLUSIVE_SCISSOR_STATE_CREATE_INFO_NV = VkStructureType.VK_STRUCTURE_TYPE_PIPELINE_VIEWPORT_EXCLUSIVE_SCISSOR_STATE_CREATE_INFO_NV,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_EXCLUSIVE_SCISSOR_FEATURES_NV = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_EXCLUSIVE_SCISSOR_FEATURES_NV,
	VK_STRUCTURE_TYPE_CHECKPOINT_DATA_NV = VkStructureType.VK_STRUCTURE_TYPE_CHECKPOINT_DATA_NV,
	VK_STRUCTURE_TYPE_QUEUE_FAMILY_CHECKPOINT_PROPERTIES_NV = VkStructureType.VK_STRUCTURE_TYPE_QUEUE_FAMILY_CHECKPOINT_PROPERTIES_NV,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_INTEGER_FUNCTIONS_2_FEATURES_INTEL = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_INTEGER_FUNCTIONS_2_FEATURES_INTEL,
	VK_STRUCTURE_TYPE_QUERY_POOL_PERFORMANCE_QUERY_CREATE_INFO_INTEL = VkStructureType.VK_STRUCTURE_TYPE_QUERY_POOL_PERFORMANCE_QUERY_CREATE_INFO_INTEL,
	VK_STRUCTURE_TYPE_INITIALIZE_PERFORMANCE_API_INFO_INTEL = VkStructureType.VK_STRUCTURE_TYPE_INITIALIZE_PERFORMANCE_API_INFO_INTEL,
	VK_STRUCTURE_TYPE_PERFORMANCE_MARKER_INFO_INTEL = VkStructureType.VK_STRUCTURE_TYPE_PERFORMANCE_MARKER_INFO_INTEL,
	VK_STRUCTURE_TYPE_PERFORMANCE_STREAM_MARKER_INFO_INTEL = VkStructureType.VK_STRUCTURE_TYPE_PERFORMANCE_STREAM_MARKER_INFO_INTEL,
	VK_STRUCTURE_TYPE_PERFORMANCE_OVERRIDE_INFO_INTEL = VkStructureType.VK_STRUCTURE_TYPE_PERFORMANCE_OVERRIDE_INFO_INTEL,
	VK_STRUCTURE_TYPE_PERFORMANCE_CONFIGURATION_ACQUIRE_INFO_INTEL = VkStructureType.VK_STRUCTURE_TYPE_PERFORMANCE_CONFIGURATION_ACQUIRE_INFO_INTEL,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PCI_BUS_INFO_PROPERTIES_EXT = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PCI_BUS_INFO_PROPERTIES_EXT,
	VK_STRUCTURE_TYPE_DISPLAY_NATIVE_HDR_SURFACE_CAPABILITIES_AMD = VkStructureType.VK_STRUCTURE_TYPE_DISPLAY_NATIVE_HDR_SURFACE_CAPABILITIES_AMD,
	VK_STRUCTURE_TYPE_SWAPCHAIN_DISPLAY_NATIVE_HDR_CREATE_INFO_AMD = VkStructureType.VK_STRUCTURE_TYPE_SWAPCHAIN_DISPLAY_NATIVE_HDR_CREATE_INFO_AMD,
	VK_STRUCTURE_TYPE_IMAGEPIPE_SURFACE_CREATE_INFO_FUCHSIA = VkStructureType.VK_STRUCTURE_TYPE_IMAGEPIPE_SURFACE_CREATE_INFO_FUCHSIA,
	VK_STRUCTURE_TYPE_METAL_SURFACE_CREATE_INFO_EXT = VkStructureType.VK_STRUCTURE_TYPE_METAL_SURFACE_CREATE_INFO_EXT,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_FEATURES_EXT = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_FEATURES_EXT,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_PROPERTIES_EXT = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_PROPERTIES_EXT,
	VK_STRUCTURE_TYPE_RENDER_PASS_FRAGMENT_DENSITY_MAP_CREATE_INFO_EXT = VkStructureType.VK_STRUCTURE_TYPE_RENDER_PASS_FRAGMENT_DENSITY_MAP_CREATE_INFO_EXT,
	VK_STRUCTURE_TYPE_FRAGMENT_SHADING_RATE_ATTACHMENT_INFO_KHR = VkStructureType.VK_STRUCTURE_TYPE_FRAGMENT_SHADING_RATE_ATTACHMENT_INFO_KHR,
	VK_STRUCTURE_TYPE_PIPELINE_FRAGMENT_SHADING_RATE_STATE_CREATE_INFO_KHR = VkStructureType.VK_STRUCTURE_TYPE_PIPELINE_FRAGMENT_SHADING_RATE_STATE_CREATE_INFO_KHR,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_SHADING_RATE_PROPERTIES_KHR = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_SHADING_RATE_PROPERTIES_KHR,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_SHADING_RATE_FEATURES_KHR = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_SHADING_RATE_FEATURES_KHR,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_SHADING_RATE_KHR = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_SHADING_RATE_KHR,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_CORE_PROPERTIES_2_AMD = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_CORE_PROPERTIES_2_AMD,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_COHERENT_MEMORY_FEATURES_AMD = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_COHERENT_MEMORY_FEATURES_AMD,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_IMAGE_ATOMIC_INT64_FEATURES_EXT = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_IMAGE_ATOMIC_INT64_FEATURES_EXT,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MEMORY_BUDGET_PROPERTIES_EXT = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MEMORY_BUDGET_PROPERTIES_EXT,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MEMORY_PRIORITY_FEATURES_EXT = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MEMORY_PRIORITY_FEATURES_EXT,
	VK_STRUCTURE_TYPE_MEMORY_PRIORITY_ALLOCATE_INFO_EXT = VkStructureType.VK_STRUCTURE_TYPE_MEMORY_PRIORITY_ALLOCATE_INFO_EXT,
	VK_STRUCTURE_TYPE_SURFACE_PROTECTED_CAPABILITIES_KHR = VkStructureType.VK_STRUCTURE_TYPE_SURFACE_PROTECTED_CAPABILITIES_KHR,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DEDICATED_ALLOCATION_IMAGE_ALIASING_FEATURES_NV = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DEDICATED_ALLOCATION_IMAGE_ALIASING_FEATURES_NV,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_BUFFER_DEVICE_ADDRESS_FEATURES_EXT = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_BUFFER_DEVICE_ADDRESS_FEATURES_EXT,
	VK_STRUCTURE_TYPE_BUFFER_DEVICE_ADDRESS_CREATE_INFO_EXT = VkStructureType.VK_STRUCTURE_TYPE_BUFFER_DEVICE_ADDRESS_CREATE_INFO_EXT,
	VK_STRUCTURE_TYPE_VALIDATION_FEATURES_EXT = VkStructureType.VK_STRUCTURE_TYPE_VALIDATION_FEATURES_EXT,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PRESENT_WAIT_FEATURES_KHR = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PRESENT_WAIT_FEATURES_KHR,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_COOPERATIVE_MATRIX_FEATURES_NV = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_COOPERATIVE_MATRIX_FEATURES_NV,
	VK_STRUCTURE_TYPE_COOPERATIVE_MATRIX_PROPERTIES_NV = VkStructureType.VK_STRUCTURE_TYPE_COOPERATIVE_MATRIX_PROPERTIES_NV,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_COOPERATIVE_MATRIX_PROPERTIES_NV = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_COOPERATIVE_MATRIX_PROPERTIES_NV,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_COVERAGE_REDUCTION_MODE_FEATURES_NV = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_COVERAGE_REDUCTION_MODE_FEATURES_NV,
	VK_STRUCTURE_TYPE_PIPELINE_COVERAGE_REDUCTION_STATE_CREATE_INFO_NV = VkStructureType.VK_STRUCTURE_TYPE_PIPELINE_COVERAGE_REDUCTION_STATE_CREATE_INFO_NV,
	VK_STRUCTURE_TYPE_FRAMEBUFFER_MIXED_SAMPLES_COMBINATION_NV = VkStructureType.VK_STRUCTURE_TYPE_FRAMEBUFFER_MIXED_SAMPLES_COMBINATION_NV,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_SHADER_INTERLOCK_FEATURES_EXT = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_SHADER_INTERLOCK_FEATURES_EXT,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_YCBCR_IMAGE_ARRAYS_FEATURES_EXT = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_YCBCR_IMAGE_ARRAYS_FEATURES_EXT,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PROVOKING_VERTEX_FEATURES_EXT = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PROVOKING_VERTEX_FEATURES_EXT,
	VK_STRUCTURE_TYPE_PIPELINE_RASTERIZATION_PROVOKING_VERTEX_STATE_CREATE_INFO_EXT = VkStructureType.VK_STRUCTURE_TYPE_PIPELINE_RASTERIZATION_PROVOKING_VERTEX_STATE_CREATE_INFO_EXT,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PROVOKING_VERTEX_PROPERTIES_EXT = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PROVOKING_VERTEX_PROPERTIES_EXT,
	VK_STRUCTURE_TYPE_SURFACE_FULL_SCREEN_EXCLUSIVE_INFO_EXT = VkStructureType.VK_STRUCTURE_TYPE_SURFACE_FULL_SCREEN_EXCLUSIVE_INFO_EXT,
	VK_STRUCTURE_TYPE_SURFACE_CAPABILITIES_FULL_SCREEN_EXCLUSIVE_EXT = VkStructureType.VK_STRUCTURE_TYPE_SURFACE_CAPABILITIES_FULL_SCREEN_EXCLUSIVE_EXT,
	VK_STRUCTURE_TYPE_SURFACE_FULL_SCREEN_EXCLUSIVE_WIN32_INFO_EXT = VkStructureType.VK_STRUCTURE_TYPE_SURFACE_FULL_SCREEN_EXCLUSIVE_WIN32_INFO_EXT,
	VK_STRUCTURE_TYPE_HEADLESS_SURFACE_CREATE_INFO_EXT = VkStructureType.VK_STRUCTURE_TYPE_HEADLESS_SURFACE_CREATE_INFO_EXT,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LINE_RASTERIZATION_FEATURES_EXT = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LINE_RASTERIZATION_FEATURES_EXT,
	VK_STRUCTURE_TYPE_PIPELINE_RASTERIZATION_LINE_STATE_CREATE_INFO_EXT = VkStructureType.VK_STRUCTURE_TYPE_PIPELINE_RASTERIZATION_LINE_STATE_CREATE_INFO_EXT,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LINE_RASTERIZATION_PROPERTIES_EXT = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LINE_RASTERIZATION_PROPERTIES_EXT,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_ATOMIC_FLOAT_FEATURES_EXT = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_ATOMIC_FLOAT_FEATURES_EXT,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_INDEX_TYPE_UINT8_FEATURES_EXT = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_INDEX_TYPE_UINT8_FEATURES_EXT,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_EXTENDED_DYNAMIC_STATE_FEATURES_EXT = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_EXTENDED_DYNAMIC_STATE_FEATURES_EXT,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PIPELINE_EXECUTABLE_PROPERTIES_FEATURES_KHR = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PIPELINE_EXECUTABLE_PROPERTIES_FEATURES_KHR,
	VK_STRUCTURE_TYPE_PIPELINE_INFO_KHR = VkStructureType.VK_STRUCTURE_TYPE_PIPELINE_INFO_KHR,
	VK_STRUCTURE_TYPE_PIPELINE_EXECUTABLE_PROPERTIES_KHR = VkStructureType.VK_STRUCTURE_TYPE_PIPELINE_EXECUTABLE_PROPERTIES_KHR,
	VK_STRUCTURE_TYPE_PIPELINE_EXECUTABLE_INFO_KHR = VkStructureType.VK_STRUCTURE_TYPE_PIPELINE_EXECUTABLE_INFO_KHR,
	VK_STRUCTURE_TYPE_PIPELINE_EXECUTABLE_STATISTIC_KHR = VkStructureType.VK_STRUCTURE_TYPE_PIPELINE_EXECUTABLE_STATISTIC_KHR,
	VK_STRUCTURE_TYPE_PIPELINE_EXECUTABLE_INTERNAL_REPRESENTATION_KHR = VkStructureType.VK_STRUCTURE_TYPE_PIPELINE_EXECUTABLE_INTERNAL_REPRESENTATION_KHR,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_ATOMIC_FLOAT_2_FEATURES_EXT = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_ATOMIC_FLOAT_2_FEATURES_EXT,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DEVICE_GENERATED_COMMANDS_PROPERTIES_NV = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DEVICE_GENERATED_COMMANDS_PROPERTIES_NV,
	VK_STRUCTURE_TYPE_GRAPHICS_SHADER_GROUP_CREATE_INFO_NV = VkStructureType.VK_STRUCTURE_TYPE_GRAPHICS_SHADER_GROUP_CREATE_INFO_NV,
	VK_STRUCTURE_TYPE_GRAPHICS_PIPELINE_SHADER_GROUPS_CREATE_INFO_NV = VkStructureType.VK_STRUCTURE_TYPE_GRAPHICS_PIPELINE_SHADER_GROUPS_CREATE_INFO_NV,
	VK_STRUCTURE_TYPE_INDIRECT_COMMANDS_LAYOUT_TOKEN_NV = VkStructureType.VK_STRUCTURE_TYPE_INDIRECT_COMMANDS_LAYOUT_TOKEN_NV,
	VK_STRUCTURE_TYPE_INDIRECT_COMMANDS_LAYOUT_CREATE_INFO_NV = VkStructureType.VK_STRUCTURE_TYPE_INDIRECT_COMMANDS_LAYOUT_CREATE_INFO_NV,
	VK_STRUCTURE_TYPE_GENERATED_COMMANDS_INFO_NV = VkStructureType.VK_STRUCTURE_TYPE_GENERATED_COMMANDS_INFO_NV,
	VK_STRUCTURE_TYPE_GENERATED_COMMANDS_MEMORY_REQUIREMENTS_INFO_NV = VkStructureType.VK_STRUCTURE_TYPE_GENERATED_COMMANDS_MEMORY_REQUIREMENTS_INFO_NV,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DEVICE_GENERATED_COMMANDS_FEATURES_NV = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DEVICE_GENERATED_COMMANDS_FEATURES_NV,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_INHERITED_VIEWPORT_SCISSOR_FEATURES_NV = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_INHERITED_VIEWPORT_SCISSOR_FEATURES_NV,
	VK_STRUCTURE_TYPE_COMMAND_BUFFER_INHERITANCE_VIEWPORT_SCISSOR_INFO_NV = VkStructureType.VK_STRUCTURE_TYPE_COMMAND_BUFFER_INHERITANCE_VIEWPORT_SCISSOR_INFO_NV,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TEXEL_BUFFER_ALIGNMENT_FEATURES_EXT = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TEXEL_BUFFER_ALIGNMENT_FEATURES_EXT,
	VK_STRUCTURE_TYPE_COMMAND_BUFFER_INHERITANCE_RENDER_PASS_TRANSFORM_INFO_QCOM = VkStructureType.VK_STRUCTURE_TYPE_COMMAND_BUFFER_INHERITANCE_RENDER_PASS_TRANSFORM_INFO_QCOM,
	VK_STRUCTURE_TYPE_RENDER_PASS_TRANSFORM_BEGIN_INFO_QCOM = VkStructureType.VK_STRUCTURE_TYPE_RENDER_PASS_TRANSFORM_BEGIN_INFO_QCOM,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DEVICE_MEMORY_REPORT_FEATURES_EXT = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DEVICE_MEMORY_REPORT_FEATURES_EXT,
	VK_STRUCTURE_TYPE_DEVICE_DEVICE_MEMORY_REPORT_CREATE_INFO_EXT = VkStructureType.VK_STRUCTURE_TYPE_DEVICE_DEVICE_MEMORY_REPORT_CREATE_INFO_EXT,
	VK_STRUCTURE_TYPE_DEVICE_MEMORY_REPORT_CALLBACK_DATA_EXT = VkStructureType.VK_STRUCTURE_TYPE_DEVICE_MEMORY_REPORT_CALLBACK_DATA_EXT,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ROBUSTNESS_2_FEATURES_EXT = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ROBUSTNESS_2_FEATURES_EXT,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ROBUSTNESS_2_PROPERTIES_EXT = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ROBUSTNESS_2_PROPERTIES_EXT,
	VK_STRUCTURE_TYPE_SAMPLER_CUSTOM_BORDER_COLOR_CREATE_INFO_EXT = VkStructureType.VK_STRUCTURE_TYPE_SAMPLER_CUSTOM_BORDER_COLOR_CREATE_INFO_EXT,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_CUSTOM_BORDER_COLOR_PROPERTIES_EXT = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_CUSTOM_BORDER_COLOR_PROPERTIES_EXT,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_CUSTOM_BORDER_COLOR_FEATURES_EXT = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_CUSTOM_BORDER_COLOR_FEATURES_EXT,
	VK_STRUCTURE_TYPE_PIPELINE_LIBRARY_CREATE_INFO_KHR = VkStructureType.VK_STRUCTURE_TYPE_PIPELINE_LIBRARY_CREATE_INFO_KHR,
	VK_STRUCTURE_TYPE_PRESENT_ID_KHR = VkStructureType.VK_STRUCTURE_TYPE_PRESENT_ID_KHR,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PRESENT_ID_FEATURES_KHR = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PRESENT_ID_FEATURES_KHR,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DIAGNOSTICS_CONFIG_FEATURES_NV = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DIAGNOSTICS_CONFIG_FEATURES_NV,
	VK_STRUCTURE_TYPE_DEVICE_DIAGNOSTICS_CONFIG_CREATE_INFO_NV = VkStructureType.VK_STRUCTURE_TYPE_DEVICE_DIAGNOSTICS_CONFIG_CREATE_INFO_NV,
	VK_STRUCTURE_TYPE_QUEUE_FAMILY_CHECKPOINT_PROPERTIES_2_NV = VkStructureType.VK_STRUCTURE_TYPE_QUEUE_FAMILY_CHECKPOINT_PROPERTIES_2_NV,
	VK_STRUCTURE_TYPE_CHECKPOINT_DATA_2_NV = VkStructureType.VK_STRUCTURE_TYPE_CHECKPOINT_DATA_2_NV,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_GRAPHICS_PIPELINE_LIBRARY_FEATURES_EXT = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_GRAPHICS_PIPELINE_LIBRARY_FEATURES_EXT,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_GRAPHICS_PIPELINE_LIBRARY_PROPERTIES_EXT = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_GRAPHICS_PIPELINE_LIBRARY_PROPERTIES_EXT,
	VK_STRUCTURE_TYPE_GRAPHICS_PIPELINE_LIBRARY_CREATE_INFO_EXT = VkStructureType.VK_STRUCTURE_TYPE_GRAPHICS_PIPELINE_LIBRARY_CREATE_INFO_EXT,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_SUBGROUP_UNIFORM_CONTROL_FLOW_FEATURES_KHR = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_SUBGROUP_UNIFORM_CONTROL_FLOW_FEATURES_KHR,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_SHADING_RATE_ENUMS_PROPERTIES_NV = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_SHADING_RATE_ENUMS_PROPERTIES_NV,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_SHADING_RATE_ENUMS_FEATURES_NV = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_SHADING_RATE_ENUMS_FEATURES_NV,
	VK_STRUCTURE_TYPE_PIPELINE_FRAGMENT_SHADING_RATE_ENUM_STATE_CREATE_INFO_NV = VkStructureType.VK_STRUCTURE_TYPE_PIPELINE_FRAGMENT_SHADING_RATE_ENUM_STATE_CREATE_INFO_NV,
	VK_STRUCTURE_TYPE_ACCELERATION_STRUCTURE_GEOMETRY_MOTION_TRIANGLES_DATA_NV = VkStructureType.VK_STRUCTURE_TYPE_ACCELERATION_STRUCTURE_GEOMETRY_MOTION_TRIANGLES_DATA_NV,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RAY_TRACING_MOTION_BLUR_FEATURES_NV = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RAY_TRACING_MOTION_BLUR_FEATURES_NV,
	VK_STRUCTURE_TYPE_ACCELERATION_STRUCTURE_MOTION_INFO_NV = VkStructureType.VK_STRUCTURE_TYPE_ACCELERATION_STRUCTURE_MOTION_INFO_NV,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_YCBCR_2_PLANE_444_FORMATS_FEATURES_EXT = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_YCBCR_2_PLANE_444_FORMATS_FEATURES_EXT,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_2_FEATURES_EXT = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_2_FEATURES_EXT,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_2_PROPERTIES_EXT = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_2_PROPERTIES_EXT,
	VK_STRUCTURE_TYPE_COPY_COMMAND_TRANSFORM_INFO_QCOM = VkStructureType.VK_STRUCTURE_TYPE_COPY_COMMAND_TRANSFORM_INFO_QCOM,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_WORKGROUP_MEMORY_EXPLICIT_LAYOUT_FEATURES_KHR = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_WORKGROUP_MEMORY_EXPLICIT_LAYOUT_FEATURES_KHR,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_4444_FORMATS_FEATURES_EXT = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_4444_FORMATS_FEATURES_EXT,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RASTERIZATION_ORDER_ATTACHMENT_ACCESS_FEATURES_ARM = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RASTERIZATION_ORDER_ATTACHMENT_ACCESS_FEATURES_ARM,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RGBA10X6_FORMATS_FEATURES_EXT = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RGBA10X6_FORMATS_FEATURES_EXT,
	VK_STRUCTURE_TYPE_DIRECTFB_SURFACE_CREATE_INFO_EXT = VkStructureType.VK_STRUCTURE_TYPE_DIRECTFB_SURFACE_CREATE_INFO_EXT,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MUTABLE_DESCRIPTOR_TYPE_FEATURES_VALVE = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MUTABLE_DESCRIPTOR_TYPE_FEATURES_VALVE,
	VK_STRUCTURE_TYPE_MUTABLE_DESCRIPTOR_TYPE_CREATE_INFO_VALVE = VkStructureType.VK_STRUCTURE_TYPE_MUTABLE_DESCRIPTOR_TYPE_CREATE_INFO_VALVE,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VERTEX_INPUT_DYNAMIC_STATE_FEATURES_EXT = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VERTEX_INPUT_DYNAMIC_STATE_FEATURES_EXT,
	VK_STRUCTURE_TYPE_VERTEX_INPUT_BINDING_DESCRIPTION_2_EXT = VkStructureType.VK_STRUCTURE_TYPE_VERTEX_INPUT_BINDING_DESCRIPTION_2_EXT,
	VK_STRUCTURE_TYPE_VERTEX_INPUT_ATTRIBUTE_DESCRIPTION_2_EXT = VkStructureType.VK_STRUCTURE_TYPE_VERTEX_INPUT_ATTRIBUTE_DESCRIPTION_2_EXT,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DRM_PROPERTIES_EXT = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DRM_PROPERTIES_EXT,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DEPTH_CLIP_CONTROL_FEATURES_EXT = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DEPTH_CLIP_CONTROL_FEATURES_EXT,
	VK_STRUCTURE_TYPE_PIPELINE_VIEWPORT_DEPTH_CLIP_CONTROL_CREATE_INFO_EXT = VkStructureType.VK_STRUCTURE_TYPE_PIPELINE_VIEWPORT_DEPTH_CLIP_CONTROL_CREATE_INFO_EXT,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PRIMITIVE_TOPOLOGY_LIST_RESTART_FEATURES_EXT = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PRIMITIVE_TOPOLOGY_LIST_RESTART_FEATURES_EXT,
	VK_STRUCTURE_TYPE_IMPORT_MEMORY_ZIRCON_HANDLE_INFO_FUCHSIA = VkStructureType.VK_STRUCTURE_TYPE_IMPORT_MEMORY_ZIRCON_HANDLE_INFO_FUCHSIA,
	VK_STRUCTURE_TYPE_MEMORY_ZIRCON_HANDLE_PROPERTIES_FUCHSIA = VkStructureType.VK_STRUCTURE_TYPE_MEMORY_ZIRCON_HANDLE_PROPERTIES_FUCHSIA,
	VK_STRUCTURE_TYPE_MEMORY_GET_ZIRCON_HANDLE_INFO_FUCHSIA = VkStructureType.VK_STRUCTURE_TYPE_MEMORY_GET_ZIRCON_HANDLE_INFO_FUCHSIA,
	VK_STRUCTURE_TYPE_IMPORT_SEMAPHORE_ZIRCON_HANDLE_INFO_FUCHSIA = VkStructureType.VK_STRUCTURE_TYPE_IMPORT_SEMAPHORE_ZIRCON_HANDLE_INFO_FUCHSIA,
	VK_STRUCTURE_TYPE_SEMAPHORE_GET_ZIRCON_HANDLE_INFO_FUCHSIA = VkStructureType.VK_STRUCTURE_TYPE_SEMAPHORE_GET_ZIRCON_HANDLE_INFO_FUCHSIA,
	VK_STRUCTURE_TYPE_BUFFER_COLLECTION_CREATE_INFO_FUCHSIA = VkStructureType.VK_STRUCTURE_TYPE_BUFFER_COLLECTION_CREATE_INFO_FUCHSIA,
	VK_STRUCTURE_TYPE_IMPORT_MEMORY_BUFFER_COLLECTION_FUCHSIA = VkStructureType.VK_STRUCTURE_TYPE_IMPORT_MEMORY_BUFFER_COLLECTION_FUCHSIA,
	VK_STRUCTURE_TYPE_BUFFER_COLLECTION_IMAGE_CREATE_INFO_FUCHSIA = VkStructureType.VK_STRUCTURE_TYPE_BUFFER_COLLECTION_IMAGE_CREATE_INFO_FUCHSIA,
	VK_STRUCTURE_TYPE_BUFFER_COLLECTION_PROPERTIES_FUCHSIA = VkStructureType.VK_STRUCTURE_TYPE_BUFFER_COLLECTION_PROPERTIES_FUCHSIA,
	VK_STRUCTURE_TYPE_BUFFER_CONSTRAINTS_INFO_FUCHSIA = VkStructureType.VK_STRUCTURE_TYPE_BUFFER_CONSTRAINTS_INFO_FUCHSIA,
	VK_STRUCTURE_TYPE_BUFFER_COLLECTION_BUFFER_CREATE_INFO_FUCHSIA = VkStructureType.VK_STRUCTURE_TYPE_BUFFER_COLLECTION_BUFFER_CREATE_INFO_FUCHSIA,
	VK_STRUCTURE_TYPE_IMAGE_CONSTRAINTS_INFO_FUCHSIA = VkStructureType.VK_STRUCTURE_TYPE_IMAGE_CONSTRAINTS_INFO_FUCHSIA,
	VK_STRUCTURE_TYPE_IMAGE_FORMAT_CONSTRAINTS_INFO_FUCHSIA = VkStructureType.VK_STRUCTURE_TYPE_IMAGE_FORMAT_CONSTRAINTS_INFO_FUCHSIA,
	VK_STRUCTURE_TYPE_SYSMEM_COLOR_SPACE_FUCHSIA = VkStructureType.VK_STRUCTURE_TYPE_SYSMEM_COLOR_SPACE_FUCHSIA,
	VK_STRUCTURE_TYPE_BUFFER_COLLECTION_CONSTRAINTS_INFO_FUCHSIA = VkStructureType.VK_STRUCTURE_TYPE_BUFFER_COLLECTION_CONSTRAINTS_INFO_FUCHSIA,
	VK_STRUCTURE_TYPE_SUBPASS_SHADING_PIPELINE_CREATE_INFO_HUAWEI = VkStructureType.VK_STRUCTURE_TYPE_SUBPASS_SHADING_PIPELINE_CREATE_INFO_HUAWEI,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SUBPASS_SHADING_FEATURES_HUAWEI = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SUBPASS_SHADING_FEATURES_HUAWEI,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SUBPASS_SHADING_PROPERTIES_HUAWEI = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SUBPASS_SHADING_PROPERTIES_HUAWEI,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_INVOCATION_MASK_FEATURES_HUAWEI = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_INVOCATION_MASK_FEATURES_HUAWEI,
	VK_STRUCTURE_TYPE_MEMORY_GET_REMOTE_ADDRESS_INFO_NV = VkStructureType.VK_STRUCTURE_TYPE_MEMORY_GET_REMOTE_ADDRESS_INFO_NV,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_EXTERNAL_MEMORY_RDMA_FEATURES_NV = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_EXTERNAL_MEMORY_RDMA_FEATURES_NV,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_EXTENDED_DYNAMIC_STATE_2_FEATURES_EXT = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_EXTENDED_DYNAMIC_STATE_2_FEATURES_EXT,
	VK_STRUCTURE_TYPE_SCREEN_SURFACE_CREATE_INFO_QNX = VkStructureType.VK_STRUCTURE_TYPE_SCREEN_SURFACE_CREATE_INFO_QNX,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_COLOR_WRITE_ENABLE_FEATURES_EXT = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_COLOR_WRITE_ENABLE_FEATURES_EXT,
	VK_STRUCTURE_TYPE_PIPELINE_COLOR_WRITE_CREATE_INFO_EXT = VkStructureType.VK_STRUCTURE_TYPE_PIPELINE_COLOR_WRITE_CREATE_INFO_EXT,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PRIMITIVES_GENERATED_QUERY_FEATURES_EXT = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PRIMITIVES_GENERATED_QUERY_FEATURES_EXT,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_VIEW_MIN_LOD_FEATURES_EXT = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_VIEW_MIN_LOD_FEATURES_EXT,
	VK_STRUCTURE_TYPE_IMAGE_VIEW_MIN_LOD_CREATE_INFO_EXT = VkStructureType.VK_STRUCTURE_TYPE_IMAGE_VIEW_MIN_LOD_CREATE_INFO_EXT,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MULTI_DRAW_FEATURES_EXT = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MULTI_DRAW_FEATURES_EXT,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MULTI_DRAW_PROPERTIES_EXT = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MULTI_DRAW_PROPERTIES_EXT,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_2D_VIEW_OF_3D_FEATURES_EXT = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_2D_VIEW_OF_3D_FEATURES_EXT,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_BORDER_COLOR_SWIZZLE_FEATURES_EXT = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_BORDER_COLOR_SWIZZLE_FEATURES_EXT,
	VK_STRUCTURE_TYPE_SAMPLER_BORDER_COLOR_COMPONENT_MAPPING_CREATE_INFO_EXT = VkStructureType.VK_STRUCTURE_TYPE_SAMPLER_BORDER_COLOR_COMPONENT_MAPPING_CREATE_INFO_EXT,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PAGEABLE_DEVICE_LOCAL_MEMORY_FEATURES_EXT = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PAGEABLE_DEVICE_LOCAL_MEMORY_FEATURES_EXT,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DESCRIPTOR_SET_HOST_MAPPING_FEATURES_VALVE = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DESCRIPTOR_SET_HOST_MAPPING_FEATURES_VALVE,
	VK_STRUCTURE_TYPE_DESCRIPTOR_SET_BINDING_REFERENCE_VALVE = VkStructureType.VK_STRUCTURE_TYPE_DESCRIPTOR_SET_BINDING_REFERENCE_VALVE,
	VK_STRUCTURE_TYPE_DESCRIPTOR_SET_LAYOUT_HOST_MAPPING_INFO_VALVE = VkStructureType.VK_STRUCTURE_TYPE_DESCRIPTOR_SET_LAYOUT_HOST_MAPPING_INFO_VALVE,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_OFFSET_FEATURES_QCOM = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_OFFSET_FEATURES_QCOM,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_OFFSET_PROPERTIES_QCOM = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_OFFSET_PROPERTIES_QCOM,
	VK_STRUCTURE_TYPE_SUBPASS_FRAGMENT_DENSITY_MAP_OFFSET_END_INFO_QCOM = VkStructureType.VK_STRUCTURE_TYPE_SUBPASS_FRAGMENT_DENSITY_MAP_OFFSET_END_INFO_QCOM,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LINEAR_COLOR_ATTACHMENT_FEATURES_NV = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LINEAR_COLOR_ATTACHMENT_FEATURES_NV,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VARIABLE_POINTER_FEATURES = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VARIABLE_POINTER_FEATURES,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_DRAW_PARAMETER_FEATURES = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_DRAW_PARAMETER_FEATURES,
	VK_STRUCTURE_TYPE_DEBUG_REPORT_CREATE_INFO_EXT = VkStructureType.VK_STRUCTURE_TYPE_DEBUG_REPORT_CREATE_INFO_EXT,
	VK_STRUCTURE_TYPE_RENDERING_INFO_KHR = VkStructureType.VK_STRUCTURE_TYPE_RENDERING_INFO_KHR,
	VK_STRUCTURE_TYPE_RENDERING_ATTACHMENT_INFO_KHR = VkStructureType.VK_STRUCTURE_TYPE_RENDERING_ATTACHMENT_INFO_KHR,
	VK_STRUCTURE_TYPE_PIPELINE_RENDERING_CREATE_INFO_KHR = VkStructureType.VK_STRUCTURE_TYPE_PIPELINE_RENDERING_CREATE_INFO_KHR,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DYNAMIC_RENDERING_FEATURES_KHR = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DYNAMIC_RENDERING_FEATURES_KHR,
	VK_STRUCTURE_TYPE_COMMAND_BUFFER_INHERITANCE_RENDERING_INFO_KHR = VkStructureType.VK_STRUCTURE_TYPE_COMMAND_BUFFER_INHERITANCE_RENDERING_INFO_KHR,
	VK_STRUCTURE_TYPE_ATTACHMENT_SAMPLE_COUNT_INFO_NV = VkStructureType.VK_STRUCTURE_TYPE_ATTACHMENT_SAMPLE_COUNT_INFO_NV,
	VK_STRUCTURE_TYPE_RENDER_PASS_MULTIVIEW_CREATE_INFO_KHR = VkStructureType.VK_STRUCTURE_TYPE_RENDER_PASS_MULTIVIEW_CREATE_INFO_KHR,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MULTIVIEW_FEATURES_KHR = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MULTIVIEW_FEATURES_KHR,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MULTIVIEW_PROPERTIES_KHR = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MULTIVIEW_PROPERTIES_KHR,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FEATURES_2_KHR = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FEATURES_2_KHR,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PROPERTIES_2_KHR = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PROPERTIES_2_KHR,
	VK_STRUCTURE_TYPE_FORMAT_PROPERTIES_2_KHR = VkStructureType.VK_STRUCTURE_TYPE_FORMAT_PROPERTIES_2_KHR,
	VK_STRUCTURE_TYPE_IMAGE_FORMAT_PROPERTIES_2_KHR = VkStructureType.VK_STRUCTURE_TYPE_IMAGE_FORMAT_PROPERTIES_2_KHR,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_FORMAT_INFO_2_KHR = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_FORMAT_INFO_2_KHR,
	VK_STRUCTURE_TYPE_QUEUE_FAMILY_PROPERTIES_2_KHR = VkStructureType.VK_STRUCTURE_TYPE_QUEUE_FAMILY_PROPERTIES_2_KHR,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MEMORY_PROPERTIES_2_KHR = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MEMORY_PROPERTIES_2_KHR,
	VK_STRUCTURE_TYPE_SPARSE_IMAGE_FORMAT_PROPERTIES_2_KHR = VkStructureType.VK_STRUCTURE_TYPE_SPARSE_IMAGE_FORMAT_PROPERTIES_2_KHR,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SPARSE_IMAGE_FORMAT_INFO_2_KHR = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SPARSE_IMAGE_FORMAT_INFO_2_KHR,
	VK_STRUCTURE_TYPE_MEMORY_ALLOCATE_FLAGS_INFO_KHR = VkStructureType.VK_STRUCTURE_TYPE_MEMORY_ALLOCATE_FLAGS_INFO_KHR,
	VK_STRUCTURE_TYPE_DEVICE_GROUP_RENDER_PASS_BEGIN_INFO_KHR = VkStructureType.VK_STRUCTURE_TYPE_DEVICE_GROUP_RENDER_PASS_BEGIN_INFO_KHR,
	VK_STRUCTURE_TYPE_DEVICE_GROUP_COMMAND_BUFFER_BEGIN_INFO_KHR = VkStructureType.VK_STRUCTURE_TYPE_DEVICE_GROUP_COMMAND_BUFFER_BEGIN_INFO_KHR,
	VK_STRUCTURE_TYPE_DEVICE_GROUP_SUBMIT_INFO_KHR = VkStructureType.VK_STRUCTURE_TYPE_DEVICE_GROUP_SUBMIT_INFO_KHR,
	VK_STRUCTURE_TYPE_DEVICE_GROUP_BIND_SPARSE_INFO_KHR = VkStructureType.VK_STRUCTURE_TYPE_DEVICE_GROUP_BIND_SPARSE_INFO_KHR,
	VK_STRUCTURE_TYPE_BIND_BUFFER_MEMORY_DEVICE_GROUP_INFO_KHR = VkStructureType.VK_STRUCTURE_TYPE_BIND_BUFFER_MEMORY_DEVICE_GROUP_INFO_KHR,
	VK_STRUCTURE_TYPE_BIND_IMAGE_MEMORY_DEVICE_GROUP_INFO_KHR = VkStructureType.VK_STRUCTURE_TYPE_BIND_IMAGE_MEMORY_DEVICE_GROUP_INFO_KHR,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TEXTURE_COMPRESSION_ASTC_HDR_FEATURES_EXT = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TEXTURE_COMPRESSION_ASTC_HDR_FEATURES_EXT,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_GROUP_PROPERTIES_KHR = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_GROUP_PROPERTIES_KHR,
	VK_STRUCTURE_TYPE_DEVICE_GROUP_DEVICE_CREATE_INFO_KHR = VkStructureType.VK_STRUCTURE_TYPE_DEVICE_GROUP_DEVICE_CREATE_INFO_KHR,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_EXTERNAL_IMAGE_FORMAT_INFO_KHR = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_EXTERNAL_IMAGE_FORMAT_INFO_KHR,
	VK_STRUCTURE_TYPE_EXTERNAL_IMAGE_FORMAT_PROPERTIES_KHR = VkStructureType.VK_STRUCTURE_TYPE_EXTERNAL_IMAGE_FORMAT_PROPERTIES_KHR,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_EXTERNAL_BUFFER_INFO_KHR = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_EXTERNAL_BUFFER_INFO_KHR,
	VK_STRUCTURE_TYPE_EXTERNAL_BUFFER_PROPERTIES_KHR = VkStructureType.VK_STRUCTURE_TYPE_EXTERNAL_BUFFER_PROPERTIES_KHR,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ID_PROPERTIES_KHR = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ID_PROPERTIES_KHR,
	VK_STRUCTURE_TYPE_EXTERNAL_MEMORY_BUFFER_CREATE_INFO_KHR = VkStructureType.VK_STRUCTURE_TYPE_EXTERNAL_MEMORY_BUFFER_CREATE_INFO_KHR,
	VK_STRUCTURE_TYPE_EXTERNAL_MEMORY_IMAGE_CREATE_INFO_KHR = VkStructureType.VK_STRUCTURE_TYPE_EXTERNAL_MEMORY_IMAGE_CREATE_INFO_KHR,
	VK_STRUCTURE_TYPE_EXPORT_MEMORY_ALLOCATE_INFO_KHR = VkStructureType.VK_STRUCTURE_TYPE_EXPORT_MEMORY_ALLOCATE_INFO_KHR,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_EXTERNAL_SEMAPHORE_INFO_KHR = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_EXTERNAL_SEMAPHORE_INFO_KHR,
	VK_STRUCTURE_TYPE_EXTERNAL_SEMAPHORE_PROPERTIES_KHR = VkStructureType.VK_STRUCTURE_TYPE_EXTERNAL_SEMAPHORE_PROPERTIES_KHR,
	VK_STRUCTURE_TYPE_EXPORT_SEMAPHORE_CREATE_INFO_KHR = VkStructureType.VK_STRUCTURE_TYPE_EXPORT_SEMAPHORE_CREATE_INFO_KHR,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_FLOAT16_INT8_FEATURES_KHR = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_FLOAT16_INT8_FEATURES_KHR,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FLOAT16_INT8_FEATURES_KHR = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FLOAT16_INT8_FEATURES_KHR,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_16BIT_STORAGE_FEATURES_KHR = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_16BIT_STORAGE_FEATURES_KHR,
	VK_STRUCTURE_TYPE_DESCRIPTOR_UPDATE_TEMPLATE_CREATE_INFO_KHR = VkStructureType.VK_STRUCTURE_TYPE_DESCRIPTOR_UPDATE_TEMPLATE_CREATE_INFO_KHR,
	VK_STRUCTURE_TYPE_SURFACE_CAPABILITIES2_EXT = VkStructureType.VK_STRUCTURE_TYPE_SURFACE_CAPABILITIES2_EXT,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGELESS_FRAMEBUFFER_FEATURES_KHR = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGELESS_FRAMEBUFFER_FEATURES_KHR,
	VK_STRUCTURE_TYPE_FRAMEBUFFER_ATTACHMENTS_CREATE_INFO_KHR = VkStructureType.VK_STRUCTURE_TYPE_FRAMEBUFFER_ATTACHMENTS_CREATE_INFO_KHR,
	VK_STRUCTURE_TYPE_FRAMEBUFFER_ATTACHMENT_IMAGE_INFO_KHR = VkStructureType.VK_STRUCTURE_TYPE_FRAMEBUFFER_ATTACHMENT_IMAGE_INFO_KHR,
	VK_STRUCTURE_TYPE_RENDER_PASS_ATTACHMENT_BEGIN_INFO_KHR = VkStructureType.VK_STRUCTURE_TYPE_RENDER_PASS_ATTACHMENT_BEGIN_INFO_KHR,
	VK_STRUCTURE_TYPE_ATTACHMENT_DESCRIPTION_2_KHR = VkStructureType.VK_STRUCTURE_TYPE_ATTACHMENT_DESCRIPTION_2_KHR,
	VK_STRUCTURE_TYPE_ATTACHMENT_REFERENCE_2_KHR = VkStructureType.VK_STRUCTURE_TYPE_ATTACHMENT_REFERENCE_2_KHR,
	VK_STRUCTURE_TYPE_SUBPASS_DESCRIPTION_2_KHR = VkStructureType.VK_STRUCTURE_TYPE_SUBPASS_DESCRIPTION_2_KHR,
	VK_STRUCTURE_TYPE_SUBPASS_DEPENDENCY_2_KHR = VkStructureType.VK_STRUCTURE_TYPE_SUBPASS_DEPENDENCY_2_KHR,
	VK_STRUCTURE_TYPE_RENDER_PASS_CREATE_INFO_2_KHR = VkStructureType.VK_STRUCTURE_TYPE_RENDER_PASS_CREATE_INFO_2_KHR,
	VK_STRUCTURE_TYPE_SUBPASS_BEGIN_INFO_KHR = VkStructureType.VK_STRUCTURE_TYPE_SUBPASS_BEGIN_INFO_KHR,
	VK_STRUCTURE_TYPE_SUBPASS_END_INFO_KHR = VkStructureType.VK_STRUCTURE_TYPE_SUBPASS_END_INFO_KHR,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_EXTERNAL_FENCE_INFO_KHR = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_EXTERNAL_FENCE_INFO_KHR,
	VK_STRUCTURE_TYPE_EXTERNAL_FENCE_PROPERTIES_KHR = VkStructureType.VK_STRUCTURE_TYPE_EXTERNAL_FENCE_PROPERTIES_KHR,
	VK_STRUCTURE_TYPE_EXPORT_FENCE_CREATE_INFO_KHR = VkStructureType.VK_STRUCTURE_TYPE_EXPORT_FENCE_CREATE_INFO_KHR,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_POINT_CLIPPING_PROPERTIES_KHR = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_POINT_CLIPPING_PROPERTIES_KHR,
	VK_STRUCTURE_TYPE_RENDER_PASS_INPUT_ATTACHMENT_ASPECT_CREATE_INFO_KHR = VkStructureType.VK_STRUCTURE_TYPE_RENDER_PASS_INPUT_ATTACHMENT_ASPECT_CREATE_INFO_KHR,
	VK_STRUCTURE_TYPE_IMAGE_VIEW_USAGE_CREATE_INFO_KHR = VkStructureType.VK_STRUCTURE_TYPE_IMAGE_VIEW_USAGE_CREATE_INFO_KHR,
	VK_STRUCTURE_TYPE_PIPELINE_TESSELLATION_DOMAIN_ORIGIN_STATE_CREATE_INFO_KHR = VkStructureType.VK_STRUCTURE_TYPE_PIPELINE_TESSELLATION_DOMAIN_ORIGIN_STATE_CREATE_INFO_KHR,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VARIABLE_POINTERS_FEATURES_KHR = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VARIABLE_POINTERS_FEATURES_KHR,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VARIABLE_POINTER_FEATURES_KHR = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VARIABLE_POINTER_FEATURES_KHR,
	VK_STRUCTURE_TYPE_MEMORY_DEDICATED_REQUIREMENTS_KHR = VkStructureType.VK_STRUCTURE_TYPE_MEMORY_DEDICATED_REQUIREMENTS_KHR,
	VK_STRUCTURE_TYPE_MEMORY_DEDICATED_ALLOCATE_INFO_KHR = VkStructureType.VK_STRUCTURE_TYPE_MEMORY_DEDICATED_ALLOCATE_INFO_KHR,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SAMPLER_FILTER_MINMAX_PROPERTIES_EXT = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SAMPLER_FILTER_MINMAX_PROPERTIES_EXT,
	VK_STRUCTURE_TYPE_SAMPLER_REDUCTION_MODE_CREATE_INFO_EXT = VkStructureType.VK_STRUCTURE_TYPE_SAMPLER_REDUCTION_MODE_CREATE_INFO_EXT,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_INLINE_UNIFORM_BLOCK_FEATURES_EXT = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_INLINE_UNIFORM_BLOCK_FEATURES_EXT,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_INLINE_UNIFORM_BLOCK_PROPERTIES_EXT = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_INLINE_UNIFORM_BLOCK_PROPERTIES_EXT,
	VK_STRUCTURE_TYPE_WRITE_DESCRIPTOR_SET_INLINE_UNIFORM_BLOCK_EXT = VkStructureType.VK_STRUCTURE_TYPE_WRITE_DESCRIPTOR_SET_INLINE_UNIFORM_BLOCK_EXT,
	VK_STRUCTURE_TYPE_DESCRIPTOR_POOL_INLINE_UNIFORM_BLOCK_CREATE_INFO_EXT = VkStructureType.VK_STRUCTURE_TYPE_DESCRIPTOR_POOL_INLINE_UNIFORM_BLOCK_CREATE_INFO_EXT,
	VK_STRUCTURE_TYPE_BUFFER_MEMORY_REQUIREMENTS_INFO_2_KHR = VkStructureType.VK_STRUCTURE_TYPE_BUFFER_MEMORY_REQUIREMENTS_INFO_2_KHR,
	VK_STRUCTURE_TYPE_IMAGE_MEMORY_REQUIREMENTS_INFO_2_KHR = VkStructureType.VK_STRUCTURE_TYPE_IMAGE_MEMORY_REQUIREMENTS_INFO_2_KHR,
	VK_STRUCTURE_TYPE_IMAGE_SPARSE_MEMORY_REQUIREMENTS_INFO_2_KHR = VkStructureType.VK_STRUCTURE_TYPE_IMAGE_SPARSE_MEMORY_REQUIREMENTS_INFO_2_KHR,
	VK_STRUCTURE_TYPE_MEMORY_REQUIREMENTS_2_KHR = VkStructureType.VK_STRUCTURE_TYPE_MEMORY_REQUIREMENTS_2_KHR,
	VK_STRUCTURE_TYPE_SPARSE_IMAGE_MEMORY_REQUIREMENTS_2_KHR = VkStructureType.VK_STRUCTURE_TYPE_SPARSE_IMAGE_MEMORY_REQUIREMENTS_2_KHR,
	VK_STRUCTURE_TYPE_IMAGE_FORMAT_LIST_CREATE_INFO_KHR = VkStructureType.VK_STRUCTURE_TYPE_IMAGE_FORMAT_LIST_CREATE_INFO_KHR,
	VK_STRUCTURE_TYPE_SAMPLER_YCBCR_CONVERSION_CREATE_INFO_KHR = VkStructureType.VK_STRUCTURE_TYPE_SAMPLER_YCBCR_CONVERSION_CREATE_INFO_KHR,
	VK_STRUCTURE_TYPE_SAMPLER_YCBCR_CONVERSION_INFO_KHR = VkStructureType.VK_STRUCTURE_TYPE_SAMPLER_YCBCR_CONVERSION_INFO_KHR,
	VK_STRUCTURE_TYPE_BIND_IMAGE_PLANE_MEMORY_INFO_KHR = VkStructureType.VK_STRUCTURE_TYPE_BIND_IMAGE_PLANE_MEMORY_INFO_KHR,
	VK_STRUCTURE_TYPE_IMAGE_PLANE_MEMORY_REQUIREMENTS_INFO_KHR = VkStructureType.VK_STRUCTURE_TYPE_IMAGE_PLANE_MEMORY_REQUIREMENTS_INFO_KHR,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SAMPLER_YCBCR_CONVERSION_FEATURES_KHR = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SAMPLER_YCBCR_CONVERSION_FEATURES_KHR,
	VK_STRUCTURE_TYPE_SAMPLER_YCBCR_CONVERSION_IMAGE_FORMAT_PROPERTIES_KHR = VkStructureType.VK_STRUCTURE_TYPE_SAMPLER_YCBCR_CONVERSION_IMAGE_FORMAT_PROPERTIES_KHR,
	VK_STRUCTURE_TYPE_BIND_BUFFER_MEMORY_INFO_KHR = VkStructureType.VK_STRUCTURE_TYPE_BIND_BUFFER_MEMORY_INFO_KHR,
	VK_STRUCTURE_TYPE_BIND_IMAGE_MEMORY_INFO_KHR = VkStructureType.VK_STRUCTURE_TYPE_BIND_IMAGE_MEMORY_INFO_KHR,
	VK_STRUCTURE_TYPE_DESCRIPTOR_SET_LAYOUT_BINDING_FLAGS_CREATE_INFO_EXT = VkStructureType.VK_STRUCTURE_TYPE_DESCRIPTOR_SET_LAYOUT_BINDING_FLAGS_CREATE_INFO_EXT,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DESCRIPTOR_INDEXING_FEATURES_EXT = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DESCRIPTOR_INDEXING_FEATURES_EXT,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DESCRIPTOR_INDEXING_PROPERTIES_EXT = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DESCRIPTOR_INDEXING_PROPERTIES_EXT,
	VK_STRUCTURE_TYPE_DESCRIPTOR_SET_VARIABLE_DESCRIPTOR_COUNT_ALLOCATE_INFO_EXT = VkStructureType.VK_STRUCTURE_TYPE_DESCRIPTOR_SET_VARIABLE_DESCRIPTOR_COUNT_ALLOCATE_INFO_EXT,
	VK_STRUCTURE_TYPE_DESCRIPTOR_SET_VARIABLE_DESCRIPTOR_COUNT_LAYOUT_SUPPORT_EXT = VkStructureType.VK_STRUCTURE_TYPE_DESCRIPTOR_SET_VARIABLE_DESCRIPTOR_COUNT_LAYOUT_SUPPORT_EXT,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_3_PROPERTIES_KHR = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_3_PROPERTIES_KHR,
	VK_STRUCTURE_TYPE_DESCRIPTOR_SET_LAYOUT_SUPPORT_KHR = VkStructureType.VK_STRUCTURE_TYPE_DESCRIPTOR_SET_LAYOUT_SUPPORT_KHR,
	VK_STRUCTURE_TYPE_DEVICE_QUEUE_GLOBAL_PRIORITY_CREATE_INFO_EXT = VkStructureType.VK_STRUCTURE_TYPE_DEVICE_QUEUE_GLOBAL_PRIORITY_CREATE_INFO_EXT,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_SUBGROUP_EXTENDED_TYPES_FEATURES_KHR = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_SUBGROUP_EXTENDED_TYPES_FEATURES_KHR,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_8BIT_STORAGE_FEATURES_KHR = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_8BIT_STORAGE_FEATURES_KHR,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_ATOMIC_INT64_FEATURES_KHR = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_ATOMIC_INT64_FEATURES_KHR,
	VK_STRUCTURE_TYPE_PIPELINE_CREATION_FEEDBACK_CREATE_INFO_EXT = VkStructureType.VK_STRUCTURE_TYPE_PIPELINE_CREATION_FEEDBACK_CREATE_INFO_EXT,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DRIVER_PROPERTIES_KHR = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DRIVER_PROPERTIES_KHR,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FLOAT_CONTROLS_PROPERTIES_KHR = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FLOAT_CONTROLS_PROPERTIES_KHR,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DEPTH_STENCIL_RESOLVE_PROPERTIES_KHR = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DEPTH_STENCIL_RESOLVE_PROPERTIES_KHR,
	VK_STRUCTURE_TYPE_SUBPASS_DESCRIPTION_DEPTH_STENCIL_RESOLVE_KHR = VkStructureType.VK_STRUCTURE_TYPE_SUBPASS_DESCRIPTION_DEPTH_STENCIL_RESOLVE_KHR,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TIMELINE_SEMAPHORE_FEATURES_KHR = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TIMELINE_SEMAPHORE_FEATURES_KHR,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TIMELINE_SEMAPHORE_PROPERTIES_KHR = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TIMELINE_SEMAPHORE_PROPERTIES_KHR,
	VK_STRUCTURE_TYPE_SEMAPHORE_TYPE_CREATE_INFO_KHR = VkStructureType.VK_STRUCTURE_TYPE_SEMAPHORE_TYPE_CREATE_INFO_KHR,
	VK_STRUCTURE_TYPE_TIMELINE_SEMAPHORE_SUBMIT_INFO_KHR = VkStructureType.VK_STRUCTURE_TYPE_TIMELINE_SEMAPHORE_SUBMIT_INFO_KHR,
	VK_STRUCTURE_TYPE_SEMAPHORE_WAIT_INFO_KHR = VkStructureType.VK_STRUCTURE_TYPE_SEMAPHORE_WAIT_INFO_KHR,
	VK_STRUCTURE_TYPE_SEMAPHORE_SIGNAL_INFO_KHR = VkStructureType.VK_STRUCTURE_TYPE_SEMAPHORE_SIGNAL_INFO_KHR,
	VK_STRUCTURE_TYPE_QUERY_POOL_CREATE_INFO_INTEL = VkStructureType.VK_STRUCTURE_TYPE_QUERY_POOL_CREATE_INFO_INTEL,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VULKAN_MEMORY_MODEL_FEATURES_KHR = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VULKAN_MEMORY_MODEL_FEATURES_KHR,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_TERMINATE_INVOCATION_FEATURES_KHR = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_TERMINATE_INVOCATION_FEATURES_KHR,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SCALAR_BLOCK_LAYOUT_FEATURES_EXT = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SCALAR_BLOCK_LAYOUT_FEATURES_EXT,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SUBGROUP_SIZE_CONTROL_PROPERTIES_EXT = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SUBGROUP_SIZE_CONTROL_PROPERTIES_EXT,
	VK_STRUCTURE_TYPE_PIPELINE_SHADER_STAGE_REQUIRED_SUBGROUP_SIZE_CREATE_INFO_EXT = VkStructureType.VK_STRUCTURE_TYPE_PIPELINE_SHADER_STAGE_REQUIRED_SUBGROUP_SIZE_CREATE_INFO_EXT,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SUBGROUP_SIZE_CONTROL_FEATURES_EXT = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SUBGROUP_SIZE_CONTROL_FEATURES_EXT,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SEPARATE_DEPTH_STENCIL_LAYOUTS_FEATURES_KHR = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SEPARATE_DEPTH_STENCIL_LAYOUTS_FEATURES_KHR,
	VK_STRUCTURE_TYPE_ATTACHMENT_REFERENCE_STENCIL_LAYOUT_KHR = VkStructureType.VK_STRUCTURE_TYPE_ATTACHMENT_REFERENCE_STENCIL_LAYOUT_KHR,
	VK_STRUCTURE_TYPE_ATTACHMENT_DESCRIPTION_STENCIL_LAYOUT_KHR = VkStructureType.VK_STRUCTURE_TYPE_ATTACHMENT_DESCRIPTION_STENCIL_LAYOUT_KHR,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_BUFFER_ADDRESS_FEATURES_EXT = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_BUFFER_ADDRESS_FEATURES_EXT,
	VK_STRUCTURE_TYPE_BUFFER_DEVICE_ADDRESS_INFO_EXT = VkStructureType.VK_STRUCTURE_TYPE_BUFFER_DEVICE_ADDRESS_INFO_EXT,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TOOL_PROPERTIES_EXT = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TOOL_PROPERTIES_EXT,
	VK_STRUCTURE_TYPE_IMAGE_STENCIL_USAGE_CREATE_INFO_EXT = VkStructureType.VK_STRUCTURE_TYPE_IMAGE_STENCIL_USAGE_CREATE_INFO_EXT,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_UNIFORM_BUFFER_STANDARD_LAYOUT_FEATURES_KHR = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_UNIFORM_BUFFER_STANDARD_LAYOUT_FEATURES_KHR,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_BUFFER_DEVICE_ADDRESS_FEATURES_KHR = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_BUFFER_DEVICE_ADDRESS_FEATURES_KHR,
	VK_STRUCTURE_TYPE_BUFFER_DEVICE_ADDRESS_INFO_KHR = VkStructureType.VK_STRUCTURE_TYPE_BUFFER_DEVICE_ADDRESS_INFO_KHR,
	VK_STRUCTURE_TYPE_BUFFER_OPAQUE_CAPTURE_ADDRESS_CREATE_INFO_KHR = VkStructureType.VK_STRUCTURE_TYPE_BUFFER_OPAQUE_CAPTURE_ADDRESS_CREATE_INFO_KHR,
	VK_STRUCTURE_TYPE_MEMORY_OPAQUE_CAPTURE_ADDRESS_ALLOCATE_INFO_KHR = VkStructureType.VK_STRUCTURE_TYPE_MEMORY_OPAQUE_CAPTURE_ADDRESS_ALLOCATE_INFO_KHR,
	VK_STRUCTURE_TYPE_DEVICE_MEMORY_OPAQUE_CAPTURE_ADDRESS_INFO_KHR = VkStructureType.VK_STRUCTURE_TYPE_DEVICE_MEMORY_OPAQUE_CAPTURE_ADDRESS_INFO_KHR,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_HOST_QUERY_RESET_FEATURES_EXT = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_HOST_QUERY_RESET_FEATURES_EXT,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_DEMOTE_TO_HELPER_INVOCATION_FEATURES_EXT = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_DEMOTE_TO_HELPER_INVOCATION_FEATURES_EXT,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_INTEGER_DOT_PRODUCT_FEATURES_KHR = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_INTEGER_DOT_PRODUCT_FEATURES_KHR,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_INTEGER_DOT_PRODUCT_PROPERTIES_KHR = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_INTEGER_DOT_PRODUCT_PROPERTIES_KHR,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TEXEL_BUFFER_ALIGNMENT_PROPERTIES_EXT = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TEXEL_BUFFER_ALIGNMENT_PROPERTIES_EXT,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PRIVATE_DATA_FEATURES_EXT = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PRIVATE_DATA_FEATURES_EXT,
	VK_STRUCTURE_TYPE_DEVICE_PRIVATE_DATA_CREATE_INFO_EXT = VkStructureType.VK_STRUCTURE_TYPE_DEVICE_PRIVATE_DATA_CREATE_INFO_EXT,
	VK_STRUCTURE_TYPE_PRIVATE_DATA_SLOT_CREATE_INFO_EXT = VkStructureType.VK_STRUCTURE_TYPE_PRIVATE_DATA_SLOT_CREATE_INFO_EXT,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PIPELINE_CREATION_CACHE_CONTROL_FEATURES_EXT = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PIPELINE_CREATION_CACHE_CONTROL_FEATURES_EXT,
	VK_STRUCTURE_TYPE_MEMORY_BARRIER_2_KHR = VkStructureType.VK_STRUCTURE_TYPE_MEMORY_BARRIER_2_KHR,
	VK_STRUCTURE_TYPE_BUFFER_MEMORY_BARRIER_2_KHR = VkStructureType.VK_STRUCTURE_TYPE_BUFFER_MEMORY_BARRIER_2_KHR,
	VK_STRUCTURE_TYPE_IMAGE_MEMORY_BARRIER_2_KHR = VkStructureType.VK_STRUCTURE_TYPE_IMAGE_MEMORY_BARRIER_2_KHR,
	VK_STRUCTURE_TYPE_DEPENDENCY_INFO_KHR = VkStructureType.VK_STRUCTURE_TYPE_DEPENDENCY_INFO_KHR,
	VK_STRUCTURE_TYPE_SUBMIT_INFO_2_KHR = VkStructureType.VK_STRUCTURE_TYPE_SUBMIT_INFO_2_KHR,
	VK_STRUCTURE_TYPE_SEMAPHORE_SUBMIT_INFO_KHR = VkStructureType.VK_STRUCTURE_TYPE_SEMAPHORE_SUBMIT_INFO_KHR,
	VK_STRUCTURE_TYPE_COMMAND_BUFFER_SUBMIT_INFO_KHR = VkStructureType.VK_STRUCTURE_TYPE_COMMAND_BUFFER_SUBMIT_INFO_KHR,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SYNCHRONIZATION_2_FEATURES_KHR = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SYNCHRONIZATION_2_FEATURES_KHR,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ZERO_INITIALIZE_WORKGROUP_MEMORY_FEATURES_KHR = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ZERO_INITIALIZE_WORKGROUP_MEMORY_FEATURES_KHR,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_ROBUSTNESS_FEATURES_EXT = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_ROBUSTNESS_FEATURES_EXT,
	VK_STRUCTURE_TYPE_COPY_BUFFER_INFO_2_KHR = VkStructureType.VK_STRUCTURE_TYPE_COPY_BUFFER_INFO_2_KHR,
	VK_STRUCTURE_TYPE_COPY_IMAGE_INFO_2_KHR = VkStructureType.VK_STRUCTURE_TYPE_COPY_IMAGE_INFO_2_KHR,
	VK_STRUCTURE_TYPE_COPY_BUFFER_TO_IMAGE_INFO_2_KHR = VkStructureType.VK_STRUCTURE_TYPE_COPY_BUFFER_TO_IMAGE_INFO_2_KHR,
	VK_STRUCTURE_TYPE_COPY_IMAGE_TO_BUFFER_INFO_2_KHR = VkStructureType.VK_STRUCTURE_TYPE_COPY_IMAGE_TO_BUFFER_INFO_2_KHR,
	VK_STRUCTURE_TYPE_BLIT_IMAGE_INFO_2_KHR = VkStructureType.VK_STRUCTURE_TYPE_BLIT_IMAGE_INFO_2_KHR,
	VK_STRUCTURE_TYPE_RESOLVE_IMAGE_INFO_2_KHR = VkStructureType.VK_STRUCTURE_TYPE_RESOLVE_IMAGE_INFO_2_KHR,
	VK_STRUCTURE_TYPE_BUFFER_COPY_2_KHR = VkStructureType.VK_STRUCTURE_TYPE_BUFFER_COPY_2_KHR,
	VK_STRUCTURE_TYPE_IMAGE_COPY_2_KHR = VkStructureType.VK_STRUCTURE_TYPE_IMAGE_COPY_2_KHR,
	VK_STRUCTURE_TYPE_IMAGE_BLIT_2_KHR = VkStructureType.VK_STRUCTURE_TYPE_IMAGE_BLIT_2_KHR,
	VK_STRUCTURE_TYPE_BUFFER_IMAGE_COPY_2_KHR = VkStructureType.VK_STRUCTURE_TYPE_BUFFER_IMAGE_COPY_2_KHR,
	VK_STRUCTURE_TYPE_IMAGE_RESOLVE_2_KHR = VkStructureType.VK_STRUCTURE_TYPE_IMAGE_RESOLVE_2_KHR,
	VK_STRUCTURE_TYPE_FORMAT_PROPERTIES_3_KHR = VkStructureType.VK_STRUCTURE_TYPE_FORMAT_PROPERTIES_3_KHR,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_GLOBAL_PRIORITY_QUERY_FEATURES_EXT = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_GLOBAL_PRIORITY_QUERY_FEATURES_EXT,
	VK_STRUCTURE_TYPE_QUEUE_FAMILY_GLOBAL_PRIORITY_PROPERTIES_EXT = VkStructureType.VK_STRUCTURE_TYPE_QUEUE_FAMILY_GLOBAL_PRIORITY_PROPERTIES_EXT,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_4_FEATURES_KHR = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_4_FEATURES_KHR,
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_4_PROPERTIES_KHR = VkStructureType.VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_4_PROPERTIES_KHR,
	VK_STRUCTURE_TYPE_DEVICE_BUFFER_MEMORY_REQUIREMENTS_KHR = VkStructureType.VK_STRUCTURE_TYPE_DEVICE_BUFFER_MEMORY_REQUIREMENTS_KHR,
	VK_STRUCTURE_TYPE_DEVICE_IMAGE_MEMORY_REQUIREMENTS_KHR = VkStructureType.VK_STRUCTURE_TYPE_DEVICE_IMAGE_MEMORY_REQUIREMENTS_KHR,
	VK_STRUCTURE_TYPE_MAX_ENUM = VkStructureType.VK_STRUCTURE_TYPE_MAX_ENUM,
}
enum VkSubgroupFeatureFlagBits {
	VK_SUBGROUP_FEATURE_BASIC_BIT = 0x00000001,
	VK_SUBGROUP_FEATURE_VOTE_BIT = 0x00000002,
	VK_SUBGROUP_FEATURE_ARITHMETIC_BIT = 0x00000004,
	VK_SUBGROUP_FEATURE_BALLOT_BIT = 0x00000008,
	VK_SUBGROUP_FEATURE_SHUFFLE_BIT = 0x00000010,
	VK_SUBGROUP_FEATURE_SHUFFLE_RELATIVE_BIT = 0x00000020,
	VK_SUBGROUP_FEATURE_CLUSTERED_BIT = 0x00000040,
	VK_SUBGROUP_FEATURE_QUAD_BIT = 0x00000080,
	VK_SUBGROUP_FEATURE_PARTITIONED_BIT_NV = 0x00000100,
	VK_SUBGROUP_FEATURE_FLAG_BITS_MAX_ENUM = 0x7FFFFFFF,
}
enum : VkSubgroupFeatureFlagBits {
	VK_SUBGROUP_FEATURE_BASIC_BIT = VkSubgroupFeatureFlagBits.VK_SUBGROUP_FEATURE_BASIC_BIT,
	VK_SUBGROUP_FEATURE_VOTE_BIT = VkSubgroupFeatureFlagBits.VK_SUBGROUP_FEATURE_VOTE_BIT,
	VK_SUBGROUP_FEATURE_ARITHMETIC_BIT = VkSubgroupFeatureFlagBits.VK_SUBGROUP_FEATURE_ARITHMETIC_BIT,
	VK_SUBGROUP_FEATURE_BALLOT_BIT = VkSubgroupFeatureFlagBits.VK_SUBGROUP_FEATURE_BALLOT_BIT,
	VK_SUBGROUP_FEATURE_SHUFFLE_BIT = VkSubgroupFeatureFlagBits.VK_SUBGROUP_FEATURE_SHUFFLE_BIT,
	VK_SUBGROUP_FEATURE_SHUFFLE_RELATIVE_BIT = VkSubgroupFeatureFlagBits.VK_SUBGROUP_FEATURE_SHUFFLE_RELATIVE_BIT,
	VK_SUBGROUP_FEATURE_CLUSTERED_BIT = VkSubgroupFeatureFlagBits.VK_SUBGROUP_FEATURE_CLUSTERED_BIT,
	VK_SUBGROUP_FEATURE_QUAD_BIT = VkSubgroupFeatureFlagBits.VK_SUBGROUP_FEATURE_QUAD_BIT,
	VK_SUBGROUP_FEATURE_PARTITIONED_BIT_NV = VkSubgroupFeatureFlagBits.VK_SUBGROUP_FEATURE_PARTITIONED_BIT_NV,
	VK_SUBGROUP_FEATURE_FLAG_BITS_MAX_ENUM = VkSubgroupFeatureFlagBits.VK_SUBGROUP_FEATURE_FLAG_BITS_MAX_ENUM,
}
enum VkSubmitFlagBits {
	VK_SUBMIT_PROTECTED_BIT = 0x00000001,
	VK_SUBMIT_PROTECTED_BIT_KHR = VK_SUBMIT_PROTECTED_BIT,
	VK_SUBMIT_FLAG_BITS_MAX_ENUM = 0x7FFFFFFF,
}
enum : VkSubmitFlagBits {
	VK_SUBMIT_PROTECTED_BIT = VkSubmitFlagBits.VK_SUBMIT_PROTECTED_BIT,
	VK_SUBMIT_PROTECTED_BIT_KHR = VkSubmitFlagBits.VK_SUBMIT_PROTECTED_BIT_KHR,
	VK_SUBMIT_FLAG_BITS_MAX_ENUM = VkSubmitFlagBits.VK_SUBMIT_FLAG_BITS_MAX_ENUM,
}
enum VkSubpassContents {
	VK_SUBPASS_CONTENTS_INLINE = 0,
	VK_SUBPASS_CONTENTS_SECONDARY_COMMAND_BUFFERS = 1,
	VK_SUBPASS_CONTENTS_MAX_ENUM = 0x7FFFFFFF,
}
enum : VkSubpassContents {
	VK_SUBPASS_CONTENTS_INLINE = VkSubpassContents.VK_SUBPASS_CONTENTS_INLINE,
	VK_SUBPASS_CONTENTS_SECONDARY_COMMAND_BUFFERS = VkSubpassContents.VK_SUBPASS_CONTENTS_SECONDARY_COMMAND_BUFFERS,
	VK_SUBPASS_CONTENTS_MAX_ENUM = VkSubpassContents.VK_SUBPASS_CONTENTS_MAX_ENUM,
}
enum VkSubpassDescriptionFlagBits {
	VK_SUBPASS_DESCRIPTION_PER_VIEW_ATTRIBUTES_BIT_NVX = 0x00000001,
	VK_SUBPASS_DESCRIPTION_PER_VIEW_POSITION_X_ONLY_BIT_NVX = 0x00000002,
	VK_SUBPASS_DESCRIPTION_FRAGMENT_REGION_BIT_QCOM = 0x00000004,
	VK_SUBPASS_DESCRIPTION_SHADER_RESOLVE_BIT_QCOM = 0x00000008,
	VK_SUBPASS_DESCRIPTION_RASTERIZATION_ORDER_ATTACHMENT_COLOR_ACCESS_BIT_ARM = 0x00000010,
	VK_SUBPASS_DESCRIPTION_RASTERIZATION_ORDER_ATTACHMENT_DEPTH_ACCESS_BIT_ARM = 0x00000020,
	VK_SUBPASS_DESCRIPTION_RASTERIZATION_ORDER_ATTACHMENT_STENCIL_ACCESS_BIT_ARM = 0x00000040,
	VK_SUBPASS_DESCRIPTION_FLAG_BITS_MAX_ENUM = 0x7FFFFFFF,
}
enum : VkSubpassDescriptionFlagBits {
	VK_SUBPASS_DESCRIPTION_PER_VIEW_ATTRIBUTES_BIT_NVX = VkSubpassDescriptionFlagBits.VK_SUBPASS_DESCRIPTION_PER_VIEW_ATTRIBUTES_BIT_NVX,
	VK_SUBPASS_DESCRIPTION_PER_VIEW_POSITION_X_ONLY_BIT_NVX = VkSubpassDescriptionFlagBits.VK_SUBPASS_DESCRIPTION_PER_VIEW_POSITION_X_ONLY_BIT_NVX,
	VK_SUBPASS_DESCRIPTION_FRAGMENT_REGION_BIT_QCOM = VkSubpassDescriptionFlagBits.VK_SUBPASS_DESCRIPTION_FRAGMENT_REGION_BIT_QCOM,
	VK_SUBPASS_DESCRIPTION_SHADER_RESOLVE_BIT_QCOM = VkSubpassDescriptionFlagBits.VK_SUBPASS_DESCRIPTION_SHADER_RESOLVE_BIT_QCOM,
	VK_SUBPASS_DESCRIPTION_RASTERIZATION_ORDER_ATTACHMENT_COLOR_ACCESS_BIT_ARM = VkSubpassDescriptionFlagBits.VK_SUBPASS_DESCRIPTION_RASTERIZATION_ORDER_ATTACHMENT_COLOR_ACCESS_BIT_ARM,
	VK_SUBPASS_DESCRIPTION_RASTERIZATION_ORDER_ATTACHMENT_DEPTH_ACCESS_BIT_ARM = VkSubpassDescriptionFlagBits.VK_SUBPASS_DESCRIPTION_RASTERIZATION_ORDER_ATTACHMENT_DEPTH_ACCESS_BIT_ARM,
	VK_SUBPASS_DESCRIPTION_RASTERIZATION_ORDER_ATTACHMENT_STENCIL_ACCESS_BIT_ARM = VkSubpassDescriptionFlagBits.VK_SUBPASS_DESCRIPTION_RASTERIZATION_ORDER_ATTACHMENT_STENCIL_ACCESS_BIT_ARM,
	VK_SUBPASS_DESCRIPTION_FLAG_BITS_MAX_ENUM = VkSubpassDescriptionFlagBits.VK_SUBPASS_DESCRIPTION_FLAG_BITS_MAX_ENUM,
}
enum VkSurfaceCounterFlagBitsEXT {
	VK_SURFACE_COUNTER_VBLANK_BIT_EXT = 0x00000001,
	VK_SURFACE_COUNTER_VBLANK_EXT = VK_SURFACE_COUNTER_VBLANK_BIT_EXT,
	VK_SURFACE_COUNTER_FLAG_BITS_MAX_ENUM_EXT = 0x7FFFFFFF,
}
enum : VkSurfaceCounterFlagBitsEXT {
	VK_SURFACE_COUNTER_VBLANK_BIT_EXT = VkSurfaceCounterFlagBitsEXT.VK_SURFACE_COUNTER_VBLANK_BIT_EXT,
	VK_SURFACE_COUNTER_VBLANK_EXT = VkSurfaceCounterFlagBitsEXT.VK_SURFACE_COUNTER_VBLANK_EXT,
	VK_SURFACE_COUNTER_FLAG_BITS_MAX_ENUM_EXT = VkSurfaceCounterFlagBitsEXT.VK_SURFACE_COUNTER_FLAG_BITS_MAX_ENUM_EXT,
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
enum : VkSurfaceTransformFlagBitsKHR {
	VK_SURFACE_TRANSFORM_IDENTITY_BIT_KHR = VkSurfaceTransformFlagBitsKHR.VK_SURFACE_TRANSFORM_IDENTITY_BIT_KHR,
	VK_SURFACE_TRANSFORM_ROTATE_90_BIT_KHR = VkSurfaceTransformFlagBitsKHR.VK_SURFACE_TRANSFORM_ROTATE_90_BIT_KHR,
	VK_SURFACE_TRANSFORM_ROTATE_180_BIT_KHR = VkSurfaceTransformFlagBitsKHR.VK_SURFACE_TRANSFORM_ROTATE_180_BIT_KHR,
	VK_SURFACE_TRANSFORM_ROTATE_270_BIT_KHR = VkSurfaceTransformFlagBitsKHR.VK_SURFACE_TRANSFORM_ROTATE_270_BIT_KHR,
	VK_SURFACE_TRANSFORM_HORIZONTAL_MIRROR_BIT_KHR = VkSurfaceTransformFlagBitsKHR.VK_SURFACE_TRANSFORM_HORIZONTAL_MIRROR_BIT_KHR,
	VK_SURFACE_TRANSFORM_HORIZONTAL_MIRROR_ROTATE_90_BIT_KHR = VkSurfaceTransformFlagBitsKHR.VK_SURFACE_TRANSFORM_HORIZONTAL_MIRROR_ROTATE_90_BIT_KHR,
	VK_SURFACE_TRANSFORM_HORIZONTAL_MIRROR_ROTATE_180_BIT_KHR = VkSurfaceTransformFlagBitsKHR.VK_SURFACE_TRANSFORM_HORIZONTAL_MIRROR_ROTATE_180_BIT_KHR,
	VK_SURFACE_TRANSFORM_HORIZONTAL_MIRROR_ROTATE_270_BIT_KHR = VkSurfaceTransformFlagBitsKHR.VK_SURFACE_TRANSFORM_HORIZONTAL_MIRROR_ROTATE_270_BIT_KHR,
	VK_SURFACE_TRANSFORM_INHERIT_BIT_KHR = VkSurfaceTransformFlagBitsKHR.VK_SURFACE_TRANSFORM_INHERIT_BIT_KHR,
	VK_SURFACE_TRANSFORM_FLAG_BITS_MAX_ENUM_KHR = VkSurfaceTransformFlagBitsKHR.VK_SURFACE_TRANSFORM_FLAG_BITS_MAX_ENUM_KHR,
}
enum VkSwapchainCreateFlagBitsKHR {
	VK_SWAPCHAIN_CREATE_SPLIT_INSTANCE_BIND_REGIONS_BIT_KHR = 0x00000001,
	VK_SWAPCHAIN_CREATE_PROTECTED_BIT_KHR = 0x00000002,
	VK_SWAPCHAIN_CREATE_MUTABLE_FORMAT_BIT_KHR = 0x00000004,
	VK_SWAPCHAIN_CREATE_FLAG_BITS_MAX_ENUM_KHR = 0x7FFFFFFF,
}
enum : VkSwapchainCreateFlagBitsKHR {
	VK_SWAPCHAIN_CREATE_SPLIT_INSTANCE_BIND_REGIONS_BIT_KHR = VkSwapchainCreateFlagBitsKHR.VK_SWAPCHAIN_CREATE_SPLIT_INSTANCE_BIND_REGIONS_BIT_KHR,
	VK_SWAPCHAIN_CREATE_PROTECTED_BIT_KHR = VkSwapchainCreateFlagBitsKHR.VK_SWAPCHAIN_CREATE_PROTECTED_BIT_KHR,
	VK_SWAPCHAIN_CREATE_MUTABLE_FORMAT_BIT_KHR = VkSwapchainCreateFlagBitsKHR.VK_SWAPCHAIN_CREATE_MUTABLE_FORMAT_BIT_KHR,
	VK_SWAPCHAIN_CREATE_FLAG_BITS_MAX_ENUM_KHR = VkSwapchainCreateFlagBitsKHR.VK_SWAPCHAIN_CREATE_FLAG_BITS_MAX_ENUM_KHR,
}
enum VkSystemAllocationScope {
	VK_SYSTEM_ALLOCATION_SCOPE_COMMAND = 0,
	VK_SYSTEM_ALLOCATION_SCOPE_OBJECT = 1,
	VK_SYSTEM_ALLOCATION_SCOPE_CACHE = 2,
	VK_SYSTEM_ALLOCATION_SCOPE_DEVICE = 3,
	VK_SYSTEM_ALLOCATION_SCOPE_INSTANCE = 4,
	VK_SYSTEM_ALLOCATION_SCOPE_MAX_ENUM = 0x7FFFFFFF,
}
enum : VkSystemAllocationScope {
	VK_SYSTEM_ALLOCATION_SCOPE_COMMAND = VkSystemAllocationScope.VK_SYSTEM_ALLOCATION_SCOPE_COMMAND,
	VK_SYSTEM_ALLOCATION_SCOPE_OBJECT = VkSystemAllocationScope.VK_SYSTEM_ALLOCATION_SCOPE_OBJECT,
	VK_SYSTEM_ALLOCATION_SCOPE_CACHE = VkSystemAllocationScope.VK_SYSTEM_ALLOCATION_SCOPE_CACHE,
	VK_SYSTEM_ALLOCATION_SCOPE_DEVICE = VkSystemAllocationScope.VK_SYSTEM_ALLOCATION_SCOPE_DEVICE,
	VK_SYSTEM_ALLOCATION_SCOPE_INSTANCE = VkSystemAllocationScope.VK_SYSTEM_ALLOCATION_SCOPE_INSTANCE,
	VK_SYSTEM_ALLOCATION_SCOPE_MAX_ENUM = VkSystemAllocationScope.VK_SYSTEM_ALLOCATION_SCOPE_MAX_ENUM,
}
enum VkTessellationDomainOrigin {
	VK_TESSELLATION_DOMAIN_ORIGIN_UPPER_LEFT = 0,
	VK_TESSELLATION_DOMAIN_ORIGIN_LOWER_LEFT = 1,
	VK_TESSELLATION_DOMAIN_ORIGIN_UPPER_LEFT_KHR = VK_TESSELLATION_DOMAIN_ORIGIN_UPPER_LEFT,
	VK_TESSELLATION_DOMAIN_ORIGIN_LOWER_LEFT_KHR = VK_TESSELLATION_DOMAIN_ORIGIN_LOWER_LEFT,
	VK_TESSELLATION_DOMAIN_ORIGIN_MAX_ENUM = 0x7FFFFFFF,
}
enum : VkTessellationDomainOrigin {
	VK_TESSELLATION_DOMAIN_ORIGIN_UPPER_LEFT = VkTessellationDomainOrigin.VK_TESSELLATION_DOMAIN_ORIGIN_UPPER_LEFT,
	VK_TESSELLATION_DOMAIN_ORIGIN_LOWER_LEFT = VkTessellationDomainOrigin.VK_TESSELLATION_DOMAIN_ORIGIN_LOWER_LEFT,
	VK_TESSELLATION_DOMAIN_ORIGIN_UPPER_LEFT_KHR = VkTessellationDomainOrigin.VK_TESSELLATION_DOMAIN_ORIGIN_UPPER_LEFT_KHR,
	VK_TESSELLATION_DOMAIN_ORIGIN_LOWER_LEFT_KHR = VkTessellationDomainOrigin.VK_TESSELLATION_DOMAIN_ORIGIN_LOWER_LEFT_KHR,
	VK_TESSELLATION_DOMAIN_ORIGIN_MAX_ENUM = VkTessellationDomainOrigin.VK_TESSELLATION_DOMAIN_ORIGIN_MAX_ENUM,
}
enum VkTimeDomainEXT {
	VK_TIME_DOMAIN_DEVICE_EXT = 0,
	VK_TIME_DOMAIN_CLOCK_MONOTONIC_EXT = 1,
	VK_TIME_DOMAIN_CLOCK_MONOTONIC_RAW_EXT = 2,
	VK_TIME_DOMAIN_QUERY_PERFORMANCE_COUNTER_EXT = 3,
	VK_TIME_DOMAIN_MAX_ENUM_EXT = 0x7FFFFFFF,
}
enum : VkTimeDomainEXT {
	VK_TIME_DOMAIN_DEVICE_EXT = VkTimeDomainEXT.VK_TIME_DOMAIN_DEVICE_EXT,
	VK_TIME_DOMAIN_CLOCK_MONOTONIC_EXT = VkTimeDomainEXT.VK_TIME_DOMAIN_CLOCK_MONOTONIC_EXT,
	VK_TIME_DOMAIN_CLOCK_MONOTONIC_RAW_EXT = VkTimeDomainEXT.VK_TIME_DOMAIN_CLOCK_MONOTONIC_RAW_EXT,
	VK_TIME_DOMAIN_QUERY_PERFORMANCE_COUNTER_EXT = VkTimeDomainEXT.VK_TIME_DOMAIN_QUERY_PERFORMANCE_COUNTER_EXT,
	VK_TIME_DOMAIN_MAX_ENUM_EXT = VkTimeDomainEXT.VK_TIME_DOMAIN_MAX_ENUM_EXT,
}
enum VkToolPurposeFlagBits {
	VK_TOOL_PURPOSE_VALIDATION_BIT = 0x00000001,
	VK_TOOL_PURPOSE_PROFILING_BIT = 0x00000002,
	VK_TOOL_PURPOSE_TRACING_BIT = 0x00000004,
	VK_TOOL_PURPOSE_ADDITIONAL_FEATURES_BIT = 0x00000008,
	VK_TOOL_PURPOSE_MODIFYING_FEATURES_BIT = 0x00000010,
	VK_TOOL_PURPOSE_DEBUG_REPORTING_BIT_EXT = 0x00000020,
	VK_TOOL_PURPOSE_DEBUG_MARKERS_BIT_EXT = 0x00000040,
	VK_TOOL_PURPOSE_VALIDATION_BIT_EXT = VK_TOOL_PURPOSE_VALIDATION_BIT,
	VK_TOOL_PURPOSE_PROFILING_BIT_EXT = VK_TOOL_PURPOSE_PROFILING_BIT,
	VK_TOOL_PURPOSE_TRACING_BIT_EXT = VK_TOOL_PURPOSE_TRACING_BIT,
	VK_TOOL_PURPOSE_ADDITIONAL_FEATURES_BIT_EXT = VK_TOOL_PURPOSE_ADDITIONAL_FEATURES_BIT,
	VK_TOOL_PURPOSE_MODIFYING_FEATURES_BIT_EXT = VK_TOOL_PURPOSE_MODIFYING_FEATURES_BIT,
	VK_TOOL_PURPOSE_FLAG_BITS_MAX_ENUM = 0x7FFFFFFF,
}
enum : VkToolPurposeFlagBits {
	VK_TOOL_PURPOSE_VALIDATION_BIT = VkToolPurposeFlagBits.VK_TOOL_PURPOSE_VALIDATION_BIT,
	VK_TOOL_PURPOSE_PROFILING_BIT = VkToolPurposeFlagBits.VK_TOOL_PURPOSE_PROFILING_BIT,
	VK_TOOL_PURPOSE_TRACING_BIT = VkToolPurposeFlagBits.VK_TOOL_PURPOSE_TRACING_BIT,
	VK_TOOL_PURPOSE_ADDITIONAL_FEATURES_BIT = VkToolPurposeFlagBits.VK_TOOL_PURPOSE_ADDITIONAL_FEATURES_BIT,
	VK_TOOL_PURPOSE_MODIFYING_FEATURES_BIT = VkToolPurposeFlagBits.VK_TOOL_PURPOSE_MODIFYING_FEATURES_BIT,
	VK_TOOL_PURPOSE_DEBUG_REPORTING_BIT_EXT = VkToolPurposeFlagBits.VK_TOOL_PURPOSE_DEBUG_REPORTING_BIT_EXT,
	VK_TOOL_PURPOSE_DEBUG_MARKERS_BIT_EXT = VkToolPurposeFlagBits.VK_TOOL_PURPOSE_DEBUG_MARKERS_BIT_EXT,
	VK_TOOL_PURPOSE_VALIDATION_BIT_EXT = VkToolPurposeFlagBits.VK_TOOL_PURPOSE_VALIDATION_BIT_EXT,
	VK_TOOL_PURPOSE_PROFILING_BIT_EXT = VkToolPurposeFlagBits.VK_TOOL_PURPOSE_PROFILING_BIT_EXT,
	VK_TOOL_PURPOSE_TRACING_BIT_EXT = VkToolPurposeFlagBits.VK_TOOL_PURPOSE_TRACING_BIT_EXT,
	VK_TOOL_PURPOSE_ADDITIONAL_FEATURES_BIT_EXT = VkToolPurposeFlagBits.VK_TOOL_PURPOSE_ADDITIONAL_FEATURES_BIT_EXT,
	VK_TOOL_PURPOSE_MODIFYING_FEATURES_BIT_EXT = VkToolPurposeFlagBits.VK_TOOL_PURPOSE_MODIFYING_FEATURES_BIT_EXT,
	VK_TOOL_PURPOSE_FLAG_BITS_MAX_ENUM = VkToolPurposeFlagBits.VK_TOOL_PURPOSE_FLAG_BITS_MAX_ENUM,
}
enum VkValidationCacheHeaderVersionEXT {
	VK_VALIDATION_CACHE_HEADER_VERSION_ONE_EXT = 1,
	VK_VALIDATION_CACHE_HEADER_VERSION_MAX_ENUM_EXT = 0x7FFFFFFF,
}
enum : VkValidationCacheHeaderVersionEXT {
	VK_VALIDATION_CACHE_HEADER_VERSION_ONE_EXT = VkValidationCacheHeaderVersionEXT.VK_VALIDATION_CACHE_HEADER_VERSION_ONE_EXT,
	VK_VALIDATION_CACHE_HEADER_VERSION_MAX_ENUM_EXT = VkValidationCacheHeaderVersionEXT.VK_VALIDATION_CACHE_HEADER_VERSION_MAX_ENUM_EXT,
}
enum VkValidationCheckEXT {
	VK_VALIDATION_CHECK_ALL_EXT = 0,
	VK_VALIDATION_CHECK_SHADERS_EXT = 1,
	VK_VALIDATION_CHECK_MAX_ENUM_EXT = 0x7FFFFFFF,
}
enum : VkValidationCheckEXT {
	VK_VALIDATION_CHECK_ALL_EXT = VkValidationCheckEXT.VK_VALIDATION_CHECK_ALL_EXT,
	VK_VALIDATION_CHECK_SHADERS_EXT = VkValidationCheckEXT.VK_VALIDATION_CHECK_SHADERS_EXT,
	VK_VALIDATION_CHECK_MAX_ENUM_EXT = VkValidationCheckEXT.VK_VALIDATION_CHECK_MAX_ENUM_EXT,
}
enum VkValidationFeatureDisableEXT {
	VK_VALIDATION_FEATURE_DISABLE_ALL_EXT = 0,
	VK_VALIDATION_FEATURE_DISABLE_SHADERS_EXT = 1,
	VK_VALIDATION_FEATURE_DISABLE_THREAD_SAFETY_EXT = 2,
	VK_VALIDATION_FEATURE_DISABLE_API_PARAMETERS_EXT = 3,
	VK_VALIDATION_FEATURE_DISABLE_OBJECT_LIFETIMES_EXT = 4,
	VK_VALIDATION_FEATURE_DISABLE_CORE_CHECKS_EXT = 5,
	VK_VALIDATION_FEATURE_DISABLE_UNIQUE_HANDLES_EXT = 6,
	VK_VALIDATION_FEATURE_DISABLE_SHADER_VALIDATION_CACHE_EXT = 7,
	VK_VALIDATION_FEATURE_DISABLE_MAX_ENUM_EXT = 0x7FFFFFFF,
}
enum : VkValidationFeatureDisableEXT {
	VK_VALIDATION_FEATURE_DISABLE_ALL_EXT = VkValidationFeatureDisableEXT.VK_VALIDATION_FEATURE_DISABLE_ALL_EXT,
	VK_VALIDATION_FEATURE_DISABLE_SHADERS_EXT = VkValidationFeatureDisableEXT.VK_VALIDATION_FEATURE_DISABLE_SHADERS_EXT,
	VK_VALIDATION_FEATURE_DISABLE_THREAD_SAFETY_EXT = VkValidationFeatureDisableEXT.VK_VALIDATION_FEATURE_DISABLE_THREAD_SAFETY_EXT,
	VK_VALIDATION_FEATURE_DISABLE_API_PARAMETERS_EXT = VkValidationFeatureDisableEXT.VK_VALIDATION_FEATURE_DISABLE_API_PARAMETERS_EXT,
	VK_VALIDATION_FEATURE_DISABLE_OBJECT_LIFETIMES_EXT = VkValidationFeatureDisableEXT.VK_VALIDATION_FEATURE_DISABLE_OBJECT_LIFETIMES_EXT,
	VK_VALIDATION_FEATURE_DISABLE_CORE_CHECKS_EXT = VkValidationFeatureDisableEXT.VK_VALIDATION_FEATURE_DISABLE_CORE_CHECKS_EXT,
	VK_VALIDATION_FEATURE_DISABLE_UNIQUE_HANDLES_EXT = VkValidationFeatureDisableEXT.VK_VALIDATION_FEATURE_DISABLE_UNIQUE_HANDLES_EXT,
	VK_VALIDATION_FEATURE_DISABLE_SHADER_VALIDATION_CACHE_EXT = VkValidationFeatureDisableEXT.VK_VALIDATION_FEATURE_DISABLE_SHADER_VALIDATION_CACHE_EXT,
	VK_VALIDATION_FEATURE_DISABLE_MAX_ENUM_EXT = VkValidationFeatureDisableEXT.VK_VALIDATION_FEATURE_DISABLE_MAX_ENUM_EXT,
}
enum VkValidationFeatureEnableEXT {
	VK_VALIDATION_FEATURE_ENABLE_GPU_ASSISTED_EXT = 0,
	VK_VALIDATION_FEATURE_ENABLE_GPU_ASSISTED_RESERVE_BINDING_SLOT_EXT = 1,
	VK_VALIDATION_FEATURE_ENABLE_BEST_PRACTICES_EXT = 2,
	VK_VALIDATION_FEATURE_ENABLE_DEBUG_PRINTF_EXT = 3,
	VK_VALIDATION_FEATURE_ENABLE_SYNCHRONIZATION_VALIDATION_EXT = 4,
	VK_VALIDATION_FEATURE_ENABLE_MAX_ENUM_EXT = 0x7FFFFFFF,
}
enum : VkValidationFeatureEnableEXT {
	VK_VALIDATION_FEATURE_ENABLE_GPU_ASSISTED_EXT = VkValidationFeatureEnableEXT.VK_VALIDATION_FEATURE_ENABLE_GPU_ASSISTED_EXT,
	VK_VALIDATION_FEATURE_ENABLE_GPU_ASSISTED_RESERVE_BINDING_SLOT_EXT = VkValidationFeatureEnableEXT.VK_VALIDATION_FEATURE_ENABLE_GPU_ASSISTED_RESERVE_BINDING_SLOT_EXT,
	VK_VALIDATION_FEATURE_ENABLE_BEST_PRACTICES_EXT = VkValidationFeatureEnableEXT.VK_VALIDATION_FEATURE_ENABLE_BEST_PRACTICES_EXT,
	VK_VALIDATION_FEATURE_ENABLE_DEBUG_PRINTF_EXT = VkValidationFeatureEnableEXT.VK_VALIDATION_FEATURE_ENABLE_DEBUG_PRINTF_EXT,
	VK_VALIDATION_FEATURE_ENABLE_SYNCHRONIZATION_VALIDATION_EXT = VkValidationFeatureEnableEXT.VK_VALIDATION_FEATURE_ENABLE_SYNCHRONIZATION_VALIDATION_EXT,
	VK_VALIDATION_FEATURE_ENABLE_MAX_ENUM_EXT = VkValidationFeatureEnableEXT.VK_VALIDATION_FEATURE_ENABLE_MAX_ENUM_EXT,
}
enum VkVendorId {
	VK_VENDOR_ID_VIV = 0x10001,
	VK_VENDOR_ID_VSI = 0x10002,
	VK_VENDOR_ID_KAZAN = 0x10003,
	VK_VENDOR_ID_CODEPLAY = 0x10004,
	VK_VENDOR_ID_MESA = 0x10005,
	VK_VENDOR_ID_POCL = 0x10006,
	VK_VENDOR_ID_MAX_ENUM = 0x7FFFFFFF,
}
enum : VkVendorId {
	VK_VENDOR_ID_VIV = VkVendorId.VK_VENDOR_ID_VIV,
	VK_VENDOR_ID_VSI = VkVendorId.VK_VENDOR_ID_VSI,
	VK_VENDOR_ID_KAZAN = VkVendorId.VK_VENDOR_ID_KAZAN,
	VK_VENDOR_ID_CODEPLAY = VkVendorId.VK_VENDOR_ID_CODEPLAY,
	VK_VENDOR_ID_MESA = VkVendorId.VK_VENDOR_ID_MESA,
	VK_VENDOR_ID_POCL = VkVendorId.VK_VENDOR_ID_POCL,
	VK_VENDOR_ID_MAX_ENUM = VkVendorId.VK_VENDOR_ID_MAX_ENUM,
}
enum VkVertexInputRate {
	VK_VERTEX_INPUT_RATE_VERTEX = 0,
	VK_VERTEX_INPUT_RATE_INSTANCE = 1,
	VK_VERTEX_INPUT_RATE_MAX_ENUM = 0x7FFFFFFF,
}
enum : VkVertexInputRate {
	VK_VERTEX_INPUT_RATE_VERTEX = VkVertexInputRate.VK_VERTEX_INPUT_RATE_VERTEX,
	VK_VERTEX_INPUT_RATE_INSTANCE = VkVertexInputRate.VK_VERTEX_INPUT_RATE_INSTANCE,
	VK_VERTEX_INPUT_RATE_MAX_ENUM = VkVertexInputRate.VK_VERTEX_INPUT_RATE_MAX_ENUM,
}
enum VkViewportCoordinateSwizzleNV {
	VK_VIEWPORT_COORDINATE_SWIZZLE_POSITIVE_X_NV = 0,
	VK_VIEWPORT_COORDINATE_SWIZZLE_NEGATIVE_X_NV = 1,
	VK_VIEWPORT_COORDINATE_SWIZZLE_POSITIVE_Y_NV = 2,
	VK_VIEWPORT_COORDINATE_SWIZZLE_NEGATIVE_Y_NV = 3,
	VK_VIEWPORT_COORDINATE_SWIZZLE_POSITIVE_Z_NV = 4,
	VK_VIEWPORT_COORDINATE_SWIZZLE_NEGATIVE_Z_NV = 5,
	VK_VIEWPORT_COORDINATE_SWIZZLE_POSITIVE_W_NV = 6,
	VK_VIEWPORT_COORDINATE_SWIZZLE_NEGATIVE_W_NV = 7,
	VK_VIEWPORT_COORDINATE_SWIZZLE_MAX_ENUM_NV = 0x7FFFFFFF,
}
enum : VkViewportCoordinateSwizzleNV {
	VK_VIEWPORT_COORDINATE_SWIZZLE_POSITIVE_X_NV = VkViewportCoordinateSwizzleNV.VK_VIEWPORT_COORDINATE_SWIZZLE_POSITIVE_X_NV,
	VK_VIEWPORT_COORDINATE_SWIZZLE_NEGATIVE_X_NV = VkViewportCoordinateSwizzleNV.VK_VIEWPORT_COORDINATE_SWIZZLE_NEGATIVE_X_NV,
	VK_VIEWPORT_COORDINATE_SWIZZLE_POSITIVE_Y_NV = VkViewportCoordinateSwizzleNV.VK_VIEWPORT_COORDINATE_SWIZZLE_POSITIVE_Y_NV,
	VK_VIEWPORT_COORDINATE_SWIZZLE_NEGATIVE_Y_NV = VkViewportCoordinateSwizzleNV.VK_VIEWPORT_COORDINATE_SWIZZLE_NEGATIVE_Y_NV,
	VK_VIEWPORT_COORDINATE_SWIZZLE_POSITIVE_Z_NV = VkViewportCoordinateSwizzleNV.VK_VIEWPORT_COORDINATE_SWIZZLE_POSITIVE_Z_NV,
	VK_VIEWPORT_COORDINATE_SWIZZLE_NEGATIVE_Z_NV = VkViewportCoordinateSwizzleNV.VK_VIEWPORT_COORDINATE_SWIZZLE_NEGATIVE_Z_NV,
	VK_VIEWPORT_COORDINATE_SWIZZLE_POSITIVE_W_NV = VkViewportCoordinateSwizzleNV.VK_VIEWPORT_COORDINATE_SWIZZLE_POSITIVE_W_NV,
	VK_VIEWPORT_COORDINATE_SWIZZLE_NEGATIVE_W_NV = VkViewportCoordinateSwizzleNV.VK_VIEWPORT_COORDINATE_SWIZZLE_NEGATIVE_W_NV,
	VK_VIEWPORT_COORDINATE_SWIZZLE_MAX_ENUM_NV = VkViewportCoordinateSwizzleNV.VK_VIEWPORT_COORDINATE_SWIZZLE_MAX_ENUM_NV,
}

// Unions
union VkAccelerationStructureGeometryDataKHR {
	VkAccelerationStructureGeometryTrianglesDataKHR triangles;
	VkAccelerationStructureGeometryAabbsDataKHR aabbs;
	VkAccelerationStructureGeometryInstancesDataKHR instances;
}
union VkAccelerationStructureMotionInstanceDataNV {
	VkAccelerationStructureInstanceKHR staticInstance;
	VkAccelerationStructureMatrixMotionInstanceNV matrixMotionInstance;
	VkAccelerationStructureSRTMotionInstanceNV srtMotionInstance;
}
union VkClearColorValue {
	float[4] float32;
	int32_t[4] int32;
	uint32_t[4] uint32;
}
union VkClearValue {
	VkClearColorValue color;
	VkClearDepthStencilValue depthStencil;
}
union VkDeviceOrHostAddressConstKHR {
	VkDeviceAddress deviceAddress;
	void* hostAddress;
}
union VkDeviceOrHostAddressKHR {
	VkDeviceAddress deviceAddress;
	void* hostAddress;
}
union VkPerformanceCounterResultKHR {
	int32_t int32;
	int64_t int64;
	uint32_t uint32;
	uint64_t uint64;
	float float32;
	double float64;
}
union VkPerformanceValueDataINTEL {
	uint32_t value32;
	uint64_t value64;
	float valueFloat;
	VkBool32 valueBool;
	immutable(char)* valueString;
}
union VkPipelineExecutableStatisticValueKHR {
	VkBool32 b32;
	int64_t i64;
	uint64_t u64;
	double f64;
}

// Structs
struct HINSTANCE__ {
	int unused;
}
struct HMONITOR__ {
	int unused;
}
struct HWND__ {
	int unused;
}
struct VkAabbPositionsKHR {
	float minX;
	float minY;
	float minZ;
	float maxX;
	float maxY;
	float maxZ;
}
struct VkAccelerationStructureBuildGeometryInfoKHR {
	VkStructureType sType;
	void* pNext;
	VkAccelerationStructureTypeKHR type;
	VkBuildAccelerationStructureFlagsKHR flags;
	VkBuildAccelerationStructureModeKHR mode;
	VkAccelerationStructureKHR srcAccelerationStructure;
	VkAccelerationStructureKHR dstAccelerationStructure;
	uint32_t geometryCount;
	VkAccelerationStructureGeometryKHR* pGeometries;
	VkAccelerationStructureGeometryKHR** ppGeometries;
	VkDeviceOrHostAddressKHR scratchData;
}
struct VkAccelerationStructureBuildRangeInfoKHR {
	uint32_t primitiveCount;
	uint32_t primitiveOffset;
	uint32_t firstVertex;
	uint32_t transformOffset;
}
struct VkAccelerationStructureBuildSizesInfoKHR {
	VkStructureType sType;
	void* pNext;
	VkDeviceSize accelerationStructureSize;
	VkDeviceSize updateScratchSize;
	VkDeviceSize buildScratchSize;
}
struct VkAccelerationStructureCreateInfoKHR {
	VkStructureType sType;
	void* pNext;
	VkAccelerationStructureCreateFlagsKHR createFlags;
	VkBuffer buffer;
	VkDeviceSize offset;
	VkDeviceSize size;
	VkAccelerationStructureTypeKHR type;
	VkDeviceAddress deviceAddress;
}
struct VkAccelerationStructureCreateInfoNV {
	VkStructureType sType;
	void* pNext;
	VkDeviceSize compactedSize;
	VkAccelerationStructureInfoNV info;
}
struct VkAccelerationStructureDeviceAddressInfoKHR {
	VkStructureType sType;
	void* pNext;
	VkAccelerationStructureKHR accelerationStructure;
}
struct VkAccelerationStructureGeometryAabbsDataKHR {
	VkStructureType sType;
	void* pNext;
	VkDeviceOrHostAddressConstKHR data;
	VkDeviceSize stride;
}
struct VkAccelerationStructureGeometryInstancesDataKHR {
	VkStructureType sType;
	void* pNext;
	VkBool32 arrayOfPointers;
	VkDeviceOrHostAddressConstKHR data;
}
struct VkAccelerationStructureGeometryKHR {
	VkStructureType sType;
	void* pNext;
	VkGeometryTypeKHR geometryType;
	VkAccelerationStructureGeometryDataKHR geometry;
	VkGeometryFlagsKHR flags;
}
struct VkAccelerationStructureGeometryMotionTrianglesDataNV {
	VkStructureType sType;
	void* pNext;
	VkDeviceOrHostAddressConstKHR vertexData;
}
struct VkAccelerationStructureGeometryTrianglesDataKHR {
	VkStructureType sType;
	void* pNext;
	VkFormat vertexFormat;
	VkDeviceOrHostAddressConstKHR vertexData;
	VkDeviceSize vertexStride;
	uint32_t maxVertex;
	VkIndexType indexType;
	VkDeviceOrHostAddressConstKHR indexData;
	VkDeviceOrHostAddressConstKHR transformData;
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
struct VkAccelerationStructureInstanceKHR {
	VkTransformMatrixKHR transform;
	uint32_t instanceCustomIndex;
	uint32_t mask;
	uint32_t instanceShaderBindingTableRecordOffset;
	VkGeometryInstanceFlagsKHR flags;
	uint64_t accelerationStructureReference;
}
struct VkAccelerationStructureKHR_T {
}
struct VkAccelerationStructureMatrixMotionInstanceNV {
	VkTransformMatrixKHR transformT0;
	VkTransformMatrixKHR transformT1;
	uint32_t instanceCustomIndex;
	uint32_t mask;
	uint32_t instanceShaderBindingTableRecordOffset;
	VkGeometryInstanceFlagsKHR flags;
	uint64_t accelerationStructureReference;
}
struct VkAccelerationStructureMemoryRequirementsInfoNV {
	VkStructureType sType;
	void* pNext;
	VkAccelerationStructureMemoryRequirementsTypeNV type;
	VkAccelerationStructureNV accelerationStructure;
}
struct VkAccelerationStructureMotionInfoNV {
	VkStructureType sType;
	void* pNext;
	uint32_t maxInstances;
	VkAccelerationStructureMotionInfoFlagsNV flags;
}
struct VkAccelerationStructureMotionInstanceNV {
	VkAccelerationStructureMotionInstanceTypeNV type;
	VkAccelerationStructureMotionInstanceFlagsNV flags;
	VkAccelerationStructureMotionInstanceDataNV data;
}
struct VkAccelerationStructureNV_T {
}
struct VkAccelerationStructureSRTMotionInstanceNV {
	VkSRTDataNV transformT0;
	VkSRTDataNV transformT1;
	uint32_t instanceCustomIndex;
	uint32_t mask;
	uint32_t instanceShaderBindingTableRecordOffset;
	VkGeometryInstanceFlagsKHR flags;
	uint64_t accelerationStructureReference;
}
struct VkAccelerationStructureVersionInfoKHR {
	VkStructureType sType;
	void* pNext;
	uint8_t* pVersionData;
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
struct VkAcquireProfilingLockInfoKHR {
	VkStructureType sType;
	void* pNext;
	VkAcquireProfilingLockFlagsKHR flags;
	uint64_t timeout;
}
struct VkAllocationCallbacks {
	void* pUserData;
	PFN_vkAllocationFunction pfnAllocation;
	PFN_vkReallocationFunction pfnReallocation;
	PFN_vkFreeFunction pfnFree;
	PFN_vkInternalAllocationNotification pfnInternalAllocation;
	PFN_vkInternalFreeNotification pfnInternalFree;
}
struct VkApplicationInfo {
	VkStructureType sType;
	void* pNext;
	immutable(char)* pApplicationName;
	uint32_t applicationVersion;
	immutable(char)* pEngineName;
	uint32_t engineVersion;
	uint32_t apiVersion;
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
struct VkAttachmentDescriptionStencilLayout {
	VkStructureType sType;
	void* pNext;
	VkImageLayout stencilInitialLayout;
	VkImageLayout stencilFinalLayout;
}
struct VkAttachmentReference {
	uint32_t attachment;
	VkImageLayout layout;
}
struct VkAttachmentReference2 {
	VkStructureType sType;
	void* pNext;
	uint32_t attachment;
	VkImageLayout layout;
	VkImageAspectFlags aspectMask;
}
struct VkAttachmentReferenceStencilLayout {
	VkStructureType sType;
	void* pNext;
	VkImageLayout stencilLayout;
}
struct VkAttachmentSampleCountInfoAMD {
	VkStructureType sType;
	void* pNext;
	uint32_t colorAttachmentCount;
	VkSampleCountFlagBits* pColorAttachmentSamples;
	VkSampleCountFlagBits depthStencilAttachmentSamples;
}
struct VkAttachmentSampleLocationsEXT {
	uint32_t attachmentIndex;
	VkSampleLocationsInfoEXT sampleLocationsInfo;
}
struct VkBaseInStructure {
	VkStructureType sType;
	VkBaseInStructure* pNext;
}
struct VkBaseOutStructure {
	VkStructureType sType;
	VkBaseOutStructure* pNext;
}
struct VkBindAccelerationStructureMemoryInfoNV {
	VkStructureType sType;
	void* pNext;
	VkAccelerationStructureNV accelerationStructure;
	VkDeviceMemory memory;
	VkDeviceSize memoryOffset;
	uint32_t deviceIndexCount;
	uint32_t* pDeviceIndices;
}
struct VkBindBufferMemoryDeviceGroupInfo {
	VkStructureType sType;
	void* pNext;
	uint32_t deviceIndexCount;
	uint32_t* pDeviceIndices;
}
struct VkBindBufferMemoryInfo {
	VkStructureType sType;
	void* pNext;
	VkBuffer buffer;
	VkDeviceMemory memory;
	VkDeviceSize memoryOffset;
}
struct VkBindImageMemoryDeviceGroupInfo {
	VkStructureType sType;
	void* pNext;
	uint32_t deviceIndexCount;
	uint32_t* pDeviceIndices;
	uint32_t splitInstanceBindRegionCount;
	VkRect2D* pSplitInstanceBindRegions;
}
struct VkBindImageMemoryInfo {
	VkStructureType sType;
	void* pNext;
	VkImage image;
	VkDeviceMemory memory;
	VkDeviceSize memoryOffset;
}
struct VkBindImageMemorySwapchainInfoKHR {
	VkStructureType sType;
	void* pNext;
	VkSwapchainKHR swapchain;
	uint32_t imageIndex;
}
struct VkBindImagePlaneMemoryInfo {
	VkStructureType sType;
	void* pNext;
	VkImageAspectFlagBits planeAspect;
}
struct VkBindIndexBufferIndirectCommandNV {
	VkDeviceAddress bufferAddress;
	uint32_t size;
	VkIndexType indexType;
}
struct VkBindShaderGroupIndirectCommandNV {
	uint32_t groupIndex;
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
struct VkBindVertexBufferIndirectCommandNV {
	VkDeviceAddress bufferAddress;
	uint32_t size;
	uint32_t stride;
}
struct VkBlitImageInfo2 {
	VkStructureType sType;
	void* pNext;
	VkImage srcImage;
	VkImageLayout srcImageLayout;
	VkImage dstImage;
	VkImageLayout dstImageLayout;
	uint32_t regionCount;
	VkImageBlit2* pRegions;
	VkFilter filter;
}
struct VkBufferCopy {
	VkDeviceSize srcOffset;
	VkDeviceSize dstOffset;
	VkDeviceSize size;
}
struct VkBufferCopy2 {
	VkStructureType sType;
	void* pNext;
	VkDeviceSize srcOffset;
	VkDeviceSize dstOffset;
	VkDeviceSize size;
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
struct VkBufferDeviceAddressCreateInfoEXT {
	VkStructureType sType;
	void* pNext;
	VkDeviceAddress deviceAddress;
}
struct VkBufferDeviceAddressInfo {
	VkStructureType sType;
	void* pNext;
	VkBuffer buffer;
}
struct VkBufferImageCopy {
	VkDeviceSize bufferOffset;
	uint32_t bufferRowLength;
	uint32_t bufferImageHeight;
	VkImageSubresourceLayers imageSubresource;
	VkOffset3D imageOffset;
	VkExtent3D imageExtent;
}
struct VkBufferImageCopy2 {
	VkStructureType sType;
	void* pNext;
	VkDeviceSize bufferOffset;
	uint32_t bufferRowLength;
	uint32_t bufferImageHeight;
	VkImageSubresourceLayers imageSubresource;
	VkOffset3D imageOffset;
	VkExtent3D imageExtent;
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
struct VkBufferMemoryBarrier2 {
	VkStructureType sType;
	void* pNext;
	VkPipelineStageFlags2 srcStageMask;
	VkAccessFlags2 srcAccessMask;
	VkPipelineStageFlags2 dstStageMask;
	VkAccessFlags2 dstAccessMask;
	uint32_t srcQueueFamilyIndex;
	uint32_t dstQueueFamilyIndex;
	VkBuffer buffer;
	VkDeviceSize offset;
	VkDeviceSize size;
}
struct VkBufferMemoryRequirementsInfo2 {
	VkStructureType sType;
	void* pNext;
	VkBuffer buffer;
}
struct VkBufferOpaqueCaptureAddressCreateInfo {
	VkStructureType sType;
	void* pNext;
	uint64_t opaqueCaptureAddress;
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
struct VkBufferView_T {
}
struct VkBuffer_T {
}
struct VkCalibratedTimestampInfoEXT {
	VkStructureType sType;
	void* pNext;
	VkTimeDomainEXT timeDomain;
}
struct VkCheckpointData2NV {
	VkStructureType sType;
	void* pNext;
	VkPipelineStageFlags2 stage;
	void* pCheckpointMarker;
}
struct VkCheckpointDataNV {
	VkStructureType sType;
	void* pNext;
	VkPipelineStageFlagBits stage;
	void* pCheckpointMarker;
}
struct VkClearAttachment {
	VkImageAspectFlags aspectMask;
	uint32_t colorAttachment;
	VkClearValue clearValue;
}
struct VkClearDepthStencilValue {
	float depth;
	uint32_t stencil;
}
struct VkClearRect {
	VkRect2D rect;
	uint32_t baseArrayLayer;
	uint32_t layerCount;
}
struct VkCoarseSampleLocationNV {
	uint32_t pixelX;
	uint32_t pixelY;
	uint32_t sample;
}
struct VkCoarseSampleOrderCustomNV {
	VkShadingRatePaletteEntryNV shadingRate;
	uint32_t sampleCount;
	uint32_t sampleLocationCount;
	VkCoarseSampleLocationNV* pSampleLocations;
}
struct VkCommandBufferAllocateInfo {
	VkStructureType sType;
	void* pNext;
	VkCommandPool commandPool;
	VkCommandBufferLevel level;
	uint32_t commandBufferCount;
}
struct VkCommandBufferBeginInfo {
	VkStructureType sType;
	void* pNext;
	VkCommandBufferUsageFlags flags;
	VkCommandBufferInheritanceInfo* pInheritanceInfo;
}
struct VkCommandBufferInheritanceConditionalRenderingInfoEXT {
	VkStructureType sType;
	void* pNext;
	VkBool32 conditionalRenderingEnable;
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
struct VkCommandBufferInheritanceRenderPassTransformInfoQCOM {
	VkStructureType sType;
	void* pNext;
	VkSurfaceTransformFlagBitsKHR transform;
	VkRect2D renderArea;
}
struct VkCommandBufferInheritanceRenderingInfo {
	VkStructureType sType;
	void* pNext;
	VkRenderingFlags flags;
	uint32_t viewMask;
	uint32_t colorAttachmentCount;
	VkFormat* pColorAttachmentFormats;
	VkFormat depthAttachmentFormat;
	VkFormat stencilAttachmentFormat;
	VkSampleCountFlagBits rasterizationSamples;
}
struct VkCommandBufferInheritanceViewportScissorInfoNV {
	VkStructureType sType;
	void* pNext;
	VkBool32 viewportScissor2D;
	uint32_t viewportDepthCount;
	VkViewport* pViewportDepths;
}
struct VkCommandBufferSubmitInfo {
	VkStructureType sType;
	void* pNext;
	VkCommandBuffer commandBuffer;
	uint32_t deviceMask;
}
struct VkCommandBuffer_T {
}
struct VkCommandPoolCreateInfo {
	VkStructureType sType;
	void* pNext;
	VkCommandPoolCreateFlags flags;
	uint32_t queueFamilyIndex;
}
struct VkCommandPool_T {
}
struct VkComponentMapping {
	VkComponentSwizzle r;
	VkComponentSwizzle g;
	VkComponentSwizzle b;
	VkComponentSwizzle a;
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
struct VkConditionalRenderingBeginInfoEXT {
	VkStructureType sType;
	void* pNext;
	VkBuffer buffer;
	VkDeviceSize offset;
	VkConditionalRenderingFlagsEXT flags;
}
struct VkConformanceVersion {
	uint8_t major;
	uint8_t minor;
	uint8_t subminor;
	uint8_t patch;
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
struct VkCopyAccelerationStructureInfoKHR {
	VkStructureType sType;
	void* pNext;
	VkAccelerationStructureKHR src;
	VkAccelerationStructureKHR dst;
	VkCopyAccelerationStructureModeKHR mode;
}
struct VkCopyAccelerationStructureToMemoryInfoKHR {
	VkStructureType sType;
	void* pNext;
	VkAccelerationStructureKHR src;
	VkDeviceOrHostAddressKHR dst;
	VkCopyAccelerationStructureModeKHR mode;
}
struct VkCopyBufferInfo2 {
	VkStructureType sType;
	void* pNext;
	VkBuffer srcBuffer;
	VkBuffer dstBuffer;
	uint32_t regionCount;
	VkBufferCopy2* pRegions;
}
struct VkCopyBufferToImageInfo2 {
	VkStructureType sType;
	void* pNext;
	VkBuffer srcBuffer;
	VkImage dstImage;
	VkImageLayout dstImageLayout;
	uint32_t regionCount;
	VkBufferImageCopy2* pRegions;
}
struct VkCopyCommandTransformInfoQCOM {
	VkStructureType sType;
	void* pNext;
	VkSurfaceTransformFlagBitsKHR transform;
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
struct VkCopyImageInfo2 {
	VkStructureType sType;
	void* pNext;
	VkImage srcImage;
	VkImageLayout srcImageLayout;
	VkImage dstImage;
	VkImageLayout dstImageLayout;
	uint32_t regionCount;
	VkImageCopy2* pRegions;
}
struct VkCopyImageToBufferInfo2 {
	VkStructureType sType;
	void* pNext;
	VkImage srcImage;
	VkImageLayout srcImageLayout;
	VkBuffer dstBuffer;
	uint32_t regionCount;
	VkBufferImageCopy2* pRegions;
}
struct VkCopyMemoryToAccelerationStructureInfoKHR {
	VkStructureType sType;
	void* pNext;
	VkDeviceOrHostAddressConstKHR src;
	VkAccelerationStructureKHR dst;
	VkCopyAccelerationStructureModeKHR mode;
}
struct VkCuFunctionCreateInfoNVX {
	VkStructureType sType;
	void* pNext;
	VkCuModuleNVX module_;
	immutable(char)* pName;
}
struct VkCuFunctionNVX_T {
}
struct VkCuLaunchInfoNVX {
	VkStructureType sType;
	void* pNext;
	VkCuFunctionNVX function_;
	uint32_t gridDimX;
	uint32_t gridDimY;
	uint32_t gridDimZ;
	uint32_t blockDimX;
	uint32_t blockDimY;
	uint32_t blockDimZ;
	uint32_t sharedMemBytes;
	size_t paramCount;
	void** pParams;
	size_t extraCount;
	void** pExtras;
}
struct VkCuModuleCreateInfoNVX {
	VkStructureType sType;
	void* pNext;
	size_t dataSize;
	void* pData;
}
struct VkCuModuleNVX_T {
}
struct VkD3D12FenceSubmitInfoKHR {
	VkStructureType sType;
	void* pNext;
	uint32_t waitSemaphoreValuesCount;
	uint64_t* pWaitSemaphoreValues;
	uint32_t signalSemaphoreValuesCount;
	uint64_t* pSignalSemaphoreValues;
}
struct VkDebugMarkerMarkerInfoEXT {
	VkStructureType sType;
	void* pNext;
	immutable(char)* pMarkerName;
	float[4] color;
}
struct VkDebugMarkerObjectNameInfoEXT {
	VkStructureType sType;
	void* pNext;
	VkDebugReportObjectTypeEXT objectType;
	uint64_t object;
	immutable(char)* pObjectName;
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
struct VkDebugReportCallbackCreateInfoEXT {
	VkStructureType sType;
	void* pNext;
	VkDebugReportFlagsEXT flags;
	PFN_vkDebugReportCallbackEXT pfnCallback;
	void* pUserData;
}
struct VkDebugReportCallbackEXT_T {
}
struct VkDebugUtilsLabelEXT {
	VkStructureType sType;
	void* pNext;
	immutable(char)* pLabelName;
	float[4] color;
}
struct VkDebugUtilsMessengerCallbackDataEXT {
	VkStructureType sType;
	void* pNext;
	VkDebugUtilsMessengerCallbackDataFlagsEXT flags;
	immutable(char)* pMessageIdName;
	int32_t messageIdNumber;
	immutable(char)* pMessage;
	uint32_t queueLabelCount;
	VkDebugUtilsLabelEXT* pQueueLabels;
	uint32_t cmdBufLabelCount;
	VkDebugUtilsLabelEXT* pCmdBufLabels;
	uint32_t objectCount;
	VkDebugUtilsObjectNameInfoEXT* pObjects;
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
struct VkDebugUtilsMessengerEXT_T {
}
struct VkDebugUtilsObjectNameInfoEXT {
	VkStructureType sType;
	void* pNext;
	VkObjectType objectType;
	uint64_t objectHandle;
	immutable(char)* pObjectName;
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
struct VkDedicatedAllocationBufferCreateInfoNV {
	VkStructureType sType;
	void* pNext;
	VkBool32 dedicatedAllocation;
}
struct VkDedicatedAllocationImageCreateInfoNV {
	VkStructureType sType;
	void* pNext;
	VkBool32 dedicatedAllocation;
}
struct VkDedicatedAllocationMemoryAllocateInfoNV {
	VkStructureType sType;
	void* pNext;
	VkImage image;
	VkBuffer buffer;
}
struct VkDeferredOperationKHR_T {
}
struct VkDependencyInfo {
	VkStructureType sType;
	void* pNext;
	VkDependencyFlags dependencyFlags;
	uint32_t memoryBarrierCount;
	VkMemoryBarrier2* pMemoryBarriers;
	uint32_t bufferMemoryBarrierCount;
	VkBufferMemoryBarrier2* pBufferMemoryBarriers;
	uint32_t imageMemoryBarrierCount;
	VkImageMemoryBarrier2* pImageMemoryBarriers;
}
struct VkDescriptorBufferInfo {
	VkBuffer buffer;
	VkDeviceSize offset;
	VkDeviceSize range;
}
struct VkDescriptorImageInfo {
	VkSampler sampler;
	VkImageView imageView;
	VkImageLayout imageLayout;
}
struct VkDescriptorPoolCreateInfo {
	VkStructureType sType;
	void* pNext;
	VkDescriptorPoolCreateFlags flags;
	uint32_t maxSets;
	uint32_t poolSizeCount;
	VkDescriptorPoolSize* pPoolSizes;
}
struct VkDescriptorPoolInlineUniformBlockCreateInfo {
	VkStructureType sType;
	void* pNext;
	uint32_t maxInlineUniformBlockBindings;
}
struct VkDescriptorPoolSize {
	VkDescriptorType type;
	uint32_t descriptorCount;
}
struct VkDescriptorPool_T {
}
struct VkDescriptorSetAllocateInfo {
	VkStructureType sType;
	void* pNext;
	VkDescriptorPool descriptorPool;
	uint32_t descriptorSetCount;
	VkDescriptorSetLayout* pSetLayouts;
}
struct VkDescriptorSetBindingReferenceVALVE {
	VkStructureType sType;
	void* pNext;
	VkDescriptorSetLayout descriptorSetLayout;
	uint32_t binding;
}
struct VkDescriptorSetLayoutBinding {
	uint32_t binding;
	VkDescriptorType descriptorType;
	uint32_t descriptorCount;
	VkShaderStageFlags stageFlags;
	VkSampler* pImmutableSamplers;
}
struct VkDescriptorSetLayoutBindingFlagsCreateInfo {
	VkStructureType sType;
	void* pNext;
	uint32_t bindingCount;
	VkDescriptorBindingFlags* pBindingFlags;
}
struct VkDescriptorSetLayoutCreateInfo {
	VkStructureType sType;
	void* pNext;
	VkDescriptorSetLayoutCreateFlags flags;
	uint32_t bindingCount;
	VkDescriptorSetLayoutBinding* pBindings;
}
struct VkDescriptorSetLayoutHostMappingInfoVALVE {
	VkStructureType sType;
	void* pNext;
	size_t descriptorOffset;
	uint32_t descriptorSize;
}
struct VkDescriptorSetLayoutSupport {
	VkStructureType sType;
	void* pNext;
	VkBool32 supported;
}
struct VkDescriptorSetLayout_T {
}
struct VkDescriptorSetVariableDescriptorCountAllocateInfo {
	VkStructureType sType;
	void* pNext;
	uint32_t descriptorSetCount;
	uint32_t* pDescriptorCounts;
}
struct VkDescriptorSetVariableDescriptorCountLayoutSupport {
	VkStructureType sType;
	void* pNext;
	uint32_t maxVariableDescriptorCount;
}
struct VkDescriptorSet_T {
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
struct VkDescriptorUpdateTemplateEntry {
	uint32_t dstBinding;
	uint32_t dstArrayElement;
	uint32_t descriptorCount;
	VkDescriptorType descriptorType;
	size_t offset;
	size_t stride;
}
struct VkDescriptorUpdateTemplate_T {
}
struct VkDeviceBufferMemoryRequirements {
	VkStructureType sType;
	void* pNext;
	VkBufferCreateInfo* pCreateInfo;
}
struct VkDeviceCreateInfo {
	VkStructureType sType;
	void* pNext;
	VkDeviceCreateFlags flags;
	uint32_t queueCreateInfoCount;
	VkDeviceQueueCreateInfo* pQueueCreateInfos;
	uint32_t enabledLayerCount;
	immutable(char)** ppEnabledLayerNames;
	uint32_t enabledExtensionCount;
	immutable(char)** ppEnabledExtensionNames;
	VkPhysicalDeviceFeatures* pEnabledFeatures;
}
struct VkDeviceDeviceMemoryReportCreateInfoEXT {
	VkStructureType sType;
	void* pNext;
	VkDeviceMemoryReportFlagsEXT flags;
	PFN_vkDeviceMemoryReportCallbackEXT pfnUserCallback;
	void* pUserData;
}
struct VkDeviceDiagnosticsConfigCreateInfoNV {
	VkStructureType sType;
	void* pNext;
	VkDeviceDiagnosticsConfigFlagsNV flags;
}
struct VkDeviceEventInfoEXT {
	VkStructureType sType;
	void* pNext;
	VkDeviceEventTypeEXT deviceEvent;
}
struct VkDeviceGroupBindSparseInfo {
	VkStructureType sType;
	void* pNext;
	uint32_t resourceDeviceIndex;
	uint32_t memoryDeviceIndex;
}
struct VkDeviceGroupCommandBufferBeginInfo {
	VkStructureType sType;
	void* pNext;
	uint32_t deviceMask;
}
struct VkDeviceGroupDeviceCreateInfo {
	VkStructureType sType;
	void* pNext;
	uint32_t physicalDeviceCount;
	VkPhysicalDevice* pPhysicalDevices;
}
struct VkDeviceGroupPresentCapabilitiesKHR {
	VkStructureType sType;
	void* pNext;
	uint32_t[32U] presentMask;
	VkDeviceGroupPresentModeFlagsKHR modes;
}
struct VkDeviceGroupPresentInfoKHR {
	VkStructureType sType;
	void* pNext;
	uint32_t swapchainCount;
	uint32_t* pDeviceMasks;
	VkDeviceGroupPresentModeFlagBitsKHR mode;
}
struct VkDeviceGroupRenderPassBeginInfo {
	VkStructureType sType;
	void* pNext;
	uint32_t deviceMask;
	uint32_t deviceRenderAreaCount;
	VkRect2D* pDeviceRenderAreas;
}
struct VkDeviceGroupSubmitInfo {
	VkStructureType sType;
	void* pNext;
	uint32_t waitSemaphoreCount;
	uint32_t* pWaitSemaphoreDeviceIndices;
	uint32_t commandBufferCount;
	uint32_t* pCommandBufferDeviceMasks;
	uint32_t signalSemaphoreCount;
	uint32_t* pSignalSemaphoreDeviceIndices;
}
struct VkDeviceGroupSwapchainCreateInfoKHR {
	VkStructureType sType;
	void* pNext;
	VkDeviceGroupPresentModeFlagsKHR modes;
}
struct VkDeviceImageMemoryRequirements {
	VkStructureType sType;
	void* pNext;
	VkImageCreateInfo* pCreateInfo;
	VkImageAspectFlagBits planeAspect;
}
struct VkDeviceMemoryOpaqueCaptureAddressInfo {
	VkStructureType sType;
	void* pNext;
	VkDeviceMemory memory;
}
struct VkDeviceMemoryOverallocationCreateInfoAMD {
	VkStructureType sType;
	void* pNext;
	VkMemoryOverallocationBehaviorAMD overallocationBehavior;
}
struct VkDeviceMemoryReportCallbackDataEXT {
	VkStructureType sType;
	void* pNext;
	VkDeviceMemoryReportFlagsEXT flags;
	VkDeviceMemoryReportEventTypeEXT type;
	uint64_t memoryObjectId;
	VkDeviceSize size;
	VkObjectType objectType;
	uint64_t objectHandle;
	uint32_t heapIndex;
}
struct VkDeviceMemory_T {
}
struct VkDevicePrivateDataCreateInfo {
	VkStructureType sType;
	void* pNext;
	uint32_t privateDataSlotRequestCount;
}
struct VkDeviceQueueCreateInfo {
	VkStructureType sType;
	void* pNext;
	VkDeviceQueueCreateFlags flags;
	uint32_t queueFamilyIndex;
	uint32_t queueCount;
	float* pQueuePriorities;
}
struct VkDeviceQueueGlobalPriorityCreateInfoKHR {
	VkStructureType sType;
	void* pNext;
	VkQueueGlobalPriorityKHR globalPriority;
}
struct VkDeviceQueueInfo2 {
	VkStructureType sType;
	void* pNext;
	VkDeviceQueueCreateFlags flags;
	uint32_t queueFamilyIndex;
	uint32_t queueIndex;
}
struct VkDevice_T {
}
struct VkDispatchIndirectCommand {
	uint32_t x;
	uint32_t y;
	uint32_t z;
}
struct VkDisplayEventInfoEXT {
	VkStructureType sType;
	void* pNext;
	VkDisplayEventTypeEXT displayEvent;
}
struct VkDisplayKHR_T {
}
struct VkDisplayModeCreateInfoKHR {
	VkStructureType sType;
	void* pNext;
	VkDisplayModeCreateFlagsKHR flags;
	VkDisplayModeParametersKHR parameters;
}
struct VkDisplayModeKHR_T {
}
struct VkDisplayModeParametersKHR {
	VkExtent2D visibleRegion;
	uint32_t refreshRate;
}
struct VkDisplayModeProperties2KHR {
	VkStructureType sType;
	void* pNext;
	VkDisplayModePropertiesKHR displayModeProperties;
}
struct VkDisplayModePropertiesKHR {
	VkDisplayModeKHR displayMode;
	VkDisplayModeParametersKHR parameters;
}
struct VkDisplayNativeHdrSurfaceCapabilitiesAMD {
	VkStructureType sType;
	void* pNext;
	VkBool32 localDimmingSupport;
}
struct VkDisplayPlaneCapabilities2KHR {
	VkStructureType sType;
	void* pNext;
	VkDisplayPlaneCapabilitiesKHR capabilities;
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
struct VkDisplayPlaneInfo2KHR {
	VkStructureType sType;
	void* pNext;
	VkDisplayModeKHR mode;
	uint32_t planeIndex;
}
struct VkDisplayPlaneProperties2KHR {
	VkStructureType sType;
	void* pNext;
	VkDisplayPlanePropertiesKHR displayPlaneProperties;
}
struct VkDisplayPlanePropertiesKHR {
	VkDisplayKHR currentDisplay;
	uint32_t currentStackIndex;
}
struct VkDisplayPowerInfoEXT {
	VkStructureType sType;
	void* pNext;
	VkDisplayPowerStateEXT powerState;
}
struct VkDisplayPresentInfoKHR {
	VkStructureType sType;
	void* pNext;
	VkRect2D srcRect;
	VkRect2D dstRect;
	VkBool32 persistent;
}
struct VkDisplayProperties2KHR {
	VkStructureType sType;
	void* pNext;
	VkDisplayPropertiesKHR displayProperties;
}
struct VkDisplayPropertiesKHR {
	VkDisplayKHR display;
	immutable(char)* displayName;
	VkExtent2D physicalDimensions;
	VkExtent2D physicalResolution;
	VkSurfaceTransformFlagsKHR supportedTransforms;
	VkBool32 planeReorderPossible;
	VkBool32 persistentContent;
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
struct VkDrawIndexedIndirectCommand {
	uint32_t indexCount;
	uint32_t instanceCount;
	uint32_t firstIndex;
	int32_t vertexOffset;
	uint32_t firstInstance;
}
struct VkDrawIndirectCommand {
	uint32_t vertexCount;
	uint32_t instanceCount;
	uint32_t firstVertex;
	uint32_t firstInstance;
}
struct VkDrawMeshTasksIndirectCommandNV {
	uint32_t taskCount;
	uint32_t firstTask;
}
struct VkDrmFormatModifierProperties2EXT {
	uint64_t drmFormatModifier;
	uint32_t drmFormatModifierPlaneCount;
	VkFormatFeatureFlags2 drmFormatModifierTilingFeatures;
}
struct VkDrmFormatModifierPropertiesEXT {
	uint64_t drmFormatModifier;
	uint32_t drmFormatModifierPlaneCount;
	VkFormatFeatureFlags drmFormatModifierTilingFeatures;
}
struct VkDrmFormatModifierPropertiesList2EXT {
	VkStructureType sType;
	void* pNext;
	uint32_t drmFormatModifierCount;
	VkDrmFormatModifierProperties2EXT* pDrmFormatModifierProperties;
}
struct VkDrmFormatModifierPropertiesListEXT {
	VkStructureType sType;
	void* pNext;
	uint32_t drmFormatModifierCount;
	VkDrmFormatModifierPropertiesEXT* pDrmFormatModifierProperties;
}
struct VkEventCreateInfo {
	VkStructureType sType;
	void* pNext;
	VkEventCreateFlags flags;
}
struct VkEvent_T {
}
struct VkExportFenceCreateInfo {
	VkStructureType sType;
	void* pNext;
	VkExternalFenceHandleTypeFlags handleTypes;
}
struct VkExportFenceWin32HandleInfoKHR {
	VkStructureType sType;
	void* pNext;
	SECURITY_ATTRIBUTES* pAttributes;
	DWORD dwAccess;
	LPCWSTR name;
}
struct VkExportMemoryAllocateInfo {
	VkStructureType sType;
	void* pNext;
	VkExternalMemoryHandleTypeFlags handleTypes;
}
struct VkExportMemoryAllocateInfoNV {
	VkStructureType sType;
	void* pNext;
	VkExternalMemoryHandleTypeFlagsNV handleTypes;
}
struct VkExportMemoryWin32HandleInfoKHR {
	VkStructureType sType;
	void* pNext;
	SECURITY_ATTRIBUTES* pAttributes;
	DWORD dwAccess;
	LPCWSTR name;
}
struct VkExportMemoryWin32HandleInfoNV {
	VkStructureType sType;
	void* pNext;
	SECURITY_ATTRIBUTES* pAttributes;
	DWORD dwAccess;
}
struct VkExportSemaphoreCreateInfo {
	VkStructureType sType;
	void* pNext;
	VkExternalSemaphoreHandleTypeFlags handleTypes;
}
struct VkExportSemaphoreWin32HandleInfoKHR {
	VkStructureType sType;
	void* pNext;
	SECURITY_ATTRIBUTES* pAttributes;
	DWORD dwAccess;
	LPCWSTR name;
}
struct VkExtensionProperties {
	char[256U] extensionName;
	uint32_t specVersion;
}
struct VkExtent2D {
	uint32_t width;
	uint32_t height;
}
struct VkExtent3D {
	uint32_t width;
	uint32_t height;
	uint32_t depth;
}
struct VkExternalBufferProperties {
	VkStructureType sType;
	void* pNext;
	VkExternalMemoryProperties externalMemoryProperties;
}
struct VkExternalFenceProperties {
	VkStructureType sType;
	void* pNext;
	VkExternalFenceHandleTypeFlags exportFromImportedHandleTypes;
	VkExternalFenceHandleTypeFlags compatibleHandleTypes;
	VkExternalFenceFeatureFlags externalFenceFeatures;
}
struct VkExternalImageFormatProperties {
	VkStructureType sType;
	void* pNext;
	VkExternalMemoryProperties externalMemoryProperties;
}
struct VkExternalImageFormatPropertiesNV {
	VkImageFormatProperties imageFormatProperties;
	VkExternalMemoryFeatureFlagsNV externalMemoryFeatures;
	VkExternalMemoryHandleTypeFlagsNV exportFromImportedHandleTypes;
	VkExternalMemoryHandleTypeFlagsNV compatibleHandleTypes;
}
struct VkExternalMemoryBufferCreateInfo {
	VkStructureType sType;
	void* pNext;
	VkExternalMemoryHandleTypeFlags handleTypes;
}
struct VkExternalMemoryImageCreateInfo {
	VkStructureType sType;
	void* pNext;
	VkExternalMemoryHandleTypeFlags handleTypes;
}
struct VkExternalMemoryImageCreateInfoNV {
	VkStructureType sType;
	void* pNext;
	VkExternalMemoryHandleTypeFlagsNV handleTypes;
}
struct VkExternalMemoryProperties {
	VkExternalMemoryFeatureFlags externalMemoryFeatures;
	VkExternalMemoryHandleTypeFlags exportFromImportedHandleTypes;
	VkExternalMemoryHandleTypeFlags compatibleHandleTypes;
}
struct VkExternalSemaphoreProperties {
	VkStructureType sType;
	void* pNext;
	VkExternalSemaphoreHandleTypeFlags exportFromImportedHandleTypes;
	VkExternalSemaphoreHandleTypeFlags compatibleHandleTypes;
	VkExternalSemaphoreFeatureFlags externalSemaphoreFeatures;
}
struct VkFenceCreateInfo {
	VkStructureType sType;
	void* pNext;
	VkFenceCreateFlags flags;
}
struct VkFenceGetFdInfoKHR {
	VkStructureType sType;
	void* pNext;
	VkFence fence;
	VkExternalFenceHandleTypeFlagBits handleType;
}
struct VkFenceGetWin32HandleInfoKHR {
	VkStructureType sType;
	void* pNext;
	VkFence fence;
	VkExternalFenceHandleTypeFlagBits handleType;
}
struct VkFence_T {
}
struct VkFilterCubicImageViewImageFormatPropertiesEXT {
	VkStructureType sType;
	void* pNext;
	VkBool32 filterCubic;
	VkBool32 filterCubicMinmax;
}
struct VkFormatProperties {
	VkFormatFeatureFlags linearTilingFeatures;
	VkFormatFeatureFlags optimalTilingFeatures;
	VkFormatFeatureFlags bufferFeatures;
}
struct VkFormatProperties2 {
	VkStructureType sType;
	void* pNext;
	VkFormatProperties formatProperties;
}
struct VkFormatProperties3 {
	VkStructureType sType;
	void* pNext;
	VkFormatFeatureFlags2 linearTilingFeatures;
	VkFormatFeatureFlags2 optimalTilingFeatures;
	VkFormatFeatureFlags2 bufferFeatures;
}
struct VkFragmentShadingRateAttachmentInfoKHR {
	VkStructureType sType;
	void* pNext;
	VkAttachmentReference2* pFragmentShadingRateAttachment;
	VkExtent2D shadingRateAttachmentTexelSize;
}
struct VkFramebufferAttachmentImageInfo {
	VkStructureType sType;
	void* pNext;
	VkImageCreateFlags flags;
	VkImageUsageFlags usage;
	uint32_t width;
	uint32_t height;
	uint32_t layerCount;
	uint32_t viewFormatCount;
	VkFormat* pViewFormats;
}
struct VkFramebufferAttachmentsCreateInfo {
	VkStructureType sType;
	void* pNext;
	uint32_t attachmentImageInfoCount;
	VkFramebufferAttachmentImageInfo* pAttachmentImageInfos;
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
struct VkFramebufferMixedSamplesCombinationNV {
	VkStructureType sType;
	void* pNext;
	VkCoverageReductionModeNV coverageReductionMode;
	VkSampleCountFlagBits rasterizationSamples;
	VkSampleCountFlags depthStencilSamples;
	VkSampleCountFlags colorSamples;
}
struct VkFramebuffer_T {
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
struct VkGeneratedCommandsMemoryRequirementsInfoNV {
	VkStructureType sType;
	void* pNext;
	VkPipelineBindPoint pipelineBindPoint;
	VkPipeline pipeline;
	VkIndirectCommandsLayoutNV indirectCommandsLayout;
	uint32_t maxSequencesCount;
}
struct VkGeometryAABBNV {
	VkStructureType sType;
	void* pNext;
	VkBuffer aabbData;
	uint32_t numAABBs;
	uint32_t stride;
	VkDeviceSize offset;
}
struct VkGeometryDataNV {
	VkGeometryTrianglesNV triangles;
	VkGeometryAABBNV aabbs;
}
struct VkGeometryNV {
	VkStructureType sType;
	void* pNext;
	VkGeometryTypeKHR geometryType;
	VkGeometryDataNV geometry;
	VkGeometryFlagsKHR flags;
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
struct VkGraphicsPipelineLibraryCreateInfoEXT {
	VkStructureType sType;
	void* pNext;
	VkGraphicsPipelineLibraryFlagsEXT flags;
}
struct VkGraphicsPipelineShaderGroupsCreateInfoNV {
	VkStructureType sType;
	void* pNext;
	uint32_t groupCount;
	VkGraphicsShaderGroupCreateInfoNV* pGroups;
	uint32_t pipelineCount;
	VkPipeline* pPipelines;
}
struct VkGraphicsShaderGroupCreateInfoNV {
	VkStructureType sType;
	void* pNext;
	uint32_t stageCount;
	VkPipelineShaderStageCreateInfo* pStages;
	VkPipelineVertexInputStateCreateInfo* pVertexInputState;
	VkPipelineTessellationStateCreateInfo* pTessellationState;
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
struct VkHeadlessSurfaceCreateInfoEXT {
	VkStructureType sType;
	void* pNext;
	VkHeadlessSurfaceCreateFlagsEXT flags;
}
struct VkImageBlit {
	VkImageSubresourceLayers srcSubresource;
	VkOffset3D[2] srcOffsets;
	VkImageSubresourceLayers dstSubresource;
	VkOffset3D[2] dstOffsets;
}
struct VkImageBlit2 {
	VkStructureType sType;
	void* pNext;
	VkImageSubresourceLayers srcSubresource;
	VkOffset3D[2] srcOffsets;
	VkImageSubresourceLayers dstSubresource;
	VkOffset3D[2] dstOffsets;
}
struct VkImageCopy {
	VkImageSubresourceLayers srcSubresource;
	VkOffset3D srcOffset;
	VkImageSubresourceLayers dstSubresource;
	VkOffset3D dstOffset;
	VkExtent3D extent;
}
struct VkImageCopy2 {
	VkStructureType sType;
	void* pNext;
	VkImageSubresourceLayers srcSubresource;
	VkOffset3D srcOffset;
	VkImageSubresourceLayers dstSubresource;
	VkOffset3D dstOffset;
	VkExtent3D extent;
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
struct VkImageDrmFormatModifierExplicitCreateInfoEXT {
	VkStructureType sType;
	void* pNext;
	uint64_t drmFormatModifier;
	uint32_t drmFormatModifierPlaneCount;
	VkSubresourceLayout* pPlaneLayouts;
}
struct VkImageDrmFormatModifierListCreateInfoEXT {
	VkStructureType sType;
	void* pNext;
	uint32_t drmFormatModifierCount;
	uint64_t* pDrmFormatModifiers;
}
struct VkImageDrmFormatModifierPropertiesEXT {
	VkStructureType sType;
	void* pNext;
	uint64_t drmFormatModifier;
}
struct VkImageFormatListCreateInfo {
	VkStructureType sType;
	void* pNext;
	uint32_t viewFormatCount;
	VkFormat* pViewFormats;
}
struct VkImageFormatProperties {
	VkExtent3D maxExtent;
	uint32_t maxMipLevels;
	uint32_t maxArrayLayers;
	VkSampleCountFlags sampleCounts;
	VkDeviceSize maxResourceSize;
}
struct VkImageFormatProperties2 {
	VkStructureType sType;
	void* pNext;
	VkImageFormatProperties imageFormatProperties;
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
struct VkImageMemoryBarrier2 {
	VkStructureType sType;
	void* pNext;
	VkPipelineStageFlags2 srcStageMask;
	VkAccessFlags2 srcAccessMask;
	VkPipelineStageFlags2 dstStageMask;
	VkAccessFlags2 dstAccessMask;
	VkImageLayout oldLayout;
	VkImageLayout newLayout;
	uint32_t srcQueueFamilyIndex;
	uint32_t dstQueueFamilyIndex;
	VkImage image;
	VkImageSubresourceRange subresourceRange;
}
struct VkImageMemoryRequirementsInfo2 {
	VkStructureType sType;
	void* pNext;
	VkImage image;
}
struct VkImagePlaneMemoryRequirementsInfo {
	VkStructureType sType;
	void* pNext;
	VkImageAspectFlagBits planeAspect;
}
struct VkImageResolve {
	VkImageSubresourceLayers srcSubresource;
	VkOffset3D srcOffset;
	VkImageSubresourceLayers dstSubresource;
	VkOffset3D dstOffset;
	VkExtent3D extent;
}
struct VkImageResolve2 {
	VkStructureType sType;
	void* pNext;
	VkImageSubresourceLayers srcSubresource;
	VkOffset3D srcOffset;
	VkImageSubresourceLayers dstSubresource;
	VkOffset3D dstOffset;
	VkExtent3D extent;
}
struct VkImageSparseMemoryRequirementsInfo2 {
	VkStructureType sType;
	void* pNext;
	VkImage image;
}
struct VkImageStencilUsageCreateInfo {
	VkStructureType sType;
	void* pNext;
	VkImageUsageFlags stencilUsage;
}
struct VkImageSubresource {
	VkImageAspectFlags aspectMask;
	uint32_t mipLevel;
	uint32_t arrayLayer;
}
struct VkImageSubresourceLayers {
	VkImageAspectFlags aspectMask;
	uint32_t mipLevel;
	uint32_t baseArrayLayer;
	uint32_t layerCount;
}
struct VkImageSubresourceRange {
	VkImageAspectFlags aspectMask;
	uint32_t baseMipLevel;
	uint32_t levelCount;
	uint32_t baseArrayLayer;
	uint32_t layerCount;
}
struct VkImageSwapchainCreateInfoKHR {
	VkStructureType sType;
	void* pNext;
	VkSwapchainKHR swapchain;
}
struct VkImageViewASTCDecodeModeEXT {
	VkStructureType sType;
	void* pNext;
	VkFormat decodeMode;
}
struct VkImageViewAddressPropertiesNVX {
	VkStructureType sType;
	void* pNext;
	VkDeviceAddress deviceAddress;
	VkDeviceSize size;
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
struct VkImageViewHandleInfoNVX {
	VkStructureType sType;
	void* pNext;
	VkImageView imageView;
	VkDescriptorType descriptorType;
	VkSampler sampler;
}
struct VkImageViewMinLodCreateInfoEXT {
	VkStructureType sType;
	void* pNext;
	float minLod;
}
struct VkImageViewUsageCreateInfo {
	VkStructureType sType;
	void* pNext;
	VkImageUsageFlags usage;
}
struct VkImageView_T {
}
struct VkImage_T {
}
struct VkImportFenceFdInfoKHR {
	VkStructureType sType;
	void* pNext;
	VkFence fence;
	VkFenceImportFlags flags;
	VkExternalFenceHandleTypeFlagBits handleType;
	int fd;
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
struct VkImportMemoryFdInfoKHR {
	VkStructureType sType;
	void* pNext;
	VkExternalMemoryHandleTypeFlagBits handleType;
	int fd;
}
struct VkImportMemoryHostPointerInfoEXT {
	VkStructureType sType;
	void* pNext;
	VkExternalMemoryHandleTypeFlagBits handleType;
	void* pHostPointer;
}
struct VkImportMemoryWin32HandleInfoKHR {
	VkStructureType sType;
	void* pNext;
	VkExternalMemoryHandleTypeFlagBits handleType;
	HANDLE handle;
	LPCWSTR name;
}
struct VkImportMemoryWin32HandleInfoNV {
	VkStructureType sType;
	void* pNext;
	VkExternalMemoryHandleTypeFlagsNV handleType;
	HANDLE handle;
}
struct VkImportSemaphoreFdInfoKHR {
	VkStructureType sType;
	void* pNext;
	VkSemaphore semaphore;
	VkSemaphoreImportFlags flags;
	VkExternalSemaphoreHandleTypeFlagBits handleType;
	int fd;
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
struct VkIndirectCommandsLayoutNV_T {
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
struct VkIndirectCommandsStreamNV {
	VkBuffer buffer;
	VkDeviceSize offset;
}
struct VkInitializePerformanceApiInfoINTEL {
	VkStructureType sType;
	void* pNext;
	void* pUserData;
}
struct VkInputAttachmentAspectReference {
	uint32_t subpass;
	uint32_t inputAttachmentIndex;
	VkImageAspectFlags aspectMask;
}
struct VkInstanceCreateInfo {
	VkStructureType sType;
	void* pNext;
	VkInstanceCreateFlags flags;
	VkApplicationInfo* pApplicationInfo;
	uint32_t enabledLayerCount;
	immutable(char)** ppEnabledLayerNames;
	uint32_t enabledExtensionCount;
	immutable(char)** ppEnabledExtensionNames;
}
struct VkInstance_T {
}
struct VkLayerProperties {
	char[256U] layerName;
	uint32_t specVersion;
	uint32_t implementationVersion;
	char[256U] description;
}
struct VkMappedMemoryRange {
	VkStructureType sType;
	void* pNext;
	VkDeviceMemory memory;
	VkDeviceSize offset;
	VkDeviceSize size;
}
struct VkMemoryAllocateFlagsInfo {
	VkStructureType sType;
	void* pNext;
	VkMemoryAllocateFlags flags;
	uint32_t deviceMask;
}
struct VkMemoryAllocateInfo {
	VkStructureType sType;
	void* pNext;
	VkDeviceSize allocationSize;
	uint32_t memoryTypeIndex;
}
struct VkMemoryBarrier {
	VkStructureType sType;
	void* pNext;
	VkAccessFlags srcAccessMask;
	VkAccessFlags dstAccessMask;
}
struct VkMemoryBarrier2 {
	VkStructureType sType;
	void* pNext;
	VkPipelineStageFlags2 srcStageMask;
	VkAccessFlags2 srcAccessMask;
	VkPipelineStageFlags2 dstStageMask;
	VkAccessFlags2 dstAccessMask;
}
struct VkMemoryDedicatedAllocateInfo {
	VkStructureType sType;
	void* pNext;
	VkImage image;
	VkBuffer buffer;
}
struct VkMemoryDedicatedRequirements {
	VkStructureType sType;
	void* pNext;
	VkBool32 prefersDedicatedAllocation;
	VkBool32 requiresDedicatedAllocation;
}
struct VkMemoryFdPropertiesKHR {
	VkStructureType sType;
	void* pNext;
	uint32_t memoryTypeBits;
}
struct VkMemoryGetFdInfoKHR {
	VkStructureType sType;
	void* pNext;
	VkDeviceMemory memory;
	VkExternalMemoryHandleTypeFlagBits handleType;
}
struct VkMemoryGetRemoteAddressInfoNV {
	VkStructureType sType;
	void* pNext;
	VkDeviceMemory memory;
	VkExternalMemoryHandleTypeFlagBits handleType;
}
struct VkMemoryGetWin32HandleInfoKHR {
	VkStructureType sType;
	void* pNext;
	VkDeviceMemory memory;
	VkExternalMemoryHandleTypeFlagBits handleType;
}
struct VkMemoryHeap {
	VkDeviceSize size;
	VkMemoryHeapFlags flags;
}
struct VkMemoryHostPointerPropertiesEXT {
	VkStructureType sType;
	void* pNext;
	uint32_t memoryTypeBits;
}
struct VkMemoryOpaqueCaptureAddressAllocateInfo {
	VkStructureType sType;
	void* pNext;
	uint64_t opaqueCaptureAddress;
}
struct VkMemoryPriorityAllocateInfoEXT {
	VkStructureType sType;
	void* pNext;
	float priority;
}
struct VkMemoryRequirements {
	VkDeviceSize size;
	VkDeviceSize alignment;
	uint32_t memoryTypeBits;
}
struct VkMemoryRequirements2 {
	VkStructureType sType;
	void* pNext;
	VkMemoryRequirements memoryRequirements;
}
struct VkMemoryType {
	VkMemoryPropertyFlags propertyFlags;
	uint32_t heapIndex;
}
struct VkMemoryWin32HandlePropertiesKHR {
	VkStructureType sType;
	void* pNext;
	uint32_t memoryTypeBits;
}
struct VkMultiDrawIndexedInfoEXT {
	uint32_t firstIndex;
	uint32_t indexCount;
	int32_t vertexOffset;
}
struct VkMultiDrawInfoEXT {
	uint32_t firstVertex;
	uint32_t vertexCount;
}
struct VkMultisamplePropertiesEXT {
	VkStructureType sType;
	void* pNext;
	VkExtent2D maxSampleLocationGridSize;
}
struct VkMultiviewPerViewAttributesInfoNVX {
	VkStructureType sType;
	void* pNext;
	VkBool32 perViewAttributes;
	VkBool32 perViewAttributesPositionXOnly;
}
struct VkMutableDescriptorTypeCreateInfoVALVE {
	VkStructureType sType;
	void* pNext;
	uint32_t mutableDescriptorTypeListCount;
	VkMutableDescriptorTypeListVALVE* pMutableDescriptorTypeLists;
}
struct VkMutableDescriptorTypeListVALVE {
	uint32_t descriptorTypeCount;
	VkDescriptorType* pDescriptorTypes;
}
struct VkOffset2D {
	int32_t x;
	int32_t y;
}
struct VkOffset3D {
	int32_t x;
	int32_t y;
	int32_t z;
}
struct VkPastPresentationTimingGOOGLE {
	uint32_t presentID;
	uint64_t desiredPresentTime;
	uint64_t actualPresentTime;
	uint64_t earliestPresentTime;
	uint64_t presentMargin;
}
struct VkPerformanceConfigurationAcquireInfoINTEL {
	VkStructureType sType;
	void* pNext;
	VkPerformanceConfigurationTypeINTEL type;
}
struct VkPerformanceConfigurationINTEL_T {
}
struct VkPerformanceCounterDescriptionKHR {
	VkStructureType sType;
	void* pNext;
	VkPerformanceCounterDescriptionFlagsKHR flags;
	char[256U] name;
	char[256U] category;
	char[256U] description;
}
struct VkPerformanceCounterKHR {
	VkStructureType sType;
	void* pNext;
	VkPerformanceCounterUnitKHR unit;
	VkPerformanceCounterScopeKHR scope_;
	VkPerformanceCounterStorageKHR storage;
	uint8_t[16U] uuid;
}
struct VkPerformanceMarkerInfoINTEL {
	VkStructureType sType;
	void* pNext;
	uint64_t marker;
}
struct VkPerformanceOverrideInfoINTEL {
	VkStructureType sType;
	void* pNext;
	VkPerformanceOverrideTypeINTEL type;
	VkBool32 enable;
	uint64_t parameter;
}
struct VkPerformanceQuerySubmitInfoKHR {
	VkStructureType sType;
	void* pNext;
	uint32_t counterPassIndex;
}
struct VkPerformanceStreamMarkerInfoINTEL {
	VkStructureType sType;
	void* pNext;
	uint32_t marker;
}
struct VkPerformanceValueINTEL {
	VkPerformanceValueTypeINTEL type;
	VkPerformanceValueDataINTEL data;
}
struct VkPhysicalDevice16BitStorageFeatures {
	VkStructureType sType;
	void* pNext;
	VkBool32 storageBuffer16BitAccess;
	VkBool32 uniformAndStorageBuffer16BitAccess;
	VkBool32 storagePushConstant16;
	VkBool32 storageInputOutput16;
}
struct VkPhysicalDevice4444FormatsFeaturesEXT {
	VkStructureType sType;
	void* pNext;
	VkBool32 formatA4R4G4B4;
	VkBool32 formatA4B4G4R4;
}
struct VkPhysicalDevice8BitStorageFeatures {
	VkStructureType sType;
	void* pNext;
	VkBool32 storageBuffer8BitAccess;
	VkBool32 uniformAndStorageBuffer8BitAccess;
	VkBool32 storagePushConstant8;
}
struct VkPhysicalDeviceASTCDecodeFeaturesEXT {
	VkStructureType sType;
	void* pNext;
	VkBool32 decodeModeSharedExponent;
}
struct VkPhysicalDeviceAccelerationStructureFeaturesKHR {
	VkStructureType sType;
	void* pNext;
	VkBool32 accelerationStructure;
	VkBool32 accelerationStructureCaptureReplay;
	VkBool32 accelerationStructureIndirectBuild;
	VkBool32 accelerationStructureHostCommands;
	VkBool32 descriptorBindingAccelerationStructureUpdateAfterBind;
}
struct VkPhysicalDeviceAccelerationStructurePropertiesKHR {
	VkStructureType sType;
	void* pNext;
	uint64_t maxGeometryCount;
	uint64_t maxInstanceCount;
	uint64_t maxPrimitiveCount;
	uint32_t maxPerStageDescriptorAccelerationStructures;
	uint32_t maxPerStageDescriptorUpdateAfterBindAccelerationStructures;
	uint32_t maxDescriptorSetAccelerationStructures;
	uint32_t maxDescriptorSetUpdateAfterBindAccelerationStructures;
	uint32_t minAccelerationStructureScratchOffsetAlignment;
}
struct VkPhysicalDeviceBlendOperationAdvancedFeaturesEXT {
	VkStructureType sType;
	void* pNext;
	VkBool32 advancedBlendCoherentOperations;
}
struct VkPhysicalDeviceBlendOperationAdvancedPropertiesEXT {
	VkStructureType sType;
	void* pNext;
	uint32_t advancedBlendMaxColorAttachments;
	VkBool32 advancedBlendIndependentBlend;
	VkBool32 advancedBlendNonPremultipliedSrcColor;
	VkBool32 advancedBlendNonPremultipliedDstColor;
	VkBool32 advancedBlendCorrelatedOverlap;
	VkBool32 advancedBlendAllOperations;
}
struct VkPhysicalDeviceBorderColorSwizzleFeaturesEXT {
	VkStructureType sType;
	void* pNext;
	VkBool32 borderColorSwizzle;
	VkBool32 borderColorSwizzleFromImage;
}
struct VkPhysicalDeviceBufferDeviceAddressFeatures {
	VkStructureType sType;
	void* pNext;
	VkBool32 bufferDeviceAddress;
	VkBool32 bufferDeviceAddressCaptureReplay;
	VkBool32 bufferDeviceAddressMultiDevice;
}
struct VkPhysicalDeviceBufferDeviceAddressFeaturesEXT {
	VkStructureType sType;
	void* pNext;
	VkBool32 bufferDeviceAddress;
	VkBool32 bufferDeviceAddressCaptureReplay;
	VkBool32 bufferDeviceAddressMultiDevice;
}
struct VkPhysicalDeviceCoherentMemoryFeaturesAMD {
	VkStructureType sType;
	void* pNext;
	VkBool32 deviceCoherentMemory;
}
struct VkPhysicalDeviceColorWriteEnableFeaturesEXT {
	VkStructureType sType;
	void* pNext;
	VkBool32 colorWriteEnable;
}
struct VkPhysicalDeviceComputeShaderDerivativesFeaturesNV {
	VkStructureType sType;
	void* pNext;
	VkBool32 computeDerivativeGroupQuads;
	VkBool32 computeDerivativeGroupLinear;
}
struct VkPhysicalDeviceConditionalRenderingFeaturesEXT {
	VkStructureType sType;
	void* pNext;
	VkBool32 conditionalRendering;
	VkBool32 inheritedConditionalRendering;
}
struct VkPhysicalDeviceConservativeRasterizationPropertiesEXT {
	VkStructureType sType;
	void* pNext;
	float primitiveOverestimationSize;
	float maxExtraPrimitiveOverestimationSize;
	float extraPrimitiveOverestimationSizeGranularity;
	VkBool32 primitiveUnderestimation;
	VkBool32 conservativePointAndLineRasterization;
	VkBool32 degenerateTrianglesRasterized;
	VkBool32 degenerateLinesRasterized;
	VkBool32 fullyCoveredFragmentShaderInputVariable;
	VkBool32 conservativeRasterizationPostDepthCoverage;
}
struct VkPhysicalDeviceCooperativeMatrixFeaturesNV {
	VkStructureType sType;
	void* pNext;
	VkBool32 cooperativeMatrix;
	VkBool32 cooperativeMatrixRobustBufferAccess;
}
struct VkPhysicalDeviceCooperativeMatrixPropertiesNV {
	VkStructureType sType;
	void* pNext;
	VkShaderStageFlags cooperativeMatrixSupportedStages;
}
struct VkPhysicalDeviceCornerSampledImageFeaturesNV {
	VkStructureType sType;
	void* pNext;
	VkBool32 cornerSampledImage;
}
struct VkPhysicalDeviceCoverageReductionModeFeaturesNV {
	VkStructureType sType;
	void* pNext;
	VkBool32 coverageReductionMode;
}
struct VkPhysicalDeviceCustomBorderColorFeaturesEXT {
	VkStructureType sType;
	void* pNext;
	VkBool32 customBorderColors;
	VkBool32 customBorderColorWithoutFormat;
}
struct VkPhysicalDeviceCustomBorderColorPropertiesEXT {
	VkStructureType sType;
	void* pNext;
	uint32_t maxCustomBorderColorSamplers;
}
struct VkPhysicalDeviceDedicatedAllocationImageAliasingFeaturesNV {
	VkStructureType sType;
	void* pNext;
	VkBool32 dedicatedAllocationImageAliasing;
}
struct VkPhysicalDeviceDepthClipControlFeaturesEXT {
	VkStructureType sType;
	void* pNext;
	VkBool32 depthClipControl;
}
struct VkPhysicalDeviceDepthClipEnableFeaturesEXT {
	VkStructureType sType;
	void* pNext;
	VkBool32 depthClipEnable;
}
struct VkPhysicalDeviceDepthStencilResolveProperties {
	VkStructureType sType;
	void* pNext;
	VkResolveModeFlags supportedDepthResolveModes;
	VkResolveModeFlags supportedStencilResolveModes;
	VkBool32 independentResolveNone;
	VkBool32 independentResolve;
}
struct VkPhysicalDeviceDescriptorIndexingFeatures {
	VkStructureType sType;
	void* pNext;
	VkBool32 shaderInputAttachmentArrayDynamicIndexing;
	VkBool32 shaderUniformTexelBufferArrayDynamicIndexing;
	VkBool32 shaderStorageTexelBufferArrayDynamicIndexing;
	VkBool32 shaderUniformBufferArrayNonUniformIndexing;
	VkBool32 shaderSampledImageArrayNonUniformIndexing;
	VkBool32 shaderStorageBufferArrayNonUniformIndexing;
	VkBool32 shaderStorageImageArrayNonUniformIndexing;
	VkBool32 shaderInputAttachmentArrayNonUniformIndexing;
	VkBool32 shaderUniformTexelBufferArrayNonUniformIndexing;
	VkBool32 shaderStorageTexelBufferArrayNonUniformIndexing;
	VkBool32 descriptorBindingUniformBufferUpdateAfterBind;
	VkBool32 descriptorBindingSampledImageUpdateAfterBind;
	VkBool32 descriptorBindingStorageImageUpdateAfterBind;
	VkBool32 descriptorBindingStorageBufferUpdateAfterBind;
	VkBool32 descriptorBindingUniformTexelBufferUpdateAfterBind;
	VkBool32 descriptorBindingStorageTexelBufferUpdateAfterBind;
	VkBool32 descriptorBindingUpdateUnusedWhilePending;
	VkBool32 descriptorBindingPartiallyBound;
	VkBool32 descriptorBindingVariableDescriptorCount;
	VkBool32 runtimeDescriptorArray;
}
struct VkPhysicalDeviceDescriptorIndexingProperties {
	VkStructureType sType;
	void* pNext;
	uint32_t maxUpdateAfterBindDescriptorsInAllPools;
	VkBool32 shaderUniformBufferArrayNonUniformIndexingNative;
	VkBool32 shaderSampledImageArrayNonUniformIndexingNative;
	VkBool32 shaderStorageBufferArrayNonUniformIndexingNative;
	VkBool32 shaderStorageImageArrayNonUniformIndexingNative;
	VkBool32 shaderInputAttachmentArrayNonUniformIndexingNative;
	VkBool32 robustBufferAccessUpdateAfterBind;
	VkBool32 quadDivergentImplicitLod;
	uint32_t maxPerStageDescriptorUpdateAfterBindSamplers;
	uint32_t maxPerStageDescriptorUpdateAfterBindUniformBuffers;
	uint32_t maxPerStageDescriptorUpdateAfterBindStorageBuffers;
	uint32_t maxPerStageDescriptorUpdateAfterBindSampledImages;
	uint32_t maxPerStageDescriptorUpdateAfterBindStorageImages;
	uint32_t maxPerStageDescriptorUpdateAfterBindInputAttachments;
	uint32_t maxPerStageUpdateAfterBindResources;
	uint32_t maxDescriptorSetUpdateAfterBindSamplers;
	uint32_t maxDescriptorSetUpdateAfterBindUniformBuffers;
	uint32_t maxDescriptorSetUpdateAfterBindUniformBuffersDynamic;
	uint32_t maxDescriptorSetUpdateAfterBindStorageBuffers;
	uint32_t maxDescriptorSetUpdateAfterBindStorageBuffersDynamic;
	uint32_t maxDescriptorSetUpdateAfterBindSampledImages;
	uint32_t maxDescriptorSetUpdateAfterBindStorageImages;
	uint32_t maxDescriptorSetUpdateAfterBindInputAttachments;
}
struct VkPhysicalDeviceDescriptorSetHostMappingFeaturesVALVE {
	VkStructureType sType;
	void* pNext;
	VkBool32 descriptorSetHostMapping;
}
struct VkPhysicalDeviceDeviceGeneratedCommandsFeaturesNV {
	VkStructureType sType;
	void* pNext;
	VkBool32 deviceGeneratedCommands;
}
struct VkPhysicalDeviceDeviceGeneratedCommandsPropertiesNV {
	VkStructureType sType;
	void* pNext;
	uint32_t maxGraphicsShaderGroupCount;
	uint32_t maxIndirectSequenceCount;
	uint32_t maxIndirectCommandsTokenCount;
	uint32_t maxIndirectCommandsStreamCount;
	uint32_t maxIndirectCommandsTokenOffset;
	uint32_t maxIndirectCommandsStreamStride;
	uint32_t minSequencesCountBufferOffsetAlignment;
	uint32_t minSequencesIndexBufferOffsetAlignment;
	uint32_t minIndirectCommandsBufferOffsetAlignment;
}
struct VkPhysicalDeviceDeviceMemoryReportFeaturesEXT {
	VkStructureType sType;
	void* pNext;
	VkBool32 deviceMemoryReport;
}
struct VkPhysicalDeviceDiagnosticsConfigFeaturesNV {
	VkStructureType sType;
	void* pNext;
	VkBool32 diagnosticsConfig;
}
struct VkPhysicalDeviceDiscardRectanglePropertiesEXT {
	VkStructureType sType;
	void* pNext;
	uint32_t maxDiscardRectangles;
}
struct VkPhysicalDeviceDriverProperties {
	VkStructureType sType;
	void* pNext;
	VkDriverId driverID;
	char[256U] driverName;
	char[256U] driverInfo;
	VkConformanceVersion conformanceVersion;
}
struct VkPhysicalDeviceDrmPropertiesEXT {
	VkStructureType sType;
	void* pNext;
	VkBool32 hasPrimary;
	VkBool32 hasRender;
	int64_t primaryMajor;
	int64_t primaryMinor;
	int64_t renderMajor;
	int64_t renderMinor;
}
struct VkPhysicalDeviceDynamicRenderingFeatures {
	VkStructureType sType;
	void* pNext;
	VkBool32 dynamicRendering;
}
struct VkPhysicalDeviceExclusiveScissorFeaturesNV {
	VkStructureType sType;
	void* pNext;
	VkBool32 exclusiveScissor;
}
struct VkPhysicalDeviceExtendedDynamicState2FeaturesEXT {
	VkStructureType sType;
	void* pNext;
	VkBool32 extendedDynamicState2;
	VkBool32 extendedDynamicState2LogicOp;
	VkBool32 extendedDynamicState2PatchControlPoints;
}
struct VkPhysicalDeviceExtendedDynamicStateFeaturesEXT {
	VkStructureType sType;
	void* pNext;
	VkBool32 extendedDynamicState;
}
struct VkPhysicalDeviceExternalBufferInfo {
	VkStructureType sType;
	void* pNext;
	VkBufferCreateFlags flags;
	VkBufferUsageFlags usage;
	VkExternalMemoryHandleTypeFlagBits handleType;
}
struct VkPhysicalDeviceExternalFenceInfo {
	VkStructureType sType;
	void* pNext;
	VkExternalFenceHandleTypeFlagBits handleType;
}
struct VkPhysicalDeviceExternalImageFormatInfo {
	VkStructureType sType;
	void* pNext;
	VkExternalMemoryHandleTypeFlagBits handleType;
}
struct VkPhysicalDeviceExternalMemoryHostPropertiesEXT {
	VkStructureType sType;
	void* pNext;
	VkDeviceSize minImportedHostPointerAlignment;
}
struct VkPhysicalDeviceExternalMemoryRDMAFeaturesNV {
	VkStructureType sType;
	void* pNext;
	VkBool32 externalMemoryRDMA;
}
struct VkPhysicalDeviceExternalSemaphoreInfo {
	VkStructureType sType;
	void* pNext;
	VkExternalSemaphoreHandleTypeFlagBits handleType;
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
struct VkPhysicalDeviceFeatures2 {
	VkStructureType sType;
	void* pNext;
	VkPhysicalDeviceFeatures features;
}
struct VkPhysicalDeviceFloatControlsProperties {
	VkStructureType sType;
	void* pNext;
	VkShaderFloatControlsIndependence denormBehaviorIndependence;
	VkShaderFloatControlsIndependence roundingModeIndependence;
	VkBool32 shaderSignedZeroInfNanPreserveFloat16;
	VkBool32 shaderSignedZeroInfNanPreserveFloat32;
	VkBool32 shaderSignedZeroInfNanPreserveFloat64;
	VkBool32 shaderDenormPreserveFloat16;
	VkBool32 shaderDenormPreserveFloat32;
	VkBool32 shaderDenormPreserveFloat64;
	VkBool32 shaderDenormFlushToZeroFloat16;
	VkBool32 shaderDenormFlushToZeroFloat32;
	VkBool32 shaderDenormFlushToZeroFloat64;
	VkBool32 shaderRoundingModeRTEFloat16;
	VkBool32 shaderRoundingModeRTEFloat32;
	VkBool32 shaderRoundingModeRTEFloat64;
	VkBool32 shaderRoundingModeRTZFloat16;
	VkBool32 shaderRoundingModeRTZFloat32;
	VkBool32 shaderRoundingModeRTZFloat64;
}
struct VkPhysicalDeviceFragmentDensityMap2FeaturesEXT {
	VkStructureType sType;
	void* pNext;
	VkBool32 fragmentDensityMapDeferred;
}
struct VkPhysicalDeviceFragmentDensityMap2PropertiesEXT {
	VkStructureType sType;
	void* pNext;
	VkBool32 subsampledLoads;
	VkBool32 subsampledCoarseReconstructionEarlyAccess;
	uint32_t maxSubsampledArrayLayers;
	uint32_t maxDescriptorSetSubsampledSamplers;
}
struct VkPhysicalDeviceFragmentDensityMapFeaturesEXT {
	VkStructureType sType;
	void* pNext;
	VkBool32 fragmentDensityMap;
	VkBool32 fragmentDensityMapDynamic;
	VkBool32 fragmentDensityMapNonSubsampledImages;
}
struct VkPhysicalDeviceFragmentDensityMapOffsetFeaturesQCOM {
	VkStructureType sType;
	void* pNext;
	VkBool32 fragmentDensityMapOffset;
}
struct VkPhysicalDeviceFragmentDensityMapOffsetPropertiesQCOM {
	VkStructureType sType;
	void* pNext;
	VkExtent2D fragmentDensityOffsetGranularity;
}
struct VkPhysicalDeviceFragmentDensityMapPropertiesEXT {
	VkStructureType sType;
	void* pNext;
	VkExtent2D minFragmentDensityTexelSize;
	VkExtent2D maxFragmentDensityTexelSize;
	VkBool32 fragmentDensityInvocations;
}
struct VkPhysicalDeviceFragmentShaderBarycentricFeaturesNV {
	VkStructureType sType;
	void* pNext;
	VkBool32 fragmentShaderBarycentric;
}
struct VkPhysicalDeviceFragmentShaderInterlockFeaturesEXT {
	VkStructureType sType;
	void* pNext;
	VkBool32 fragmentShaderSampleInterlock;
	VkBool32 fragmentShaderPixelInterlock;
	VkBool32 fragmentShaderShadingRateInterlock;
}
struct VkPhysicalDeviceFragmentShadingRateEnumsFeaturesNV {
	VkStructureType sType;
	void* pNext;
	VkBool32 fragmentShadingRateEnums;
	VkBool32 supersampleFragmentShadingRates;
	VkBool32 noInvocationFragmentShadingRates;
}
struct VkPhysicalDeviceFragmentShadingRateEnumsPropertiesNV {
	VkStructureType sType;
	void* pNext;
	VkSampleCountFlagBits maxFragmentShadingRateInvocationCount;
}
struct VkPhysicalDeviceFragmentShadingRateFeaturesKHR {
	VkStructureType sType;
	void* pNext;
	VkBool32 pipelineFragmentShadingRate;
	VkBool32 primitiveFragmentShadingRate;
	VkBool32 attachmentFragmentShadingRate;
}
struct VkPhysicalDeviceFragmentShadingRateKHR {
	VkStructureType sType;
	void* pNext;
	VkSampleCountFlags sampleCounts;
	VkExtent2D fragmentSize;
}
struct VkPhysicalDeviceFragmentShadingRatePropertiesKHR {
	VkStructureType sType;
	void* pNext;
	VkExtent2D minFragmentShadingRateAttachmentTexelSize;
	VkExtent2D maxFragmentShadingRateAttachmentTexelSize;
	uint32_t maxFragmentShadingRateAttachmentTexelSizeAspectRatio;
	VkBool32 primitiveFragmentShadingRateWithMultipleViewports;
	VkBool32 layeredShadingRateAttachments;
	VkBool32 fragmentShadingRateNonTrivialCombinerOps;
	VkExtent2D maxFragmentSize;
	uint32_t maxFragmentSizeAspectRatio;
	uint32_t maxFragmentShadingRateCoverageSamples;
	VkSampleCountFlagBits maxFragmentShadingRateRasterizationSamples;
	VkBool32 fragmentShadingRateWithShaderDepthStencilWrites;
	VkBool32 fragmentShadingRateWithSampleMask;
	VkBool32 fragmentShadingRateWithShaderSampleMask;
	VkBool32 fragmentShadingRateWithConservativeRasterization;
	VkBool32 fragmentShadingRateWithFragmentShaderInterlock;
	VkBool32 fragmentShadingRateWithCustomSampleLocations;
	VkBool32 fragmentShadingRateStrictMultiplyCombiner;
}
struct VkPhysicalDeviceGlobalPriorityQueryFeaturesKHR {
	VkStructureType sType;
	void* pNext;
	VkBool32 globalPriorityQuery;
}
struct VkPhysicalDeviceGraphicsPipelineLibraryFeaturesEXT {
	VkStructureType sType;
	void* pNext;
	VkBool32 graphicsPipelineLibrary;
}
struct VkPhysicalDeviceGraphicsPipelineLibraryPropertiesEXT {
	VkStructureType sType;
	void* pNext;
	VkBool32 graphicsPipelineLibraryFastLinking;
	VkBool32 graphicsPipelineLibraryIndependentInterpolationDecoration;
}
struct VkPhysicalDeviceGroupProperties {
	VkStructureType sType;
	void* pNext;
	uint32_t physicalDeviceCount;
	VkPhysicalDevice[32U] physicalDevices;
	VkBool32 subsetAllocation;
}
struct VkPhysicalDeviceHostQueryResetFeatures {
	VkStructureType sType;
	void* pNext;
	VkBool32 hostQueryReset;
}
struct VkPhysicalDeviceIDProperties {
	VkStructureType sType;
	void* pNext;
	uint8_t[16U] deviceUUID;
	uint8_t[16U] driverUUID;
	uint8_t[8U] deviceLUID;
	uint32_t deviceNodeMask;
	VkBool32 deviceLUIDValid;
}
struct VkPhysicalDeviceImage2DViewOf3DFeaturesEXT {
	VkStructureType sType;
	void* pNext;
	VkBool32 image2DViewOf3D;
	VkBool32 sampler2DViewOf3D;
}
struct VkPhysicalDeviceImageDrmFormatModifierInfoEXT {
	VkStructureType sType;
	void* pNext;
	uint64_t drmFormatModifier;
	VkSharingMode sharingMode;
	uint32_t queueFamilyIndexCount;
	uint32_t* pQueueFamilyIndices;
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
struct VkPhysicalDeviceImageRobustnessFeatures {
	VkStructureType sType;
	void* pNext;
	VkBool32 robustImageAccess;
}
struct VkPhysicalDeviceImageViewImageFormatInfoEXT {
	VkStructureType sType;
	void* pNext;
	VkImageViewType imageViewType;
}
struct VkPhysicalDeviceImageViewMinLodFeaturesEXT {
	VkStructureType sType;
	void* pNext;
	VkBool32 minLod;
}
struct VkPhysicalDeviceImagelessFramebufferFeatures {
	VkStructureType sType;
	void* pNext;
	VkBool32 imagelessFramebuffer;
}
struct VkPhysicalDeviceIndexTypeUint8FeaturesEXT {
	VkStructureType sType;
	void* pNext;
	VkBool32 indexTypeUint8;
}
struct VkPhysicalDeviceInheritedViewportScissorFeaturesNV {
	VkStructureType sType;
	void* pNext;
	VkBool32 inheritedViewportScissor2D;
}
struct VkPhysicalDeviceInlineUniformBlockFeatures {
	VkStructureType sType;
	void* pNext;
	VkBool32 inlineUniformBlock;
	VkBool32 descriptorBindingInlineUniformBlockUpdateAfterBind;
}
struct VkPhysicalDeviceInlineUniformBlockProperties {
	VkStructureType sType;
	void* pNext;
	uint32_t maxInlineUniformBlockSize;
	uint32_t maxPerStageDescriptorInlineUniformBlocks;
	uint32_t maxPerStageDescriptorUpdateAfterBindInlineUniformBlocks;
	uint32_t maxDescriptorSetInlineUniformBlocks;
	uint32_t maxDescriptorSetUpdateAfterBindInlineUniformBlocks;
}
struct VkPhysicalDeviceInvocationMaskFeaturesHUAWEI {
	VkStructureType sType;
	void* pNext;
	VkBool32 invocationMask;
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
struct VkPhysicalDeviceLineRasterizationFeaturesEXT {
	VkStructureType sType;
	void* pNext;
	VkBool32 rectangularLines;
	VkBool32 bresenhamLines;
	VkBool32 smoothLines;
	VkBool32 stippledRectangularLines;
	VkBool32 stippledBresenhamLines;
	VkBool32 stippledSmoothLines;
}
struct VkPhysicalDeviceLineRasterizationPropertiesEXT {
	VkStructureType sType;
	void* pNext;
	uint32_t lineSubPixelPrecisionBits;
}
struct VkPhysicalDeviceLinearColorAttachmentFeaturesNV {
	VkStructureType sType;
	void* pNext;
	VkBool32 linearColorAttachment;
}
struct VkPhysicalDeviceMaintenance3Properties {
	VkStructureType sType;
	void* pNext;
	uint32_t maxPerSetDescriptors;
	VkDeviceSize maxMemoryAllocationSize;
}
struct VkPhysicalDeviceMaintenance4Features {
	VkStructureType sType;
	void* pNext;
	VkBool32 maintenance4;
}
struct VkPhysicalDeviceMaintenance4Properties {
	VkStructureType sType;
	void* pNext;
	VkDeviceSize maxBufferSize;
}
struct VkPhysicalDeviceMemoryBudgetPropertiesEXT {
	VkStructureType sType;
	void* pNext;
	VkDeviceSize[16U] heapBudget;
	VkDeviceSize[16U] heapUsage;
}
struct VkPhysicalDeviceMemoryPriorityFeaturesEXT {
	VkStructureType sType;
	void* pNext;
	VkBool32 memoryPriority;
}
struct VkPhysicalDeviceMemoryProperties {
	uint32_t memoryTypeCount;
	VkMemoryType[32U] memoryTypes;
	uint32_t memoryHeapCount;
	VkMemoryHeap[16U] memoryHeaps;
}
struct VkPhysicalDeviceMemoryProperties2 {
	VkStructureType sType;
	void* pNext;
	VkPhysicalDeviceMemoryProperties memoryProperties;
}
struct VkPhysicalDeviceMeshShaderFeaturesNV {
	VkStructureType sType;
	void* pNext;
	VkBool32 taskShader;
	VkBool32 meshShader;
}
struct VkPhysicalDeviceMeshShaderPropertiesNV {
	VkStructureType sType;
	void* pNext;
	uint32_t maxDrawMeshTasksCount;
	uint32_t maxTaskWorkGroupInvocations;
	uint32_t[3] maxTaskWorkGroupSize;
	uint32_t maxTaskTotalMemorySize;
	uint32_t maxTaskOutputCount;
	uint32_t maxMeshWorkGroupInvocations;
	uint32_t[3] maxMeshWorkGroupSize;
	uint32_t maxMeshTotalMemorySize;
	uint32_t maxMeshOutputVertices;
	uint32_t maxMeshOutputPrimitives;
	uint32_t maxMeshMultiviewViewCount;
	uint32_t meshOutputPerVertexGranularity;
	uint32_t meshOutputPerPrimitiveGranularity;
}
struct VkPhysicalDeviceMultiDrawFeaturesEXT {
	VkStructureType sType;
	void* pNext;
	VkBool32 multiDraw;
}
struct VkPhysicalDeviceMultiDrawPropertiesEXT {
	VkStructureType sType;
	void* pNext;
	uint32_t maxMultiDrawCount;
}
struct VkPhysicalDeviceMultiviewFeatures {
	VkStructureType sType;
	void* pNext;
	VkBool32 multiview;
	VkBool32 multiviewGeometryShader;
	VkBool32 multiviewTessellationShader;
}
struct VkPhysicalDeviceMultiviewPerViewAttributesPropertiesNVX {
	VkStructureType sType;
	void* pNext;
	VkBool32 perViewPositionAllComponents;
}
struct VkPhysicalDeviceMultiviewProperties {
	VkStructureType sType;
	void* pNext;
	uint32_t maxMultiviewViewCount;
	uint32_t maxMultiviewInstanceIndex;
}
struct VkPhysicalDeviceMutableDescriptorTypeFeaturesVALVE {
	VkStructureType sType;
	void* pNext;
	VkBool32 mutableDescriptorType;
}
struct VkPhysicalDevicePCIBusInfoPropertiesEXT {
	VkStructureType sType;
	void* pNext;
	uint32_t pciDomain;
	uint32_t pciBus;
	uint32_t pciDevice;
	uint32_t pciFunction;
}
struct VkPhysicalDevicePageableDeviceLocalMemoryFeaturesEXT {
	VkStructureType sType;
	void* pNext;
	VkBool32 pageableDeviceLocalMemory;
}
struct VkPhysicalDevicePerformanceQueryFeaturesKHR {
	VkStructureType sType;
	void* pNext;
	VkBool32 performanceCounterQueryPools;
	VkBool32 performanceCounterMultipleQueryPools;
}
struct VkPhysicalDevicePerformanceQueryPropertiesKHR {
	VkStructureType sType;
	void* pNext;
	VkBool32 allowCommandBufferQueryCopies;
}
struct VkPhysicalDevicePipelineCreationCacheControlFeatures {
	VkStructureType sType;
	void* pNext;
	VkBool32 pipelineCreationCacheControl;
}
struct VkPhysicalDevicePipelineExecutablePropertiesFeaturesKHR {
	VkStructureType sType;
	void* pNext;
	VkBool32 pipelineExecutableInfo;
}
struct VkPhysicalDevicePointClippingProperties {
	VkStructureType sType;
	void* pNext;
	VkPointClippingBehavior pointClippingBehavior;
}
struct VkPhysicalDevicePresentIdFeaturesKHR {
	VkStructureType sType;
	void* pNext;
	VkBool32 presentId;
}
struct VkPhysicalDevicePresentWaitFeaturesKHR {
	VkStructureType sType;
	void* pNext;
	VkBool32 presentWait;
}
struct VkPhysicalDevicePrimitiveTopologyListRestartFeaturesEXT {
	VkStructureType sType;
	void* pNext;
	VkBool32 primitiveTopologyListRestart;
	VkBool32 primitiveTopologyPatchListRestart;
}
struct VkPhysicalDevicePrimitivesGeneratedQueryFeaturesEXT {
	VkStructureType sType;
	void* pNext;
	VkBool32 primitivesGeneratedQuery;
	VkBool32 primitivesGeneratedQueryWithRasterizerDiscard;
	VkBool32 primitivesGeneratedQueryWithNonZeroStreams;
}
struct VkPhysicalDevicePrivateDataFeatures {
	VkStructureType sType;
	void* pNext;
	VkBool32 privateData;
}
struct VkPhysicalDeviceProperties {
	uint32_t apiVersion;
	uint32_t driverVersion;
	uint32_t vendorID;
	uint32_t deviceID;
	VkPhysicalDeviceType deviceType;
	char[256U] deviceName;
	uint8_t[16U] pipelineCacheUUID;
	VkPhysicalDeviceLimits limits;
	VkPhysicalDeviceSparseProperties sparseProperties;
}
struct VkPhysicalDeviceProperties2 {
	VkStructureType sType;
	void* pNext;
	VkPhysicalDeviceProperties properties;
}
struct VkPhysicalDeviceProtectedMemoryFeatures {
	VkStructureType sType;
	void* pNext;
	VkBool32 protectedMemory;
}
struct VkPhysicalDeviceProtectedMemoryProperties {
	VkStructureType sType;
	void* pNext;
	VkBool32 protectedNoFault;
}
struct VkPhysicalDeviceProvokingVertexFeaturesEXT {
	VkStructureType sType;
	void* pNext;
	VkBool32 provokingVertexLast;
	VkBool32 transformFeedbackPreservesProvokingVertex;
}
struct VkPhysicalDeviceProvokingVertexPropertiesEXT {
	VkStructureType sType;
	void* pNext;
	VkBool32 provokingVertexModePerPipeline;
	VkBool32 transformFeedbackPreservesTriangleFanProvokingVertex;
}
struct VkPhysicalDevicePushDescriptorPropertiesKHR {
	VkStructureType sType;
	void* pNext;
	uint32_t maxPushDescriptors;
}
struct VkPhysicalDeviceRGBA10X6FormatsFeaturesEXT {
	VkStructureType sType;
	void* pNext;
	VkBool32 formatRgba10x6WithoutYCbCrSampler;
}
struct VkPhysicalDeviceRasterizationOrderAttachmentAccessFeaturesARM {
	VkStructureType sType;
	void* pNext;
	VkBool32 rasterizationOrderColorAttachmentAccess;
	VkBool32 rasterizationOrderDepthAttachmentAccess;
	VkBool32 rasterizationOrderStencilAttachmentAccess;
}
struct VkPhysicalDeviceRayQueryFeaturesKHR {
	VkStructureType sType;
	void* pNext;
	VkBool32 rayQuery;
}
struct VkPhysicalDeviceRayTracingMotionBlurFeaturesNV {
	VkStructureType sType;
	void* pNext;
	VkBool32 rayTracingMotionBlur;
	VkBool32 rayTracingMotionBlurPipelineTraceRaysIndirect;
}
struct VkPhysicalDeviceRayTracingPipelineFeaturesKHR {
	VkStructureType sType;
	void* pNext;
	VkBool32 rayTracingPipeline;
	VkBool32 rayTracingPipelineShaderGroupHandleCaptureReplay;
	VkBool32 rayTracingPipelineShaderGroupHandleCaptureReplayMixed;
	VkBool32 rayTracingPipelineTraceRaysIndirect;
	VkBool32 rayTraversalPrimitiveCulling;
}
struct VkPhysicalDeviceRayTracingPipelinePropertiesKHR {
	VkStructureType sType;
	void* pNext;
	uint32_t shaderGroupHandleSize;
	uint32_t maxRayRecursionDepth;
	uint32_t maxShaderGroupStride;
	uint32_t shaderGroupBaseAlignment;
	uint32_t shaderGroupHandleCaptureReplaySize;
	uint32_t maxRayDispatchInvocationCount;
	uint32_t shaderGroupHandleAlignment;
	uint32_t maxRayHitAttributeSize;
}
struct VkPhysicalDeviceRayTracingPropertiesNV {
	VkStructureType sType;
	void* pNext;
	uint32_t shaderGroupHandleSize;
	uint32_t maxRecursionDepth;
	uint32_t maxShaderGroupStride;
	uint32_t shaderGroupBaseAlignment;
	uint64_t maxGeometryCount;
	uint64_t maxInstanceCount;
	uint64_t maxTriangleCount;
	uint32_t maxDescriptorSetAccelerationStructures;
}
struct VkPhysicalDeviceRepresentativeFragmentTestFeaturesNV {
	VkStructureType sType;
	void* pNext;
	VkBool32 representativeFragmentTest;
}
struct VkPhysicalDeviceRobustness2FeaturesEXT {
	VkStructureType sType;
	void* pNext;
	VkBool32 robustBufferAccess2;
	VkBool32 robustImageAccess2;
	VkBool32 nullDescriptor;
}
struct VkPhysicalDeviceRobustness2PropertiesEXT {
	VkStructureType sType;
	void* pNext;
	VkDeviceSize robustStorageBufferAccessSizeAlignment;
	VkDeviceSize robustUniformBufferAccessSizeAlignment;
}
struct VkPhysicalDeviceSampleLocationsPropertiesEXT {
	VkStructureType sType;
	void* pNext;
	VkSampleCountFlags sampleLocationSampleCounts;
	VkExtent2D maxSampleLocationGridSize;
	float[2] sampleLocationCoordinateRange;
	uint32_t sampleLocationSubPixelBits;
	VkBool32 variableSampleLocations;
}
struct VkPhysicalDeviceSamplerFilterMinmaxProperties {
	VkStructureType sType;
	void* pNext;
	VkBool32 filterMinmaxSingleComponentFormats;
	VkBool32 filterMinmaxImageComponentMapping;
}
struct VkPhysicalDeviceSamplerYcbcrConversionFeatures {
	VkStructureType sType;
	void* pNext;
	VkBool32 samplerYcbcrConversion;
}
struct VkPhysicalDeviceScalarBlockLayoutFeatures {
	VkStructureType sType;
	void* pNext;
	VkBool32 scalarBlockLayout;
}
struct VkPhysicalDeviceSeparateDepthStencilLayoutsFeatures {
	VkStructureType sType;
	void* pNext;
	VkBool32 separateDepthStencilLayouts;
}
struct VkPhysicalDeviceShaderAtomicFloat2FeaturesEXT {
	VkStructureType sType;
	void* pNext;
	VkBool32 shaderBufferFloat16Atomics;
	VkBool32 shaderBufferFloat16AtomicAdd;
	VkBool32 shaderBufferFloat16AtomicMinMax;
	VkBool32 shaderBufferFloat32AtomicMinMax;
	VkBool32 shaderBufferFloat64AtomicMinMax;
	VkBool32 shaderSharedFloat16Atomics;
	VkBool32 shaderSharedFloat16AtomicAdd;
	VkBool32 shaderSharedFloat16AtomicMinMax;
	VkBool32 shaderSharedFloat32AtomicMinMax;
	VkBool32 shaderSharedFloat64AtomicMinMax;
	VkBool32 shaderImageFloat32AtomicMinMax;
	VkBool32 sparseImageFloat32AtomicMinMax;
}
struct VkPhysicalDeviceShaderAtomicFloatFeaturesEXT {
	VkStructureType sType;
	void* pNext;
	VkBool32 shaderBufferFloat32Atomics;
	VkBool32 shaderBufferFloat32AtomicAdd;
	VkBool32 shaderBufferFloat64Atomics;
	VkBool32 shaderBufferFloat64AtomicAdd;
	VkBool32 shaderSharedFloat32Atomics;
	VkBool32 shaderSharedFloat32AtomicAdd;
	VkBool32 shaderSharedFloat64Atomics;
	VkBool32 shaderSharedFloat64AtomicAdd;
	VkBool32 shaderImageFloat32Atomics;
	VkBool32 shaderImageFloat32AtomicAdd;
	VkBool32 sparseImageFloat32Atomics;
	VkBool32 sparseImageFloat32AtomicAdd;
}
struct VkPhysicalDeviceShaderAtomicInt64Features {
	VkStructureType sType;
	void* pNext;
	VkBool32 shaderBufferInt64Atomics;
	VkBool32 shaderSharedInt64Atomics;
}
struct VkPhysicalDeviceShaderClockFeaturesKHR {
	VkStructureType sType;
	void* pNext;
	VkBool32 shaderSubgroupClock;
	VkBool32 shaderDeviceClock;
}
struct VkPhysicalDeviceShaderCoreProperties2AMD {
	VkStructureType sType;
	void* pNext;
	VkShaderCorePropertiesFlagsAMD shaderCoreFeatures;
	uint32_t activeComputeUnitCount;
}
struct VkPhysicalDeviceShaderCorePropertiesAMD {
	VkStructureType sType;
	void* pNext;
	uint32_t shaderEngineCount;
	uint32_t shaderArraysPerEngineCount;
	uint32_t computeUnitsPerShaderArray;
	uint32_t simdPerComputeUnit;
	uint32_t wavefrontsPerSimd;
	uint32_t wavefrontSize;
	uint32_t sgprsPerSimd;
	uint32_t minSgprAllocation;
	uint32_t maxSgprAllocation;
	uint32_t sgprAllocationGranularity;
	uint32_t vgprsPerSimd;
	uint32_t minVgprAllocation;
	uint32_t maxVgprAllocation;
	uint32_t vgprAllocationGranularity;
}
struct VkPhysicalDeviceShaderDemoteToHelperInvocationFeatures {
	VkStructureType sType;
	void* pNext;
	VkBool32 shaderDemoteToHelperInvocation;
}
struct VkPhysicalDeviceShaderDrawParametersFeatures {
	VkStructureType sType;
	void* pNext;
	VkBool32 shaderDrawParameters;
}
struct VkPhysicalDeviceShaderFloat16Int8Features {
	VkStructureType sType;
	void* pNext;
	VkBool32 shaderFloat16;
	VkBool32 shaderInt8;
}
struct VkPhysicalDeviceShaderImageAtomicInt64FeaturesEXT {
	VkStructureType sType;
	void* pNext;
	VkBool32 shaderImageInt64Atomics;
	VkBool32 sparseImageInt64Atomics;
}
struct VkPhysicalDeviceShaderImageFootprintFeaturesNV {
	VkStructureType sType;
	void* pNext;
	VkBool32 imageFootprint;
}
struct VkPhysicalDeviceShaderIntegerDotProductFeatures {
	VkStructureType sType;
	void* pNext;
	VkBool32 shaderIntegerDotProduct;
}
struct VkPhysicalDeviceShaderIntegerDotProductProperties {
	VkStructureType sType;
	void* pNext;
	VkBool32 integerDotProduct8BitUnsignedAccelerated;
	VkBool32 integerDotProduct8BitSignedAccelerated;
	VkBool32 integerDotProduct8BitMixedSignednessAccelerated;
	VkBool32 integerDotProduct4x8BitPackedUnsignedAccelerated;
	VkBool32 integerDotProduct4x8BitPackedSignedAccelerated;
	VkBool32 integerDotProduct4x8BitPackedMixedSignednessAccelerated;
	VkBool32 integerDotProduct16BitUnsignedAccelerated;
	VkBool32 integerDotProduct16BitSignedAccelerated;
	VkBool32 integerDotProduct16BitMixedSignednessAccelerated;
	VkBool32 integerDotProduct32BitUnsignedAccelerated;
	VkBool32 integerDotProduct32BitSignedAccelerated;
	VkBool32 integerDotProduct32BitMixedSignednessAccelerated;
	VkBool32 integerDotProduct64BitUnsignedAccelerated;
	VkBool32 integerDotProduct64BitSignedAccelerated;
	VkBool32 integerDotProduct64BitMixedSignednessAccelerated;
	VkBool32 integerDotProductAccumulatingSaturating8BitUnsignedAccelerated;
	VkBool32 integerDotProductAccumulatingSaturating8BitSignedAccelerated;
	VkBool32 integerDotProductAccumulatingSaturating8BitMixedSignednessAccelerated;
	VkBool32 integerDotProductAccumulatingSaturating4x8BitPackedUnsignedAccelerated;
	VkBool32 integerDotProductAccumulatingSaturating4x8BitPackedSignedAccelerated;
	VkBool32 integerDotProductAccumulatingSaturating4x8BitPackedMixedSignednessAccelerated;
	VkBool32 integerDotProductAccumulatingSaturating16BitUnsignedAccelerated;
	VkBool32 integerDotProductAccumulatingSaturating16BitSignedAccelerated;
	VkBool32 integerDotProductAccumulatingSaturating16BitMixedSignednessAccelerated;
	VkBool32 integerDotProductAccumulatingSaturating32BitUnsignedAccelerated;
	VkBool32 integerDotProductAccumulatingSaturating32BitSignedAccelerated;
	VkBool32 integerDotProductAccumulatingSaturating32BitMixedSignednessAccelerated;
	VkBool32 integerDotProductAccumulatingSaturating64BitUnsignedAccelerated;
	VkBool32 integerDotProductAccumulatingSaturating64BitSignedAccelerated;
	VkBool32 integerDotProductAccumulatingSaturating64BitMixedSignednessAccelerated;
}
struct VkPhysicalDeviceShaderIntegerFunctions2FeaturesINTEL {
	VkStructureType sType;
	void* pNext;
	VkBool32 shaderIntegerFunctions2;
}
struct VkPhysicalDeviceShaderSMBuiltinsFeaturesNV {
	VkStructureType sType;
	void* pNext;
	VkBool32 shaderSMBuiltins;
}
struct VkPhysicalDeviceShaderSMBuiltinsPropertiesNV {
	VkStructureType sType;
	void* pNext;
	uint32_t shaderSMCount;
	uint32_t shaderWarpsPerSM;
}
struct VkPhysicalDeviceShaderSubgroupExtendedTypesFeatures {
	VkStructureType sType;
	void* pNext;
	VkBool32 shaderSubgroupExtendedTypes;
}
struct VkPhysicalDeviceShaderSubgroupUniformControlFlowFeaturesKHR {
	VkStructureType sType;
	void* pNext;
	VkBool32 shaderSubgroupUniformControlFlow;
}
struct VkPhysicalDeviceShaderTerminateInvocationFeatures {
	VkStructureType sType;
	void* pNext;
	VkBool32 shaderTerminateInvocation;
}
struct VkPhysicalDeviceShadingRateImageFeaturesNV {
	VkStructureType sType;
	void* pNext;
	VkBool32 shadingRateImage;
	VkBool32 shadingRateCoarseSampleOrder;
}
struct VkPhysicalDeviceShadingRateImagePropertiesNV {
	VkStructureType sType;
	void* pNext;
	VkExtent2D shadingRateTexelSize;
	uint32_t shadingRatePaletteSize;
	uint32_t shadingRateMaxCoarseSamples;
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
struct VkPhysicalDeviceSparseProperties {
	VkBool32 residencyStandard2DBlockShape;
	VkBool32 residencyStandard2DMultisampleBlockShape;
	VkBool32 residencyStandard3DBlockShape;
	VkBool32 residencyAlignedMipSize;
	VkBool32 residencyNonResidentStrict;
}
struct VkPhysicalDeviceSubgroupProperties {
	VkStructureType sType;
	void* pNext;
	uint32_t subgroupSize;
	VkShaderStageFlags supportedStages;
	VkSubgroupFeatureFlags supportedOperations;
	VkBool32 quadOperationsInAllStages;
}
struct VkPhysicalDeviceSubgroupSizeControlFeatures {
	VkStructureType sType;
	void* pNext;
	VkBool32 subgroupSizeControl;
	VkBool32 computeFullSubgroups;
}
struct VkPhysicalDeviceSubgroupSizeControlProperties {
	VkStructureType sType;
	void* pNext;
	uint32_t minSubgroupSize;
	uint32_t maxSubgroupSize;
	uint32_t maxComputeWorkgroupSubgroups;
	VkShaderStageFlags requiredSubgroupSizeStages;
}
struct VkPhysicalDeviceSubpassShadingFeaturesHUAWEI {
	VkStructureType sType;
	void* pNext;
	VkBool32 subpassShading;
}
struct VkPhysicalDeviceSubpassShadingPropertiesHUAWEI {
	VkStructureType sType;
	void* pNext;
	uint32_t maxSubpassShadingWorkgroupSizeAspectRatio;
}
struct VkPhysicalDeviceSurfaceInfo2KHR {
	VkStructureType sType;
	void* pNext;
	VkSurfaceKHR surface;
}
struct VkPhysicalDeviceSynchronization2Features {
	VkStructureType sType;
	void* pNext;
	VkBool32 synchronization2;
}
struct VkPhysicalDeviceTexelBufferAlignmentFeaturesEXT {
	VkStructureType sType;
	void* pNext;
	VkBool32 texelBufferAlignment;
}
struct VkPhysicalDeviceTexelBufferAlignmentProperties {
	VkStructureType sType;
	void* pNext;
	VkDeviceSize storageTexelBufferOffsetAlignmentBytes;
	VkBool32 storageTexelBufferOffsetSingleTexelAlignment;
	VkDeviceSize uniformTexelBufferOffsetAlignmentBytes;
	VkBool32 uniformTexelBufferOffsetSingleTexelAlignment;
}
struct VkPhysicalDeviceTextureCompressionASTCHDRFeatures {
	VkStructureType sType;
	void* pNext;
	VkBool32 textureCompressionASTC_HDR;
}
struct VkPhysicalDeviceTimelineSemaphoreFeatures {
	VkStructureType sType;
	void* pNext;
	VkBool32 timelineSemaphore;
}
struct VkPhysicalDeviceTimelineSemaphoreProperties {
	VkStructureType sType;
	void* pNext;
	uint64_t maxTimelineSemaphoreValueDifference;
}
struct VkPhysicalDeviceToolProperties {
	VkStructureType sType;
	void* pNext;
	char[256U] name;
	char[256U] version_;
	VkToolPurposeFlags purposes;
	char[256U] description;
	char[256U] layer;
}
struct VkPhysicalDeviceTransformFeedbackFeaturesEXT {
	VkStructureType sType;
	void* pNext;
	VkBool32 transformFeedback;
	VkBool32 geometryStreams;
}
struct VkPhysicalDeviceTransformFeedbackPropertiesEXT {
	VkStructureType sType;
	void* pNext;
	uint32_t maxTransformFeedbackStreams;
	uint32_t maxTransformFeedbackBuffers;
	VkDeviceSize maxTransformFeedbackBufferSize;
	uint32_t maxTransformFeedbackStreamDataSize;
	uint32_t maxTransformFeedbackBufferDataSize;
	uint32_t maxTransformFeedbackBufferDataStride;
	VkBool32 transformFeedbackQueries;
	VkBool32 transformFeedbackStreamsLinesTriangles;
	VkBool32 transformFeedbackRasterizationStreamSelect;
	VkBool32 transformFeedbackDraw;
}
struct VkPhysicalDeviceUniformBufferStandardLayoutFeatures {
	VkStructureType sType;
	void* pNext;
	VkBool32 uniformBufferStandardLayout;
}
struct VkPhysicalDeviceVariablePointersFeatures {
	VkStructureType sType;
	void* pNext;
	VkBool32 variablePointersStorageBuffer;
	VkBool32 variablePointers;
}
struct VkPhysicalDeviceVertexAttributeDivisorFeaturesEXT {
	VkStructureType sType;
	void* pNext;
	VkBool32 vertexAttributeInstanceRateDivisor;
	VkBool32 vertexAttributeInstanceRateZeroDivisor;
}
struct VkPhysicalDeviceVertexAttributeDivisorPropertiesEXT {
	VkStructureType sType;
	void* pNext;
	uint32_t maxVertexAttribDivisor;
}
struct VkPhysicalDeviceVertexInputDynamicStateFeaturesEXT {
	VkStructureType sType;
	void* pNext;
	VkBool32 vertexInputDynamicState;
}
struct VkPhysicalDeviceVulkan11Features {
	VkStructureType sType;
	void* pNext;
	VkBool32 storageBuffer16BitAccess;
	VkBool32 uniformAndStorageBuffer16BitAccess;
	VkBool32 storagePushConstant16;
	VkBool32 storageInputOutput16;
	VkBool32 multiview;
	VkBool32 multiviewGeometryShader;
	VkBool32 multiviewTessellationShader;
	VkBool32 variablePointersStorageBuffer;
	VkBool32 variablePointers;
	VkBool32 protectedMemory;
	VkBool32 samplerYcbcrConversion;
	VkBool32 shaderDrawParameters;
}
struct VkPhysicalDeviceVulkan11Properties {
	VkStructureType sType;
	void* pNext;
	uint8_t[16U] deviceUUID;
	uint8_t[16U] driverUUID;
	uint8_t[8U] deviceLUID;
	uint32_t deviceNodeMask;
	VkBool32 deviceLUIDValid;
	uint32_t subgroupSize;
	VkShaderStageFlags subgroupSupportedStages;
	VkSubgroupFeatureFlags subgroupSupportedOperations;
	VkBool32 subgroupQuadOperationsInAllStages;
	VkPointClippingBehavior pointClippingBehavior;
	uint32_t maxMultiviewViewCount;
	uint32_t maxMultiviewInstanceIndex;
	VkBool32 protectedNoFault;
	uint32_t maxPerSetDescriptors;
	VkDeviceSize maxMemoryAllocationSize;
}
struct VkPhysicalDeviceVulkan12Features {
	VkStructureType sType;
	void* pNext;
	VkBool32 samplerMirrorClampToEdge;
	VkBool32 drawIndirectCount;
	VkBool32 storageBuffer8BitAccess;
	VkBool32 uniformAndStorageBuffer8BitAccess;
	VkBool32 storagePushConstant8;
	VkBool32 shaderBufferInt64Atomics;
	VkBool32 shaderSharedInt64Atomics;
	VkBool32 shaderFloat16;
	VkBool32 shaderInt8;
	VkBool32 descriptorIndexing;
	VkBool32 shaderInputAttachmentArrayDynamicIndexing;
	VkBool32 shaderUniformTexelBufferArrayDynamicIndexing;
	VkBool32 shaderStorageTexelBufferArrayDynamicIndexing;
	VkBool32 shaderUniformBufferArrayNonUniformIndexing;
	VkBool32 shaderSampledImageArrayNonUniformIndexing;
	VkBool32 shaderStorageBufferArrayNonUniformIndexing;
	VkBool32 shaderStorageImageArrayNonUniformIndexing;
	VkBool32 shaderInputAttachmentArrayNonUniformIndexing;
	VkBool32 shaderUniformTexelBufferArrayNonUniformIndexing;
	VkBool32 shaderStorageTexelBufferArrayNonUniformIndexing;
	VkBool32 descriptorBindingUniformBufferUpdateAfterBind;
	VkBool32 descriptorBindingSampledImageUpdateAfterBind;
	VkBool32 descriptorBindingStorageImageUpdateAfterBind;
	VkBool32 descriptorBindingStorageBufferUpdateAfterBind;
	VkBool32 descriptorBindingUniformTexelBufferUpdateAfterBind;
	VkBool32 descriptorBindingStorageTexelBufferUpdateAfterBind;
	VkBool32 descriptorBindingUpdateUnusedWhilePending;
	VkBool32 descriptorBindingPartiallyBound;
	VkBool32 descriptorBindingVariableDescriptorCount;
	VkBool32 runtimeDescriptorArray;
	VkBool32 samplerFilterMinmax;
	VkBool32 scalarBlockLayout;
	VkBool32 imagelessFramebuffer;
	VkBool32 uniformBufferStandardLayout;
	VkBool32 shaderSubgroupExtendedTypes;
	VkBool32 separateDepthStencilLayouts;
	VkBool32 hostQueryReset;
	VkBool32 timelineSemaphore;
	VkBool32 bufferDeviceAddress;
	VkBool32 bufferDeviceAddressCaptureReplay;
	VkBool32 bufferDeviceAddressMultiDevice;
	VkBool32 vulkanMemoryModel;
	VkBool32 vulkanMemoryModelDeviceScope;
	VkBool32 vulkanMemoryModelAvailabilityVisibilityChains;
	VkBool32 shaderOutputViewportIndex;
	VkBool32 shaderOutputLayer;
	VkBool32 subgroupBroadcastDynamicId;
}
struct VkPhysicalDeviceVulkan12Properties {
	VkStructureType sType;
	void* pNext;
	VkDriverId driverID;
	char[256U] driverName;
	char[256U] driverInfo;
	VkConformanceVersion conformanceVersion;
	VkShaderFloatControlsIndependence denormBehaviorIndependence;
	VkShaderFloatControlsIndependence roundingModeIndependence;
	VkBool32 shaderSignedZeroInfNanPreserveFloat16;
	VkBool32 shaderSignedZeroInfNanPreserveFloat32;
	VkBool32 shaderSignedZeroInfNanPreserveFloat64;
	VkBool32 shaderDenormPreserveFloat16;
	VkBool32 shaderDenormPreserveFloat32;
	VkBool32 shaderDenormPreserveFloat64;
	VkBool32 shaderDenormFlushToZeroFloat16;
	VkBool32 shaderDenormFlushToZeroFloat32;
	VkBool32 shaderDenormFlushToZeroFloat64;
	VkBool32 shaderRoundingModeRTEFloat16;
	VkBool32 shaderRoundingModeRTEFloat32;
	VkBool32 shaderRoundingModeRTEFloat64;
	VkBool32 shaderRoundingModeRTZFloat16;
	VkBool32 shaderRoundingModeRTZFloat32;
	VkBool32 shaderRoundingModeRTZFloat64;
	uint32_t maxUpdateAfterBindDescriptorsInAllPools;
	VkBool32 shaderUniformBufferArrayNonUniformIndexingNative;
	VkBool32 shaderSampledImageArrayNonUniformIndexingNative;
	VkBool32 shaderStorageBufferArrayNonUniformIndexingNative;
	VkBool32 shaderStorageImageArrayNonUniformIndexingNative;
	VkBool32 shaderInputAttachmentArrayNonUniformIndexingNative;
	VkBool32 robustBufferAccessUpdateAfterBind;
	VkBool32 quadDivergentImplicitLod;
	uint32_t maxPerStageDescriptorUpdateAfterBindSamplers;
	uint32_t maxPerStageDescriptorUpdateAfterBindUniformBuffers;
	uint32_t maxPerStageDescriptorUpdateAfterBindStorageBuffers;
	uint32_t maxPerStageDescriptorUpdateAfterBindSampledImages;
	uint32_t maxPerStageDescriptorUpdateAfterBindStorageImages;
	uint32_t maxPerStageDescriptorUpdateAfterBindInputAttachments;
	uint32_t maxPerStageUpdateAfterBindResources;
	uint32_t maxDescriptorSetUpdateAfterBindSamplers;
	uint32_t maxDescriptorSetUpdateAfterBindUniformBuffers;
	uint32_t maxDescriptorSetUpdateAfterBindUniformBuffersDynamic;
	uint32_t maxDescriptorSetUpdateAfterBindStorageBuffers;
	uint32_t maxDescriptorSetUpdateAfterBindStorageBuffersDynamic;
	uint32_t maxDescriptorSetUpdateAfterBindSampledImages;
	uint32_t maxDescriptorSetUpdateAfterBindStorageImages;
	uint32_t maxDescriptorSetUpdateAfterBindInputAttachments;
	VkResolveModeFlags supportedDepthResolveModes;
	VkResolveModeFlags supportedStencilResolveModes;
	VkBool32 independentResolveNone;
	VkBool32 independentResolve;
	VkBool32 filterMinmaxSingleComponentFormats;
	VkBool32 filterMinmaxImageComponentMapping;
	uint64_t maxTimelineSemaphoreValueDifference;
	VkSampleCountFlags framebufferIntegerColorSampleCounts;
}
struct VkPhysicalDeviceVulkan13Features {
	VkStructureType sType;
	void* pNext;
	VkBool32 robustImageAccess;
	VkBool32 inlineUniformBlock;
	VkBool32 descriptorBindingInlineUniformBlockUpdateAfterBind;
	VkBool32 pipelineCreationCacheControl;
	VkBool32 privateData;
	VkBool32 shaderDemoteToHelperInvocation;
	VkBool32 shaderTerminateInvocation;
	VkBool32 subgroupSizeControl;
	VkBool32 computeFullSubgroups;
	VkBool32 synchronization2;
	VkBool32 textureCompressionASTC_HDR;
	VkBool32 shaderZeroInitializeWorkgroupMemory;
	VkBool32 dynamicRendering;
	VkBool32 shaderIntegerDotProduct;
	VkBool32 maintenance4;
}
struct VkPhysicalDeviceVulkan13Properties {
	VkStructureType sType;
	void* pNext;
	uint32_t minSubgroupSize;
	uint32_t maxSubgroupSize;
	uint32_t maxComputeWorkgroupSubgroups;
	VkShaderStageFlags requiredSubgroupSizeStages;
	uint32_t maxInlineUniformBlockSize;
	uint32_t maxPerStageDescriptorInlineUniformBlocks;
	uint32_t maxPerStageDescriptorUpdateAfterBindInlineUniformBlocks;
	uint32_t maxDescriptorSetInlineUniformBlocks;
	uint32_t maxDescriptorSetUpdateAfterBindInlineUniformBlocks;
	uint32_t maxInlineUniformTotalSize;
	VkBool32 integerDotProduct8BitUnsignedAccelerated;
	VkBool32 integerDotProduct8BitSignedAccelerated;
	VkBool32 integerDotProduct8BitMixedSignednessAccelerated;
	VkBool32 integerDotProduct4x8BitPackedUnsignedAccelerated;
	VkBool32 integerDotProduct4x8BitPackedSignedAccelerated;
	VkBool32 integerDotProduct4x8BitPackedMixedSignednessAccelerated;
	VkBool32 integerDotProduct16BitUnsignedAccelerated;
	VkBool32 integerDotProduct16BitSignedAccelerated;
	VkBool32 integerDotProduct16BitMixedSignednessAccelerated;
	VkBool32 integerDotProduct32BitUnsignedAccelerated;
	VkBool32 integerDotProduct32BitSignedAccelerated;
	VkBool32 integerDotProduct32BitMixedSignednessAccelerated;
	VkBool32 integerDotProduct64BitUnsignedAccelerated;
	VkBool32 integerDotProduct64BitSignedAccelerated;
	VkBool32 integerDotProduct64BitMixedSignednessAccelerated;
	VkBool32 integerDotProductAccumulatingSaturating8BitUnsignedAccelerated;
	VkBool32 integerDotProductAccumulatingSaturating8BitSignedAccelerated;
	VkBool32 integerDotProductAccumulatingSaturating8BitMixedSignednessAccelerated;
	VkBool32 integerDotProductAccumulatingSaturating4x8BitPackedUnsignedAccelerated;
	VkBool32 integerDotProductAccumulatingSaturating4x8BitPackedSignedAccelerated;
	VkBool32 integerDotProductAccumulatingSaturating4x8BitPackedMixedSignednessAccelerated;
	VkBool32 integerDotProductAccumulatingSaturating16BitUnsignedAccelerated;
	VkBool32 integerDotProductAccumulatingSaturating16BitSignedAccelerated;
	VkBool32 integerDotProductAccumulatingSaturating16BitMixedSignednessAccelerated;
	VkBool32 integerDotProductAccumulatingSaturating32BitUnsignedAccelerated;
	VkBool32 integerDotProductAccumulatingSaturating32BitSignedAccelerated;
	VkBool32 integerDotProductAccumulatingSaturating32BitMixedSignednessAccelerated;
	VkBool32 integerDotProductAccumulatingSaturating64BitUnsignedAccelerated;
	VkBool32 integerDotProductAccumulatingSaturating64BitSignedAccelerated;
	VkBool32 integerDotProductAccumulatingSaturating64BitMixedSignednessAccelerated;
	VkDeviceSize storageTexelBufferOffsetAlignmentBytes;
	VkBool32 storageTexelBufferOffsetSingleTexelAlignment;
	VkDeviceSize uniformTexelBufferOffsetAlignmentBytes;
	VkBool32 uniformTexelBufferOffsetSingleTexelAlignment;
	VkDeviceSize maxBufferSize;
}
struct VkPhysicalDeviceVulkanMemoryModelFeatures {
	VkStructureType sType;
	void* pNext;
	VkBool32 vulkanMemoryModel;
	VkBool32 vulkanMemoryModelDeviceScope;
	VkBool32 vulkanMemoryModelAvailabilityVisibilityChains;
}
struct VkPhysicalDeviceWorkgroupMemoryExplicitLayoutFeaturesKHR {
	VkStructureType sType;
	void* pNext;
	VkBool32 workgroupMemoryExplicitLayout;
	VkBool32 workgroupMemoryExplicitLayoutScalarBlockLayout;
	VkBool32 workgroupMemoryExplicitLayout8BitAccess;
	VkBool32 workgroupMemoryExplicitLayout16BitAccess;
}
struct VkPhysicalDeviceYcbcr2Plane444FormatsFeaturesEXT {
	VkStructureType sType;
	void* pNext;
	VkBool32 ycbcr2plane444Formats;
}
struct VkPhysicalDeviceYcbcrImageArraysFeaturesEXT {
	VkStructureType sType;
	void* pNext;
	VkBool32 ycbcrImageArrays;
}
struct VkPhysicalDeviceZeroInitializeWorkgroupMemoryFeatures {
	VkStructureType sType;
	void* pNext;
	VkBool32 shaderZeroInitializeWorkgroupMemory;
}
struct VkPhysicalDevice_T {
}
struct VkPipelineCacheCreateInfo {
	VkStructureType sType;
	void* pNext;
	VkPipelineCacheCreateFlags flags;
	size_t initialDataSize;
	void* pInitialData;
}
struct VkPipelineCacheHeaderVersionOne {
	uint32_t headerSize;
	VkPipelineCacheHeaderVersion headerVersion;
	uint32_t vendorID;
	uint32_t deviceID;
	uint8_t[16U] pipelineCacheUUID;
}
struct VkPipelineCache_T {
}
struct VkPipelineColorBlendAdvancedStateCreateInfoEXT {
	VkStructureType sType;
	void* pNext;
	VkBool32 srcPremultiplied;
	VkBool32 dstPremultiplied;
	VkBlendOverlapEXT blendOverlap;
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
struct VkPipelineColorWriteCreateInfoEXT {
	VkStructureType sType;
	void* pNext;
	uint32_t attachmentCount;
	VkBool32* pColorWriteEnables;
}
struct VkPipelineCompilerControlCreateInfoAMD {
	VkStructureType sType;
	void* pNext;
	VkPipelineCompilerControlFlagsAMD compilerControlFlags;
}
struct VkPipelineCoverageModulationStateCreateInfoNV {
	VkStructureType sType;
	void* pNext;
	VkPipelineCoverageModulationStateCreateFlagsNV flags;
	VkCoverageModulationModeNV coverageModulationMode;
	VkBool32 coverageModulationTableEnable;
	uint32_t coverageModulationTableCount;
	float* pCoverageModulationTable;
}
struct VkPipelineCoverageReductionStateCreateInfoNV {
	VkStructureType sType;
	void* pNext;
	VkPipelineCoverageReductionStateCreateFlagsNV flags;
	VkCoverageReductionModeNV coverageReductionMode;
}
struct VkPipelineCoverageToColorStateCreateInfoNV {
	VkStructureType sType;
	void* pNext;
	VkPipelineCoverageToColorStateCreateFlagsNV flags;
	VkBool32 coverageToColorEnable;
	uint32_t coverageToColorLocation;
}
struct VkPipelineCreationFeedback {
	VkPipelineCreationFeedbackFlags flags;
	uint64_t duration;
}
struct VkPipelineCreationFeedbackCreateInfo {
	VkStructureType sType;
	void* pNext;
	VkPipelineCreationFeedback* pPipelineCreationFeedback;
	uint32_t pipelineStageCreationFeedbackCount;
	VkPipelineCreationFeedback* pPipelineStageCreationFeedbacks;
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
struct VkPipelineDiscardRectangleStateCreateInfoEXT {
	VkStructureType sType;
	void* pNext;
	VkPipelineDiscardRectangleStateCreateFlagsEXT flags;
	VkDiscardRectangleModeEXT discardRectangleMode;
	uint32_t discardRectangleCount;
	VkRect2D* pDiscardRectangles;
}
struct VkPipelineDynamicStateCreateInfo {
	VkStructureType sType;
	void* pNext;
	VkPipelineDynamicStateCreateFlags flags;
	uint32_t dynamicStateCount;
	VkDynamicState* pDynamicStates;
}
struct VkPipelineExecutableInfoKHR {
	VkStructureType sType;
	void* pNext;
	VkPipeline pipeline;
	uint32_t executableIndex;
}
struct VkPipelineExecutableInternalRepresentationKHR {
	VkStructureType sType;
	void* pNext;
	char[256U] name;
	char[256U] description;
	VkBool32 isText;
	size_t dataSize;
	void* pData;
}
struct VkPipelineExecutablePropertiesKHR {
	VkStructureType sType;
	void* pNext;
	VkShaderStageFlags stages;
	char[256U] name;
	char[256U] description;
	uint32_t subgroupSize;
}
struct VkPipelineExecutableStatisticKHR {
	VkStructureType sType;
	void* pNext;
	char[256U] name;
	char[256U] description;
	VkPipelineExecutableStatisticFormatKHR format;
	VkPipelineExecutableStatisticValueKHR value;
}
struct VkPipelineFragmentShadingRateEnumStateCreateInfoNV {
	VkStructureType sType;
	void* pNext;
	VkFragmentShadingRateTypeNV shadingRateType;
	VkFragmentShadingRateNV shadingRate;
	VkFragmentShadingRateCombinerOpKHR[2] combinerOps;
}
struct VkPipelineFragmentShadingRateStateCreateInfoKHR {
	VkStructureType sType;
	void* pNext;
	VkExtent2D fragmentSize;
	VkFragmentShadingRateCombinerOpKHR[2] combinerOps;
}
struct VkPipelineInfoKHR {
	VkStructureType sType;
	void* pNext;
	VkPipeline pipeline;
}
struct VkPipelineInputAssemblyStateCreateInfo {
	VkStructureType sType;
	void* pNext;
	VkPipelineInputAssemblyStateCreateFlags flags;
	VkPrimitiveTopology topology;
	VkBool32 primitiveRestartEnable;
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
struct VkPipelineLayout_T {
}
struct VkPipelineLibraryCreateInfoKHR {
	VkStructureType sType;
	void* pNext;
	uint32_t libraryCount;
	VkPipeline* pLibraries;
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
struct VkPipelineRasterizationConservativeStateCreateInfoEXT {
	VkStructureType sType;
	void* pNext;
	VkPipelineRasterizationConservativeStateCreateFlagsEXT flags;
	VkConservativeRasterizationModeEXT conservativeRasterizationMode;
	float extraPrimitiveOverestimationSize;
}
struct VkPipelineRasterizationDepthClipStateCreateInfoEXT {
	VkStructureType sType;
	void* pNext;
	VkPipelineRasterizationDepthClipStateCreateFlagsEXT flags;
	VkBool32 depthClipEnable;
}
struct VkPipelineRasterizationLineStateCreateInfoEXT {
	VkStructureType sType;
	void* pNext;
	VkLineRasterizationModeEXT lineRasterizationMode;
	VkBool32 stippledLineEnable;
	uint32_t lineStippleFactor;
	uint16_t lineStipplePattern;
}
struct VkPipelineRasterizationProvokingVertexStateCreateInfoEXT {
	VkStructureType sType;
	void* pNext;
	VkProvokingVertexModeEXT provokingVertexMode;
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
struct VkPipelineRasterizationStateRasterizationOrderAMD {
	VkStructureType sType;
	void* pNext;
	VkRasterizationOrderAMD rasterizationOrder;
}
struct VkPipelineRasterizationStateStreamCreateInfoEXT {
	VkStructureType sType;
	void* pNext;
	VkPipelineRasterizationStateStreamCreateFlagsEXT flags;
	uint32_t rasterizationStream;
}
struct VkPipelineRenderingCreateInfo {
	VkStructureType sType;
	void* pNext;
	uint32_t viewMask;
	uint32_t colorAttachmentCount;
	VkFormat* pColorAttachmentFormats;
	VkFormat depthAttachmentFormat;
	VkFormat stencilAttachmentFormat;
}
struct VkPipelineRepresentativeFragmentTestStateCreateInfoNV {
	VkStructureType sType;
	void* pNext;
	VkBool32 representativeFragmentTestEnable;
}
struct VkPipelineSampleLocationsStateCreateInfoEXT {
	VkStructureType sType;
	void* pNext;
	VkBool32 sampleLocationsEnable;
	VkSampleLocationsInfoEXT sampleLocationsInfo;
}
struct VkPipelineShaderStageCreateInfo {
	VkStructureType sType;
	void* pNext;
	VkPipelineShaderStageCreateFlags flags;
	VkShaderStageFlagBits stage;
	VkShaderModule module_;
	immutable(char)* pName;
	VkSpecializationInfo* pSpecializationInfo;
}
struct VkPipelineShaderStageRequiredSubgroupSizeCreateInfo {
	VkStructureType sType;
	void* pNext;
	uint32_t requiredSubgroupSize;
}
struct VkPipelineTessellationDomainOriginStateCreateInfo {
	VkStructureType sType;
	void* pNext;
	VkTessellationDomainOrigin domainOrigin;
}
struct VkPipelineTessellationStateCreateInfo {
	VkStructureType sType;
	void* pNext;
	VkPipelineTessellationStateCreateFlags flags;
	uint32_t patchControlPoints;
}
struct VkPipelineVertexInputDivisorStateCreateInfoEXT {
	VkStructureType sType;
	void* pNext;
	uint32_t vertexBindingDivisorCount;
	VkVertexInputBindingDivisorDescriptionEXT* pVertexBindingDivisors;
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
struct VkPipelineViewportCoarseSampleOrderStateCreateInfoNV {
	VkStructureType sType;
	void* pNext;
	VkCoarseSampleOrderTypeNV sampleOrderType;
	uint32_t customSampleOrderCount;
	VkCoarseSampleOrderCustomNV* pCustomSampleOrders;
}
struct VkPipelineViewportDepthClipControlCreateInfoEXT {
	VkStructureType sType;
	void* pNext;
	VkBool32 negativeOneToOne;
}
struct VkPipelineViewportExclusiveScissorStateCreateInfoNV {
	VkStructureType sType;
	void* pNext;
	uint32_t exclusiveScissorCount;
	VkRect2D* pExclusiveScissors;
}
struct VkPipelineViewportShadingRateImageStateCreateInfoNV {
	VkStructureType sType;
	void* pNext;
	VkBool32 shadingRateImageEnable;
	uint32_t viewportCount;
	VkShadingRatePaletteNV* pShadingRatePalettes;
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
struct VkPipelineViewportSwizzleStateCreateInfoNV {
	VkStructureType sType;
	void* pNext;
	VkPipelineViewportSwizzleStateCreateFlagsNV flags;
	uint32_t viewportCount;
	VkViewportSwizzleNV* pViewportSwizzles;
}
struct VkPipelineViewportWScalingStateCreateInfoNV {
	VkStructureType sType;
	void* pNext;
	VkBool32 viewportWScalingEnable;
	uint32_t viewportCount;
	VkViewportWScalingNV* pViewportWScalings;
}
struct VkPipeline_T {
}
struct VkPresentIdKHR {
	VkStructureType sType;
	void* pNext;
	uint32_t swapchainCount;
	uint64_t* pPresentIds;
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
struct VkPresentRegionKHR {
	uint32_t rectangleCount;
	VkRectLayerKHR* pRectangles;
}
struct VkPresentRegionsKHR {
	VkStructureType sType;
	void* pNext;
	uint32_t swapchainCount;
	VkPresentRegionKHR* pRegions;
}
struct VkPresentTimeGOOGLE {
	uint32_t presentID;
	uint64_t desiredPresentTime;
}
struct VkPresentTimesInfoGOOGLE {
	VkStructureType sType;
	void* pNext;
	uint32_t swapchainCount;
	VkPresentTimeGOOGLE* pTimes;
}
struct VkPrivateDataSlotCreateInfo {
	VkStructureType sType;
	void* pNext;
	VkPrivateDataSlotCreateFlags flags;
}
struct VkPrivateDataSlot_T {
}
struct VkProtectedSubmitInfo {
	VkStructureType sType;
	void* pNext;
	VkBool32 protectedSubmit;
}
struct VkPushConstantRange {
	VkShaderStageFlags stageFlags;
	uint32_t offset;
	uint32_t size;
}
struct VkQueryPoolCreateInfo {
	VkStructureType sType;
	void* pNext;
	VkQueryPoolCreateFlags flags;
	VkQueryType queryType;
	uint32_t queryCount;
	VkQueryPipelineStatisticFlags pipelineStatistics;
}
struct VkQueryPoolPerformanceCreateInfoKHR {
	VkStructureType sType;
	void* pNext;
	uint32_t queueFamilyIndex;
	uint32_t counterIndexCount;
	uint32_t* pCounterIndices;
}
struct VkQueryPoolPerformanceQueryCreateInfoINTEL {
	VkStructureType sType;
	void* pNext;
	VkQueryPoolSamplingModeINTEL performanceCountersSampling;
}
struct VkQueryPool_T {
}
struct VkQueueFamilyCheckpointProperties2NV {
	VkStructureType sType;
	void* pNext;
	VkPipelineStageFlags2 checkpointExecutionStageMask;
}
struct VkQueueFamilyCheckpointPropertiesNV {
	VkStructureType sType;
	void* pNext;
	VkPipelineStageFlags checkpointExecutionStageMask;
}
struct VkQueueFamilyGlobalPriorityPropertiesKHR {
	VkStructureType sType;
	void* pNext;
	uint32_t priorityCount;
	VkQueueGlobalPriorityKHR[16U] priorities;
}
struct VkQueueFamilyProperties {
	VkQueueFlags queueFlags;
	uint32_t queueCount;
	uint32_t timestampValidBits;
	VkExtent3D minImageTransferGranularity;
}
struct VkQueueFamilyProperties2 {
	VkStructureType sType;
	void* pNext;
	VkQueueFamilyProperties queueFamilyProperties;
}
struct VkQueue_T {
}
struct VkRayTracingPipelineCreateInfoKHR {
	VkStructureType sType;
	void* pNext;
	VkPipelineCreateFlags flags;
	uint32_t stageCount;
	VkPipelineShaderStageCreateInfo* pStages;
	uint32_t groupCount;
	VkRayTracingShaderGroupCreateInfoKHR* pGroups;
	uint32_t maxPipelineRayRecursionDepth;
	VkPipelineLibraryCreateInfoKHR* pLibraryInfo;
	VkRayTracingPipelineInterfaceCreateInfoKHR* pLibraryInterface;
	VkPipelineDynamicStateCreateInfo* pDynamicState;
	VkPipelineLayout layout;
	VkPipeline basePipelineHandle;
	int32_t basePipelineIndex;
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
struct VkRayTracingPipelineInterfaceCreateInfoKHR {
	VkStructureType sType;
	void* pNext;
	uint32_t maxPipelineRayPayloadSize;
	uint32_t maxPipelineRayHitAttributeSize;
}
struct VkRayTracingShaderGroupCreateInfoKHR {
	VkStructureType sType;
	void* pNext;
	VkRayTracingShaderGroupTypeKHR type;
	uint32_t generalShader;
	uint32_t closestHitShader;
	uint32_t anyHitShader;
	uint32_t intersectionShader;
	void* pShaderGroupCaptureReplayHandle;
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
struct VkRect2D {
	VkOffset2D offset;
	VkExtent2D extent;
}
struct VkRectLayerKHR {
	VkOffset2D offset;
	VkExtent2D extent;
	uint32_t layer;
}
struct VkRefreshCycleDurationGOOGLE {
	uint64_t refreshDuration;
}
struct VkRenderPassAttachmentBeginInfo {
	VkStructureType sType;
	void* pNext;
	uint32_t attachmentCount;
	VkImageView* pAttachments;
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
struct VkRenderPassFragmentDensityMapCreateInfoEXT {
	VkStructureType sType;
	void* pNext;
	VkAttachmentReference fragmentDensityMapAttachment;
}
struct VkRenderPassInputAttachmentAspectCreateInfo {
	VkStructureType sType;
	void* pNext;
	uint32_t aspectReferenceCount;
	VkInputAttachmentAspectReference* pAspectReferences;
}
struct VkRenderPassMultiviewCreateInfo {
	VkStructureType sType;
	void* pNext;
	uint32_t subpassCount;
	uint32_t* pViewMasks;
	uint32_t dependencyCount;
	int32_t* pViewOffsets;
	uint32_t correlationMaskCount;
	uint32_t* pCorrelationMasks;
}
struct VkRenderPassSampleLocationsBeginInfoEXT {
	VkStructureType sType;
	void* pNext;
	uint32_t attachmentInitialSampleLocationsCount;
	VkAttachmentSampleLocationsEXT* pAttachmentInitialSampleLocations;
	uint32_t postSubpassSampleLocationsCount;
	VkSubpassSampleLocationsEXT* pPostSubpassSampleLocations;
}
struct VkRenderPassTransformBeginInfoQCOM {
	VkStructureType sType;
	void* pNext;
	VkSurfaceTransformFlagBitsKHR transform;
}
struct VkRenderPass_T {
}
struct VkRenderingAttachmentInfo {
	VkStructureType sType;
	void* pNext;
	VkImageView imageView;
	VkImageLayout imageLayout;
	VkResolveModeFlagBits resolveMode;
	VkImageView resolveImageView;
	VkImageLayout resolveImageLayout;
	VkAttachmentLoadOp loadOp;
	VkAttachmentStoreOp storeOp;
	VkClearValue clearValue;
}
struct VkRenderingFragmentDensityMapAttachmentInfoEXT {
	VkStructureType sType;
	void* pNext;
	VkImageView imageView;
	VkImageLayout imageLayout;
}
struct VkRenderingFragmentShadingRateAttachmentInfoKHR {
	VkStructureType sType;
	void* pNext;
	VkImageView imageView;
	VkImageLayout imageLayout;
	VkExtent2D shadingRateAttachmentTexelSize;
}
struct VkRenderingInfo {
	VkStructureType sType;
	void* pNext;
	VkRenderingFlags flags;
	VkRect2D renderArea;
	uint32_t layerCount;
	uint32_t viewMask;
	uint32_t colorAttachmentCount;
	VkRenderingAttachmentInfo* pColorAttachments;
	VkRenderingAttachmentInfo* pDepthAttachment;
	VkRenderingAttachmentInfo* pStencilAttachment;
}
struct VkResolveImageInfo2 {
	VkStructureType sType;
	void* pNext;
	VkImage srcImage;
	VkImageLayout srcImageLayout;
	VkImage dstImage;
	VkImageLayout dstImageLayout;
	uint32_t regionCount;
	VkImageResolve2* pRegions;
}
struct VkSRTDataNV {
	float sx;
	float a;
	float b;
	float pvx;
	float sy;
	float c;
	float pvy;
	float sz;
	float pvz;
	float qx;
	float qy;
	float qz;
	float qw;
	float tx;
	float ty;
	float tz;
}
struct VkSampleLocationEXT {
	float x;
	float y;
}
struct VkSampleLocationsInfoEXT {
	VkStructureType sType;
	void* pNext;
	VkSampleCountFlagBits sampleLocationsPerPixel;
	VkExtent2D sampleLocationGridSize;
	uint32_t sampleLocationsCount;
	VkSampleLocationEXT* pSampleLocations;
}
struct VkSamplerBorderColorComponentMappingCreateInfoEXT {
	VkStructureType sType;
	void* pNext;
	VkComponentMapping components;
	VkBool32 srgb;
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
struct VkSamplerCustomBorderColorCreateInfoEXT {
	VkStructureType sType;
	void* pNext;
	VkClearColorValue customBorderColor;
	VkFormat format;
}
struct VkSamplerReductionModeCreateInfo {
	VkStructureType sType;
	void* pNext;
	VkSamplerReductionMode reductionMode;
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
struct VkSamplerYcbcrConversionImageFormatProperties {
	VkStructureType sType;
	void* pNext;
	uint32_t combinedImageSamplerDescriptorCount;
}
struct VkSamplerYcbcrConversionInfo {
	VkStructureType sType;
	void* pNext;
	VkSamplerYcbcrConversion conversion;
}
struct VkSamplerYcbcrConversion_T {
}
struct VkSampler_T {
}
struct VkSemaphoreCreateInfo {
	VkStructureType sType;
	void* pNext;
	VkSemaphoreCreateFlags flags;
}
struct VkSemaphoreGetFdInfoKHR {
	VkStructureType sType;
	void* pNext;
	VkSemaphore semaphore;
	VkExternalSemaphoreHandleTypeFlagBits handleType;
}
struct VkSemaphoreGetWin32HandleInfoKHR {
	VkStructureType sType;
	void* pNext;
	VkSemaphore semaphore;
	VkExternalSemaphoreHandleTypeFlagBits handleType;
}
struct VkSemaphoreSignalInfo {
	VkStructureType sType;
	void* pNext;
	VkSemaphore semaphore;
	uint64_t value;
}
struct VkSemaphoreSubmitInfo {
	VkStructureType sType;
	void* pNext;
	VkSemaphore semaphore;
	uint64_t value;
	VkPipelineStageFlags2 stageMask;
	uint32_t deviceIndex;
}
struct VkSemaphoreTypeCreateInfo {
	VkStructureType sType;
	void* pNext;
	VkSemaphoreType semaphoreType;
	uint64_t initialValue;
}
struct VkSemaphoreWaitInfo {
	VkStructureType sType;
	void* pNext;
	VkSemaphoreWaitFlags flags;
	uint32_t semaphoreCount;
	VkSemaphore* pSemaphores;
	uint64_t* pValues;
}
struct VkSemaphore_T {
}
struct VkSetStateFlagsIndirectCommandNV {
	uint32_t data;
}
struct VkShaderModuleCreateInfo {
	VkStructureType sType;
	void* pNext;
	VkShaderModuleCreateFlags flags;
	size_t codeSize;
	uint32_t* pCode;
}
struct VkShaderModuleValidationCacheCreateInfoEXT {
	VkStructureType sType;
	void* pNext;
	VkValidationCacheEXT validationCache;
}
struct VkShaderModule_T {
}
struct VkShaderResourceUsageAMD {
	uint32_t numUsedVgprs;
	uint32_t numUsedSgprs;
	uint32_t ldsSizePerLocalWorkGroup;
	size_t ldsUsageSizeInBytes;
	size_t scratchMemUsageInBytes;
}
struct VkShaderStatisticsInfoAMD {
	VkShaderStageFlags shaderStageMask;
	VkShaderResourceUsageAMD resourceUsage;
	uint32_t numPhysicalVgprs;
	uint32_t numPhysicalSgprs;
	uint32_t numAvailableVgprs;
	uint32_t numAvailableSgprs;
	uint32_t[3] computeWorkGroupSize;
}
struct VkShadingRatePaletteNV {
	uint32_t shadingRatePaletteEntryCount;
	VkShadingRatePaletteEntryNV* pShadingRatePaletteEntries;
}
struct VkSharedPresentSurfaceCapabilitiesKHR {
	VkStructureType sType;
	void* pNext;
	VkImageUsageFlags sharedPresentSupportedUsageFlags;
}
struct VkSparseBufferMemoryBindInfo {
	VkBuffer buffer;
	uint32_t bindCount;
	VkSparseMemoryBind* pBinds;
}
struct VkSparseImageFormatProperties {
	VkImageAspectFlags aspectMask;
	VkExtent3D imageGranularity;
	VkSparseImageFormatFlags flags;
}
struct VkSparseImageFormatProperties2 {
	VkStructureType sType;
	void* pNext;
	VkSparseImageFormatProperties properties;
}
struct VkSparseImageMemoryBind {
	VkImageSubresource subresource;
	VkOffset3D offset;
	VkExtent3D extent;
	VkDeviceMemory memory;
	VkDeviceSize memoryOffset;
	VkSparseMemoryBindFlags flags;
}
struct VkSparseImageMemoryBindInfo {
	VkImage image;
	uint32_t bindCount;
	VkSparseImageMemoryBind* pBinds;
}
struct VkSparseImageMemoryRequirements {
	VkSparseImageFormatProperties formatProperties;
	uint32_t imageMipTailFirstLod;
	VkDeviceSize imageMipTailSize;
	VkDeviceSize imageMipTailOffset;
	VkDeviceSize imageMipTailStride;
}
struct VkSparseImageMemoryRequirements2 {
	VkStructureType sType;
	void* pNext;
	VkSparseImageMemoryRequirements memoryRequirements;
}
struct VkSparseImageOpaqueMemoryBindInfo {
	VkImage image;
	uint32_t bindCount;
	VkSparseMemoryBind* pBinds;
}
struct VkSparseMemoryBind {
	VkDeviceSize resourceOffset;
	VkDeviceSize size;
	VkDeviceMemory memory;
	VkDeviceSize memoryOffset;
	VkSparseMemoryBindFlags flags;
}
struct VkSpecializationInfo {
	uint32_t mapEntryCount;
	VkSpecializationMapEntry* pMapEntries;
	size_t dataSize;
	void* pData;
}
struct VkSpecializationMapEntry {
	uint32_t constantID;
	uint32_t offset;
	size_t size;
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
struct VkStridedDeviceAddressRegionKHR {
	VkDeviceAddress deviceAddress;
	VkDeviceSize stride;
	VkDeviceSize size;
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
struct VkSubmitInfo2 {
	VkStructureType sType;
	void* pNext;
	VkSubmitFlags flags;
	uint32_t waitSemaphoreInfoCount;
	VkSemaphoreSubmitInfo* pWaitSemaphoreInfos;
	uint32_t commandBufferInfoCount;
	VkCommandBufferSubmitInfo* pCommandBufferInfos;
	uint32_t signalSemaphoreInfoCount;
	VkSemaphoreSubmitInfo* pSignalSemaphoreInfos;
}
struct VkSubpassBeginInfo {
	VkStructureType sType;
	void* pNext;
	VkSubpassContents contents;
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
struct VkSubpassDescriptionDepthStencilResolve {
	VkStructureType sType;
	void* pNext;
	VkResolveModeFlagBits depthResolveMode;
	VkResolveModeFlagBits stencilResolveMode;
	VkAttachmentReference2* pDepthStencilResolveAttachment;
}
struct VkSubpassEndInfo {
	VkStructureType sType;
	void* pNext;
}
struct VkSubpassFragmentDensityMapOffsetEndInfoQCOM {
	VkStructureType sType;
	void* pNext;
	uint32_t fragmentDensityOffsetCount;
	VkOffset2D* pFragmentDensityOffsets;
}
struct VkSubpassSampleLocationsEXT {
	uint32_t subpassIndex;
	VkSampleLocationsInfoEXT sampleLocationsInfo;
}
struct VkSubpassShadingPipelineCreateInfoHUAWEI {
	VkStructureType sType;
	void* pNext;
	VkRenderPass renderPass;
	uint32_t subpass;
}
struct VkSubresourceLayout {
	VkDeviceSize offset;
	VkDeviceSize size;
	VkDeviceSize rowPitch;
	VkDeviceSize arrayPitch;
	VkDeviceSize depthPitch;
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
struct VkSurfaceCapabilities2KHR {
	VkStructureType sType;
	void* pNext;
	VkSurfaceCapabilitiesKHR surfaceCapabilities;
}
struct VkSurfaceCapabilitiesFullScreenExclusiveEXT {
	VkStructureType sType;
	void* pNext;
	VkBool32 fullScreenExclusiveSupported;
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
struct VkSurfaceFormat2KHR {
	VkStructureType sType;
	void* pNext;
	VkSurfaceFormatKHR surfaceFormat;
}
struct VkSurfaceFormatKHR {
	VkFormat format;
	VkColorSpaceKHR colorSpace;
}
struct VkSurfaceFullScreenExclusiveInfoEXT {
	VkStructureType sType;
	void* pNext;
	VkFullScreenExclusiveEXT fullScreenExclusive;
}
struct VkSurfaceFullScreenExclusiveWin32InfoEXT {
	VkStructureType sType;
	void* pNext;
	HMONITOR hmonitor;
}
struct VkSurfaceKHR_T {
}
struct VkSurfaceProtectedCapabilitiesKHR {
	VkStructureType sType;
	void* pNext;
	VkBool32 supportsProtected;
}
struct VkSwapchainCounterCreateInfoEXT {
	VkStructureType sType;
	void* pNext;
	VkSurfaceCounterFlagsEXT surfaceCounters;
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
struct VkSwapchainDisplayNativeHdrCreateInfoAMD {
	VkStructureType sType;
	void* pNext;
	VkBool32 localDimmingEnable;
}
struct VkSwapchainKHR_T {
}
struct VkTextureLODGatherFormatPropertiesAMD {
	VkStructureType sType;
	void* pNext;
	VkBool32 supportsTextureGatherLODBiasAMD;
}
struct VkTimelineSemaphoreSubmitInfo {
	VkStructureType sType;
	void* pNext;
	uint32_t waitSemaphoreValueCount;
	uint64_t* pWaitSemaphoreValues;
	uint32_t signalSemaphoreValueCount;
	uint64_t* pSignalSemaphoreValues;
}
struct VkTraceRaysIndirectCommandKHR {
	uint32_t width;
	uint32_t height;
	uint32_t depth;
}
struct VkTransformMatrixKHR {
	float[3][4] matrix;
}
struct VkValidationCacheCreateInfoEXT {
	VkStructureType sType;
	void* pNext;
	VkValidationCacheCreateFlagsEXT flags;
	size_t initialDataSize;
	void* pInitialData;
}
struct VkValidationCacheEXT_T {
}
struct VkValidationFeaturesEXT {
	VkStructureType sType;
	void* pNext;
	uint32_t enabledValidationFeatureCount;
	VkValidationFeatureEnableEXT* pEnabledValidationFeatures;
	uint32_t disabledValidationFeatureCount;
	VkValidationFeatureDisableEXT* pDisabledValidationFeatures;
}
struct VkValidationFlagsEXT {
	VkStructureType sType;
	void* pNext;
	uint32_t disabledValidationCheckCount;
	VkValidationCheckEXT* pDisabledValidationChecks;
}
struct VkVertexInputAttributeDescription {
	uint32_t location;
	uint32_t binding;
	VkFormat format;
	uint32_t offset;
}
struct VkVertexInputAttributeDescription2EXT {
	VkStructureType sType;
	void* pNext;
	uint32_t location;
	uint32_t binding;
	VkFormat format;
	uint32_t offset;
}
struct VkVertexInputBindingDescription {
	uint32_t binding;
	uint32_t stride;
	VkVertexInputRate inputRate;
}
struct VkVertexInputBindingDescription2EXT {
	VkStructureType sType;
	void* pNext;
	uint32_t binding;
	uint32_t stride;
	VkVertexInputRate inputRate;
	uint32_t divisor;
}
struct VkVertexInputBindingDivisorDescriptionEXT {
	uint32_t binding;
	uint32_t divisor;
}
struct VkViewport {
	float x;
	float y;
	float width;
	float height;
	float minDepth;
	float maxDepth;
}
struct VkViewportSwizzleNV {
	VkViewportCoordinateSwizzleNV x;
	VkViewportCoordinateSwizzleNV y;
	VkViewportCoordinateSwizzleNV z;
	VkViewportCoordinateSwizzleNV w;
}
struct VkViewportWScalingNV {
	float xcoeff;
	float ycoeff;
}
struct VkWin32KeyedMutexAcquireReleaseInfoKHR {
	VkStructureType sType;
	void* pNext;
	uint32_t acquireCount;
	VkDeviceMemory* pAcquireSyncs;
	uint64_t* pAcquireKeys;
	uint32_t* pAcquireTimeouts;
	uint32_t releaseCount;
	VkDeviceMemory* pReleaseSyncs;
	uint64_t* pReleaseKeys;
}
struct VkWin32KeyedMutexAcquireReleaseInfoNV {
	VkStructureType sType;
	void* pNext;
	uint32_t acquireCount;
	VkDeviceMemory* pAcquireSyncs;
	uint64_t* pAcquireKeys;
	uint32_t* pAcquireTimeoutMilliseconds;
	uint32_t releaseCount;
	VkDeviceMemory* pReleaseSyncs;
	uint64_t* pReleaseKeys;
}
struct VkWin32SurfaceCreateInfoKHR {
	VkStructureType sType;
	void* pNext;
	VkWin32SurfaceCreateFlagsKHR flags;
	HINSTANCE hinstance;
	HWND hwnd;
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
struct VkWriteDescriptorSetAccelerationStructureKHR {
	VkStructureType sType;
	void* pNext;
	uint32_t accelerationStructureCount;
	VkAccelerationStructureKHR* pAccelerationStructures;
}
struct VkWriteDescriptorSetAccelerationStructureNV {
	VkStructureType sType;
	void* pNext;
	uint32_t accelerationStructureCount;
	VkAccelerationStructureNV* pAccelerationStructures;
}
struct VkWriteDescriptorSetInlineUniformBlock {
	VkStructureType sType;
	void* pNext;
	uint32_t dataSize;
	void* pData;
}
struct VkXYColorEXT {
	float x;
	float y;
}
struct _SECURITY_ATTRIBUTES {
	DWORD nLength;
	LPVOID lpSecurityDescriptor;
	BOOL bInheritHandle;
}

// Global variables

extern(Windows) { nothrow __gshared {

VkResult function(VkPhysicalDevice physicalDevice, int32_t drmFd, VkDisplayKHR display)
	vkAcquireDrmDisplayEXT;

VkResult function(VkDevice device, VkSwapchainKHR swapchain)
	vkAcquireFullScreenExclusiveModeEXT;

VkResult function(VkDevice device, VkAcquireNextImageInfoKHR* pAcquireInfo, uint32_t* pImageIndex)
	vkAcquireNextImage2KHR;

VkResult function(VkDevice device, VkSwapchainKHR swapchain, uint64_t timeout, VkSemaphore semaphore, VkFence fence, uint32_t* pImageIndex)
	vkAcquireNextImageKHR;

VkResult function(VkDevice device, VkPerformanceConfigurationAcquireInfoINTEL* pAcquireInfo, VkPerformanceConfigurationINTEL* pConfiguration)
	vkAcquirePerformanceConfigurationINTEL;

VkResult function(VkDevice device, VkAcquireProfilingLockInfoKHR* pInfo)
	vkAcquireProfilingLockKHR;

VkResult function(VkPhysicalDevice physicalDevice, VkDisplayKHR display)
	vkAcquireWinrtDisplayNV;

VkResult function(VkDevice device, VkCommandBufferAllocateInfo* pAllocateInfo, VkCommandBuffer* pCommandBuffers)
	vkAllocateCommandBuffers;

VkResult function(VkDevice device, VkDescriptorSetAllocateInfo* pAllocateInfo, VkDescriptorSet* pDescriptorSets)
	vkAllocateDescriptorSets;

VkResult function(VkDevice device, VkMemoryAllocateInfo* pAllocateInfo, VkAllocationCallbacks* pAllocator, VkDeviceMemory* pMemory)
	vkAllocateMemory;

VkResult function(VkCommandBuffer commandBuffer, VkCommandBufferBeginInfo* pBeginInfo)
	vkBeginCommandBuffer;

VkResult function(VkDevice device, uint32_t bindInfoCount, VkBindAccelerationStructureMemoryInfoNV* pBindInfos)
	vkBindAccelerationStructureMemoryNV;

VkResult function(VkDevice device, VkBuffer buffer, VkDeviceMemory memory, VkDeviceSize memoryOffset)
	vkBindBufferMemory;

VkResult function(VkDevice device, uint32_t bindInfoCount, VkBindBufferMemoryInfo* pBindInfos)
	vkBindBufferMemory2;

VkResult function(VkDevice device, uint32_t bindInfoCount, VkBindBufferMemoryInfo* pBindInfos)
	vkBindBufferMemory2KHR;

VkResult function(VkDevice device, VkImage image, VkDeviceMemory memory, VkDeviceSize memoryOffset)
	vkBindImageMemory;

VkResult function(VkDevice device, uint32_t bindInfoCount, VkBindImageMemoryInfo* pBindInfos)
	vkBindImageMemory2;

VkResult function(VkDevice device, uint32_t bindInfoCount, VkBindImageMemoryInfo* pBindInfos)
	vkBindImageMemory2KHR;

VkResult function(VkDevice device, VkDeferredOperationKHR deferredOperation, uint32_t infoCount, VkAccelerationStructureBuildGeometryInfoKHR* pInfos, VkAccelerationStructureBuildRangeInfoKHR** ppBuildRangeInfos)
	vkBuildAccelerationStructuresKHR;

void function(VkCommandBuffer commandBuffer, VkConditionalRenderingBeginInfoEXT* pConditionalRenderingBegin)
	vkCmdBeginConditionalRenderingEXT;

void function(VkCommandBuffer commandBuffer, VkDebugUtilsLabelEXT* pLabelInfo)
	vkCmdBeginDebugUtilsLabelEXT;

void function(VkCommandBuffer commandBuffer, VkQueryPool queryPool, uint32_t query, VkQueryControlFlags flags)
	vkCmdBeginQuery;

void function(VkCommandBuffer commandBuffer, VkQueryPool queryPool, uint32_t query, VkQueryControlFlags flags, uint32_t index)
	vkCmdBeginQueryIndexedEXT;

void function(VkCommandBuffer commandBuffer, VkRenderPassBeginInfo* pRenderPassBegin, VkSubpassContents contents)
	vkCmdBeginRenderPass;

void function(VkCommandBuffer commandBuffer, VkRenderPassBeginInfo* pRenderPassBegin, VkSubpassBeginInfo* pSubpassBeginInfo)
	vkCmdBeginRenderPass2;

void function(VkCommandBuffer commandBuffer, VkRenderPassBeginInfo* pRenderPassBegin, VkSubpassBeginInfo* pSubpassBeginInfo)
	vkCmdBeginRenderPass2KHR;

void function(VkCommandBuffer commandBuffer, VkRenderingInfo* pRenderingInfo)
	vkCmdBeginRendering;

void function(VkCommandBuffer commandBuffer, VkRenderingInfo* pRenderingInfo)
	vkCmdBeginRenderingKHR;

void function(VkCommandBuffer commandBuffer, uint32_t firstCounterBuffer, uint32_t counterBufferCount, VkBuffer* pCounterBuffers, VkDeviceSize* pCounterBufferOffsets)
	vkCmdBeginTransformFeedbackEXT;

void function(VkCommandBuffer commandBuffer, VkPipelineBindPoint pipelineBindPoint, VkPipelineLayout layout, uint32_t firstSet, uint32_t descriptorSetCount, VkDescriptorSet* pDescriptorSets, uint32_t dynamicOffsetCount, uint32_t* pDynamicOffsets)
	vkCmdBindDescriptorSets;

void function(VkCommandBuffer commandBuffer, VkBuffer buffer, VkDeviceSize offset, VkIndexType indexType)
	vkCmdBindIndexBuffer;

void function(VkCommandBuffer commandBuffer, VkImageView imageView, VkImageLayout imageLayout)
	vkCmdBindInvocationMaskHUAWEI;

void function(VkCommandBuffer commandBuffer, VkPipelineBindPoint pipelineBindPoint, VkPipeline pipeline)
	vkCmdBindPipeline;

void function(VkCommandBuffer commandBuffer, VkPipelineBindPoint pipelineBindPoint, VkPipeline pipeline, uint32_t groupIndex)
	vkCmdBindPipelineShaderGroupNV;

void function(VkCommandBuffer commandBuffer, VkImageView imageView, VkImageLayout imageLayout)
	vkCmdBindShadingRateImageNV;

void function(VkCommandBuffer commandBuffer, uint32_t firstBinding, uint32_t bindingCount, VkBuffer* pBuffers, VkDeviceSize* pOffsets, VkDeviceSize* pSizes)
	vkCmdBindTransformFeedbackBuffersEXT;

void function(VkCommandBuffer commandBuffer, uint32_t firstBinding, uint32_t bindingCount, VkBuffer* pBuffers, VkDeviceSize* pOffsets)
	vkCmdBindVertexBuffers;

void function(VkCommandBuffer commandBuffer, uint32_t firstBinding, uint32_t bindingCount, VkBuffer* pBuffers, VkDeviceSize* pOffsets, VkDeviceSize* pSizes, VkDeviceSize* pStrides)
	vkCmdBindVertexBuffers2;

void function(VkCommandBuffer commandBuffer, uint32_t firstBinding, uint32_t bindingCount, VkBuffer* pBuffers, VkDeviceSize* pOffsets, VkDeviceSize* pSizes, VkDeviceSize* pStrides)
	vkCmdBindVertexBuffers2EXT;

void function(VkCommandBuffer commandBuffer, VkImage srcImage, VkImageLayout srcImageLayout, VkImage dstImage, VkImageLayout dstImageLayout, uint32_t regionCount, VkImageBlit* pRegions, VkFilter filter)
	vkCmdBlitImage;

void function(VkCommandBuffer commandBuffer, VkBlitImageInfo2* pBlitImageInfo)
	vkCmdBlitImage2;

void function(VkCommandBuffer commandBuffer, VkBlitImageInfo2* pBlitImageInfo)
	vkCmdBlitImage2KHR;

void function(VkCommandBuffer commandBuffer, VkAccelerationStructureInfoNV* pInfo, VkBuffer instanceData, VkDeviceSize instanceOffset, VkBool32 update, VkAccelerationStructureNV dst, VkAccelerationStructureNV src, VkBuffer scratch, VkDeviceSize scratchOffset)
	vkCmdBuildAccelerationStructureNV;

void function(VkCommandBuffer commandBuffer, uint32_t infoCount, VkAccelerationStructureBuildGeometryInfoKHR* pInfos, VkDeviceAddress* pIndirectDeviceAddresses, uint32_t* pIndirectStrides, uint32_t** ppMaxPrimitiveCounts)
	vkCmdBuildAccelerationStructuresIndirectKHR;

void function(VkCommandBuffer commandBuffer, uint32_t infoCount, VkAccelerationStructureBuildGeometryInfoKHR* pInfos, VkAccelerationStructureBuildRangeInfoKHR** ppBuildRangeInfos)
	vkCmdBuildAccelerationStructuresKHR;

void function(VkCommandBuffer commandBuffer, uint32_t attachmentCount, VkClearAttachment* pAttachments, uint32_t rectCount, VkClearRect* pRects)
	vkCmdClearAttachments;

void function(VkCommandBuffer commandBuffer, VkImage image, VkImageLayout imageLayout, VkClearColorValue* pColor, uint32_t rangeCount, VkImageSubresourceRange* pRanges)
	vkCmdClearColorImage;

void function(VkCommandBuffer commandBuffer, VkImage image, VkImageLayout imageLayout, VkClearDepthStencilValue* pDepthStencil, uint32_t rangeCount, VkImageSubresourceRange* pRanges)
	vkCmdClearDepthStencilImage;

void function(VkCommandBuffer commandBuffer, VkCopyAccelerationStructureInfoKHR* pInfo)
	vkCmdCopyAccelerationStructureKHR;

void function(VkCommandBuffer commandBuffer, VkAccelerationStructureNV dst, VkAccelerationStructureNV src, VkCopyAccelerationStructureModeKHR mode)
	vkCmdCopyAccelerationStructureNV;

void function(VkCommandBuffer commandBuffer, VkCopyAccelerationStructureToMemoryInfoKHR* pInfo)
	vkCmdCopyAccelerationStructureToMemoryKHR;

void function(VkCommandBuffer commandBuffer, VkBuffer srcBuffer, VkBuffer dstBuffer, uint32_t regionCount, VkBufferCopy* pRegions)
	vkCmdCopyBuffer;

void function(VkCommandBuffer commandBuffer, VkCopyBufferInfo2* pCopyBufferInfo)
	vkCmdCopyBuffer2;

void function(VkCommandBuffer commandBuffer, VkCopyBufferInfo2* pCopyBufferInfo)
	vkCmdCopyBuffer2KHR;

void function(VkCommandBuffer commandBuffer, VkBuffer srcBuffer, VkImage dstImage, VkImageLayout dstImageLayout, uint32_t regionCount, VkBufferImageCopy* pRegions)
	vkCmdCopyBufferToImage;

void function(VkCommandBuffer commandBuffer, VkCopyBufferToImageInfo2* pCopyBufferToImageInfo)
	vkCmdCopyBufferToImage2;

void function(VkCommandBuffer commandBuffer, VkCopyBufferToImageInfo2* pCopyBufferToImageInfo)
	vkCmdCopyBufferToImage2KHR;

void function(VkCommandBuffer commandBuffer, VkImage srcImage, VkImageLayout srcImageLayout, VkImage dstImage, VkImageLayout dstImageLayout, uint32_t regionCount, VkImageCopy* pRegions)
	vkCmdCopyImage;

void function(VkCommandBuffer commandBuffer, VkCopyImageInfo2* pCopyImageInfo)
	vkCmdCopyImage2;

void function(VkCommandBuffer commandBuffer, VkCopyImageInfo2* pCopyImageInfo)
	vkCmdCopyImage2KHR;

void function(VkCommandBuffer commandBuffer, VkImage srcImage, VkImageLayout srcImageLayout, VkBuffer dstBuffer, uint32_t regionCount, VkBufferImageCopy* pRegions)
	vkCmdCopyImageToBuffer;

void function(VkCommandBuffer commandBuffer, VkCopyImageToBufferInfo2* pCopyImageToBufferInfo)
	vkCmdCopyImageToBuffer2;

void function(VkCommandBuffer commandBuffer, VkCopyImageToBufferInfo2* pCopyImageToBufferInfo)
	vkCmdCopyImageToBuffer2KHR;

void function(VkCommandBuffer commandBuffer, VkCopyMemoryToAccelerationStructureInfoKHR* pInfo)
	vkCmdCopyMemoryToAccelerationStructureKHR;

void function(VkCommandBuffer commandBuffer, VkQueryPool queryPool, uint32_t firstQuery, uint32_t queryCount, VkBuffer dstBuffer, VkDeviceSize dstOffset, VkDeviceSize stride, VkQueryResultFlags flags)
	vkCmdCopyQueryPoolResults;

void function(VkCommandBuffer commandBuffer, VkCuLaunchInfoNVX* pLaunchInfo)
	vkCmdCuLaunchKernelNVX;

void function(VkCommandBuffer commandBuffer, VkDebugMarkerMarkerInfoEXT* pMarkerInfo)
	vkCmdDebugMarkerBeginEXT;

void function(VkCommandBuffer commandBuffer)
	vkCmdDebugMarkerEndEXT;

void function(VkCommandBuffer commandBuffer, VkDebugMarkerMarkerInfoEXT* pMarkerInfo)
	vkCmdDebugMarkerInsertEXT;

void function(VkCommandBuffer commandBuffer, uint32_t groupCountX, uint32_t groupCountY, uint32_t groupCountZ)
	vkCmdDispatch;

void function(VkCommandBuffer commandBuffer, uint32_t baseGroupX, uint32_t baseGroupY, uint32_t baseGroupZ, uint32_t groupCountX, uint32_t groupCountY, uint32_t groupCountZ)
	vkCmdDispatchBase;

void function(VkCommandBuffer commandBuffer, uint32_t baseGroupX, uint32_t baseGroupY, uint32_t baseGroupZ, uint32_t groupCountX, uint32_t groupCountY, uint32_t groupCountZ)
	vkCmdDispatchBaseKHR;

void function(VkCommandBuffer commandBuffer, VkBuffer buffer, VkDeviceSize offset)
	vkCmdDispatchIndirect;

void function(VkCommandBuffer commandBuffer, uint32_t vertexCount, uint32_t instanceCount, uint32_t firstVertex, uint32_t firstInstance)
	vkCmdDraw;

void function(VkCommandBuffer commandBuffer, uint32_t indexCount, uint32_t instanceCount, uint32_t firstIndex, int32_t vertexOffset, uint32_t firstInstance)
	vkCmdDrawIndexed;

void function(VkCommandBuffer commandBuffer, VkBuffer buffer, VkDeviceSize offset, uint32_t drawCount, uint32_t stride)
	vkCmdDrawIndexedIndirect;

void function(VkCommandBuffer commandBuffer, VkBuffer buffer, VkDeviceSize offset, VkBuffer countBuffer, VkDeviceSize countBufferOffset, uint32_t maxDrawCount, uint32_t stride)
	vkCmdDrawIndexedIndirectCount;

void function(VkCommandBuffer commandBuffer, VkBuffer buffer, VkDeviceSize offset, VkBuffer countBuffer, VkDeviceSize countBufferOffset, uint32_t maxDrawCount, uint32_t stride)
	vkCmdDrawIndexedIndirectCountAMD;

void function(VkCommandBuffer commandBuffer, VkBuffer buffer, VkDeviceSize offset, VkBuffer countBuffer, VkDeviceSize countBufferOffset, uint32_t maxDrawCount, uint32_t stride)
	vkCmdDrawIndexedIndirectCountKHR;

void function(VkCommandBuffer commandBuffer, VkBuffer buffer, VkDeviceSize offset, uint32_t drawCount, uint32_t stride)
	vkCmdDrawIndirect;

void function(VkCommandBuffer commandBuffer, uint32_t instanceCount, uint32_t firstInstance, VkBuffer counterBuffer, VkDeviceSize counterBufferOffset, uint32_t counterOffset, uint32_t vertexStride)
	vkCmdDrawIndirectByteCountEXT;

void function(VkCommandBuffer commandBuffer, VkBuffer buffer, VkDeviceSize offset, VkBuffer countBuffer, VkDeviceSize countBufferOffset, uint32_t maxDrawCount, uint32_t stride)
	vkCmdDrawIndirectCount;

void function(VkCommandBuffer commandBuffer, VkBuffer buffer, VkDeviceSize offset, VkBuffer countBuffer, VkDeviceSize countBufferOffset, uint32_t maxDrawCount, uint32_t stride)
	vkCmdDrawIndirectCountAMD;

void function(VkCommandBuffer commandBuffer, VkBuffer buffer, VkDeviceSize offset, VkBuffer countBuffer, VkDeviceSize countBufferOffset, uint32_t maxDrawCount, uint32_t stride)
	vkCmdDrawIndirectCountKHR;

void function(VkCommandBuffer commandBuffer, VkBuffer buffer, VkDeviceSize offset, VkBuffer countBuffer, VkDeviceSize countBufferOffset, uint32_t maxDrawCount, uint32_t stride)
	vkCmdDrawMeshTasksIndirectCountNV;

void function(VkCommandBuffer commandBuffer, VkBuffer buffer, VkDeviceSize offset, uint32_t drawCount, uint32_t stride)
	vkCmdDrawMeshTasksIndirectNV;

void function(VkCommandBuffer commandBuffer, uint32_t taskCount, uint32_t firstTask)
	vkCmdDrawMeshTasksNV;

void function(VkCommandBuffer commandBuffer, uint32_t drawCount, VkMultiDrawInfoEXT* pVertexInfo, uint32_t instanceCount, uint32_t firstInstance, uint32_t stride)
	vkCmdDrawMultiEXT;

void function(VkCommandBuffer commandBuffer, uint32_t drawCount, VkMultiDrawIndexedInfoEXT* pIndexInfo, uint32_t instanceCount, uint32_t firstInstance, uint32_t stride, int32_t* pVertexOffset)
	vkCmdDrawMultiIndexedEXT;

void function(VkCommandBuffer commandBuffer)
	vkCmdEndConditionalRenderingEXT;

void function(VkCommandBuffer commandBuffer)
	vkCmdEndDebugUtilsLabelEXT;

void function(VkCommandBuffer commandBuffer, VkQueryPool queryPool, uint32_t query)
	vkCmdEndQuery;

void function(VkCommandBuffer commandBuffer, VkQueryPool queryPool, uint32_t query, uint32_t index)
	vkCmdEndQueryIndexedEXT;

void function(VkCommandBuffer commandBuffer)
	vkCmdEndRenderPass;

void function(VkCommandBuffer commandBuffer, VkSubpassEndInfo* pSubpassEndInfo)
	vkCmdEndRenderPass2;

void function(VkCommandBuffer commandBuffer, VkSubpassEndInfo* pSubpassEndInfo)
	vkCmdEndRenderPass2KHR;

void function(VkCommandBuffer commandBuffer)
	vkCmdEndRendering;

void function(VkCommandBuffer commandBuffer)
	vkCmdEndRenderingKHR;

void function(VkCommandBuffer commandBuffer, uint32_t firstCounterBuffer, uint32_t counterBufferCount, VkBuffer* pCounterBuffers, VkDeviceSize* pCounterBufferOffsets)
	vkCmdEndTransformFeedbackEXT;

void function(VkCommandBuffer commandBuffer, uint32_t commandBufferCount, VkCommandBuffer* pCommandBuffers)
	vkCmdExecuteCommands;

void function(VkCommandBuffer commandBuffer, VkBool32 isPreprocessed, VkGeneratedCommandsInfoNV* pGeneratedCommandsInfo)
	vkCmdExecuteGeneratedCommandsNV;

void function(VkCommandBuffer commandBuffer, VkBuffer dstBuffer, VkDeviceSize dstOffset, VkDeviceSize size, uint32_t data)
	vkCmdFillBuffer;

void function(VkCommandBuffer commandBuffer, VkDebugUtilsLabelEXT* pLabelInfo)
	vkCmdInsertDebugUtilsLabelEXT;

void function(VkCommandBuffer commandBuffer, VkSubpassContents contents)
	vkCmdNextSubpass;

void function(VkCommandBuffer commandBuffer, VkSubpassBeginInfo* pSubpassBeginInfo, VkSubpassEndInfo* pSubpassEndInfo)
	vkCmdNextSubpass2;

void function(VkCommandBuffer commandBuffer, VkSubpassBeginInfo* pSubpassBeginInfo, VkSubpassEndInfo* pSubpassEndInfo)
	vkCmdNextSubpass2KHR;

void function(VkCommandBuffer commandBuffer, VkPipelineStageFlags srcStageMask, VkPipelineStageFlags dstStageMask, VkDependencyFlags dependencyFlags, uint32_t memoryBarrierCount, VkMemoryBarrier* pMemoryBarriers, uint32_t bufferMemoryBarrierCount, VkBufferMemoryBarrier* pBufferMemoryBarriers, uint32_t imageMemoryBarrierCount, VkImageMemoryBarrier* pImageMemoryBarriers)
	vkCmdPipelineBarrier;

void function(VkCommandBuffer commandBuffer, VkDependencyInfo* pDependencyInfo)
	vkCmdPipelineBarrier2;

void function(VkCommandBuffer commandBuffer, VkDependencyInfo* pDependencyInfo)
	vkCmdPipelineBarrier2KHR;

void function(VkCommandBuffer commandBuffer, VkGeneratedCommandsInfoNV* pGeneratedCommandsInfo)
	vkCmdPreprocessGeneratedCommandsNV;

void function(VkCommandBuffer commandBuffer, VkPipelineLayout layout, VkShaderStageFlags stageFlags, uint32_t offset, uint32_t size, void* pValues)
	vkCmdPushConstants;

void function(VkCommandBuffer commandBuffer, VkPipelineBindPoint pipelineBindPoint, VkPipelineLayout layout, uint32_t set, uint32_t descriptorWriteCount, VkWriteDescriptorSet* pDescriptorWrites)
	vkCmdPushDescriptorSetKHR;

void function(VkCommandBuffer commandBuffer, VkDescriptorUpdateTemplate descriptorUpdateTemplate, VkPipelineLayout layout, uint32_t set, void* pData)
	vkCmdPushDescriptorSetWithTemplateKHR;

void function(VkCommandBuffer commandBuffer, VkEvent event, VkPipelineStageFlags stageMask)
	vkCmdResetEvent;

void function(VkCommandBuffer commandBuffer, VkEvent event, VkPipelineStageFlags2 stageMask)
	vkCmdResetEvent2;

void function(VkCommandBuffer commandBuffer, VkEvent event, VkPipelineStageFlags2 stageMask)
	vkCmdResetEvent2KHR;

void function(VkCommandBuffer commandBuffer, VkQueryPool queryPool, uint32_t firstQuery, uint32_t queryCount)
	vkCmdResetQueryPool;

void function(VkCommandBuffer commandBuffer, VkImage srcImage, VkImageLayout srcImageLayout, VkImage dstImage, VkImageLayout dstImageLayout, uint32_t regionCount, VkImageResolve* pRegions)
	vkCmdResolveImage;

void function(VkCommandBuffer commandBuffer, VkResolveImageInfo2* pResolveImageInfo)
	vkCmdResolveImage2;

void function(VkCommandBuffer commandBuffer, VkResolveImageInfo2* pResolveImageInfo)
	vkCmdResolveImage2KHR;

void function(VkCommandBuffer commandBuffer, float[4] blendConstants)
	vkCmdSetBlendConstants;

void function(VkCommandBuffer commandBuffer, void* pCheckpointMarker)
	vkCmdSetCheckpointNV;

void function(VkCommandBuffer commandBuffer, VkCoarseSampleOrderTypeNV sampleOrderType, uint32_t customSampleOrderCount, VkCoarseSampleOrderCustomNV* pCustomSampleOrders)
	vkCmdSetCoarseSampleOrderNV;

void function(VkCommandBuffer commandBuffer, uint32_t attachmentCount, VkBool32* pColorWriteEnables)
	vkCmdSetColorWriteEnableEXT;

void function(VkCommandBuffer commandBuffer, VkCullModeFlags cullMode)
	vkCmdSetCullMode;

void function(VkCommandBuffer commandBuffer, VkCullModeFlags cullMode)
	vkCmdSetCullModeEXT;

void function(VkCommandBuffer commandBuffer, float depthBiasConstantFactor, float depthBiasClamp, float depthBiasSlopeFactor)
	vkCmdSetDepthBias;

void function(VkCommandBuffer commandBuffer, VkBool32 depthBiasEnable)
	vkCmdSetDepthBiasEnable;

void function(VkCommandBuffer commandBuffer, VkBool32 depthBiasEnable)
	vkCmdSetDepthBiasEnableEXT;

void function(VkCommandBuffer commandBuffer, float minDepthBounds, float maxDepthBounds)
	vkCmdSetDepthBounds;

void function(VkCommandBuffer commandBuffer, VkBool32 depthBoundsTestEnable)
	vkCmdSetDepthBoundsTestEnable;

void function(VkCommandBuffer commandBuffer, VkBool32 depthBoundsTestEnable)
	vkCmdSetDepthBoundsTestEnableEXT;

void function(VkCommandBuffer commandBuffer, VkCompareOp depthCompareOp)
	vkCmdSetDepthCompareOp;

void function(VkCommandBuffer commandBuffer, VkCompareOp depthCompareOp)
	vkCmdSetDepthCompareOpEXT;

void function(VkCommandBuffer commandBuffer, VkBool32 depthTestEnable)
	vkCmdSetDepthTestEnable;

void function(VkCommandBuffer commandBuffer, VkBool32 depthTestEnable)
	vkCmdSetDepthTestEnableEXT;

void function(VkCommandBuffer commandBuffer, VkBool32 depthWriteEnable)
	vkCmdSetDepthWriteEnable;

void function(VkCommandBuffer commandBuffer, VkBool32 depthWriteEnable)
	vkCmdSetDepthWriteEnableEXT;

void function(VkCommandBuffer commandBuffer, uint32_t deviceMask)
	vkCmdSetDeviceMask;

void function(VkCommandBuffer commandBuffer, uint32_t deviceMask)
	vkCmdSetDeviceMaskKHR;

void function(VkCommandBuffer commandBuffer, uint32_t firstDiscardRectangle, uint32_t discardRectangleCount, VkRect2D* pDiscardRectangles)
	vkCmdSetDiscardRectangleEXT;

void function(VkCommandBuffer commandBuffer, VkEvent event, VkPipelineStageFlags stageMask)
	vkCmdSetEvent;

void function(VkCommandBuffer commandBuffer, VkEvent event, VkDependencyInfo* pDependencyInfo)
	vkCmdSetEvent2;

void function(VkCommandBuffer commandBuffer, VkEvent event, VkDependencyInfo* pDependencyInfo)
	vkCmdSetEvent2KHR;

void function(VkCommandBuffer commandBuffer, uint32_t firstExclusiveScissor, uint32_t exclusiveScissorCount, VkRect2D* pExclusiveScissors)
	vkCmdSetExclusiveScissorNV;

void function(VkCommandBuffer commandBuffer, VkFragmentShadingRateNV shadingRate, VkFragmentShadingRateCombinerOpKHR[2] combinerOps)
	vkCmdSetFragmentShadingRateEnumNV;

void function(VkCommandBuffer commandBuffer, VkExtent2D* pFragmentSize, VkFragmentShadingRateCombinerOpKHR[2] combinerOps)
	vkCmdSetFragmentShadingRateKHR;

void function(VkCommandBuffer commandBuffer, VkFrontFace frontFace)
	vkCmdSetFrontFace;

void function(VkCommandBuffer commandBuffer, VkFrontFace frontFace)
	vkCmdSetFrontFaceEXT;

void function(VkCommandBuffer commandBuffer, uint32_t lineStippleFactor, uint16_t lineStipplePattern)
	vkCmdSetLineStippleEXT;

void function(VkCommandBuffer commandBuffer, float lineWidth)
	vkCmdSetLineWidth;

void function(VkCommandBuffer commandBuffer, VkLogicOp logicOp)
	vkCmdSetLogicOpEXT;

void function(VkCommandBuffer commandBuffer, uint32_t patchControlPoints)
	vkCmdSetPatchControlPointsEXT;

VkResult function(VkCommandBuffer commandBuffer, VkPerformanceMarkerInfoINTEL* pMarkerInfo)
	vkCmdSetPerformanceMarkerINTEL;

VkResult function(VkCommandBuffer commandBuffer, VkPerformanceOverrideInfoINTEL* pOverrideInfo)
	vkCmdSetPerformanceOverrideINTEL;

VkResult function(VkCommandBuffer commandBuffer, VkPerformanceStreamMarkerInfoINTEL* pMarkerInfo)
	vkCmdSetPerformanceStreamMarkerINTEL;

void function(VkCommandBuffer commandBuffer, VkBool32 primitiveRestartEnable)
	vkCmdSetPrimitiveRestartEnable;

void function(VkCommandBuffer commandBuffer, VkBool32 primitiveRestartEnable)
	vkCmdSetPrimitiveRestartEnableEXT;

void function(VkCommandBuffer commandBuffer, VkPrimitiveTopology primitiveTopology)
	vkCmdSetPrimitiveTopology;

void function(VkCommandBuffer commandBuffer, VkPrimitiveTopology primitiveTopology)
	vkCmdSetPrimitiveTopologyEXT;

void function(VkCommandBuffer commandBuffer, VkBool32 rasterizerDiscardEnable)
	vkCmdSetRasterizerDiscardEnable;

void function(VkCommandBuffer commandBuffer, VkBool32 rasterizerDiscardEnable)
	vkCmdSetRasterizerDiscardEnableEXT;

void function(VkCommandBuffer commandBuffer, uint32_t pipelineStackSize)
	vkCmdSetRayTracingPipelineStackSizeKHR;

void function(VkCommandBuffer commandBuffer, VkSampleLocationsInfoEXT* pSampleLocationsInfo)
	vkCmdSetSampleLocationsEXT;

void function(VkCommandBuffer commandBuffer, uint32_t firstScissor, uint32_t scissorCount, VkRect2D* pScissors)
	vkCmdSetScissor;

void function(VkCommandBuffer commandBuffer, uint32_t scissorCount, VkRect2D* pScissors)
	vkCmdSetScissorWithCount;

void function(VkCommandBuffer commandBuffer, uint32_t scissorCount, VkRect2D* pScissors)
	vkCmdSetScissorWithCountEXT;

void function(VkCommandBuffer commandBuffer, VkStencilFaceFlags faceMask, uint32_t compareMask)
	vkCmdSetStencilCompareMask;

void function(VkCommandBuffer commandBuffer, VkStencilFaceFlags faceMask, VkStencilOp failOp, VkStencilOp passOp, VkStencilOp depthFailOp, VkCompareOp compareOp)
	vkCmdSetStencilOp;

void function(VkCommandBuffer commandBuffer, VkStencilFaceFlags faceMask, VkStencilOp failOp, VkStencilOp passOp, VkStencilOp depthFailOp, VkCompareOp compareOp)
	vkCmdSetStencilOpEXT;

void function(VkCommandBuffer commandBuffer, VkStencilFaceFlags faceMask, uint32_t reference)
	vkCmdSetStencilReference;

void function(VkCommandBuffer commandBuffer, VkBool32 stencilTestEnable)
	vkCmdSetStencilTestEnable;

void function(VkCommandBuffer commandBuffer, VkBool32 stencilTestEnable)
	vkCmdSetStencilTestEnableEXT;

void function(VkCommandBuffer commandBuffer, VkStencilFaceFlags faceMask, uint32_t writeMask)
	vkCmdSetStencilWriteMask;

void function(VkCommandBuffer commandBuffer, uint32_t vertexBindingDescriptionCount, VkVertexInputBindingDescription2EXT* pVertexBindingDescriptions, uint32_t vertexAttributeDescriptionCount, VkVertexInputAttributeDescription2EXT* pVertexAttributeDescriptions)
	vkCmdSetVertexInputEXT;

void function(VkCommandBuffer commandBuffer, uint32_t firstViewport, uint32_t viewportCount, VkViewport* pViewports)
	vkCmdSetViewport;

void function(VkCommandBuffer commandBuffer, uint32_t firstViewport, uint32_t viewportCount, VkShadingRatePaletteNV* pShadingRatePalettes)
	vkCmdSetViewportShadingRatePaletteNV;

void function(VkCommandBuffer commandBuffer, uint32_t firstViewport, uint32_t viewportCount, VkViewportWScalingNV* pViewportWScalings)
	vkCmdSetViewportWScalingNV;

void function(VkCommandBuffer commandBuffer, uint32_t viewportCount, VkViewport* pViewports)
	vkCmdSetViewportWithCount;

void function(VkCommandBuffer commandBuffer, uint32_t viewportCount, VkViewport* pViewports)
	vkCmdSetViewportWithCountEXT;

void function(VkCommandBuffer commandBuffer)
	vkCmdSubpassShadingHUAWEI;

void function(VkCommandBuffer commandBuffer, VkStridedDeviceAddressRegionKHR* pRaygenShaderBindingTable, VkStridedDeviceAddressRegionKHR* pMissShaderBindingTable, VkStridedDeviceAddressRegionKHR* pHitShaderBindingTable, VkStridedDeviceAddressRegionKHR* pCallableShaderBindingTable, VkDeviceAddress indirectDeviceAddress)
	vkCmdTraceRaysIndirectKHR;

void function(VkCommandBuffer commandBuffer, VkStridedDeviceAddressRegionKHR* pRaygenShaderBindingTable, VkStridedDeviceAddressRegionKHR* pMissShaderBindingTable, VkStridedDeviceAddressRegionKHR* pHitShaderBindingTable, VkStridedDeviceAddressRegionKHR* pCallableShaderBindingTable, uint32_t width, uint32_t height, uint32_t depth)
	vkCmdTraceRaysKHR;

void function(VkCommandBuffer commandBuffer, VkBuffer raygenShaderBindingTableBuffer, VkDeviceSize raygenShaderBindingOffset, VkBuffer missShaderBindingTableBuffer, VkDeviceSize missShaderBindingOffset, VkDeviceSize missShaderBindingStride, VkBuffer hitShaderBindingTableBuffer, VkDeviceSize hitShaderBindingOffset, VkDeviceSize hitShaderBindingStride, VkBuffer callableShaderBindingTableBuffer, VkDeviceSize callableShaderBindingOffset, VkDeviceSize callableShaderBindingStride, uint32_t width, uint32_t height, uint32_t depth)
	vkCmdTraceRaysNV;

void function(VkCommandBuffer commandBuffer, VkBuffer dstBuffer, VkDeviceSize dstOffset, VkDeviceSize dataSize, void* pData)
	vkCmdUpdateBuffer;

void function(VkCommandBuffer commandBuffer, uint32_t eventCount, VkEvent* pEvents, VkPipelineStageFlags srcStageMask, VkPipelineStageFlags dstStageMask, uint32_t memoryBarrierCount, VkMemoryBarrier* pMemoryBarriers, uint32_t bufferMemoryBarrierCount, VkBufferMemoryBarrier* pBufferMemoryBarriers, uint32_t imageMemoryBarrierCount, VkImageMemoryBarrier* pImageMemoryBarriers)
	vkCmdWaitEvents;

void function(VkCommandBuffer commandBuffer, uint32_t eventCount, VkEvent* pEvents, VkDependencyInfo* pDependencyInfos)
	vkCmdWaitEvents2;

void function(VkCommandBuffer commandBuffer, uint32_t eventCount, VkEvent* pEvents, VkDependencyInfo* pDependencyInfos)
	vkCmdWaitEvents2KHR;

void function(VkCommandBuffer commandBuffer, uint32_t accelerationStructureCount, VkAccelerationStructureKHR* pAccelerationStructures, VkQueryType queryType, VkQueryPool queryPool, uint32_t firstQuery)
	vkCmdWriteAccelerationStructuresPropertiesKHR;

void function(VkCommandBuffer commandBuffer, uint32_t accelerationStructureCount, VkAccelerationStructureNV* pAccelerationStructures, VkQueryType queryType, VkQueryPool queryPool, uint32_t firstQuery)
	vkCmdWriteAccelerationStructuresPropertiesNV;

void function(VkCommandBuffer commandBuffer, VkPipelineStageFlags2 stage, VkBuffer dstBuffer, VkDeviceSize dstOffset, uint32_t marker)
	vkCmdWriteBufferMarker2AMD;

void function(VkCommandBuffer commandBuffer, VkPipelineStageFlagBits pipelineStage, VkBuffer dstBuffer, VkDeviceSize dstOffset, uint32_t marker)
	vkCmdWriteBufferMarkerAMD;

void function(VkCommandBuffer commandBuffer, VkPipelineStageFlagBits pipelineStage, VkQueryPool queryPool, uint32_t query)
	vkCmdWriteTimestamp;

void function(VkCommandBuffer commandBuffer, VkPipelineStageFlags2 stage, VkQueryPool queryPool, uint32_t query)
	vkCmdWriteTimestamp2;

void function(VkCommandBuffer commandBuffer, VkPipelineStageFlags2 stage, VkQueryPool queryPool, uint32_t query)
	vkCmdWriteTimestamp2KHR;

VkResult function(VkDevice device, VkPipeline pipeline, uint32_t shader)
	vkCompileDeferredNV;

VkResult function(VkDevice device, VkDeferredOperationKHR deferredOperation, VkCopyAccelerationStructureInfoKHR* pInfo)
	vkCopyAccelerationStructureKHR;

VkResult function(VkDevice device, VkDeferredOperationKHR deferredOperation, VkCopyAccelerationStructureToMemoryInfoKHR* pInfo)
	vkCopyAccelerationStructureToMemoryKHR;

VkResult function(VkDevice device, VkDeferredOperationKHR deferredOperation, VkCopyMemoryToAccelerationStructureInfoKHR* pInfo)
	vkCopyMemoryToAccelerationStructureKHR;

VkResult function(VkDevice device, VkAccelerationStructureCreateInfoKHR* pCreateInfo, VkAllocationCallbacks* pAllocator, VkAccelerationStructureKHR* pAccelerationStructure)
	vkCreateAccelerationStructureKHR;

VkResult function(VkDevice device, VkAccelerationStructureCreateInfoNV* pCreateInfo, VkAllocationCallbacks* pAllocator, VkAccelerationStructureNV* pAccelerationStructure)
	vkCreateAccelerationStructureNV;

VkResult function(VkDevice device, VkBufferCreateInfo* pCreateInfo, VkAllocationCallbacks* pAllocator, VkBuffer* pBuffer)
	vkCreateBuffer;

VkResult function(VkDevice device, VkBufferViewCreateInfo* pCreateInfo, VkAllocationCallbacks* pAllocator, VkBufferView* pView)
	vkCreateBufferView;

VkResult function(VkDevice device, VkCommandPoolCreateInfo* pCreateInfo, VkAllocationCallbacks* pAllocator, VkCommandPool* pCommandPool)
	vkCreateCommandPool;

VkResult function(VkDevice device, VkPipelineCache pipelineCache, uint32_t createInfoCount, VkComputePipelineCreateInfo* pCreateInfos, VkAllocationCallbacks* pAllocator, VkPipeline* pPipelines)
	vkCreateComputePipelines;

VkResult function(VkDevice device, VkCuFunctionCreateInfoNVX* pCreateInfo, VkAllocationCallbacks* pAllocator, VkCuFunctionNVX* pFunction)
	vkCreateCuFunctionNVX;

VkResult function(VkDevice device, VkCuModuleCreateInfoNVX* pCreateInfo, VkAllocationCallbacks* pAllocator, VkCuModuleNVX* pModule)
	vkCreateCuModuleNVX;

VkResult function(VkInstance instance, VkDebugReportCallbackCreateInfoEXT* pCreateInfo, VkAllocationCallbacks* pAllocator, VkDebugReportCallbackEXT* pCallback)
	vkCreateDebugReportCallbackEXT;

VkResult function(VkInstance instance, VkDebugUtilsMessengerCreateInfoEXT* pCreateInfo, VkAllocationCallbacks* pAllocator, VkDebugUtilsMessengerEXT* pMessenger)
	vkCreateDebugUtilsMessengerEXT;

VkResult function(VkDevice device, VkAllocationCallbacks* pAllocator, VkDeferredOperationKHR* pDeferredOperation)
	vkCreateDeferredOperationKHR;

VkResult function(VkDevice device, VkDescriptorPoolCreateInfo* pCreateInfo, VkAllocationCallbacks* pAllocator, VkDescriptorPool* pDescriptorPool)
	vkCreateDescriptorPool;

VkResult function(VkDevice device, VkDescriptorSetLayoutCreateInfo* pCreateInfo, VkAllocationCallbacks* pAllocator, VkDescriptorSetLayout* pSetLayout)
	vkCreateDescriptorSetLayout;

VkResult function(VkDevice device, VkDescriptorUpdateTemplateCreateInfo* pCreateInfo, VkAllocationCallbacks* pAllocator, VkDescriptorUpdateTemplate* pDescriptorUpdateTemplate)
	vkCreateDescriptorUpdateTemplate;

VkResult function(VkDevice device, VkDescriptorUpdateTemplateCreateInfo* pCreateInfo, VkAllocationCallbacks* pAllocator, VkDescriptorUpdateTemplate* pDescriptorUpdateTemplate)
	vkCreateDescriptorUpdateTemplateKHR;

VkResult function(VkPhysicalDevice physicalDevice, VkDeviceCreateInfo* pCreateInfo, VkAllocationCallbacks* pAllocator, VkDevice* pDevice)
	vkCreateDevice;

VkResult function(VkPhysicalDevice physicalDevice, VkDisplayKHR display, VkDisplayModeCreateInfoKHR* pCreateInfo, VkAllocationCallbacks* pAllocator, VkDisplayModeKHR* pMode)
	vkCreateDisplayModeKHR;

VkResult function(VkInstance instance, VkDisplaySurfaceCreateInfoKHR* pCreateInfo, VkAllocationCallbacks* pAllocator, VkSurfaceKHR* pSurface)
	vkCreateDisplayPlaneSurfaceKHR;

VkResult function(VkDevice device, VkEventCreateInfo* pCreateInfo, VkAllocationCallbacks* pAllocator, VkEvent* pEvent)
	vkCreateEvent;

VkResult function(VkDevice device, VkFenceCreateInfo* pCreateInfo, VkAllocationCallbacks* pAllocator, VkFence* pFence)
	vkCreateFence;

VkResult function(VkDevice device, VkFramebufferCreateInfo* pCreateInfo, VkAllocationCallbacks* pAllocator, VkFramebuffer* pFramebuffer)
	vkCreateFramebuffer;

VkResult function(VkDevice device, VkPipelineCache pipelineCache, uint32_t createInfoCount, VkGraphicsPipelineCreateInfo* pCreateInfos, VkAllocationCallbacks* pAllocator, VkPipeline* pPipelines)
	vkCreateGraphicsPipelines;

VkResult function(VkInstance instance, VkHeadlessSurfaceCreateInfoEXT* pCreateInfo, VkAllocationCallbacks* pAllocator, VkSurfaceKHR* pSurface)
	vkCreateHeadlessSurfaceEXT;

VkResult function(VkDevice device, VkImageCreateInfo* pCreateInfo, VkAllocationCallbacks* pAllocator, VkImage* pImage)
	vkCreateImage;

VkResult function(VkDevice device, VkImageViewCreateInfo* pCreateInfo, VkAllocationCallbacks* pAllocator, VkImageView* pView)
	vkCreateImageView;

VkResult function(VkDevice device, VkIndirectCommandsLayoutCreateInfoNV* pCreateInfo, VkAllocationCallbacks* pAllocator, VkIndirectCommandsLayoutNV* pIndirectCommandsLayout)
	vkCreateIndirectCommandsLayoutNV;

VkResult function(VkInstanceCreateInfo* pCreateInfo, VkAllocationCallbacks* pAllocator, VkInstance* pInstance)
	vkCreateInstance;

VkResult function(VkDevice device, VkPipelineCacheCreateInfo* pCreateInfo, VkAllocationCallbacks* pAllocator, VkPipelineCache* pPipelineCache)
	vkCreatePipelineCache;

VkResult function(VkDevice device, VkPipelineLayoutCreateInfo* pCreateInfo, VkAllocationCallbacks* pAllocator, VkPipelineLayout* pPipelineLayout)
	vkCreatePipelineLayout;

VkResult function(VkDevice device, VkPrivateDataSlotCreateInfo* pCreateInfo, VkAllocationCallbacks* pAllocator, VkPrivateDataSlot* pPrivateDataSlot)
	vkCreatePrivateDataSlot;

VkResult function(VkDevice device, VkPrivateDataSlotCreateInfo* pCreateInfo, VkAllocationCallbacks* pAllocator, VkPrivateDataSlot* pPrivateDataSlot)
	vkCreatePrivateDataSlotEXT;

VkResult function(VkDevice device, VkQueryPoolCreateInfo* pCreateInfo, VkAllocationCallbacks* pAllocator, VkQueryPool* pQueryPool)
	vkCreateQueryPool;

VkResult function(VkDevice device, VkDeferredOperationKHR deferredOperation, VkPipelineCache pipelineCache, uint32_t createInfoCount, VkRayTracingPipelineCreateInfoKHR* pCreateInfos, VkAllocationCallbacks* pAllocator, VkPipeline* pPipelines)
	vkCreateRayTracingPipelinesKHR;

VkResult function(VkDevice device, VkPipelineCache pipelineCache, uint32_t createInfoCount, VkRayTracingPipelineCreateInfoNV* pCreateInfos, VkAllocationCallbacks* pAllocator, VkPipeline* pPipelines)
	vkCreateRayTracingPipelinesNV;

VkResult function(VkDevice device, VkRenderPassCreateInfo* pCreateInfo, VkAllocationCallbacks* pAllocator, VkRenderPass* pRenderPass)
	vkCreateRenderPass;

VkResult function(VkDevice device, VkRenderPassCreateInfo2* pCreateInfo, VkAllocationCallbacks* pAllocator, VkRenderPass* pRenderPass)
	vkCreateRenderPass2;

VkResult function(VkDevice device, VkRenderPassCreateInfo2* pCreateInfo, VkAllocationCallbacks* pAllocator, VkRenderPass* pRenderPass)
	vkCreateRenderPass2KHR;

VkResult function(VkDevice device, VkSamplerCreateInfo* pCreateInfo, VkAllocationCallbacks* pAllocator, VkSampler* pSampler)
	vkCreateSampler;

VkResult function(VkDevice device, VkSamplerYcbcrConversionCreateInfo* pCreateInfo, VkAllocationCallbacks* pAllocator, VkSamplerYcbcrConversion* pYcbcrConversion)
	vkCreateSamplerYcbcrConversion;

VkResult function(VkDevice device, VkSamplerYcbcrConversionCreateInfo* pCreateInfo, VkAllocationCallbacks* pAllocator, VkSamplerYcbcrConversion* pYcbcrConversion)
	vkCreateSamplerYcbcrConversionKHR;

VkResult function(VkDevice device, VkSemaphoreCreateInfo* pCreateInfo, VkAllocationCallbacks* pAllocator, VkSemaphore* pSemaphore)
	vkCreateSemaphore;

VkResult function(VkDevice device, VkShaderModuleCreateInfo* pCreateInfo, VkAllocationCallbacks* pAllocator, VkShaderModule* pShaderModule)
	vkCreateShaderModule;

VkResult function(VkDevice device, uint32_t swapchainCount, VkSwapchainCreateInfoKHR* pCreateInfos, VkAllocationCallbacks* pAllocator, VkSwapchainKHR* pSwapchains)
	vkCreateSharedSwapchainsKHR;

VkResult function(VkDevice device, VkSwapchainCreateInfoKHR* pCreateInfo, VkAllocationCallbacks* pAllocator, VkSwapchainKHR* pSwapchain)
	vkCreateSwapchainKHR;

VkResult function(VkDevice device, VkValidationCacheCreateInfoEXT* pCreateInfo, VkAllocationCallbacks* pAllocator, VkValidationCacheEXT* pValidationCache)
	vkCreateValidationCacheEXT;

VkResult function(VkInstance instance, VkWin32SurfaceCreateInfoKHR* pCreateInfo, VkAllocationCallbacks* pAllocator, VkSurfaceKHR* pSurface)
	vkCreateWin32SurfaceKHR;

VkResult function(VkDevice device, VkDebugMarkerObjectNameInfoEXT* pNameInfo)
	vkDebugMarkerSetObjectNameEXT;

VkResult function(VkDevice device, VkDebugMarkerObjectTagInfoEXT* pTagInfo)
	vkDebugMarkerSetObjectTagEXT;

void function(VkInstance instance, VkDebugReportFlagsEXT flags, VkDebugReportObjectTypeEXT objectType, uint64_t object, size_t location, int32_t messageCode, immutable(char)* pLayerPrefix, immutable(char)* pMessage)
	vkDebugReportMessageEXT;

VkResult function(VkDevice device, VkDeferredOperationKHR operation)
	vkDeferredOperationJoinKHR;

void function(VkDevice device, VkAccelerationStructureKHR accelerationStructure, VkAllocationCallbacks* pAllocator)
	vkDestroyAccelerationStructureKHR;

void function(VkDevice device, VkAccelerationStructureNV accelerationStructure, VkAllocationCallbacks* pAllocator)
	vkDestroyAccelerationStructureNV;

void function(VkDevice device, VkBuffer buffer, VkAllocationCallbacks* pAllocator)
	vkDestroyBuffer;

void function(VkDevice device, VkBufferView bufferView, VkAllocationCallbacks* pAllocator)
	vkDestroyBufferView;

void function(VkDevice device, VkCommandPool commandPool, VkAllocationCallbacks* pAllocator)
	vkDestroyCommandPool;

void function(VkDevice device, VkCuFunctionNVX function_, VkAllocationCallbacks* pAllocator)
	vkDestroyCuFunctionNVX;

void function(VkDevice device, VkCuModuleNVX module_, VkAllocationCallbacks* pAllocator)
	vkDestroyCuModuleNVX;

void function(VkInstance instance, VkDebugReportCallbackEXT callback, VkAllocationCallbacks* pAllocator)
	vkDestroyDebugReportCallbackEXT;

void function(VkInstance instance, VkDebugUtilsMessengerEXT messenger, VkAllocationCallbacks* pAllocator)
	vkDestroyDebugUtilsMessengerEXT;

void function(VkDevice device, VkDeferredOperationKHR operation, VkAllocationCallbacks* pAllocator)
	vkDestroyDeferredOperationKHR;

void function(VkDevice device, VkDescriptorPool descriptorPool, VkAllocationCallbacks* pAllocator)
	vkDestroyDescriptorPool;

void function(VkDevice device, VkDescriptorSetLayout descriptorSetLayout, VkAllocationCallbacks* pAllocator)
	vkDestroyDescriptorSetLayout;

void function(VkDevice device, VkDescriptorUpdateTemplate descriptorUpdateTemplate, VkAllocationCallbacks* pAllocator)
	vkDestroyDescriptorUpdateTemplate;

void function(VkDevice device, VkDescriptorUpdateTemplate descriptorUpdateTemplate, VkAllocationCallbacks* pAllocator)
	vkDestroyDescriptorUpdateTemplateKHR;

void function(VkDevice device, VkAllocationCallbacks* pAllocator)
	vkDestroyDevice;

void function(VkDevice device, VkEvent event, VkAllocationCallbacks* pAllocator)
	vkDestroyEvent;

void function(VkDevice device, VkFence fence, VkAllocationCallbacks* pAllocator)
	vkDestroyFence;

void function(VkDevice device, VkFramebuffer framebuffer, VkAllocationCallbacks* pAllocator)
	vkDestroyFramebuffer;

void function(VkDevice device, VkImage image, VkAllocationCallbacks* pAllocator)
	vkDestroyImage;

void function(VkDevice device, VkImageView imageView, VkAllocationCallbacks* pAllocator)
	vkDestroyImageView;

void function(VkDevice device, VkIndirectCommandsLayoutNV indirectCommandsLayout, VkAllocationCallbacks* pAllocator)
	vkDestroyIndirectCommandsLayoutNV;

void function(VkInstance instance, VkAllocationCallbacks* pAllocator)
	vkDestroyInstance;

void function(VkDevice device, VkPipeline pipeline, VkAllocationCallbacks* pAllocator)
	vkDestroyPipeline;

void function(VkDevice device, VkPipelineCache pipelineCache, VkAllocationCallbacks* pAllocator)
	vkDestroyPipelineCache;

void function(VkDevice device, VkPipelineLayout pipelineLayout, VkAllocationCallbacks* pAllocator)
	vkDestroyPipelineLayout;

void function(VkDevice device, VkPrivateDataSlot privateDataSlot, VkAllocationCallbacks* pAllocator)
	vkDestroyPrivateDataSlot;

void function(VkDevice device, VkPrivateDataSlot privateDataSlot, VkAllocationCallbacks* pAllocator)
	vkDestroyPrivateDataSlotEXT;

void function(VkDevice device, VkQueryPool queryPool, VkAllocationCallbacks* pAllocator)
	vkDestroyQueryPool;

void function(VkDevice device, VkRenderPass renderPass, VkAllocationCallbacks* pAllocator)
	vkDestroyRenderPass;

void function(VkDevice device, VkSampler sampler, VkAllocationCallbacks* pAllocator)
	vkDestroySampler;

void function(VkDevice device, VkSamplerYcbcrConversion ycbcrConversion, VkAllocationCallbacks* pAllocator)
	vkDestroySamplerYcbcrConversion;

void function(VkDevice device, VkSamplerYcbcrConversion ycbcrConversion, VkAllocationCallbacks* pAllocator)
	vkDestroySamplerYcbcrConversionKHR;

void function(VkDevice device, VkSemaphore semaphore, VkAllocationCallbacks* pAllocator)
	vkDestroySemaphore;

void function(VkDevice device, VkShaderModule shaderModule, VkAllocationCallbacks* pAllocator)
	vkDestroyShaderModule;

void function(VkInstance instance, VkSurfaceKHR surface, VkAllocationCallbacks* pAllocator)
	vkDestroySurfaceKHR;

void function(VkDevice device, VkSwapchainKHR swapchain, VkAllocationCallbacks* pAllocator)
	vkDestroySwapchainKHR;

void function(VkDevice device, VkValidationCacheEXT validationCache, VkAllocationCallbacks* pAllocator)
	vkDestroyValidationCacheEXT;

VkResult function(VkDevice device)
	vkDeviceWaitIdle;

VkResult function(VkDevice device, VkDisplayKHR display, VkDisplayPowerInfoEXT* pDisplayPowerInfo)
	vkDisplayPowerControlEXT;

VkResult function(VkCommandBuffer commandBuffer)
	vkEndCommandBuffer;

VkResult function(VkPhysicalDevice physicalDevice, immutable(char)* pLayerName, uint32_t* pPropertyCount, VkExtensionProperties* pProperties)
	vkEnumerateDeviceExtensionProperties;

VkResult function(VkPhysicalDevice physicalDevice, uint32_t* pPropertyCount, VkLayerProperties* pProperties)
	vkEnumerateDeviceLayerProperties;

VkResult function(immutable(char)* pLayerName, uint32_t* pPropertyCount, VkExtensionProperties* pProperties)
	vkEnumerateInstanceExtensionProperties;

VkResult function(uint32_t* pPropertyCount, VkLayerProperties* pProperties)
	vkEnumerateInstanceLayerProperties;

VkResult function(uint32_t* pApiVersion)
	vkEnumerateInstanceVersion;

VkResult function(VkInstance instance, uint32_t* pPhysicalDeviceGroupCount, VkPhysicalDeviceGroupProperties* pPhysicalDeviceGroupProperties)
	vkEnumeratePhysicalDeviceGroups;

VkResult function(VkInstance instance, uint32_t* pPhysicalDeviceGroupCount, VkPhysicalDeviceGroupProperties* pPhysicalDeviceGroupProperties)
	vkEnumeratePhysicalDeviceGroupsKHR;

VkResult function(VkPhysicalDevice physicalDevice, uint32_t queueFamilyIndex, uint32_t* pCounterCount, VkPerformanceCounterKHR* pCounters, VkPerformanceCounterDescriptionKHR* pCounterDescriptions)
	vkEnumeratePhysicalDeviceQueueFamilyPerformanceQueryCountersKHR;

VkResult function(VkInstance instance, uint32_t* pPhysicalDeviceCount, VkPhysicalDevice* pPhysicalDevices)
	vkEnumeratePhysicalDevices;

VkResult function(VkDevice device, uint32_t memoryRangeCount, VkMappedMemoryRange* pMemoryRanges)
	vkFlushMappedMemoryRanges;

void function(VkDevice device, VkCommandPool commandPool, uint32_t commandBufferCount, VkCommandBuffer* pCommandBuffers)
	vkFreeCommandBuffers;

VkResult function(VkDevice device, VkDescriptorPool descriptorPool, uint32_t descriptorSetCount, VkDescriptorSet* pDescriptorSets)
	vkFreeDescriptorSets;

void function(VkDevice device, VkDeviceMemory memory, VkAllocationCallbacks* pAllocator)
	vkFreeMemory;

void function(VkDevice device, VkAccelerationStructureBuildTypeKHR buildType, VkAccelerationStructureBuildGeometryInfoKHR* pBuildInfo, uint32_t* pMaxPrimitiveCounts, VkAccelerationStructureBuildSizesInfoKHR* pSizeInfo)
	vkGetAccelerationStructureBuildSizesKHR;

VkDeviceAddress function(VkDevice device, VkAccelerationStructureDeviceAddressInfoKHR* pInfo)
	vkGetAccelerationStructureDeviceAddressKHR;

VkResult function(VkDevice device, VkAccelerationStructureNV accelerationStructure, size_t dataSize, void* pData)
	vkGetAccelerationStructureHandleNV;

void function(VkDevice device, VkAccelerationStructureMemoryRequirementsInfoNV* pInfo, VkMemoryRequirements2KHR* pMemoryRequirements)
	vkGetAccelerationStructureMemoryRequirementsNV;

VkDeviceAddress function(VkDevice device, VkBufferDeviceAddressInfo* pInfo)
	vkGetBufferDeviceAddress;

VkDeviceAddress function(VkDevice device, VkBufferDeviceAddressInfo* pInfo)
	vkGetBufferDeviceAddressEXT;

VkDeviceAddress function(VkDevice device, VkBufferDeviceAddressInfo* pInfo)
	vkGetBufferDeviceAddressKHR;

void function(VkDevice device, VkBuffer buffer, VkMemoryRequirements* pMemoryRequirements)
	vkGetBufferMemoryRequirements;

void function(VkDevice device, VkBufferMemoryRequirementsInfo2* pInfo, VkMemoryRequirements2* pMemoryRequirements)
	vkGetBufferMemoryRequirements2;

void function(VkDevice device, VkBufferMemoryRequirementsInfo2* pInfo, VkMemoryRequirements2* pMemoryRequirements)
	vkGetBufferMemoryRequirements2KHR;

uint64_t function(VkDevice device, VkBufferDeviceAddressInfo* pInfo)
	vkGetBufferOpaqueCaptureAddress;

uint64_t function(VkDevice device, VkBufferDeviceAddressInfo* pInfo)
	vkGetBufferOpaqueCaptureAddressKHR;

VkResult function(VkDevice device, uint32_t timestampCount, VkCalibratedTimestampInfoEXT* pTimestampInfos, uint64_t* pTimestamps, uint64_t* pMaxDeviation)
	vkGetCalibratedTimestampsEXT;

uint32_t function(VkDevice device, VkDeferredOperationKHR operation)
	vkGetDeferredOperationMaxConcurrencyKHR;

VkResult function(VkDevice device, VkDeferredOperationKHR operation)
	vkGetDeferredOperationResultKHR;

void function(VkDevice device, VkDescriptorSet descriptorSet, void** ppData)
	vkGetDescriptorSetHostMappingVALVE;

void function(VkDevice device, VkDescriptorSetBindingReferenceVALVE* pBindingReference, VkDescriptorSetLayoutHostMappingInfoVALVE* pHostMapping)
	vkGetDescriptorSetLayoutHostMappingInfoVALVE;

void function(VkDevice device, VkDescriptorSetLayoutCreateInfo* pCreateInfo, VkDescriptorSetLayoutSupport* pSupport)
	vkGetDescriptorSetLayoutSupport;

void function(VkDevice device, VkDescriptorSetLayoutCreateInfo* pCreateInfo, VkDescriptorSetLayoutSupport* pSupport)
	vkGetDescriptorSetLayoutSupportKHR;

void function(VkDevice device, VkAccelerationStructureVersionInfoKHR* pVersionInfo, VkAccelerationStructureCompatibilityKHR* pCompatibility)
	vkGetDeviceAccelerationStructureCompatibilityKHR;

void function(VkDevice device, VkDeviceBufferMemoryRequirements* pInfo, VkMemoryRequirements2* pMemoryRequirements)
	vkGetDeviceBufferMemoryRequirements;

void function(VkDevice device, VkDeviceBufferMemoryRequirements* pInfo, VkMemoryRequirements2* pMemoryRequirements)
	vkGetDeviceBufferMemoryRequirementsKHR;

void function(VkDevice device, uint32_t heapIndex, uint32_t localDeviceIndex, uint32_t remoteDeviceIndex, VkPeerMemoryFeatureFlags* pPeerMemoryFeatures)
	vkGetDeviceGroupPeerMemoryFeatures;

void function(VkDevice device, uint32_t heapIndex, uint32_t localDeviceIndex, uint32_t remoteDeviceIndex, VkPeerMemoryFeatureFlags* pPeerMemoryFeatures)
	vkGetDeviceGroupPeerMemoryFeaturesKHR;

VkResult function(VkDevice device, VkDeviceGroupPresentCapabilitiesKHR* pDeviceGroupPresentCapabilities)
	vkGetDeviceGroupPresentCapabilitiesKHR;

VkResult function(VkDevice device, VkPhysicalDeviceSurfaceInfo2KHR* pSurfaceInfo, VkDeviceGroupPresentModeFlagsKHR* pModes)
	vkGetDeviceGroupSurfacePresentModes2EXT;

VkResult function(VkDevice device, VkSurfaceKHR surface, VkDeviceGroupPresentModeFlagsKHR* pModes)
	vkGetDeviceGroupSurfacePresentModesKHR;

void function(VkDevice device, VkDeviceImageMemoryRequirements* pInfo, VkMemoryRequirements2* pMemoryRequirements)
	vkGetDeviceImageMemoryRequirements;

void function(VkDevice device, VkDeviceImageMemoryRequirements* pInfo, VkMemoryRequirements2* pMemoryRequirements)
	vkGetDeviceImageMemoryRequirementsKHR;

void function(VkDevice device, VkDeviceImageMemoryRequirements* pInfo, uint32_t* pSparseMemoryRequirementCount, VkSparseImageMemoryRequirements2* pSparseMemoryRequirements)
	vkGetDeviceImageSparseMemoryRequirements;

void function(VkDevice device, VkDeviceImageMemoryRequirements* pInfo, uint32_t* pSparseMemoryRequirementCount, VkSparseImageMemoryRequirements2* pSparseMemoryRequirements)
	vkGetDeviceImageSparseMemoryRequirementsKHR;

void function(VkDevice device, VkDeviceMemory memory, VkDeviceSize* pCommittedMemoryInBytes)
	vkGetDeviceMemoryCommitment;

uint64_t function(VkDevice device, VkDeviceMemoryOpaqueCaptureAddressInfo* pInfo)
	vkGetDeviceMemoryOpaqueCaptureAddress;

uint64_t function(VkDevice device, VkDeviceMemoryOpaqueCaptureAddressInfo* pInfo)
	vkGetDeviceMemoryOpaqueCaptureAddressKHR;

PFN_vkVoidFunction function(VkDevice device, immutable(char)* pName)
	vkGetDeviceProcAddr;

void function(VkDevice device, uint32_t queueFamilyIndex, uint32_t queueIndex, VkQueue* pQueue)
	vkGetDeviceQueue;

void function(VkDevice device, VkDeviceQueueInfo2* pQueueInfo, VkQueue* pQueue)
	vkGetDeviceQueue2;

VkResult function(VkDevice device, VkRenderPass renderpass, VkExtent2D* pMaxWorkgroupSize)
	vkGetDeviceSubpassShadingMaxWorkgroupSizeHUAWEI;

VkResult function(VkPhysicalDevice physicalDevice, VkDisplayKHR display, uint32_t* pPropertyCount, VkDisplayModeProperties2KHR* pProperties)
	vkGetDisplayModeProperties2KHR;

VkResult function(VkPhysicalDevice physicalDevice, VkDisplayKHR display, uint32_t* pPropertyCount, VkDisplayModePropertiesKHR* pProperties)
	vkGetDisplayModePropertiesKHR;

VkResult function(VkPhysicalDevice physicalDevice, VkDisplayPlaneInfo2KHR* pDisplayPlaneInfo, VkDisplayPlaneCapabilities2KHR* pCapabilities)
	vkGetDisplayPlaneCapabilities2KHR;

VkResult function(VkPhysicalDevice physicalDevice, VkDisplayModeKHR mode, uint32_t planeIndex, VkDisplayPlaneCapabilitiesKHR* pCapabilities)
	vkGetDisplayPlaneCapabilitiesKHR;

VkResult function(VkPhysicalDevice physicalDevice, uint32_t planeIndex, uint32_t* pDisplayCount, VkDisplayKHR* pDisplays)
	vkGetDisplayPlaneSupportedDisplaysKHR;

VkResult function(VkPhysicalDevice physicalDevice, int32_t drmFd, uint32_t connectorId, VkDisplayKHR* display)
	vkGetDrmDisplayEXT;

VkResult function(VkDevice device, VkEvent event)
	vkGetEventStatus;

VkResult function(VkDevice device, VkFenceGetFdInfoKHR* pGetFdInfo, int* pFd)
	vkGetFenceFdKHR;

VkResult function(VkDevice device, VkFence fence)
	vkGetFenceStatus;

VkResult function(VkDevice device, VkFenceGetWin32HandleInfoKHR* pGetWin32HandleInfo, HANDLE* pHandle)
	vkGetFenceWin32HandleKHR;

void function(VkDevice device, VkGeneratedCommandsMemoryRequirementsInfoNV* pInfo, VkMemoryRequirements2* pMemoryRequirements)
	vkGetGeneratedCommandsMemoryRequirementsNV;

VkResult function(VkDevice device, VkImage image, VkImageDrmFormatModifierPropertiesEXT* pProperties)
	vkGetImageDrmFormatModifierPropertiesEXT;

void function(VkDevice device, VkImage image, VkMemoryRequirements* pMemoryRequirements)
	vkGetImageMemoryRequirements;

void function(VkDevice device, VkImageMemoryRequirementsInfo2* pInfo, VkMemoryRequirements2* pMemoryRequirements)
	vkGetImageMemoryRequirements2;

void function(VkDevice device, VkImageMemoryRequirementsInfo2* pInfo, VkMemoryRequirements2* pMemoryRequirements)
	vkGetImageMemoryRequirements2KHR;

void function(VkDevice device, VkImage image, uint32_t* pSparseMemoryRequirementCount, VkSparseImageMemoryRequirements* pSparseMemoryRequirements)
	vkGetImageSparseMemoryRequirements;

void function(VkDevice device, VkImageSparseMemoryRequirementsInfo2* pInfo, uint32_t* pSparseMemoryRequirementCount, VkSparseImageMemoryRequirements2* pSparseMemoryRequirements)
	vkGetImageSparseMemoryRequirements2;

void function(VkDevice device, VkImageSparseMemoryRequirementsInfo2* pInfo, uint32_t* pSparseMemoryRequirementCount, VkSparseImageMemoryRequirements2* pSparseMemoryRequirements)
	vkGetImageSparseMemoryRequirements2KHR;

void function(VkDevice device, VkImage image, VkImageSubresource* pSubresource, VkSubresourceLayout* pLayout)
	vkGetImageSubresourceLayout;

VkResult function(VkDevice device, VkImageView imageView, VkImageViewAddressPropertiesNVX* pProperties)
	vkGetImageViewAddressNVX;

uint32_t function(VkDevice device, VkImageViewHandleInfoNVX* pInfo)
	vkGetImageViewHandleNVX;

PFN_vkVoidFunction function(VkInstance instance, immutable(char)* pName)
	vkGetInstanceProcAddr;

VkResult function(VkDevice device, VkMemoryGetFdInfoKHR* pGetFdInfo, int* pFd)
	vkGetMemoryFdKHR;

VkResult function(VkDevice device, VkExternalMemoryHandleTypeFlagBits handleType, int fd, VkMemoryFdPropertiesKHR* pMemoryFdProperties)
	vkGetMemoryFdPropertiesKHR;

VkResult function(VkDevice device, VkExternalMemoryHandleTypeFlagBits handleType, void* pHostPointer, VkMemoryHostPointerPropertiesEXT* pMemoryHostPointerProperties)
	vkGetMemoryHostPointerPropertiesEXT;

VkResult function(VkDevice device, VkMemoryGetRemoteAddressInfoNV* pMemoryGetRemoteAddressInfo, VkRemoteAddressNV* pAddress)
	vkGetMemoryRemoteAddressNV;

VkResult function(VkDevice device, VkMemoryGetWin32HandleInfoKHR* pGetWin32HandleInfo, HANDLE* pHandle)
	vkGetMemoryWin32HandleKHR;

VkResult function(VkDevice device, VkDeviceMemory memory, VkExternalMemoryHandleTypeFlagsNV handleType, HANDLE* pHandle)
	vkGetMemoryWin32HandleNV;

VkResult function(VkDevice device, VkExternalMemoryHandleTypeFlagBits handleType, VkMemoryWin32HandlePropertiesKHR* pMemoryWin32HandleProperties)
	vkGetMemoryWin32HandlePropertiesKHR;

VkResult function(VkDevice device, VkSwapchainKHR swapchain, uint32_t* pPresentationTimingCount, VkPastPresentationTimingGOOGLE* pPresentationTimings)
	vkGetPastPresentationTimingGOOGLE;

VkResult function(VkDevice device, VkPerformanceParameterTypeINTEL parameter, VkPerformanceValueINTEL* pValue)
	vkGetPerformanceParameterINTEL;

VkResult function(VkPhysicalDevice physicalDevice, uint32_t* pTimeDomainCount, VkTimeDomainEXT* pTimeDomains)
	vkGetPhysicalDeviceCalibrateableTimeDomainsEXT;

VkResult function(VkPhysicalDevice physicalDevice, uint32_t* pPropertyCount, VkCooperativeMatrixPropertiesNV* pProperties)
	vkGetPhysicalDeviceCooperativeMatrixPropertiesNV;

VkResult function(VkPhysicalDevice physicalDevice, uint32_t* pPropertyCount, VkDisplayPlaneProperties2KHR* pProperties)
	vkGetPhysicalDeviceDisplayPlaneProperties2KHR;

VkResult function(VkPhysicalDevice physicalDevice, uint32_t* pPropertyCount, VkDisplayPlanePropertiesKHR* pProperties)
	vkGetPhysicalDeviceDisplayPlanePropertiesKHR;

VkResult function(VkPhysicalDevice physicalDevice, uint32_t* pPropertyCount, VkDisplayProperties2KHR* pProperties)
	vkGetPhysicalDeviceDisplayProperties2KHR;

VkResult function(VkPhysicalDevice physicalDevice, uint32_t* pPropertyCount, VkDisplayPropertiesKHR* pProperties)
	vkGetPhysicalDeviceDisplayPropertiesKHR;

void function(VkPhysicalDevice physicalDevice, VkPhysicalDeviceExternalBufferInfo* pExternalBufferInfo, VkExternalBufferProperties* pExternalBufferProperties)
	vkGetPhysicalDeviceExternalBufferProperties;

void function(VkPhysicalDevice physicalDevice, VkPhysicalDeviceExternalBufferInfo* pExternalBufferInfo, VkExternalBufferProperties* pExternalBufferProperties)
	vkGetPhysicalDeviceExternalBufferPropertiesKHR;

void function(VkPhysicalDevice physicalDevice, VkPhysicalDeviceExternalFenceInfo* pExternalFenceInfo, VkExternalFenceProperties* pExternalFenceProperties)
	vkGetPhysicalDeviceExternalFenceProperties;

void function(VkPhysicalDevice physicalDevice, VkPhysicalDeviceExternalFenceInfo* pExternalFenceInfo, VkExternalFenceProperties* pExternalFenceProperties)
	vkGetPhysicalDeviceExternalFencePropertiesKHR;

VkResult function(VkPhysicalDevice physicalDevice, VkFormat format, VkImageType type, VkImageTiling tiling, VkImageUsageFlags usage, VkImageCreateFlags flags, VkExternalMemoryHandleTypeFlagsNV externalHandleType, VkExternalImageFormatPropertiesNV* pExternalImageFormatProperties)
	vkGetPhysicalDeviceExternalImageFormatPropertiesNV;

void function(VkPhysicalDevice physicalDevice, VkPhysicalDeviceExternalSemaphoreInfo* pExternalSemaphoreInfo, VkExternalSemaphoreProperties* pExternalSemaphoreProperties)
	vkGetPhysicalDeviceExternalSemaphoreProperties;

void function(VkPhysicalDevice physicalDevice, VkPhysicalDeviceExternalSemaphoreInfo* pExternalSemaphoreInfo, VkExternalSemaphoreProperties* pExternalSemaphoreProperties)
	vkGetPhysicalDeviceExternalSemaphorePropertiesKHR;

void function(VkPhysicalDevice physicalDevice, VkPhysicalDeviceFeatures* pFeatures)
	vkGetPhysicalDeviceFeatures;

void function(VkPhysicalDevice physicalDevice, VkPhysicalDeviceFeatures2* pFeatures)
	vkGetPhysicalDeviceFeatures2;

void function(VkPhysicalDevice physicalDevice, VkPhysicalDeviceFeatures2* pFeatures)
	vkGetPhysicalDeviceFeatures2KHR;

void function(VkPhysicalDevice physicalDevice, VkFormat format, VkFormatProperties* pFormatProperties)
	vkGetPhysicalDeviceFormatProperties;

void function(VkPhysicalDevice physicalDevice, VkFormat format, VkFormatProperties2* pFormatProperties)
	vkGetPhysicalDeviceFormatProperties2;

void function(VkPhysicalDevice physicalDevice, VkFormat format, VkFormatProperties2* pFormatProperties)
	vkGetPhysicalDeviceFormatProperties2KHR;

VkResult function(VkPhysicalDevice physicalDevice, uint32_t* pFragmentShadingRateCount, VkPhysicalDeviceFragmentShadingRateKHR* pFragmentShadingRates)
	vkGetPhysicalDeviceFragmentShadingRatesKHR;

VkResult function(VkPhysicalDevice physicalDevice, VkFormat format, VkImageType type, VkImageTiling tiling, VkImageUsageFlags usage, VkImageCreateFlags flags, VkImageFormatProperties* pImageFormatProperties)
	vkGetPhysicalDeviceImageFormatProperties;

VkResult function(VkPhysicalDevice physicalDevice, VkPhysicalDeviceImageFormatInfo2* pImageFormatInfo, VkImageFormatProperties2* pImageFormatProperties)
	vkGetPhysicalDeviceImageFormatProperties2;

VkResult function(VkPhysicalDevice physicalDevice, VkPhysicalDeviceImageFormatInfo2* pImageFormatInfo, VkImageFormatProperties2* pImageFormatProperties)
	vkGetPhysicalDeviceImageFormatProperties2KHR;

void function(VkPhysicalDevice physicalDevice, VkPhysicalDeviceMemoryProperties* pMemoryProperties)
	vkGetPhysicalDeviceMemoryProperties;

void function(VkPhysicalDevice physicalDevice, VkPhysicalDeviceMemoryProperties2* pMemoryProperties)
	vkGetPhysicalDeviceMemoryProperties2;

void function(VkPhysicalDevice physicalDevice, VkPhysicalDeviceMemoryProperties2* pMemoryProperties)
	vkGetPhysicalDeviceMemoryProperties2KHR;

void function(VkPhysicalDevice physicalDevice, VkSampleCountFlagBits samples, VkMultisamplePropertiesEXT* pMultisampleProperties)
	vkGetPhysicalDeviceMultisamplePropertiesEXT;

VkResult function(VkPhysicalDevice physicalDevice, VkSurfaceKHR surface, uint32_t* pRectCount, VkRect2D* pRects)
	vkGetPhysicalDevicePresentRectanglesKHR;

void function(VkPhysicalDevice physicalDevice, VkPhysicalDeviceProperties* pProperties)
	vkGetPhysicalDeviceProperties;

void function(VkPhysicalDevice physicalDevice, VkPhysicalDeviceProperties2* pProperties)
	vkGetPhysicalDeviceProperties2;

void function(VkPhysicalDevice physicalDevice, VkPhysicalDeviceProperties2* pProperties)
	vkGetPhysicalDeviceProperties2KHR;

void function(VkPhysicalDevice physicalDevice, VkQueryPoolPerformanceCreateInfoKHR* pPerformanceQueryCreateInfo, uint32_t* pNumPasses)
	vkGetPhysicalDeviceQueueFamilyPerformanceQueryPassesKHR;

void function(VkPhysicalDevice physicalDevice, uint32_t* pQueueFamilyPropertyCount, VkQueueFamilyProperties* pQueueFamilyProperties)
	vkGetPhysicalDeviceQueueFamilyProperties;

void function(VkPhysicalDevice physicalDevice, uint32_t* pQueueFamilyPropertyCount, VkQueueFamilyProperties2* pQueueFamilyProperties)
	vkGetPhysicalDeviceQueueFamilyProperties2;

void function(VkPhysicalDevice physicalDevice, uint32_t* pQueueFamilyPropertyCount, VkQueueFamilyProperties2* pQueueFamilyProperties)
	vkGetPhysicalDeviceQueueFamilyProperties2KHR;

void function(VkPhysicalDevice physicalDevice, VkFormat format, VkImageType type, VkSampleCountFlagBits samples, VkImageUsageFlags usage, VkImageTiling tiling, uint32_t* pPropertyCount, VkSparseImageFormatProperties* pProperties)
	vkGetPhysicalDeviceSparseImageFormatProperties;

void function(VkPhysicalDevice physicalDevice, VkPhysicalDeviceSparseImageFormatInfo2* pFormatInfo, uint32_t* pPropertyCount, VkSparseImageFormatProperties2* pProperties)
	vkGetPhysicalDeviceSparseImageFormatProperties2;

void function(VkPhysicalDevice physicalDevice, VkPhysicalDeviceSparseImageFormatInfo2* pFormatInfo, uint32_t* pPropertyCount, VkSparseImageFormatProperties2* pProperties)
	vkGetPhysicalDeviceSparseImageFormatProperties2KHR;

VkResult function(VkPhysicalDevice physicalDevice, uint32_t* pCombinationCount, VkFramebufferMixedSamplesCombinationNV* pCombinations)
	vkGetPhysicalDeviceSupportedFramebufferMixedSamplesCombinationsNV;

VkResult function(VkPhysicalDevice physicalDevice, VkSurfaceKHR surface, VkSurfaceCapabilities2EXT* pSurfaceCapabilities)
	vkGetPhysicalDeviceSurfaceCapabilities2EXT;

VkResult function(VkPhysicalDevice physicalDevice, VkPhysicalDeviceSurfaceInfo2KHR* pSurfaceInfo, VkSurfaceCapabilities2KHR* pSurfaceCapabilities)
	vkGetPhysicalDeviceSurfaceCapabilities2KHR;

VkResult function(VkPhysicalDevice physicalDevice, VkSurfaceKHR surface, VkSurfaceCapabilitiesKHR* pSurfaceCapabilities)
	vkGetPhysicalDeviceSurfaceCapabilitiesKHR;

VkResult function(VkPhysicalDevice physicalDevice, VkPhysicalDeviceSurfaceInfo2KHR* pSurfaceInfo, uint32_t* pSurfaceFormatCount, VkSurfaceFormat2KHR* pSurfaceFormats)
	vkGetPhysicalDeviceSurfaceFormats2KHR;

VkResult function(VkPhysicalDevice physicalDevice, VkSurfaceKHR surface, uint32_t* pSurfaceFormatCount, VkSurfaceFormatKHR* pSurfaceFormats)
	vkGetPhysicalDeviceSurfaceFormatsKHR;

VkResult function(VkPhysicalDevice physicalDevice, VkPhysicalDeviceSurfaceInfo2KHR* pSurfaceInfo, uint32_t* pPresentModeCount, VkPresentModeKHR* pPresentModes)
	vkGetPhysicalDeviceSurfacePresentModes2EXT;

VkResult function(VkPhysicalDevice physicalDevice, VkSurfaceKHR surface, uint32_t* pPresentModeCount, VkPresentModeKHR* pPresentModes)
	vkGetPhysicalDeviceSurfacePresentModesKHR;

VkResult function(VkPhysicalDevice physicalDevice, uint32_t queueFamilyIndex, VkSurfaceKHR surface, VkBool32* pSupported)
	vkGetPhysicalDeviceSurfaceSupportKHR;

VkResult function(VkPhysicalDevice physicalDevice, uint32_t* pToolCount, VkPhysicalDeviceToolProperties* pToolProperties)
	vkGetPhysicalDeviceToolProperties;

VkResult function(VkPhysicalDevice physicalDevice, uint32_t* pToolCount, VkPhysicalDeviceToolProperties* pToolProperties)
	vkGetPhysicalDeviceToolPropertiesEXT;

VkBool32 function(VkPhysicalDevice physicalDevice, uint32_t queueFamilyIndex)
	vkGetPhysicalDeviceWin32PresentationSupportKHR;

VkResult function(VkDevice device, VkPipelineCache pipelineCache, size_t* pDataSize, void* pData)
	vkGetPipelineCacheData;

VkResult function(VkDevice device, VkPipelineExecutableInfoKHR* pExecutableInfo, uint32_t* pInternalRepresentationCount, VkPipelineExecutableInternalRepresentationKHR* pInternalRepresentations)
	vkGetPipelineExecutableInternalRepresentationsKHR;

VkResult function(VkDevice device, VkPipelineInfoKHR* pPipelineInfo, uint32_t* pExecutableCount, VkPipelineExecutablePropertiesKHR* pProperties)
	vkGetPipelineExecutablePropertiesKHR;

VkResult function(VkDevice device, VkPipelineExecutableInfoKHR* pExecutableInfo, uint32_t* pStatisticCount, VkPipelineExecutableStatisticKHR* pStatistics)
	vkGetPipelineExecutableStatisticsKHR;

void function(VkDevice device, VkObjectType objectType, uint64_t objectHandle, VkPrivateDataSlot privateDataSlot, uint64_t* pData)
	vkGetPrivateData;

void function(VkDevice device, VkObjectType objectType, uint64_t objectHandle, VkPrivateDataSlot privateDataSlot, uint64_t* pData)
	vkGetPrivateDataEXT;

VkResult function(VkDevice device, VkQueryPool queryPool, uint32_t firstQuery, uint32_t queryCount, size_t dataSize, void* pData, VkDeviceSize stride, VkQueryResultFlags flags)
	vkGetQueryPoolResults;

void function(VkQueue queue, uint32_t* pCheckpointDataCount, VkCheckpointData2NV* pCheckpointData)
	vkGetQueueCheckpointData2NV;

void function(VkQueue queue, uint32_t* pCheckpointDataCount, VkCheckpointDataNV* pCheckpointData)
	vkGetQueueCheckpointDataNV;

VkResult function(VkDevice device, VkPipeline pipeline, uint32_t firstGroup, uint32_t groupCount, size_t dataSize, void* pData)
	vkGetRayTracingCaptureReplayShaderGroupHandlesKHR;

VkResult function(VkDevice device, VkPipeline pipeline, uint32_t firstGroup, uint32_t groupCount, size_t dataSize, void* pData)
	vkGetRayTracingShaderGroupHandlesKHR;

VkResult function(VkDevice device, VkPipeline pipeline, uint32_t firstGroup, uint32_t groupCount, size_t dataSize, void* pData)
	vkGetRayTracingShaderGroupHandlesNV;

VkDeviceSize function(VkDevice device, VkPipeline pipeline, uint32_t group, VkShaderGroupShaderKHR groupShader)
	vkGetRayTracingShaderGroupStackSizeKHR;

VkResult function(VkDevice device, VkSwapchainKHR swapchain, VkRefreshCycleDurationGOOGLE* pDisplayTimingProperties)
	vkGetRefreshCycleDurationGOOGLE;

void function(VkDevice device, VkRenderPass renderPass, VkExtent2D* pGranularity)
	vkGetRenderAreaGranularity;

VkResult function(VkDevice device, VkSemaphore semaphore, uint64_t* pValue)
	vkGetSemaphoreCounterValue;

VkResult function(VkDevice device, VkSemaphore semaphore, uint64_t* pValue)
	vkGetSemaphoreCounterValueKHR;

VkResult function(VkDevice device, VkSemaphoreGetFdInfoKHR* pGetFdInfo, int* pFd)
	vkGetSemaphoreFdKHR;

VkResult function(VkDevice device, VkSemaphoreGetWin32HandleInfoKHR* pGetWin32HandleInfo, HANDLE* pHandle)
	vkGetSemaphoreWin32HandleKHR;

VkResult function(VkDevice device, VkPipeline pipeline, VkShaderStageFlagBits shaderStage, VkShaderInfoTypeAMD infoType, size_t* pInfoSize, void* pInfo)
	vkGetShaderInfoAMD;

VkResult function(VkDevice device, VkSwapchainKHR swapchain, VkSurfaceCounterFlagBitsEXT counter, uint64_t* pCounterValue)
	vkGetSwapchainCounterEXT;

VkResult function(VkDevice device, VkSwapchainKHR swapchain, uint32_t* pSwapchainImageCount, VkImage* pSwapchainImages)
	vkGetSwapchainImagesKHR;

VkResult function(VkDevice device, VkSwapchainKHR swapchain)
	vkGetSwapchainStatusKHR;

VkResult function(VkDevice device, VkValidationCacheEXT validationCache, size_t* pDataSize, void* pData)
	vkGetValidationCacheDataEXT;

VkResult function(VkPhysicalDevice physicalDevice, uint32_t deviceRelativeId, VkDisplayKHR* pDisplay)
	vkGetWinrtDisplayNV;

VkResult function(VkDevice device, VkImportFenceFdInfoKHR* pImportFenceFdInfo)
	vkImportFenceFdKHR;

VkResult function(VkDevice device, VkImportFenceWin32HandleInfoKHR* pImportFenceWin32HandleInfo)
	vkImportFenceWin32HandleKHR;

VkResult function(VkDevice device, VkImportSemaphoreFdInfoKHR* pImportSemaphoreFdInfo)
	vkImportSemaphoreFdKHR;

VkResult function(VkDevice device, VkImportSemaphoreWin32HandleInfoKHR* pImportSemaphoreWin32HandleInfo)
	vkImportSemaphoreWin32HandleKHR;

VkResult function(VkDevice device, VkInitializePerformanceApiInfoINTEL* pInitializeInfo)
	vkInitializePerformanceApiINTEL;

VkResult function(VkDevice device, uint32_t memoryRangeCount, VkMappedMemoryRange* pMemoryRanges)
	vkInvalidateMappedMemoryRanges;

VkResult function(VkDevice device, VkDeviceMemory memory, VkDeviceSize offset, VkDeviceSize size, VkMemoryMapFlags flags, void** ppData)
	vkMapMemory;

VkResult function(VkDevice device, VkPipelineCache dstCache, uint32_t srcCacheCount, VkPipelineCache* pSrcCaches)
	vkMergePipelineCaches;

VkResult function(VkDevice device, VkValidationCacheEXT dstCache, uint32_t srcCacheCount, VkValidationCacheEXT* pSrcCaches)
	vkMergeValidationCachesEXT;

void function(VkQueue queue, VkDebugUtilsLabelEXT* pLabelInfo)
	vkQueueBeginDebugUtilsLabelEXT;

VkResult function(VkQueue queue, uint32_t bindInfoCount, VkBindSparseInfo* pBindInfo, VkFence fence)
	vkQueueBindSparse;

void function(VkQueue queue)
	vkQueueEndDebugUtilsLabelEXT;

void function(VkQueue queue, VkDebugUtilsLabelEXT* pLabelInfo)
	vkQueueInsertDebugUtilsLabelEXT;

VkResult function(VkQueue queue, VkPresentInfoKHR* pPresentInfo)
	vkQueuePresentKHR;

VkResult function(VkQueue queue, VkPerformanceConfigurationINTEL configuration)
	vkQueueSetPerformanceConfigurationINTEL;

VkResult function(VkQueue queue, uint32_t submitCount, VkSubmitInfo* pSubmits, VkFence fence)
	vkQueueSubmit;

VkResult function(VkQueue queue, uint32_t submitCount, VkSubmitInfo2* pSubmits, VkFence fence)
	vkQueueSubmit2;

VkResult function(VkQueue queue, uint32_t submitCount, VkSubmitInfo2* pSubmits, VkFence fence)
	vkQueueSubmit2KHR;

VkResult function(VkQueue queue)
	vkQueueWaitIdle;

VkResult function(VkDevice device, VkDeviceEventInfoEXT* pDeviceEventInfo, VkAllocationCallbacks* pAllocator, VkFence* pFence)
	vkRegisterDeviceEventEXT;

VkResult function(VkDevice device, VkDisplayKHR display, VkDisplayEventInfoEXT* pDisplayEventInfo, VkAllocationCallbacks* pAllocator, VkFence* pFence)
	vkRegisterDisplayEventEXT;

VkResult function(VkPhysicalDevice physicalDevice, VkDisplayKHR display)
	vkReleaseDisplayEXT;

VkResult function(VkDevice device, VkSwapchainKHR swapchain)
	vkReleaseFullScreenExclusiveModeEXT;

VkResult function(VkDevice device, VkPerformanceConfigurationINTEL configuration)
	vkReleasePerformanceConfigurationINTEL;

void function(VkDevice device)
	vkReleaseProfilingLockKHR;

VkResult function(VkCommandBuffer commandBuffer, VkCommandBufferResetFlags flags)
	vkResetCommandBuffer;

VkResult function(VkDevice device, VkCommandPool commandPool, VkCommandPoolResetFlags flags)
	vkResetCommandPool;

VkResult function(VkDevice device, VkDescriptorPool descriptorPool, VkDescriptorPoolResetFlags flags)
	vkResetDescriptorPool;

VkResult function(VkDevice device, VkEvent event)
	vkResetEvent;

VkResult function(VkDevice device, uint32_t fenceCount, VkFence* pFences)
	vkResetFences;

void function(VkDevice device, VkQueryPool queryPool, uint32_t firstQuery, uint32_t queryCount)
	vkResetQueryPool;

void function(VkDevice device, VkQueryPool queryPool, uint32_t firstQuery, uint32_t queryCount)
	vkResetQueryPoolEXT;

VkResult function(VkDevice device, VkDebugUtilsObjectNameInfoEXT* pNameInfo)
	vkSetDebugUtilsObjectNameEXT;

VkResult function(VkDevice device, VkDebugUtilsObjectTagInfoEXT* pTagInfo)
	vkSetDebugUtilsObjectTagEXT;

void function(VkDevice device, VkDeviceMemory memory, float priority)
	vkSetDeviceMemoryPriorityEXT;

VkResult function(VkDevice device, VkEvent event)
	vkSetEvent;

void function(VkDevice device, uint32_t swapchainCount, VkSwapchainKHR* pSwapchains, VkHdrMetadataEXT* pMetadata)
	vkSetHdrMetadataEXT;

void function(VkDevice device, VkSwapchainKHR swapChain, VkBool32 localDimmingEnable)
	vkSetLocalDimmingAMD;

VkResult function(VkDevice device, VkObjectType objectType, uint64_t objectHandle, VkPrivateDataSlot privateDataSlot, uint64_t data)
	vkSetPrivateData;

VkResult function(VkDevice device, VkObjectType objectType, uint64_t objectHandle, VkPrivateDataSlot privateDataSlot, uint64_t data)
	vkSetPrivateDataEXT;

VkResult function(VkDevice device, VkSemaphoreSignalInfo* pSignalInfo)
	vkSignalSemaphore;

VkResult function(VkDevice device, VkSemaphoreSignalInfo* pSignalInfo)
	vkSignalSemaphoreKHR;

void function(VkInstance instance, VkDebugUtilsMessageSeverityFlagBitsEXT messageSeverity, VkDebugUtilsMessageTypeFlagsEXT messageTypes, VkDebugUtilsMessengerCallbackDataEXT* pCallbackData)
	vkSubmitDebugUtilsMessageEXT;

void function(VkDevice device, VkCommandPool commandPool, VkCommandPoolTrimFlags flags)
	vkTrimCommandPool;

void function(VkDevice device, VkCommandPool commandPool, VkCommandPoolTrimFlags flags)
	vkTrimCommandPoolKHR;

void function(VkDevice device)
	vkUninitializePerformanceApiINTEL;

void function(VkDevice device, VkDeviceMemory memory)
	vkUnmapMemory;

void function(VkDevice device, VkDescriptorSet descriptorSet, VkDescriptorUpdateTemplate descriptorUpdateTemplate, void* pData)
	vkUpdateDescriptorSetWithTemplate;

void function(VkDevice device, VkDescriptorSet descriptorSet, VkDescriptorUpdateTemplate descriptorUpdateTemplate, void* pData)
	vkUpdateDescriptorSetWithTemplateKHR;

void function(VkDevice device, uint32_t descriptorWriteCount, VkWriteDescriptorSet* pDescriptorWrites, uint32_t descriptorCopyCount, VkCopyDescriptorSet* pDescriptorCopies)
	vkUpdateDescriptorSets;

VkResult function(VkDevice device, uint32_t fenceCount, VkFence* pFences, VkBool32 waitAll, uint64_t timeout)
	vkWaitForFences;

VkResult function(VkDevice device, VkSwapchainKHR swapchain, uint64_t presentId, uint64_t timeout)
	vkWaitForPresentKHR;

VkResult function(VkDevice device, VkSemaphoreWaitInfo* pWaitInfo, uint64_t timeout)
	vkWaitSemaphores;

VkResult function(VkDevice device, VkSemaphoreWaitInfo* pWaitInfo, uint64_t timeout)
	vkWaitSemaphoresKHR;

VkResult function(VkDevice device, uint32_t accelerationStructureCount, VkAccelerationStructureKHR* pAccelerationStructures, VkQueryType queryType, size_t dataSize, void* pData, size_t stride)
	vkWriteAccelerationStructuresPropertiesKHR;

}} // extern(Windows), __gshared

extern(C) { nothrow __gshared {

}} // extern(C), __gshared


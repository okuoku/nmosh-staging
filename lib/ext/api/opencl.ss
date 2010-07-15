(library (ext api opencl)
         (export 
           ;; Platform API
           clGetPlatformIDs
           clGetPlatformInfo

           ;; Device API
           clGetDeviceIDs
           clGetDeviceInfo

           ;; Constants
            CL_SUCCESS
            CL_DEVICE_NOT_FOUND
            CL_DEVICE_NOT_AVAILABLE
            CL_COMPILER_NOT_AVAILABLE
            CL_MEM_OBJECT_ALLOCATION_FAILURE
            CL_OUT_OF_RESOURCES
            CL_OUT_OF_HOST_MEMORY
            CL_PROFILING_INFO_NOT_AVAILABLE
            CL_MEM_COPY_OVERLAP
            CL_IMAGE_FORMAT_MISMATCH
            CL_IMAGE_FORMAT_NOT_SUPPORTED
            CL_BUILD_PROGRAM_FAILURE
            CL_MAP_FAILURE
            CL_MISALIGNED_SUB_BUFFER_OFFSET
            CL_EXEC_STATUS_ERROR_FOR_EVENTS_IN_WAIT_LIST
            CL_INVALID_VALUE
            CL_INVALID_DEVICE_TYPE
            CL_INVALID_PLATFORM
            CL_INVALID_DEVICE
            CL_INVALID_CONTEXT
            CL_INVALID_QUEUE_PROPERTIES
            CL_INVALID_COMMAND_QUEUE
            CL_INVALID_HOST_PTR
            CL_INVALID_MEM_OBJECT
            CL_INVALID_IMAGE_FORMAT_DESCRIPTOR
            CL_INVALID_IMAGE_SIZE
            CL_INVALID_SAMPLER
            CL_INVALID_BINARY
            CL_INVALID_BUILD_OPTIONS
            CL_INVALID_PROGRAM
            CL_INVALID_PROGRAM_EXECUTABLE
            CL_INVALID_KERNEL_NAME
            CL_INVALID_KERNEL_DEFINITION
            CL_INVALID_KERNEL
            CL_INVALID_ARG_INDEX
            CL_INVALID_ARG_VALUE
            CL_INVALID_ARG_SIZE
            CL_INVALID_KERNEL_ARGS
            CL_INVALID_WORK_DIMENSION
            CL_INVALID_WORK_GROUP_SIZE
            CL_INVALID_WORK_ITEM_SIZE
            CL_INVALID_GLOBAL_OFFSET
            CL_INVALID_EVENT_WAIT_LIST
            CL_INVALID_EVENT
            CL_INVALID_OPERATION
            CL_INVALID_GL_OBJECT
            CL_INVALID_BUFFER_SIZE
            CL_INVALID_MIP_LEVEL
            CL_INVALID_GLOBAL_WORK_SIZE
            CL_VERSION_1_0
            CL_VERSION_1_1
            CL_FALSE
            CL_TRUE
            CL_PLATFORM_PROFILE
            CL_PLATFORM_VERSION
            CL_PLATFORM_NAME
            CL_PLATFORM_VENDOR
            CL_PLATFORM_EXTENSIONS
            CL_DEVICE_TYPE_DEFAULT
            CL_DEVICE_TYPE_CPU
            CL_DEVICE_TYPE_GPU
            CL_DEVICE_TYPE_ACCELERATOR
            CL_DEVICE_TYPE_ALL
            CL_DEVICE_TYPE
            CL_DEVICE_VENDOR_ID
            CL_DEVICE_MAX_COMPUTE_UNITS
            CL_DEVICE_MAX_WORK_ITEM_DIMENSIONS
            CL_DEVICE_MAX_WORK_GROUP_SIZE
            CL_DEVICE_MAX_WORK_ITEM_SIZES
            CL_DEVICE_PREFERRED_VECTOR_WIDTH_CHAR
            CL_DEVICE_PREFERRED_VECTOR_WIDTH_SHORT
            CL_DEVICE_PREFERRED_VECTOR_WIDTH_INT
            CL_DEVICE_PREFERRED_VECTOR_WIDTH_LONG
            CL_DEVICE_PREFERRED_VECTOR_WIDTH_FLOAT
            CL_DEVICE_PREFERRED_VECTOR_WIDTH_DOUBLE
            CL_DEVICE_MAX_CLOCK_FREQUENCY
            CL_DEVICE_ADDRESS_BITS
            CL_DEVICE_MAX_READ_IMAGE_ARGS
            CL_DEVICE_MAX_WRITE_IMAGE_ARGS
            CL_DEVICE_MAX_MEM_ALLOC_SIZE
            CL_DEVICE_IMAGE2D_MAX_WIDTH
            CL_DEVICE_IMAGE2D_MAX_HEIGHT
            CL_DEVICE_IMAGE3D_MAX_WIDTH
            CL_DEVICE_IMAGE3D_MAX_HEIGHT
            CL_DEVICE_IMAGE3D_MAX_DEPTH
            CL_DEVICE_IMAGE_SUPPORT
            CL_DEVICE_MAX_PARAMETER_SIZE
            CL_DEVICE_MAX_SAMPLERS
            CL_DEVICE_MEM_BASE_ADDR_ALIGN
            CL_DEVICE_MIN_DATA_TYPE_ALIGN_SIZE
            CL_DEVICE_SINGLE_FP_CONFIG
            CL_DEVICE_GLOBAL_MEM_CACHE_TYPE
            CL_DEVICE_GLOBAL_MEM_CACHELINE_SIZE
            CL_DEVICE_GLOBAL_MEM_CACHE_SIZE
            CL_DEVICE_GLOBAL_MEM_SIZE
            CL_DEVICE_MAX_CONSTANT_BUFFER_SIZE
            CL_DEVICE_MAX_CONSTANT_ARGS
            CL_DEVICE_LOCAL_MEM_TYPE
            CL_DEVICE_LOCAL_MEM_SIZE
            CL_DEVICE_ERROR_CORRECTION_SUPPORT
            CL_DEVICE_PROFILING_TIMER_RESOLUTION
            CL_DEVICE_ENDIAN_LITTLE
            CL_DEVICE_AVAILABLE
            CL_DEVICE_COMPILER_AVAILABLE
            CL_DEVICE_EXECUTION_CAPABILITIES
            CL_DEVICE_QUEUE_PROPERTIES
            CL_DEVICE_NAME
            CL_DEVICE_VENDOR
            CL_DRIVER_VERSION
            CL_DEVICE_PROFILE
            CL_DEVICE_VERSION
            CL_DEVICE_EXTENSIONS
            CL_DEVICE_PLATFORM
            CL_DEVICE_PREFERRED_VECTOR_WIDTH_HALF
            CL_DEVICE_HOST_UNIFIED_MEMORY
            CL_DEVICE_NATIVE_VECTOR_WIDTH_CHAR
            CL_DEVICE_NATIVE_VECTOR_WIDTH_SHORT
            CL_DEVICE_NATIVE_VECTOR_WIDTH_INT
            CL_DEVICE_NATIVE_VECTOR_WIDTH_LONG
            CL_DEVICE_NATIVE_VECTOR_WIDTH_FLOAT
            CL_DEVICE_NATIVE_VECTOR_WIDTH_DOUBLE
            CL_DEVICE_NATIVE_VECTOR_WIDTH_HALF
            CL_DEVICE_OPENCL_C_VERSION
            CL_FP_DENORM
            CL_FP_INF_NAN
            CL_FP_ROUND_TO_NEAREST
            CL_FP_ROUND_TO_ZERO
            CL_FP_ROUND_TO_INF
            CL_FP_FMA
            CL_FP_SOFT_FLOAT
            CL_NONE
            CL_READ_ONLY_CACHE
            CL_READ_WRITE_CACHE
            CL_LOCAL
            CL_GLOBAL
            CL_EXEC_KERNEL
            CL_EXEC_NATIVE_KERNEL
            CL_QUEUE_OUT_OF_ORDER_EXEC_MODE_ENABLE
            CL_QUEUE_PROFILING_ENABLE
            CL_CONTEXT_REFERENCE_COUNT
            CL_CONTEXT_DEVICES
            CL_CONTEXT_PROPERTIES
            CL_CONTEXT_NUM_DEVICES
            CL_CONTEXT_PLATFORM
            CL_QUEUE_CONTEXT
            CL_QUEUE_DEVICE
            CL_QUEUE_REFERENCE_COUNT
            CL_QUEUE_PROPERTIES
            CL_MEM_READ_WRITE
            CL_MEM_WRITE_ONLY
            CL_MEM_READ_ONLY
            CL_MEM_USE_HOST_PTR
            CL_MEM_ALLOC_HOST_PTR
            CL_MEM_COPY_HOST_PTR
            CL_R
            CL_A
            CL_RG
            CL_RA
            CL_RGB
            CL_RGBA
            CL_BGRA
            CL_ARGB
            CL_INTENSITY
            CL_LUMINANCE
            CL_Rx
            CL_RGx
            CL_RGBx
            CL_SNORM_INT8
            CL_SNORM_INT16
            CL_UNORM_INT8
            CL_UNORM_INT16
            CL_UNORM_SHORT_565
            CL_UNORM_SHORT_555
            CL_UNORM_INT_101010
            CL_SIGNED_INT8
            CL_SIGNED_INT16
            CL_SIGNED_INT32
            CL_UNSIGNED_INT8
            CL_UNSIGNED_INT16
            CL_UNSIGNED_INT32
            CL_HALF_FLOAT
            CL_FLOAT
            CL_MEM_OBJECT_BUFFER
            CL_MEM_OBJECT_IMAGE2D
            CL_MEM_OBJECT_IMAGE3D
            CL_MEM_TYPE
            CL_MEM_FLAGS
            CL_MEM_SIZE
            CL_MEM_HOST_PTR
            CL_MEM_MAP_COUNT
            CL_MEM_REFERENCE_COUNT
            CL_MEM_CONTEXT
            CL_MEM_ASSOCIATED_MEMOBJECT
            CL_MEM_OFFSET
            CL_IMAGE_FORMAT
            CL_IMAGE_ELEMENT_SIZE
            CL_IMAGE_ROW_PITCH
            CL_IMAGE_SLICE_PITCH
            CL_IMAGE_WIDTH
            CL_IMAGE_HEIGHT
            CL_IMAGE_DEPTH
            CL_ADDRESS_NONE
            CL_ADDRESS_CLAMP_TO_EDGE
            CL_ADDRESS_CLAMP
            CL_ADDRESS_REPEAT
            CL_ADDRESS_MIRRORED_REPEAT
            CL_FILTER_NEAREST
            CL_FILTER_LINEAR
            CL_SAMPLER_REFERENCE_COUNT
            CL_SAMPLER_CONTEXT
            CL_SAMPLER_NORMALIZED_COORDS
            CL_SAMPLER_ADDRESSING_MODE
            CL_SAMPLER_FILTER_MODE
            CL_MAP_READ
            CL_MAP_WRITE
            CL_PROGRAM_REFERENCE_COUNT
            CL_PROGRAM_CONTEXT
            CL_PROGRAM_NUM_DEVICES
            CL_PROGRAM_DEVICES
            CL_PROGRAM_SOURCE
            CL_PROGRAM_BINARY_SIZES
            CL_PROGRAM_BINARIES
            CL_PROGRAM_BUILD_STATUS
            CL_PROGRAM_BUILD_OPTIONS
            CL_PROGRAM_BUILD_LOG
            CL_BUILD_SUCCESS
            CL_BUILD_NONE
            CL_BUILD_ERROR
            CL_BUILD_IN_PROGRESS
            CL_KERNEL_FUNCTION_NAME
            CL_KERNEL_NUM_ARGS
            CL_KERNEL_REFERENCE_COUNT
            CL_KERNEL_CONTEXT
            CL_KERNEL_PROGRAM
            CL_KERNEL_WORK_GROUP_SIZE
            CL_KERNEL_COMPILE_WORK_GROUP_SIZE
            CL_KERNEL_LOCAL_MEM_SIZE
            CL_KERNEL_PREFERRED_WORK_GROUP_SIZE_MULTIPLE
            CL_KERNEL_PRIVATE_MEM_SIZE
            CL_EVENT_COMMAND_QUEUE
            CL_EVENT_COMMAND_TYPE
            CL_EVENT_REFERENCE_COUNT
            CL_EVENT_COMMAND_EXECUTION_STATUS
            CL_EVENT_CONTEXT
            CL_COMMAND_NDRANGE_KERNEL
            CL_COMMAND_TASK
            CL_COMMAND_NATIVE_KERNEL
            CL_COMMAND_READ_BUFFER
            CL_COMMAND_WRITE_BUFFER
            CL_COMMAND_COPY_BUFFER
            CL_COMMAND_READ_IMAGE
            CL_COMMAND_WRITE_IMAGE
            CL_COMMAND_COPY_IMAGE
            CL_COMMAND_COPY_IMAGE_TO_BUFFER
            CL_COMMAND_COPY_BUFFER_TO_IMAGE
            CL_COMMAND_MAP_BUFFER
            CL_COMMAND_MAP_IMAGE
            CL_COMMAND_UNMAP_MEM_OBJECT
            CL_COMMAND_MARKER
            CL_COMMAND_ACQUIRE_GL_OBJECTS
            CL_COMMAND_RELEASE_GL_OBJECTS
            CL_COMMAND_READ_BUFFER_RECT
            CL_COMMAND_WRITE_BUFFER_RECT
            CL_COMMAND_COPY_BUFFER_RECT
            CL_COMMAND_USER
            CL_COMPLETE
            CL_RUNNING
            CL_SUBMITTED
            CL_QUEUED
            CL_BUFFER_CREATE_TYPE_REGION
            CL_PROFILING_COMMAND_QUEUED
            CL_PROFILING_COMMAND_SUBMIT
            CL_PROFILING_COMMAND_START
            CL_PROFILING_COMMAND_END

           )
         (import (rnrs)(nmosh ext))

(import-ext ((darwin-framework "OpenCL")
             (win32-dll "OpenCL.dll"))

            ;; Platform API
            (c-function int clGetPlatformIDs unsigned-int void* void*)
            (c-function int clGetPlatformInfo void* unsigned-int unsigned-int void* unsigned-int)

            ;; Device API
            (c-function int clGetDeviceIDs void* unsigned-int unsigned-int void* void*)
            (c-function int clGetDeviceInfo 
                        void* unsigned-int unsigned-int void* unsigned-int))

;; Constants

(define CL_SUCCESS                                  0)
(define CL_DEVICE_NOT_FOUND                         -1)
(define CL_DEVICE_NOT_AVAILABLE                     -2)
(define CL_COMPILER_NOT_AVAILABLE                   -3)
(define CL_MEM_OBJECT_ALLOCATION_FAILURE            -4)
(define CL_OUT_OF_RESOURCES                         -5)
(define CL_OUT_OF_HOST_MEMORY                       -6)
(define CL_PROFILING_INFO_NOT_AVAILABLE             -7)
(define CL_MEM_COPY_OVERLAP                         -8)
(define CL_IMAGE_FORMAT_MISMATCH                    -9)
(define CL_IMAGE_FORMAT_NOT_SUPPORTED               -10)
(define CL_BUILD_PROGRAM_FAILURE                    -11)
(define CL_MAP_FAILURE                              -12)
(define CL_MISALIGNED_SUB_BUFFER_OFFSET             -13)
(define CL_EXEC_STATUS_ERROR_FOR_EVENTS_IN_WAIT_LIST -14)

(define CL_INVALID_VALUE                            -30)
(define CL_INVALID_DEVICE_TYPE                      -31)
(define CL_INVALID_PLATFORM                         -32)
(define CL_INVALID_DEVICE                           -33)
(define CL_INVALID_CONTEXT                          -34)
(define CL_INVALID_QUEUE_PROPERTIES                 -35)
(define CL_INVALID_COMMAND_QUEUE                    -36)
(define CL_INVALID_HOST_PTR                         -37)
(define CL_INVALID_MEM_OBJECT                       -38)
(define CL_INVALID_IMAGE_FORMAT_DESCRIPTOR          -39)
(define CL_INVALID_IMAGE_SIZE                       -40)
(define CL_INVALID_SAMPLER                          -41)
(define CL_INVALID_BINARY                           -42)
(define CL_INVALID_BUILD_OPTIONS                    -43)
(define CL_INVALID_PROGRAM                          -44)
(define CL_INVALID_PROGRAM_EXECUTABLE               -45)
(define CL_INVALID_KERNEL_NAME                      -46)
(define CL_INVALID_KERNEL_DEFINITION                -47)
(define CL_INVALID_KERNEL                           -48)
(define CL_INVALID_ARG_INDEX                        -49)
(define CL_INVALID_ARG_VALUE                        -50)
(define CL_INVALID_ARG_SIZE                         -51)
(define CL_INVALID_KERNEL_ARGS                      -52)
(define CL_INVALID_WORK_DIMENSION                   -53)
(define CL_INVALID_WORK_GROUP_SIZE                  -54)
(define CL_INVALID_WORK_ITEM_SIZE                   -55)
(define CL_INVALID_GLOBAL_OFFSET                    -56)
(define CL_INVALID_EVENT_WAIT_LIST                  -57)
(define CL_INVALID_EVENT                            -58)
(define CL_INVALID_OPERATION                        -59)
(define CL_INVALID_GL_OBJECT                        -60)
(define CL_INVALID_BUFFER_SIZE                      -61)
(define CL_INVALID_MIP_LEVEL                        -62)
(define CL_INVALID_GLOBAL_WORK_SIZE                 -63)

;; version
(define CL_VERSION_1_0                              1)
(define CL_VERSION_1_1                              1)

;; cl_bool
(define CL_FALSE                                    0)
(define CL_TRUE                                     1)

;; cl_platform_info
(define CL_PLATFORM_PROFILE                         #x0900)
(define CL_PLATFORM_VERSION                         #x0901)
(define CL_PLATFORM_NAME                            #x0902)
(define CL_PLATFORM_VENDOR                          #x0903)
(define CL_PLATFORM_EXTENSIONS                      #x0904)

;; cl_device_type
(define CL_DEVICE_TYPE_DEFAULT                      1)
(define CL_DEVICE_TYPE_CPU                          2)
(define CL_DEVICE_TYPE_GPU                          4)
(define CL_DEVICE_TYPE_ACCELERATOR                  8)
(define CL_DEVICE_TYPE_ALL                          #xFFFFFFFF)

;; cl_device_info
(define CL_DEVICE_TYPE                              #x1000)
(define CL_DEVICE_VENDOR_ID                         #x1001)
(define CL_DEVICE_MAX_COMPUTE_UNITS                 #x1002)
(define CL_DEVICE_MAX_WORK_ITEM_DIMENSIONS          #x1003)
(define CL_DEVICE_MAX_WORK_GROUP_SIZE               #x1004)
(define CL_DEVICE_MAX_WORK_ITEM_SIZES               #x1005)
(define CL_DEVICE_PREFERRED_VECTOR_WIDTH_CHAR       #x1006)
(define CL_DEVICE_PREFERRED_VECTOR_WIDTH_SHORT      #x1007)
(define CL_DEVICE_PREFERRED_VECTOR_WIDTH_INT        #x1008)
(define CL_DEVICE_PREFERRED_VECTOR_WIDTH_LONG       #x1009)
(define CL_DEVICE_PREFERRED_VECTOR_WIDTH_FLOAT      #x100A)
(define CL_DEVICE_PREFERRED_VECTOR_WIDTH_DOUBLE     #x100B)
(define CL_DEVICE_MAX_CLOCK_FREQUENCY               #x100C)
(define CL_DEVICE_ADDRESS_BITS                      #x100D)
(define CL_DEVICE_MAX_READ_IMAGE_ARGS               #x100E)
(define CL_DEVICE_MAX_WRITE_IMAGE_ARGS              #x100F)
(define CL_DEVICE_MAX_MEM_ALLOC_SIZE                #x1010)
(define CL_DEVICE_IMAGE2D_MAX_WIDTH                 #x1011)
(define CL_DEVICE_IMAGE2D_MAX_HEIGHT                #x1012)
(define CL_DEVICE_IMAGE3D_MAX_WIDTH                 #x1013)
(define CL_DEVICE_IMAGE3D_MAX_HEIGHT                #x1014)
(define CL_DEVICE_IMAGE3D_MAX_DEPTH                 #x1015)
(define CL_DEVICE_IMAGE_SUPPORT                     #x1016)
(define CL_DEVICE_MAX_PARAMETER_SIZE                #x1017)
(define CL_DEVICE_MAX_SAMPLERS                      #x1018)
(define CL_DEVICE_MEM_BASE_ADDR_ALIGN               #x1019)
(define CL_DEVICE_MIN_DATA_TYPE_ALIGN_SIZE          #x101A)
(define CL_DEVICE_SINGLE_FP_CONFIG                  #x101B)
(define CL_DEVICE_GLOBAL_MEM_CACHE_TYPE             #x101C)
(define CL_DEVICE_GLOBAL_MEM_CACHELINE_SIZE         #x101D)
(define CL_DEVICE_GLOBAL_MEM_CACHE_SIZE             #x101E)
(define CL_DEVICE_GLOBAL_MEM_SIZE                   #x101F)
(define CL_DEVICE_MAX_CONSTANT_BUFFER_SIZE          #x1020)
(define CL_DEVICE_MAX_CONSTANT_ARGS                 #x1021)
(define CL_DEVICE_LOCAL_MEM_TYPE                    #x1022)
(define CL_DEVICE_LOCAL_MEM_SIZE                    #x1023)
(define CL_DEVICE_ERROR_CORRECTION_SUPPORT          #x1024)
(define CL_DEVICE_PROFILING_TIMER_RESOLUTION        #x1025)
(define CL_DEVICE_ENDIAN_LITTLE                     #x1026)
(define CL_DEVICE_AVAILABLE                         #x1027)
(define CL_DEVICE_COMPILER_AVAILABLE                #x1028)
(define CL_DEVICE_EXECUTION_CAPABILITIES            #x1029)
(define CL_DEVICE_QUEUE_PROPERTIES                  #x102A)
(define CL_DEVICE_NAME                              #x102B)
(define CL_DEVICE_VENDOR                            #x102C)
(define CL_DRIVER_VERSION                           #x102D)
(define CL_DEVICE_PROFILE                           #x102E)
(define CL_DEVICE_VERSION                           #x102F)
(define CL_DEVICE_EXTENSIONS                        #x1030)
(define CL_DEVICE_PLATFORM                          #x1031)
(define CL_DEVICE_PREFERRED_VECTOR_WIDTH_HALF       #x1034)
(define CL_DEVICE_HOST_UNIFIED_MEMORY               #x1035)
(define CL_DEVICE_NATIVE_VECTOR_WIDTH_CHAR          #x1036)
(define CL_DEVICE_NATIVE_VECTOR_WIDTH_SHORT         #x1037)
(define CL_DEVICE_NATIVE_VECTOR_WIDTH_INT           #x1038)
(define CL_DEVICE_NATIVE_VECTOR_WIDTH_LONG          #x1039)
(define CL_DEVICE_NATIVE_VECTOR_WIDTH_FLOAT         #x103A)
(define CL_DEVICE_NATIVE_VECTOR_WIDTH_DOUBLE        #x103B)
(define CL_DEVICE_NATIVE_VECTOR_WIDTH_HALF          #x103C)
(define CL_DEVICE_OPENCL_C_VERSION                  #x103D)

;; cl_device_fp_config
(define CL_FP_DENORM                                1)
(define CL_FP_INF_NAN                               2)
(define CL_FP_ROUND_TO_NEAREST                      4)
(define CL_FP_ROUND_TO_ZERO                         8)
(define CL_FP_ROUND_TO_INF                          16)
(define CL_FP_FMA                                   32)
(define CL_FP_SOFT_FLOAT                            64)

;; cl_device_mem_cache_type
(define CL_NONE                                     #x0)
(define CL_READ_ONLY_CACHE                          #x1)
(define CL_READ_WRITE_CACHE                         #x2)

;; cl_device_local_mem_type
(define CL_LOCAL                                    #x1)
(define CL_GLOBAL                                   #x2)

;; cl_device_exec_capabilities
(define CL_EXEC_KERNEL                              1)
(define CL_EXEC_NATIVE_KERNEL                       2)

;; cl_command_queue_properties
(define CL_QUEUE_OUT_OF_ORDER_EXEC_MODE_ENABLE      1)
(define CL_QUEUE_PROFILING_ENABLE                   2)

;; cl_context_info
(define CL_CONTEXT_REFERENCE_COUNT                  #x1080)
(define CL_CONTEXT_DEVICES                          #x1081)
(define CL_CONTEXT_PROPERTIES                       #x1082)
(define CL_CONTEXT_NUM_DEVICES                      #x1083)

;; cl_context_info + cl_context_properties
(define CL_CONTEXT_PLATFORM                         #x1084)

;; cl_command_queue_info
(define CL_QUEUE_CONTEXT                            #x1090)
(define CL_QUEUE_DEVICE                             #x1091)
(define CL_QUEUE_REFERENCE_COUNT                    #x1092)
(define CL_QUEUE_PROPERTIES                         #x1093)

;; cl_mem_flags 
(define CL_MEM_READ_WRITE                           1)
(define CL_MEM_WRITE_ONLY                           2)
(define CL_MEM_READ_ONLY                            4)
(define CL_MEM_USE_HOST_PTR                         8)
(define CL_MEM_ALLOC_HOST_PTR                       16)
(define CL_MEM_COPY_HOST_PTR                        32)

;; cl_channel_order
(define CL_R                                        #x10B0)
(define CL_A                                        #x10B1)
(define CL_RG                                       #x10B2)
(define CL_RA                                       #x10B3)
(define CL_RGB                                      #x10B4)
(define CL_RGBA                                     #x10B5)
(define CL_BGRA                                     #x10B6)
(define CL_ARGB                                     #x10B7)
(define CL_INTENSITY                                #x10B8)
(define CL_LUMINANCE                                #x10B9)
(define CL_Rx                                       #x10BA)
(define CL_RGx                                      #x10BB)
(define CL_RGBx                                     #x10BC)

;; cl_channel_type
(define CL_SNORM_INT8                               #x10D0)
(define CL_SNORM_INT16                              #x10D1)
(define CL_UNORM_INT8                               #x10D2)
(define CL_UNORM_INT16                              #x10D3)
(define CL_UNORM_SHORT_565                          #x10D4)
(define CL_UNORM_SHORT_555                          #x10D5)
(define CL_UNORM_INT_101010                         #x10D6)
(define CL_SIGNED_INT8                              #x10D7)
(define CL_SIGNED_INT16                             #x10D8)
(define CL_SIGNED_INT32                             #x10D9)
(define CL_UNSIGNED_INT8                            #x10DA)
(define CL_UNSIGNED_INT16                           #x10DB)
(define CL_UNSIGNED_INT32                           #x10DC)
(define CL_HALF_FLOAT                               #x10DD)
(define CL_FLOAT                                    #x10DE)

;; cl_mem_object_type
(define CL_MEM_OBJECT_BUFFER                        #x10F0)
(define CL_MEM_OBJECT_IMAGE2D                       #x10F1)
(define CL_MEM_OBJECT_IMAGE3D                       #x10F2)

;; cl_mem_info
(define CL_MEM_TYPE                                 #x1100)
(define CL_MEM_FLAGS                                #x1101)
(define CL_MEM_SIZE                                 #x1102)
(define CL_MEM_HOST_PTR                             #x1103)
(define CL_MEM_MAP_COUNT                            #x1104)
(define CL_MEM_REFERENCE_COUNT                      #x1105)
(define CL_MEM_CONTEXT                              #x1106)
(define CL_MEM_ASSOCIATED_MEMOBJECT                 #x1107)
(define CL_MEM_OFFSET                               #x1108)

;; cl_image_info
(define CL_IMAGE_FORMAT                             #x1110)
(define CL_IMAGE_ELEMENT_SIZE                       #x1111)
(define CL_IMAGE_ROW_PITCH                          #x1112)
(define CL_IMAGE_SLICE_PITCH                        #x1113)
(define CL_IMAGE_WIDTH                              #x1114)
(define CL_IMAGE_HEIGHT                             #x1115)
(define CL_IMAGE_DEPTH                              #x1116)

;; cl_addressing_mode
(define CL_ADDRESS_NONE                             #x1130)
(define CL_ADDRESS_CLAMP_TO_EDGE                    #x1131)
(define CL_ADDRESS_CLAMP                            #x1132)
(define CL_ADDRESS_REPEAT                           #x1133)
(define CL_ADDRESS_MIRRORED_REPEAT                  #x1134)

;; cl_filter_mode
(define CL_FILTER_NEAREST                           #x1140)
(define CL_FILTER_LINEAR                            #x1141)

;; cl_sampler_info
(define CL_SAMPLER_REFERENCE_COUNT                  #x1150)
(define CL_SAMPLER_CONTEXT                          #x1151)
(define CL_SAMPLER_NORMALIZED_COORDS                #x1152)
(define CL_SAMPLER_ADDRESSING_MODE                  #x1153)
(define CL_SAMPLER_FILTER_MODE                      #x1154)

;; cl_map_flags
(define CL_MAP_READ                                 1)
(define CL_MAP_WRITE                                2)

;; cl_program_info
(define CL_PROGRAM_REFERENCE_COUNT                  #x1160)
(define CL_PROGRAM_CONTEXT                          #x1161)
(define CL_PROGRAM_NUM_DEVICES                      #x1162)
(define CL_PROGRAM_DEVICES                          #x1163)
(define CL_PROGRAM_SOURCE                           #x1164)
(define CL_PROGRAM_BINARY_SIZES                     #x1165)
(define CL_PROGRAM_BINARIES                         #x1166)

;; cl_program_build_info
(define CL_PROGRAM_BUILD_STATUS                     #x1181)
(define CL_PROGRAM_BUILD_OPTIONS                    #x1182)
(define CL_PROGRAM_BUILD_LOG                        #x1183)

;; cl_build_status
(define CL_BUILD_SUCCESS                            0)
(define CL_BUILD_NONE                               -1)
(define CL_BUILD_ERROR                              -2)
(define CL_BUILD_IN_PROGRESS                        -3)

;; cl_kernel_info
(define CL_KERNEL_FUNCTION_NAME                     #x1190)
(define CL_KERNEL_NUM_ARGS                          #x1191)
(define CL_KERNEL_REFERENCE_COUNT                   #x1192)
(define CL_KERNEL_CONTEXT                           #x1193)
(define CL_KERNEL_PROGRAM                           #x1194)

;; cl_kernel_work_group_info
(define CL_KERNEL_WORK_GROUP_SIZE                   #x11B0)
(define CL_KERNEL_COMPILE_WORK_GROUP_SIZE           #x11B1)
(define CL_KERNEL_LOCAL_MEM_SIZE                    #x11B2)
(define CL_KERNEL_PREFERRED_WORK_GROUP_SIZE_MULTIPLE #x11B3)
(define CL_KERNEL_PRIVATE_MEM_SIZE                  #x11B4)

;; cl_event_info
(define CL_EVENT_COMMAND_QUEUE                      #x11D0)
(define CL_EVENT_COMMAND_TYPE                       #x11D1)
(define CL_EVENT_REFERENCE_COUNT                    #x11D2)
(define CL_EVENT_COMMAND_EXECUTION_STATUS           #x11D3)
(define CL_EVENT_CONTEXT                            #x11D4)

;; cl_command_type
(define CL_COMMAND_NDRANGE_KERNEL                   #x11F0)
(define CL_COMMAND_TASK                             #x11F1)
(define CL_COMMAND_NATIVE_KERNEL                    #x11F2)
(define CL_COMMAND_READ_BUFFER                      #x11F3)
(define CL_COMMAND_WRITE_BUFFER                     #x11F4)
(define CL_COMMAND_COPY_BUFFER                      #x11F5)
(define CL_COMMAND_READ_IMAGE                       #x11F6)
(define CL_COMMAND_WRITE_IMAGE                      #x11F7)
(define CL_COMMAND_COPY_IMAGE                       #x11F8)
(define CL_COMMAND_COPY_IMAGE_TO_BUFFER             #x11F9)
(define CL_COMMAND_COPY_BUFFER_TO_IMAGE             #x11FA)
(define CL_COMMAND_MAP_BUFFER                       #x11FB)
(define CL_COMMAND_MAP_IMAGE                        #x11FC)
(define CL_COMMAND_UNMAP_MEM_OBJECT                 #x11FD)
(define CL_COMMAND_MARKER                           #x11FE)
(define CL_COMMAND_ACQUIRE_GL_OBJECTS               #x11FF)
(define CL_COMMAND_RELEASE_GL_OBJECTS               #x1200)
(define CL_COMMAND_READ_BUFFER_RECT                 #x1201)
(define CL_COMMAND_WRITE_BUFFER_RECT                #x1202)
(define CL_COMMAND_COPY_BUFFER_RECT                 #x1203)
(define CL_COMMAND_USER                             #x1204)

;; command execution status 
(define CL_COMPLETE                                 #x0)
(define CL_RUNNING                                  #x1)
(define CL_SUBMITTED                                #x2)
(define CL_QUEUED                                   #x3)

;; cl_buffer_create_type
(define CL_BUFFER_CREATE_TYPE_REGION                #x1220)

;; cl_profiling_info
(define CL_PROFILING_COMMAND_QUEUED                 #x1280)
(define CL_PROFILING_COMMAND_SUBMIT                 #x1281)
(define CL_PROFILING_COMMAND_START                  #x1282)
(define CL_PROFILING_COMMAND_END                    #x1283)

)

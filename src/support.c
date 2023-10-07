
#include <stdlib.h>

#ifdef WIN32
#define EXPORT_API __declspec(dllEXPORT_API)
#else
#define EXPORT_API
#endif

EXPORT_API void *vips_support_malloc(size_t size) { return malloc(size); }

EXPORT_API void vips_support_free(void *ptr) { free(ptr); }

EXPORT_API int vips_support_free_callback(void *ptr, void *) {
  vips_support_free(ptr);

  return 0;
}

typedef int (*vips_support_free_callback_fn)(void *, void *);

EXPORT_API vips_support_free_callback_fn vips_support_free_callback_ptr() {
  return vips_support_free_callback;
}
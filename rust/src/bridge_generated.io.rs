use super::*;
// Section: wire functions

#[no_mangle]
pub extern "C" fn wire_get_counter(port_: i64) {
    wire_get_counter_impl(port_)
}

#[no_mangle]
pub extern "C" fn wire_increment(port_: i64) {
    wire_increment_impl(port_)
}

#[no_mangle]
pub extern "C" fn wire_decrement(port_: i64) {
    wire_decrement_impl(port_)
}

#[no_mangle]
pub extern "C" fn wire_get_result(port_: i64) {
    wire_get_result_impl(port_)
}

#[no_mangle]
pub extern "C" fn wire_calculate_simple(port_: i64, args: *mut wire_StringList) {
    wire_calculate_simple_impl(port_, args)
}

#[no_mangle]
pub extern "C" fn wire_calculate_bongal(port_: i64, args: *mut wire_StringList) {
    wire_calculate_bongal_impl(port_, args)
}

#[no_mangle]
pub extern "C" fn wire_get_new_bongal(port_: i64) {
    wire_get_new_bongal_impl(port_)
}

#[no_mangle]
pub extern "C" fn wire_calculate(port_: i64, args: *mut wire_StringList) {
    wire_calculate_impl(port_, args)
}

#[no_mangle]
pub extern "C" fn wire_calculate_verbose(port_: i64) {
    wire_calculate_verbose_impl(port_)
}

#[no_mangle]
pub extern "C" fn wire_calculate27(port_: i64, args: *mut wire_StringList) {
    wire_calculate27_impl(port_, args)
}

// Section: allocate functions

#[no_mangle]
pub extern "C" fn new_StringList_0(len: i32) -> *mut wire_StringList {
    let wrap = wire_StringList {
        ptr: support::new_leak_vec_ptr(<*mut wire_uint_8_list>::new_with_null_ptr(), len),
        len,
    };
    support::new_leak_box_ptr(wrap)
}

#[no_mangle]
pub extern "C" fn new_uint_8_list_0(len: i32) -> *mut wire_uint_8_list {
    let ans = wire_uint_8_list {
        ptr: support::new_leak_vec_ptr(Default::default(), len),
        len,
    };
    support::new_leak_box_ptr(ans)
}

// Section: impl Wire2Api

impl Wire2Api<String> for *mut wire_uint_8_list {
    fn wire2api(self) -> String {
        let vec: Vec<u8> = self.wire2api();
        String::from_utf8_lossy(&vec).into_owned()
    }
}
impl Wire2Api<Vec<String>> for *mut wire_StringList {
    fn wire2api(self) -> Vec<String> {
        let vec = unsafe {
            let wrap = support::box_from_leak_ptr(self);
            support::vec_from_leak_ptr(wrap.ptr, wrap.len)
        };
        vec.into_iter().map(Wire2Api::wire2api).collect()
    }
}

impl Wire2Api<Vec<u8>> for *mut wire_uint_8_list {
    fn wire2api(self) -> Vec<u8> {
        unsafe {
            let wrap = support::box_from_leak_ptr(self);
            support::vec_from_leak_ptr(wrap.ptr, wrap.len)
        }
    }
}
// Section: wire structs

#[repr(C)]
#[derive(Clone)]
pub struct wire_StringList {
    ptr: *mut *mut wire_uint_8_list,
    len: i32,
}

#[repr(C)]
#[derive(Clone)]
pub struct wire_uint_8_list {
    ptr: *mut u8,
    len: i32,
}

// Section: impl NewWithNullPtr

pub trait NewWithNullPtr {
    fn new_with_null_ptr() -> Self;
}

impl<T> NewWithNullPtr for *mut T {
    fn new_with_null_ptr() -> Self {
        std::ptr::null_mut()
    }
}

// Section: sync execution mode utility

#[no_mangle]
pub extern "C" fn free_WireSyncReturnStruct(val: support::WireSyncReturnStruct) {
    unsafe {
        let _ = support::vec_from_leak_ptr(val.ptr, val.len);
    }
}

package com.kokok.kokok_pay.toast;

public enum ToastType {
    SUCCESS("0"), WARNING("1"), FAILED("2"), NORMAL("3");

    private final String toastType;

    ToastType(String toastType) {
        this.toastType = toastType;
    }

    public String getToastType() {
        return toastType;
    }

    public static ToastType getInstance(String toastValue) {
        if (toastValue == null) return ToastType.FAILED;
        for (ToastType tt : ToastType.values()) {
            if (tt.getToastType().equals(toastValue)) {
                return tt;
            }
        }
        return ToastType.NORMAL;
    }
}
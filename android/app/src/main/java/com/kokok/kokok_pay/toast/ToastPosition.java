package com.kokok.kokok_pay.toast;

public enum ToastPosition {
    TOP("1"), CENTER("2"), BOTTOM("3");

    private final String toastPosition;

    ToastPosition(String toastPosition) {
        this.toastPosition = toastPosition;
    }

    public String getToastPosition() {
        return toastPosition;
    }

    public static ToastPosition getInstance(String positionValue) {
        if (positionValue == null) return ToastPosition.BOTTOM;
        for (ToastPosition tp : ToastPosition.values()) {
            if (tp.getToastPosition().equals(positionValue)) {
                return tp;
            }
        }
        return ToastPosition.BOTTOM;
    }

}
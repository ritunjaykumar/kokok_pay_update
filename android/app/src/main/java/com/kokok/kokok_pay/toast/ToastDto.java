package com.kokok.kokok_pay.toast;

import androidx.annotation.NonNull;

import java.io.Serializable;

public final class ToastDto implements Serializable {
    private final String toastMessage;
    private final ToastPosition toastPosition;
    private final ToastType toastType;
    private final boolean dark;


    public ToastDto(String toastMessage, ToastPosition toastPosition, ToastType toastType, boolean dark) {
        this.toastMessage = toastMessage;
        this.toastPosition = toastPosition;
        this.toastType = toastType;
        this.dark =dark;
    }

    public String getToastMessage() {
        return toastMessage;
    }

    public ToastPosition getToastPosition() {
        return toastPosition;
    }

    public ToastType getToastType() {
        return toastType;
    }

    public boolean isDark() {
        return dark;
    }

    @NonNull
    @Override
    public String toString() {
        return "ToastDto{" +
                "toastMessage='" + toastMessage + '\'' +
                ", toastPosition=" + toastPosition +
                ", toastType=" + toastType +
                ", dark=" + dark +
                '}';
    }


}
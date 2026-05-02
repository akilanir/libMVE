.class final Lcom/lb/material_preferences_library/custom_preferences/EditTextPreference$SavedState$1;
.super Ljava/lang/Object;
.source "EditTextPreference.java"

# interfaces
.implements Landroid/os/Parcelable$Creator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lb/material_preferences_library/custom_preferences/EditTextPreference$SavedState;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Landroid/os/Parcelable$Creator",
        "<",
        "Lcom/lb/material_preferences_library/custom_preferences/EditTextPreference$SavedState;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 265
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public createFromParcel(Landroid/os/Parcel;)Lcom/lb/material_preferences_library/custom_preferences/EditTextPreference$SavedState;
    .registers 3
    .param p1, "in"    # Landroid/os/Parcel;

    .prologue
    .line 268
    new-instance v0, Lcom/lb/material_preferences_library/custom_preferences/EditTextPreference$SavedState;

    invoke-direct {v0, p1}, Lcom/lb/material_preferences_library/custom_preferences/EditTextPreference$SavedState;-><init>(Landroid/os/Parcel;)V

    return-object v0
.end method

.method public bridge synthetic createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;
    .registers 3
    .param p1, "x0"    # Landroid/os/Parcel;

    .prologue
    .line 265
    invoke-virtual {p0, p1}, Lcom/lb/material_preferences_library/custom_preferences/EditTextPreference$SavedState$1;->createFromParcel(Landroid/os/Parcel;)Lcom/lb/material_preferences_library/custom_preferences/EditTextPreference$SavedState;

    move-result-object v0

    return-object v0
.end method

.method public newArray(I)[Lcom/lb/material_preferences_library/custom_preferences/EditTextPreference$SavedState;
    .registers 3
    .param p1, "size"    # I

    .prologue
    .line 273
    new-array v0, p1, [Lcom/lb/material_preferences_library/custom_preferences/EditTextPreference$SavedState;

    return-object v0
.end method

.method public bridge synthetic newArray(I)[Ljava/lang/Object;
    .registers 3
    .param p1, "x0"    # I

    .prologue
    .line 265
    invoke-virtual {p0, p1}, Lcom/lb/material_preferences_library/custom_preferences/EditTextPreference$SavedState$1;->newArray(I)[Lcom/lb/material_preferences_library/custom_preferences/EditTextPreference$SavedState;

    move-result-object v0

    return-object v0
.end method

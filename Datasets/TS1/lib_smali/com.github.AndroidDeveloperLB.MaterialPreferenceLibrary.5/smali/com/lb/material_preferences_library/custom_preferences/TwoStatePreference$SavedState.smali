.class Lcom/lb/material_preferences_library/custom_preferences/TwoStatePreference$SavedState;
.super Landroid/preference/Preference$BaseSavedState;
.source "TwoStatePreference.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lb/material_preferences_library/custom_preferences/TwoStatePreference;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "SavedState"
.end annotation


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Lcom/lb/material_preferences_library/custom_preferences/TwoStatePreference$SavedState;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field checked:Z


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 297
    new-instance v0, Lcom/lb/material_preferences_library/custom_preferences/TwoStatePreference$SavedState$1;

    invoke-direct {v0}, Lcom/lb/material_preferences_library/custom_preferences/TwoStatePreference$SavedState$1;-><init>()V

    sput-object v0, Lcom/lb/material_preferences_library/custom_preferences/TwoStatePreference$SavedState;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>(Landroid/os/Parcel;)V
    .registers 4
    .param p1, "source"    # Landroid/os/Parcel;

    .prologue
    const/4 v0, 0x1

    .line 281
    invoke-direct {p0, p1}, Landroid/preference/Preference$BaseSavedState;-><init>(Landroid/os/Parcel;)V

    .line 282
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v1

    if-ne v1, v0, :cond_d

    :goto_a
    iput-boolean v0, p0, Lcom/lb/material_preferences_library/custom_preferences/TwoStatePreference$SavedState;->checked:Z

    .line 283
    return-void

    .line 282
    :cond_d
    const/4 v0, 0x0

    goto :goto_a
.end method

.method public constructor <init>(Landroid/os/Parcelable;)V
    .registers 2
    .param p1, "superState"    # Landroid/os/Parcelable;

    .prologue
    .line 294
    invoke-direct {p0, p1}, Landroid/preference/Preference$BaseSavedState;-><init>(Landroid/os/Parcelable;)V

    .line 295
    return-void
.end method


# virtual methods
.method public writeToParcel(Landroid/os/Parcel;I)V
    .registers 4
    .param p1, "dest"    # Landroid/os/Parcel;
    .param p2, "flags"    # I

    .prologue
    .line 288
    invoke-super {p0, p1, p2}, Landroid/preference/Preference$BaseSavedState;->writeToParcel(Landroid/os/Parcel;I)V

    .line 289
    iget-boolean v0, p0, Lcom/lb/material_preferences_library/custom_preferences/TwoStatePreference$SavedState;->checked:Z

    if-eqz v0, :cond_c

    const/4 v0, 0x1

    :goto_8
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 290
    return-void

    .line 289
    :cond_c
    const/4 v0, 0x0

    goto :goto_8
.end method

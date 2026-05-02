.class Lcom/lb/material_preferences_library/custom_preferences/DialogPreference$SavedState;
.super Landroid/preference/Preference$BaseSavedState;
.source "DialogPreference.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lb/material_preferences_library/custom_preferences/DialogPreference;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "SavedState"
.end annotation


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Lcom/lb/material_preferences_library/custom_preferences/DialogPreference$SavedState;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field dialogBundle:Landroid/os/Bundle;

.field isDialogShowing:Z


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 513
    new-instance v0, Lcom/lb/material_preferences_library/custom_preferences/DialogPreference$SavedState$1;

    invoke-direct {v0}, Lcom/lb/material_preferences_library/custom_preferences/DialogPreference$SavedState$1;-><init>()V

    sput-object v0, Lcom/lb/material_preferences_library/custom_preferences/DialogPreference$SavedState;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>(Landroid/os/Parcel;)V
    .registers 4
    .param p1, "source"    # Landroid/os/Parcel;

    .prologue
    const/4 v0, 0x1

    .line 531
    invoke-direct {p0, p1}, Landroid/preference/Preference$BaseSavedState;-><init>(Landroid/os/Parcel;)V

    .line 532
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v1

    if-ne v1, v0, :cond_13

    :goto_a
    iput-boolean v0, p0, Lcom/lb/material_preferences_library/custom_preferences/DialogPreference$SavedState;->isDialogShowing:Z

    .line 533
    invoke-virtual {p1}, Landroid/os/Parcel;->readBundle()Landroid/os/Bundle;

    move-result-object v0

    iput-object v0, p0, Lcom/lb/material_preferences_library/custom_preferences/DialogPreference$SavedState;->dialogBundle:Landroid/os/Bundle;

    .line 534
    return-void

    .line 532
    :cond_13
    const/4 v0, 0x0

    goto :goto_a
.end method

.method public constructor <init>(Landroid/os/Parcelable;)V
    .registers 2
    .param p1, "superState"    # Landroid/os/Parcelable;

    .prologue
    .line 538
    invoke-direct {p0, p1}, Landroid/preference/Preference$BaseSavedState;-><init>(Landroid/os/Parcelable;)V

    .line 539
    return-void
.end method


# virtual methods
.method public writeToParcel(Landroid/os/Parcel;I)V
    .registers 4
    .param p1, "dest"    # Landroid/os/Parcel;
    .param p2, "flags"    # I

    .prologue
    .line 544
    invoke-super {p0, p1, p2}, Landroid/preference/Preference$BaseSavedState;->writeToParcel(Landroid/os/Parcel;I)V

    .line 545
    iget-boolean v0, p0, Lcom/lb/material_preferences_library/custom_preferences/DialogPreference$SavedState;->isDialogShowing:Z

    if-eqz v0, :cond_11

    const/4 v0, 0x1

    :goto_8
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 546
    iget-object v0, p0, Lcom/lb/material_preferences_library/custom_preferences/DialogPreference$SavedState;->dialogBundle:Landroid/os/Bundle;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeBundle(Landroid/os/Bundle;)V

    .line 547
    return-void

    .line 545
    :cond_11
    const/4 v0, 0x0

    goto :goto_8
.end method

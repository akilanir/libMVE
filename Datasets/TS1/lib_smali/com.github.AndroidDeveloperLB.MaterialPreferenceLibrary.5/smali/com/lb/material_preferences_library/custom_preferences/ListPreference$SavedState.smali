.class Lcom/lb/material_preferences_library/custom_preferences/ListPreference$SavedState;
.super Landroid/preference/Preference$BaseSavedState;
.source "ListPreference.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lb/material_preferences_library/custom_preferences/ListPreference;
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
            "Lcom/lb/material_preferences_library/custom_preferences/ListPreference$SavedState;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field value:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 410
    new-instance v0, Lcom/lb/material_preferences_library/custom_preferences/ListPreference$SavedState$1;

    invoke-direct {v0}, Lcom/lb/material_preferences_library/custom_preferences/ListPreference$SavedState$1;-><init>()V

    sput-object v0, Lcom/lb/material_preferences_library/custom_preferences/ListPreference$SavedState;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>(Landroid/os/Parcel;)V
    .registers 3
    .param p1, "source"    # Landroid/os/Parcel;

    .prologue
    .line 394
    invoke-direct {p0, p1}, Landroid/preference/Preference$BaseSavedState;-><init>(Landroid/os/Parcel;)V

    .line 395
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/lb/material_preferences_library/custom_preferences/ListPreference$SavedState;->value:Ljava/lang/String;

    .line 396
    return-void
.end method

.method public constructor <init>(Landroid/os/Parcelable;)V
    .registers 2
    .param p1, "superState"    # Landroid/os/Parcelable;

    .prologue
    .line 407
    invoke-direct {p0, p1}, Landroid/preference/Preference$BaseSavedState;-><init>(Landroid/os/Parcelable;)V

    .line 408
    return-void
.end method


# virtual methods
.method public writeToParcel(Landroid/os/Parcel;I)V
    .registers 4
    .param p1, "dest"    # Landroid/os/Parcel;
    .param p2, "flags"    # I

    .prologue
    .line 401
    invoke-super {p0, p1, p2}, Landroid/preference/Preference$BaseSavedState;->writeToParcel(Landroid/os/Parcel;I)V

    .line 402
    iget-object v0, p0, Lcom/lb/material_preferences_library/custom_preferences/ListPreference$SavedState;->value:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 403
    return-void
.end method

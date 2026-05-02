.class public Lcom/github/curioustechizen/ago/RelativeTimeTextView$SavedState;
.super Landroid/view/View$BaseSavedState;
.source "RelativeTimeTextView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/github/curioustechizen/ago/RelativeTimeTextView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "SavedState"
.end annotation


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Lcom/github/curioustechizen/ago/RelativeTimeTextView$SavedState;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private referenceTime:J


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 230
    new-instance v0, Lcom/github/curioustechizen/ago/RelativeTimeTextView$SavedState$1;

    invoke-direct {v0}, Lcom/github/curioustechizen/ago/RelativeTimeTextView$SavedState$1;-><init>()V

    sput-object v0, Lcom/github/curioustechizen/ago/RelativeTimeTextView$SavedState;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method private constructor <init>(Landroid/os/Parcel;)V
    .registers 4
    .param p1, "in"    # Landroid/os/Parcel;

    .prologue
    .line 241
    invoke-direct {p0, p1}, Landroid/view/View$BaseSavedState;-><init>(Landroid/os/Parcel;)V

    .line 242
    invoke-virtual {p1}, Landroid/os/Parcel;->readLong()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/github/curioustechizen/ago/RelativeTimeTextView$SavedState;->referenceTime:J

    .line 243
    return-void
.end method

.method synthetic constructor <init>(Landroid/os/Parcel;Lcom/github/curioustechizen/ago/RelativeTimeTextView$1;)V
    .registers 3
    .param p1, "x0"    # Landroid/os/Parcel;
    .param p2, "x1"    # Lcom/github/curioustechizen/ago/RelativeTimeTextView$1;

    .prologue
    .line 216
    invoke-direct {p0, p1}, Lcom/github/curioustechizen/ago/RelativeTimeTextView$SavedState;-><init>(Landroid/os/Parcel;)V

    return-void
.end method

.method public constructor <init>(Landroid/os/Parcelable;)V
    .registers 2
    .param p1, "superState"    # Landroid/os/Parcelable;

    .prologue
    .line 221
    invoke-direct {p0, p1}, Landroid/view/View$BaseSavedState;-><init>(Landroid/os/Parcelable;)V

    .line 222
    return-void
.end method

.method static synthetic access$000(Lcom/github/curioustechizen/ago/RelativeTimeTextView$SavedState;)J
    .registers 3
    .param p0, "x0"    # Lcom/github/curioustechizen/ago/RelativeTimeTextView$SavedState;

    .prologue
    .line 216
    iget-wide v0, p0, Lcom/github/curioustechizen/ago/RelativeTimeTextView$SavedState;->referenceTime:J

    return-wide v0
.end method

.method static synthetic access$002(Lcom/github/curioustechizen/ago/RelativeTimeTextView$SavedState;J)J
    .registers 3
    .param p0, "x0"    # Lcom/github/curioustechizen/ago/RelativeTimeTextView$SavedState;
    .param p1, "x1"    # J

    .prologue
    .line 216
    iput-wide p1, p0, Lcom/github/curioustechizen/ago/RelativeTimeTextView$SavedState;->referenceTime:J

    return-wide p1
.end method


# virtual methods
.method public writeToParcel(Landroid/os/Parcel;I)V
    .registers 5
    .param p1, "dest"    # Landroid/os/Parcel;
    .param p2, "flags"    # I

    .prologue
    .line 226
    invoke-super {p0, p1, p2}, Landroid/view/View$BaseSavedState;->writeToParcel(Landroid/os/Parcel;I)V

    .line 227
    iget-wide v0, p0, Lcom/github/curioustechizen/ago/RelativeTimeTextView$SavedState;->referenceTime:J

    invoke-virtual {p1, v0, v1}, Landroid/os/Parcel;->writeLong(J)V

    .line 228
    return-void
.end method

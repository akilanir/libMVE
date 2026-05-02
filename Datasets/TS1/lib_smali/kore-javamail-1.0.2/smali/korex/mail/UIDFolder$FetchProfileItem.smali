.class public Lkorex/mail/UIDFolder$FetchProfileItem;
.super Lkorex/mail/FetchProfile$Item;
.source "UIDFolder.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lkorex/mail/UIDFolder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "FetchProfileItem"
.end annotation


# static fields
.field public static final UID:Lkorex/mail/UIDFolder$FetchProfileItem;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    .line 111
    new-instance v0, Lkorex/mail/UIDFolder$FetchProfileItem;

    const-string v1, "UID"

    invoke-direct {v0, v1}, Lkorex/mail/UIDFolder$FetchProfileItem;-><init>(Ljava/lang/String;)V

    sput-object v0, Lkorex/mail/UIDFolder$FetchProfileItem;->UID:Lkorex/mail/UIDFolder$FetchProfileItem;

    return-void
.end method

.method protected constructor <init>(Ljava/lang/String;)V
    .registers 2
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 93
    invoke-direct {p0, p1}, Lkorex/mail/FetchProfile$Item;-><init>(Ljava/lang/String;)V

    .line 94
    return-void
.end method

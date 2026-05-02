.class public final Lkorex/mail/Flags$Flag;
.super Ljava/lang/Object;
.source "Flags.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lkorex/mail/Flags;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Flag"
.end annotation


# static fields
.field public static final ANSWERED:Lkorex/mail/Flags$Flag;

.field public static final DELETED:Lkorex/mail/Flags$Flag;

.field public static final DRAFT:Lkorex/mail/Flags$Flag;

.field public static final FLAGGED:Lkorex/mail/Flags$Flag;

.field public static final RECENT:Lkorex/mail/Flags$Flag;

.field public static final SEEN:Lkorex/mail/Flags$Flag;

.field public static final USER:Lkorex/mail/Flags$Flag;


# instance fields
.field private bit:I


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    .line 124
    new-instance v0, Lkorex/mail/Flags$Flag;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Lkorex/mail/Flags$Flag;-><init>(I)V

    sput-object v0, Lkorex/mail/Flags$Flag;->ANSWERED:Lkorex/mail/Flags$Flag;

    .line 131
    new-instance v0, Lkorex/mail/Flags$Flag;

    const/4 v1, 0x2

    invoke-direct {v0, v1}, Lkorex/mail/Flags$Flag;-><init>(I)V

    sput-object v0, Lkorex/mail/Flags$Flag;->DELETED:Lkorex/mail/Flags$Flag;

    .line 137
    new-instance v0, Lkorex/mail/Flags$Flag;

    const/4 v1, 0x4

    invoke-direct {v0, v1}, Lkorex/mail/Flags$Flag;-><init>(I)V

    sput-object v0, Lkorex/mail/Flags$Flag;->DRAFT:Lkorex/mail/Flags$Flag;

    .line 143
    new-instance v0, Lkorex/mail/Flags$Flag;

    const/16 v1, 0x8

    invoke-direct {v0, v1}, Lkorex/mail/Flags$Flag;-><init>(I)V

    sput-object v0, Lkorex/mail/Flags$Flag;->FLAGGED:Lkorex/mail/Flags$Flag;

    .line 152
    new-instance v0, Lkorex/mail/Flags$Flag;

    const/16 v1, 0x10

    invoke-direct {v0, v1}, Lkorex/mail/Flags$Flag;-><init>(I)V

    sput-object v0, Lkorex/mail/Flags$Flag;->RECENT:Lkorex/mail/Flags$Flag;

    .line 163
    new-instance v0, Lkorex/mail/Flags$Flag;

    const/16 v1, 0x20

    invoke-direct {v0, v1}, Lkorex/mail/Flags$Flag;-><init>(I)V

    sput-object v0, Lkorex/mail/Flags$Flag;->SEEN:Lkorex/mail/Flags$Flag;

    .line 174
    new-instance v0, Lkorex/mail/Flags$Flag;

    const/high16 v1, -0x80000000

    invoke-direct {v0, v1}, Lkorex/mail/Flags$Flag;-><init>(I)V

    sput-object v0, Lkorex/mail/Flags$Flag;->USER:Lkorex/mail/Flags$Flag;

    return-void
.end method

.method private constructor <init>(I)V
    .registers 2
    .param p1, "bit"    # I

    .prologue
    .line 178
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 179
    iput p1, p0, Lkorex/mail/Flags$Flag;->bit:I

    .line 180
    return-void
.end method

.method static synthetic access$000(Lkorex/mail/Flags$Flag;)I
    .registers 2
    .param p0, "x0"    # Lkorex/mail/Flags$Flag;

    .prologue
    .line 119
    iget v0, p0, Lkorex/mail/Flags$Flag;->bit:I

    return v0
.end method

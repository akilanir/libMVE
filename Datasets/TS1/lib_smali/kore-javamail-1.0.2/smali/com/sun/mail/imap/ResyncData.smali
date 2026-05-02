.class public Lcom/sun/mail/imap/ResyncData;
.super Ljava/lang/Object;
.source "ResyncData.java"


# static fields
.field public static final CONDSTORE:Lcom/sun/mail/imap/ResyncData;


# instance fields
.field private modseq:J

.field private uids:[Lcom/sun/mail/imap/protocol/UIDSet;

.field private uidvalidity:J


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .prologue
    const-wide/16 v1, -0x1

    .line 69
    new-instance v0, Lcom/sun/mail/imap/ResyncData;

    invoke-direct {v0, v1, v2, v1, v2}, Lcom/sun/mail/imap/ResyncData;-><init>(JJ)V

    sput-object v0, Lcom/sun/mail/imap/ResyncData;->CONDSTORE:Lcom/sun/mail/imap/ResyncData;

    return-void
.end method

.method public constructor <init>(JJ)V
    .registers 8
    .param p1, "uidvalidity"    # J
    .param p3, "modseq"    # J

    .prologue
    const-wide/16 v1, -0x1

    const/4 v0, 0x0

    .line 81
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 62
    iput-wide v1, p0, Lcom/sun/mail/imap/ResyncData;->uidvalidity:J

    .line 63
    iput-wide v1, p0, Lcom/sun/mail/imap/ResyncData;->modseq:J

    .line 64
    iput-object v0, p0, Lcom/sun/mail/imap/ResyncData;->uids:[Lcom/sun/mail/imap/protocol/UIDSet;

    .line 82
    iput-wide p1, p0, Lcom/sun/mail/imap/ResyncData;->uidvalidity:J

    .line 83
    iput-wide p3, p0, Lcom/sun/mail/imap/ResyncData;->modseq:J

    .line 84
    iput-object v0, p0, Lcom/sun/mail/imap/ResyncData;->uids:[Lcom/sun/mail/imap/protocol/UIDSet;

    .line 85
    return-void
.end method

.method public constructor <init>(JJJJ)V
    .registers 12
    .param p1, "uidvalidity"    # J
    .param p3, "modseq"    # J
    .param p5, "uidFirst"    # J
    .param p7, "uidLast"    # J

    .prologue
    const-wide/16 v0, -0x1

    .line 97
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 62
    iput-wide v0, p0, Lcom/sun/mail/imap/ResyncData;->uidvalidity:J

    .line 63
    iput-wide v0, p0, Lcom/sun/mail/imap/ResyncData;->modseq:J

    .line 64
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/sun/mail/imap/ResyncData;->uids:[Lcom/sun/mail/imap/protocol/UIDSet;

    .line 98
    iput-wide p1, p0, Lcom/sun/mail/imap/ResyncData;->uidvalidity:J

    .line 99
    iput-wide p3, p0, Lcom/sun/mail/imap/ResyncData;->modseq:J

    .line 100
    const/4 v0, 0x1

    new-array v0, v0, [Lcom/sun/mail/imap/protocol/UIDSet;

    const/4 v1, 0x0

    new-instance v2, Lcom/sun/mail/imap/protocol/UIDSet;

    invoke-direct {v2, p5, p6, p7, p8}, Lcom/sun/mail/imap/protocol/UIDSet;-><init>(JJ)V

    aput-object v2, v0, v1

    iput-object v0, p0, Lcom/sun/mail/imap/ResyncData;->uids:[Lcom/sun/mail/imap/protocol/UIDSet;

    .line 101
    return-void
.end method

.method public constructor <init>(JJ[J)V
    .registers 8
    .param p1, "uidvalidity"    # J
    .param p3, "modseq"    # J
    .param p5, "uids"    # [J

    .prologue
    const-wide/16 v0, -0x1

    .line 111
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 62
    iput-wide v0, p0, Lcom/sun/mail/imap/ResyncData;->uidvalidity:J

    .line 63
    iput-wide v0, p0, Lcom/sun/mail/imap/ResyncData;->modseq:J

    .line 64
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/sun/mail/imap/ResyncData;->uids:[Lcom/sun/mail/imap/protocol/UIDSet;

    .line 112
    iput-wide p1, p0, Lcom/sun/mail/imap/ResyncData;->uidvalidity:J

    .line 113
    iput-wide p3, p0, Lcom/sun/mail/imap/ResyncData;->modseq:J

    .line 114
    invoke-static {p5}, Lcom/sun/mail/imap/protocol/UIDSet;->createUIDSets([J)[Lcom/sun/mail/imap/protocol/UIDSet;

    move-result-object v0

    iput-object v0, p0, Lcom/sun/mail/imap/ResyncData;->uids:[Lcom/sun/mail/imap/protocol/UIDSet;

    .line 115
    return-void
.end method


# virtual methods
.method public getModSeq()J
    .registers 3

    .prologue
    .line 132
    iget-wide v0, p0, Lcom/sun/mail/imap/ResyncData;->modseq:J

    return-wide v0
.end method

.method getUIDSet()[Lcom/sun/mail/imap/protocol/UIDSet;
    .registers 2

    .prologue
    .line 140
    iget-object v0, p0, Lcom/sun/mail/imap/ResyncData;->uids:[Lcom/sun/mail/imap/protocol/UIDSet;

    return-object v0
.end method

.method public getUIDValidity()J
    .registers 3

    .prologue
    .line 123
    iget-wide v0, p0, Lcom/sun/mail/imap/ResyncData;->uidvalidity:J

    return-wide v0
.end method

.class public Lkorex/mail/internet/HeaderTokenizer$Token;
.super Ljava/lang/Object;
.source "HeaderTokenizer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lkorex/mail/internet/HeaderTokenizer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Token"
.end annotation


# static fields
.field public static final ATOM:I = -0x1

.field public static final COMMENT:I = -0x3

.field public static final EOF:I = -0x4

.field public static final QUOTEDSTRING:I = -0x2


# instance fields
.field private type:I

.field private value:Ljava/lang/String;


# direct methods
.method public constructor <init>(ILjava/lang/String;)V
    .registers 3
    .param p1, "type"    # I
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 96
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 97
    iput p1, p0, Lkorex/mail/internet/HeaderTokenizer$Token;->type:I

    .line 98
    iput-object p2, p0, Lkorex/mail/internet/HeaderTokenizer$Token;->value:Ljava/lang/String;

    .line 99
    return-void
.end method


# virtual methods
.method public getType()I
    .registers 2

    .prologue
    .line 120
    iget v0, p0, Lkorex/mail/internet/HeaderTokenizer$Token;->type:I

    return v0
.end method

.method public getValue()Ljava/lang/String;
    .registers 2

    .prologue
    .line 132
    iget-object v0, p0, Lkorex/mail/internet/HeaderTokenizer$Token;->value:Ljava/lang/String;

    return-object v0
.end method

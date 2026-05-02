.class public abstract Lkorex/mail/search/ComparisonTerm;
.super Lkorex/mail/search/SearchTerm;
.source "ComparisonTerm.java"


# static fields
.field public static final EQ:I = 0x3

.field public static final GE:I = 0x6

.field public static final GT:I = 0x5

.field public static final LE:I = 0x1

.field public static final LT:I = 0x2

.field public static final NE:I = 0x4

.field private static final serialVersionUID:J = 0x14370cafcc71f144L


# instance fields
.field protected comparison:I


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 50
    invoke-direct {p0}, Lkorex/mail/search/SearchTerm;-><init>()V

    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .registers 6
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x0

    .line 71
    instance-of v2, p1, Lkorex/mail/search/ComparisonTerm;

    if-nez v2, :cond_6

    .line 74
    :cond_5
    :goto_5
    return v1

    :cond_6
    move-object v0, p1

    .line 73
    check-cast v0, Lkorex/mail/search/ComparisonTerm;

    .line 74
    .local v0, "ct":Lkorex/mail/search/ComparisonTerm;
    iget v2, v0, Lkorex/mail/search/ComparisonTerm;->comparison:I

    iget v3, p0, Lkorex/mail/search/ComparisonTerm;->comparison:I

    if-ne v2, v3, :cond_5

    const/4 v1, 0x1

    goto :goto_5
.end method

.method public hashCode()I
    .registers 2

    .prologue
    .line 81
    iget v0, p0, Lkorex/mail/search/ComparisonTerm;->comparison:I

    return v0
.end method

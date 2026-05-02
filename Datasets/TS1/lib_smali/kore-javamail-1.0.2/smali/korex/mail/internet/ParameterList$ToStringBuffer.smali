.class Lkorex/mail/internet/ParameterList$ToStringBuffer;
.super Ljava/lang/Object;
.source "ParameterList.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lkorex/mail/internet/ParameterList;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "ToStringBuffer"
.end annotation


# instance fields
.field private sb:Ljava/lang/StringBuffer;

.field private used:I


# direct methods
.method public constructor <init>(I)V
    .registers 3
    .param p1, "used"    # I

    .prologue
    .line 654
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 652
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    iput-object v0, p0, Lkorex/mail/internet/ParameterList$ToStringBuffer;->sb:Ljava/lang/StringBuffer;

    .line 655
    iput p1, p0, Lkorex/mail/internet/ParameterList$ToStringBuffer;->used:I

    .line 656
    return-void
.end method


# virtual methods
.method public addNV(Ljava/lang/String;Ljava/lang/String;)V
    .registers 9
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    const/16 v5, 0x4c

    .line 659
    # invokes: Lkorex/mail/internet/ParameterList;->quote(Ljava/lang/String;)Ljava/lang/String;
    invoke-static {p2}, Lkorex/mail/internet/ParameterList;->access$200(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    .line 660
    iget-object v3, p0, Lkorex/mail/internet/ParameterList$ToStringBuffer;->sb:Ljava/lang/StringBuffer;

    const-string v4, "; "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 661
    iget v3, p0, Lkorex/mail/internet/ParameterList$ToStringBuffer;->used:I

    add-int/lit8 v3, v3, 0x2

    iput v3, p0, Lkorex/mail/internet/ParameterList$ToStringBuffer;->used:I

    .line 662
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v3

    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v4

    add-int/2addr v3, v4

    add-int/lit8 v1, v3, 0x1

    .line 663
    .local v1, "len":I
    iget v3, p0, Lkorex/mail/internet/ParameterList$ToStringBuffer;->used:I

    add-int/2addr v3, v1

    if-le v3, v5, :cond_2e

    .line 664
    iget-object v3, p0, Lkorex/mail/internet/ParameterList$ToStringBuffer;->sb:Ljava/lang/StringBuffer;

    const-string v4, "\r\n\t"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 665
    const/16 v3, 0x8

    iput v3, p0, Lkorex/mail/internet/ParameterList$ToStringBuffer;->used:I

    .line 667
    :cond_2e
    iget-object v3, p0, Lkorex/mail/internet/ParameterList$ToStringBuffer;->sb:Ljava/lang/StringBuffer;

    invoke-virtual {v3, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const/16 v4, 0x3d

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 668
    iget v3, p0, Lkorex/mail/internet/ParameterList$ToStringBuffer;->used:I

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v4

    add-int/lit8 v4, v4, 0x1

    add-int/2addr v3, v4

    iput v3, p0, Lkorex/mail/internet/ParameterList$ToStringBuffer;->used:I

    .line 669
    iget v3, p0, Lkorex/mail/internet/ParameterList$ToStringBuffer;->used:I

    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v4

    add-int/2addr v3, v4

    if-le v3, v5, :cond_77

    .line 671
    iget v3, p0, Lkorex/mail/internet/ParameterList$ToStringBuffer;->used:I

    invoke-static {v3, p2}, Lkorex/mail/internet/MimeUtility;->fold(ILjava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 672
    .local v2, "s":Ljava/lang/String;
    iget-object v3, p0, Lkorex/mail/internet/ParameterList$ToStringBuffer;->sb:Ljava/lang/StringBuffer;

    invoke-virtual {v3, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 673
    const/16 v3, 0xa

    invoke-virtual {v2, v3}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v0

    .line 674
    .local v0, "lastlf":I
    if-ltz v0, :cond_6d

    .line 675
    iget v3, p0, Lkorex/mail/internet/ParameterList$ToStringBuffer;->used:I

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v4

    sub-int/2addr v4, v0

    add-int/lit8 v4, v4, -0x1

    add-int/2addr v3, v4

    iput v3, p0, Lkorex/mail/internet/ParameterList$ToStringBuffer;->used:I

    .line 682
    .end local v0    # "lastlf":I
    .end local v2    # "s":Ljava/lang/String;
    :goto_6c
    return-void

    .line 677
    .restart local v0    # "lastlf":I
    .restart local v2    # "s":Ljava/lang/String;
    :cond_6d
    iget v3, p0, Lkorex/mail/internet/ParameterList$ToStringBuffer;->used:I

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v4

    add-int/2addr v3, v4

    iput v3, p0, Lkorex/mail/internet/ParameterList$ToStringBuffer;->used:I

    goto :goto_6c

    .line 679
    .end local v0    # "lastlf":I
    .end local v2    # "s":Ljava/lang/String;
    :cond_77
    iget-object v3, p0, Lkorex/mail/internet/ParameterList$ToStringBuffer;->sb:Ljava/lang/StringBuffer;

    invoke-virtual {v3, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 680
    iget v3, p0, Lkorex/mail/internet/ParameterList$ToStringBuffer;->used:I

    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v4

    add-int/2addr v3, v4

    iput v3, p0, Lkorex/mail/internet/ParameterList$ToStringBuffer;->used:I

    goto :goto_6c
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 685
    iget-object v0, p0, Lkorex/mail/internet/ParameterList$ToStringBuffer;->sb:Ljava/lang/StringBuffer;

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

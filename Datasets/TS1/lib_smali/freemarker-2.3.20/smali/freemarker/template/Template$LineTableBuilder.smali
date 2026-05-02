.class Lfreemarker/template/Template$LineTableBuilder;
.super Ljava/io/FilterReader;
.source "Template.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lfreemarker/template/Template;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "LineTableBuilder"
.end annotation


# instance fields
.field lastChar:I

.field lineBuf:Ljava/lang/StringBuffer;

.field private final this$0:Lfreemarker/template/Template;


# direct methods
.method constructor <init>(Lfreemarker/template/Template;Ljava/io/Reader;)V
    .registers 4
    .param p2, "r"    # Ljava/io/Reader;

    .prologue
    .line 549
    invoke-direct {p0, p2}, Ljava/io/FilterReader;-><init>(Ljava/io/Reader;)V

    .line 548
    iput-object p1, p0, Lfreemarker/template/Template$LineTableBuilder;->this$0:Lfreemarker/template/Template;

    .line 542
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    iput-object v0, p0, Lfreemarker/template/Template$LineTableBuilder;->lineBuf:Ljava/lang/StringBuffer;

    .line 550
    return-void
.end method

.method private handleChar(I)V
    .registers 9
    .param p1, "c"    # I

    .prologue
    const/16 v5, 0xd

    const/16 v6, 0xa

    .line 576
    if-eq p1, v6, :cond_8

    if-ne p1, v5, :cond_5f

    .line 577
    :cond_8
    iget v4, p0, Lfreemarker/template/Template$LineTableBuilder;->lastChar:I

    if-ne v4, v5, :cond_43

    if-ne p1, v6, :cond_43

    .line 578
    iget-object v4, p0, Lfreemarker/template/Template$LineTableBuilder;->this$0:Lfreemarker/template/Template;

    invoke-static {v4}, Lfreemarker/template/Template;->access$000(Lfreemarker/template/Template;)Ljava/util/ArrayList;

    move-result-object v4

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    add-int/lit8 v1, v4, -0x1

    .line 579
    .local v1, "lastIndex":I
    iget-object v4, p0, Lfreemarker/template/Template$LineTableBuilder;->this$0:Lfreemarker/template/Template;

    invoke-static {v4}, Lfreemarker/template/Template;->access$000(Lfreemarker/template/Template;)Ljava/util/ArrayList;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 580
    .local v2, "lastLine":Ljava/lang/String;
    iget-object v4, p0, Lfreemarker/template/Template$LineTableBuilder;->this$0:Lfreemarker/template/Template;

    invoke-static {v4}, Lfreemarker/template/Template;->access$000(Lfreemarker/template/Template;)Ljava/util/ArrayList;

    move-result-object v4

    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v5, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v1, v5}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 596
    .end local v1    # "lastIndex":I
    .end local v2    # "lastLine":Ljava/lang/String;
    :cond_40
    :goto_40
    iput p1, p0, Lfreemarker/template/Template$LineTableBuilder;->lastChar:I

    .line 597
    return-void

    .line 582
    :cond_43
    iget-object v4, p0, Lfreemarker/template/Template$LineTableBuilder;->lineBuf:Ljava/lang/StringBuffer;

    int-to-char v5, p1

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 583
    iget-object v4, p0, Lfreemarker/template/Template$LineTableBuilder;->this$0:Lfreemarker/template/Template;

    invoke-static {v4}, Lfreemarker/template/Template;->access$000(Lfreemarker/template/Template;)Ljava/util/ArrayList;

    move-result-object v4

    iget-object v5, p0, Lfreemarker/template/Template$LineTableBuilder;->lineBuf:Ljava/lang/StringBuffer;

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 584
    iget-object v4, p0, Lfreemarker/template/Template$LineTableBuilder;->lineBuf:Ljava/lang/StringBuffer;

    const/4 v5, 0x0

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->setLength(I)V

    goto :goto_40

    .line 587
    :cond_5f
    const/16 v4, 0x9

    if-ne p1, v4, :cond_7a

    .line 588
    iget-object v4, p0, Lfreemarker/template/Template$LineTableBuilder;->lineBuf:Ljava/lang/StringBuffer;

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->length()I

    move-result v4

    rem-int/lit8 v4, v4, 0x8

    rsub-int/lit8 v3, v4, 0x8

    .line 589
    .local v3, "numSpaces":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_6e
    if-ge v0, v3, :cond_40

    .line 590
    iget-object v4, p0, Lfreemarker/template/Template$LineTableBuilder;->lineBuf:Ljava/lang/StringBuffer;

    const/16 v5, 0x20

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 589
    add-int/lit8 v0, v0, 0x1

    goto :goto_6e

    .line 594
    .end local v0    # "i":I
    .end local v3    # "numSpaces":I
    :cond_7a
    iget-object v4, p0, Lfreemarker/template/Template$LineTableBuilder;->lineBuf:Ljava/lang/StringBuffer;

    int-to-char v5, p1

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    goto :goto_40
.end method


# virtual methods
.method public close()V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 568
    iget-object v0, p0, Lfreemarker/template/Template$LineTableBuilder;->lineBuf:Ljava/lang/StringBuffer;

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->length()I

    move-result v0

    if-lez v0, :cond_1d

    .line 569
    iget-object v0, p0, Lfreemarker/template/Template$LineTableBuilder;->this$0:Lfreemarker/template/Template;

    invoke-static {v0}, Lfreemarker/template/Template;->access$000(Lfreemarker/template/Template;)Ljava/util/ArrayList;

    move-result-object v0

    iget-object v1, p0, Lfreemarker/template/Template$LineTableBuilder;->lineBuf:Ljava/lang/StringBuffer;

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 570
    iget-object v0, p0, Lfreemarker/template/Template$LineTableBuilder;->lineBuf:Ljava/lang/StringBuffer;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->setLength(I)V

    .line 572
    :cond_1d
    invoke-super {p0}, Ljava/io/FilterReader;->close()V

    .line 573
    return-void
.end method

.method public read()I
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 553
    iget-object v1, p0, Lfreemarker/template/Template$LineTableBuilder;->in:Ljava/io/Reader;

    invoke-virtual {v1}, Ljava/io/Reader;->read()I

    move-result v0

    .line 554
    .local v0, "c":I
    invoke-direct {p0, v0}, Lfreemarker/template/Template$LineTableBuilder;->handleChar(I)V

    .line 555
    return v0
.end method

.method public read([CII)I
    .registers 8
    .param p1, "cbuf"    # [C
    .param p2, "off"    # I
    .param p3, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 559
    iget-object v3, p0, Lfreemarker/template/Template$LineTableBuilder;->in:Ljava/io/Reader;

    invoke-virtual {v3, p1, p2, p3}, Ljava/io/Reader;->read([CII)I

    move-result v2

    .line 560
    .local v2, "numchars":I
    move v1, p2

    .local v1, "i":I
    :goto_7
    add-int v3, p2, v2

    if-ge v1, v3, :cond_13

    .line 561
    aget-char v0, p1, v1

    .line 562
    .local v0, "c":C
    invoke-direct {p0, v0}, Lfreemarker/template/Template$LineTableBuilder;->handleChar(I)V

    .line 560
    add-int/lit8 v1, v1, 0x1

    goto :goto_7

    .line 564
    .end local v0    # "c":C
    :cond_13
    return v2
.end method

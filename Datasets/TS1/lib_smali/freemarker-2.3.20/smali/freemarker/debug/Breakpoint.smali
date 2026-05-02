.class public Lfreemarker/debug/Breakpoint;
.super Ljava/lang/Object;
.source "Breakpoint.java"

# interfaces
.implements Ljava/io/Serializable;
.implements Ljava/lang/Comparable;


# static fields
.field private static final serialVersionUID:J = 0x1L


# instance fields
.field private final line:I

.field private final templateName:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;I)V
    .registers 3
    .param p1, "templateName"    # Ljava/lang/String;
    .param p2, "line"    # I

    .prologue
    .line 74
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 75
    iput-object p1, p0, Lfreemarker/debug/Breakpoint;->templateName:Ljava/lang/String;

    .line 76
    iput p2, p0, Lfreemarker/debug/Breakpoint;->line:I

    .line 77
    return-void
.end method


# virtual methods
.method public compareTo(Ljava/lang/Object;)I
    .registers 6
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    .line 111
    move-object v0, p1

    check-cast v0, Lfreemarker/debug/Breakpoint;

    .line 112
    .local v0, "b":Lfreemarker/debug/Breakpoint;
    iget-object v2, p0, Lfreemarker/debug/Breakpoint;->templateName:Ljava/lang/String;

    iget-object v3, v0, Lfreemarker/debug/Breakpoint;->templateName:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v1

    .line 113
    .local v1, "r":I
    if-nez v1, :cond_13

    iget v2, p0, Lfreemarker/debug/Breakpoint;->line:I

    iget v3, v0, Lfreemarker/debug/Breakpoint;->line:I

    sub-int v1, v2, v3

    .end local v1    # "r":I
    :cond_13
    return v1
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 6
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x0

    .line 101
    instance-of v2, p1, Lfreemarker/debug/Breakpoint;

    if-eqz v2, :cond_19

    move-object v0, p1

    .line 103
    check-cast v0, Lfreemarker/debug/Breakpoint;

    .line 104
    .local v0, "b":Lfreemarker/debug/Breakpoint;
    iget-object v2, v0, Lfreemarker/debug/Breakpoint;->templateName:Ljava/lang/String;

    iget-object v3, p0, Lfreemarker/debug/Breakpoint;->templateName:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_19

    iget v2, v0, Lfreemarker/debug/Breakpoint;->line:I

    iget v3, p0, Lfreemarker/debug/Breakpoint;->line:I

    if-ne v2, v3, :cond_19

    const/4 v1, 0x1

    .line 106
    .end local v0    # "b":Lfreemarker/debug/Breakpoint;
    :cond_19
    return v1
.end method

.method public getLine()I
    .registers 2

    .prologue
    .line 84
    iget v0, p0, Lfreemarker/debug/Breakpoint;->line:I

    return v0
.end method

.method public getLocationString()Ljava/lang/String;
    .registers 3

    .prologue
    .line 121
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    iget-object v1, p0, Lfreemarker/debug/Breakpoint;->templateName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    const-string v1, ":"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    iget v1, p0, Lfreemarker/debug/Breakpoint;->line:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getTemplateName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 91
    iget-object v0, p0, Lfreemarker/debug/Breakpoint;->templateName:Ljava/lang/String;

    return-object v0
.end method

.method public hashCode()I
    .registers 3

    .prologue
    .line 96
    iget-object v0, p0, Lfreemarker/debug/Breakpoint;->templateName:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    iget v1, p0, Lfreemarker/debug/Breakpoint;->line:I

    mul-int/lit8 v1, v1, 0x1f

    add-int/2addr v0, v1

    return v0
.end method

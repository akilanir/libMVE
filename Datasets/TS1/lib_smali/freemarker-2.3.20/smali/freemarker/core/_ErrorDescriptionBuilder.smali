.class public Lfreemarker/core/_ErrorDescriptionBuilder;
.super Ljava/lang/Object;
.source "_ErrorDescriptionBuilder.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lfreemarker/core/_ErrorDescriptionBuilder$1;,
        Lfreemarker/core/_ErrorDescriptionBuilder$Blaming;
    }
.end annotation


# static fields
.field private static final logger:Lfreemarker/log/Logger;


# instance fields
.field private blamed:Lfreemarker/core/Expression;

.field private final description:Ljava/lang/String;

.field private final descriptionParts:[Ljava/lang/Object;

.field private showBlamer:Z

.field private template:Lfreemarker/template/Template;

.field private tip:Ljava/lang/Object;

.field private tips:[Ljava/lang/Object;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 14
    const-string v0, "freemarker.runtime"

    invoke-static {v0}, Lfreemarker/log/Logger;->getLogger(Ljava/lang/String;)Lfreemarker/log/Logger;

    move-result-object v0

    sput-object v0, Lfreemarker/core/_ErrorDescriptionBuilder;->logger:Lfreemarker/log/Logger;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .registers 3
    .param p1, "description"    # Ljava/lang/String;

    .prologue
    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 25
    iput-object p1, p0, Lfreemarker/core/_ErrorDescriptionBuilder;->description:Ljava/lang/String;

    .line 26
    const/4 v0, 0x0

    iput-object v0, p0, Lfreemarker/core/_ErrorDescriptionBuilder;->descriptionParts:[Ljava/lang/Object;

    .line 27
    return-void
.end method

.method public constructor <init>([Ljava/lang/Object;)V
    .registers 3
    .param p1, "descriptionParts"    # [Ljava/lang/Object;

    .prologue
    .line 34
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 35
    iput-object p1, p0, Lfreemarker/core/_ErrorDescriptionBuilder;->descriptionParts:[Ljava/lang/Object;

    .line 36
    const/4 v0, 0x0

    iput-object v0, p0, Lfreemarker/core/_ErrorDescriptionBuilder;->description:Ljava/lang/String;

    .line 37
    return-void
.end method

.method private appendParts(Ljava/lang/StringBuffer;[Ljava/lang/Object;)V
    .registers 13
    .param p1, "sb"    # Ljava/lang/StringBuffer;
    .param p2, "parts"    # [Ljava/lang/Object;

    .prologue
    const/16 v9, 0x40

    const/16 v8, 0x23

    const/4 v7, 0x2

    const/4 v6, 0x1

    .line 179
    iget-object v4, p0, Lfreemarker/core/_ErrorDescriptionBuilder;->template:Lfreemarker/template/Template;

    if-eqz v4, :cond_20

    iget-object v3, p0, Lfreemarker/core/_ErrorDescriptionBuilder;->template:Lfreemarker/template/Template;

    .line 180
    .local v3, "template":Lfreemarker/template/Template;
    :goto_c
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_d
    array-length v4, p2

    if-ge v0, v4, :cond_9d

    .line 181
    aget-object v2, p2, v0

    .line 182
    .local v2, "partObj":Ljava/lang/Object;
    instance-of v4, v2, [Ljava/lang/Object;

    if-eqz v4, :cond_2d

    .line 183
    check-cast v2, [Ljava/lang/Object;

    .end local v2    # "partObj":Ljava/lang/Object;
    check-cast v2, [Ljava/lang/Object;

    invoke-direct {p0, p1, v2}, Lfreemarker/core/_ErrorDescriptionBuilder;->appendParts(Ljava/lang/StringBuffer;[Ljava/lang/Object;)V

    .line 180
    :goto_1d
    add-int/lit8 v0, v0, 0x1

    goto :goto_d

    .line 179
    .end local v0    # "i":I
    .end local v3    # "template":Lfreemarker/template/Template;
    :cond_20
    iget-object v4, p0, Lfreemarker/core/_ErrorDescriptionBuilder;->blamed:Lfreemarker/core/Expression;

    if-eqz v4, :cond_2b

    iget-object v4, p0, Lfreemarker/core/_ErrorDescriptionBuilder;->blamed:Lfreemarker/core/Expression;

    invoke-virtual {v4}, Lfreemarker/core/Expression;->getTemplate()Lfreemarker/template/Template;

    move-result-object v3

    goto :goto_c

    :cond_2b
    const/4 v3, 0x0

    goto :goto_c

    .line 185
    .restart local v0    # "i":I
    .restart local v2    # "partObj":Ljava/lang/Object;
    .restart local v3    # "template":Lfreemarker/template/Template;
    :cond_2d
    aget-object v4, p2, v0

    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    .line 186
    .local v1, "part":Ljava/lang/String;
    if-eqz v3, :cond_99

    .line 187
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v4

    const/4 v5, 0x4

    if-le v4, v5, :cond_95

    const/4 v4, 0x0

    invoke-virtual {v1, v4}, Ljava/lang/String;->charAt(I)C

    move-result v4

    const/16 v5, 0x3c

    if-ne v4, v5, :cond_95

    invoke-virtual {v1, v6}, Ljava/lang/String;->charAt(I)C

    move-result v4

    if-eq v4, v8, :cond_65

    invoke-virtual {v1, v6}, Ljava/lang/String;->charAt(I)C

    move-result v4

    if-eq v4, v9, :cond_65

    invoke-virtual {v1, v6}, Ljava/lang/String;->charAt(I)C

    move-result v4

    const/16 v5, 0x2f

    if-ne v4, v5, :cond_95

    invoke-virtual {v1, v7}, Ljava/lang/String;->charAt(I)C

    move-result v4

    if-eq v4, v8, :cond_65

    invoke-virtual {v1, v7}, Ljava/lang/String;->charAt(I)C

    move-result v4

    if-ne v4, v9, :cond_95

    :cond_65
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v4

    add-int/lit8 v4, v4, -0x1

    invoke-virtual {v1, v4}, Ljava/lang/String;->charAt(I)C

    move-result v4

    const/16 v5, 0x3e

    if-ne v4, v5, :cond_95

    .line 194
    invoke-virtual {v3}, Lfreemarker/template/Template;->getActualTagSyntax()I

    move-result v4

    if-ne v4, v7, :cond_91

    .line 195
    const/16 v4, 0x5b

    invoke-virtual {p1, v4}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 196
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v4

    add-int/lit8 v4, v4, -0x1

    invoke-virtual {v1, v6, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p1, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 197
    const/16 v4, 0x5d

    invoke-virtual {p1, v4}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    goto :goto_1d

    .line 199
    :cond_91
    invoke-virtual {p1, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_1d

    .line 202
    :cond_95
    invoke-virtual {p1, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_1d

    .line 205
    :cond_99
    invoke-virtual {p1, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_1d

    .line 209
    .end local v1    # "part":Ljava/lang/String;
    .end local v2    # "partObj":Ljava/lang/Object;
    :cond_9d
    return-void
.end method

.method private containsSingleInterpolatoinLiteral(Lfreemarker/core/Expression;I)Z
    .registers 10
    .param p1, "exp"    # Lfreemarker/core/Expression;
    .param p2, "recursionDepth"    # I

    .prologue
    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 139
    if-nez p1, :cond_6

    move v4, v5

    .line 155
    :goto_5
    return v4

    .line 142
    :cond_6
    const/16 v4, 0x14

    if-le p2, v4, :cond_c

    move v4, v5

    goto :goto_5

    .line 144
    :cond_c
    instance-of v4, p1, Lfreemarker/core/StringLiteral;

    if-eqz v4, :cond_1b

    move-object v4, p1

    check-cast v4, Lfreemarker/core/StringLiteral;

    invoke-virtual {v4}, Lfreemarker/core/StringLiteral;->isSingleInterpolationLiteral()Z

    move-result v4

    if-eqz v4, :cond_1b

    move v4, v6

    goto :goto_5

    .line 146
    :cond_1b
    invoke-virtual {p1}, Lfreemarker/core/Expression;->getParameterCount()I

    move-result v1

    .line 147
    .local v1, "paramCnt":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_20
    if-ge v0, v1, :cond_39

    .line 148
    invoke-virtual {p1, v0}, Lfreemarker/core/Expression;->getParameterValue(I)Ljava/lang/Object;

    move-result-object v2

    .line 149
    .local v2, "paramValue":Ljava/lang/Object;
    instance-of v4, v2, Lfreemarker/core/Expression;

    if-eqz v4, :cond_36

    .line 150
    check-cast v2, Lfreemarker/core/Expression;

    .end local v2    # "paramValue":Ljava/lang/Object;
    add-int/lit8 v4, p2, 0x1

    invoke-direct {p0, v2, v4}, Lfreemarker/core/_ErrorDescriptionBuilder;->containsSingleInterpolatoinLiteral(Lfreemarker/core/Expression;I)Z

    move-result v3

    .line 151
    .local v3, "result":Z
    if-eqz v3, :cond_36

    move v4, v6

    goto :goto_5

    .line 147
    .end local v3    # "result":Z
    :cond_36
    add-int/lit8 v0, v0, 0x1

    goto :goto_20

    :cond_39
    move v4, v5

    .line 155
    goto :goto_5
.end method

.method private findBlaming(Lfreemarker/core/TemplateObject;Lfreemarker/core/Expression;I)Lfreemarker/core/_ErrorDescriptionBuilder$Blaming;
    .registers 10
    .param p1, "parent"    # Lfreemarker/core/TemplateObject;
    .param p2, "blamed"    # Lfreemarker/core/Expression;
    .param p3, "recursionDepth"    # I

    .prologue
    const/4 v4, 0x0

    .line 160
    const/16 v5, 0x32

    if-le p3, v5, :cond_7

    move-object v0, v4

    .line 175
    :cond_6
    :goto_6
    return-object v0

    .line 162
    :cond_7
    invoke-virtual {p1}, Lfreemarker/core/TemplateObject;->getParameterCount()I

    move-result v2

    .line 163
    .local v2, "paramCnt":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_c
    if-ge v1, v2, :cond_33

    .line 164
    invoke-virtual {p1, v1}, Lfreemarker/core/TemplateObject;->getParameterValue(I)Ljava/lang/Object;

    move-result-object v3

    .line 165
    .local v3, "paramValue":Ljava/lang/Object;
    if-ne v3, p2, :cond_22

    .line 166
    new-instance v0, Lfreemarker/core/_ErrorDescriptionBuilder$Blaming;

    invoke-direct {v0, v4}, Lfreemarker/core/_ErrorDescriptionBuilder$Blaming;-><init>(Lfreemarker/core/_ErrorDescriptionBuilder$1;)V

    .line 167
    .local v0, "blaming":Lfreemarker/core/_ErrorDescriptionBuilder$Blaming;
    iput-object p1, v0, Lfreemarker/core/_ErrorDescriptionBuilder$Blaming;->blamer:Lfreemarker/core/TemplateObject;

    .line 168
    invoke-virtual {p1, v1}, Lfreemarker/core/TemplateObject;->getParameterRole(I)Lfreemarker/core/ParameterRole;

    move-result-object v4

    iput-object v4, v0, Lfreemarker/core/_ErrorDescriptionBuilder$Blaming;->roleOfblamed:Lfreemarker/core/ParameterRole;

    goto :goto_6

    .line 170
    .end local v0    # "blaming":Lfreemarker/core/_ErrorDescriptionBuilder$Blaming;
    :cond_22
    instance-of v5, v3, Lfreemarker/core/TemplateObject;

    if-eqz v5, :cond_30

    .line 171
    check-cast v3, Lfreemarker/core/TemplateObject;

    .end local v3    # "paramValue":Ljava/lang/Object;
    add-int/lit8 v5, p3, 0x1

    invoke-direct {p0, v3, p2, v5}, Lfreemarker/core/_ErrorDescriptionBuilder;->findBlaming(Lfreemarker/core/TemplateObject;Lfreemarker/core/Expression;I)Lfreemarker/core/_ErrorDescriptionBuilder$Blaming;

    move-result-object v0

    .line 172
    .restart local v0    # "blaming":Lfreemarker/core/_ErrorDescriptionBuilder$Blaming;
    if-nez v0, :cond_6

    .line 163
    .end local v0    # "blaming":Lfreemarker/core/_ErrorDescriptionBuilder$Blaming;
    :cond_30
    add-int/lit8 v1, v1, 0x1

    goto :goto_c

    :cond_33
    move-object v0, v4

    .line 175
    goto :goto_6
.end method

.method private splitToLines(Ljava/lang/String;)[Ljava/lang/String;
    .registers 5
    .param p1, "s"    # Ljava/lang/String;

    .prologue
    .line 212
    const-string v1, "\r\n"

    const-string v2, "\n"

    invoke-static {p1, v1, v2}, Lfreemarker/template/utility/StringUtil;->replace(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 213
    const-string v1, "\r"

    const-string v2, "\n"

    invoke-static {p1, v1, v2}, Lfreemarker/template/utility/StringUtil;->replace(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 214
    const/16 v1, 0xa

    invoke-static {p1, v1}, Lfreemarker/template/utility/StringUtil;->split(Ljava/lang/String;C)[Ljava/lang/String;

    move-result-object v0

    .line 215
    .local v0, "lines":[Ljava/lang/String;
    return-object v0
.end method


# virtual methods
.method public blame(Lfreemarker/core/Expression;)Lfreemarker/core/_ErrorDescriptionBuilder;
    .registers 2
    .param p1, "blamedExpr"    # Lfreemarker/core/Expression;

    .prologue
    .line 227
    iput-object p1, p0, Lfreemarker/core/_ErrorDescriptionBuilder;->blamed:Lfreemarker/core/Expression;

    .line 228
    return-object p0
.end method

.method public showBlamer(Z)Lfreemarker/core/_ErrorDescriptionBuilder;
    .registers 2
    .param p1, "showBlamer"    # Z

    .prologue
    .line 232
    iput-boolean p1, p0, Lfreemarker/core/_ErrorDescriptionBuilder;->showBlamer:Z

    .line 233
    return-object p0
.end method

.method public template(Lfreemarker/template/Template;)Lfreemarker/core/_ErrorDescriptionBuilder;
    .registers 2
    .param p1, "template"    # Lfreemarker/template/Template;

    .prologue
    .line 222
    iput-object p1, p0, Lfreemarker/core/_ErrorDescriptionBuilder;->template:Lfreemarker/template/Template;

    .line 223
    return-object p0
.end method

.method public tip(Ljava/lang/String;)Lfreemarker/core/_ErrorDescriptionBuilder;
    .registers 2
    .param p1, "tip"    # Ljava/lang/String;

    .prologue
    .line 237
    iput-object p1, p0, Lfreemarker/core/_ErrorDescriptionBuilder;->tip:Ljava/lang/Object;

    .line 238
    return-object p0
.end method

.method public tip([Ljava/lang/Object;)Lfreemarker/core/_ErrorDescriptionBuilder;
    .registers 2
    .param p1, "tip"    # [Ljava/lang/Object;

    .prologue
    .line 242
    iput-object p1, p0, Lfreemarker/core/_ErrorDescriptionBuilder;->tip:Ljava/lang/Object;

    .line 243
    return-object p0
.end method

.method public tips([Ljava/lang/Object;)Lfreemarker/core/_ErrorDescriptionBuilder;
    .registers 2
    .param p1, "tips"    # [Ljava/lang/Object;

    .prologue
    .line 247
    iput-object p1, p0, Lfreemarker/core/_ErrorDescriptionBuilder;->tips:[Ljava/lang/Object;

    .line 248
    return-object p0
.end method

.method public tips([[Ljava/lang/String;)Lfreemarker/core/_ErrorDescriptionBuilder;
    .registers 2
    .param p1, "tips"    # [[Ljava/lang/String;

    .prologue
    .line 252
    iput-object p1, p0, Lfreemarker/core/_ErrorDescriptionBuilder;->tips:[Ljava/lang/Object;

    .line 253
    return-object p0
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 40
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lfreemarker/core/_ErrorDescriptionBuilder;->toString(Lfreemarker/core/TemplateElement;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toString(Lfreemarker/core/TemplateElement;)Ljava/lang/String;
    .registers 23
    .param p1, "parentElement"    # Lfreemarker/core/TemplateElement;

    .prologue
    .line 44
    move-object/from16 v0, p0

    iget-object v0, v0, Lfreemarker/core/_ErrorDescriptionBuilder;->blamed:Lfreemarker/core/Expression;

    move-object/from16 v19, v0

    if-nez v19, :cond_27

    move-object/from16 v0, p0

    iget-object v0, v0, Lfreemarker/core/_ErrorDescriptionBuilder;->tips:[Ljava/lang/Object;

    move-object/from16 v19, v0

    if-nez v19, :cond_27

    move-object/from16 v0, p0

    iget-object v0, v0, Lfreemarker/core/_ErrorDescriptionBuilder;->tip:Ljava/lang/Object;

    move-object/from16 v19, v0

    if-nez v19, :cond_27

    move-object/from16 v0, p0

    iget-object v0, v0, Lfreemarker/core/_ErrorDescriptionBuilder;->descriptionParts:[Ljava/lang/Object;

    move-object/from16 v19, v0

    if-nez v19, :cond_27

    move-object/from16 v0, p0

    iget-object v0, v0, Lfreemarker/core/_ErrorDescriptionBuilder;->description:Ljava/lang/String;

    move-object/from16 v19, v0

    .line 135
    :goto_26
    return-object v19

    .line 46
    :cond_27
    new-instance v17, Ljava/lang/StringBuffer;

    const/16 v19, 0xc8

    move-object/from16 v0, v17

    move/from16 v1, v19

    invoke-direct {v0, v1}, Ljava/lang/StringBuffer;-><init>(I)V

    .line 48
    .local v17, "sb":Ljava/lang/StringBuffer;
    if-eqz p1, :cond_a9

    move-object/from16 v0, p0

    iget-object v0, v0, Lfreemarker/core/_ErrorDescriptionBuilder;->blamed:Lfreemarker/core/Expression;

    move-object/from16 v19, v0

    if-eqz v19, :cond_a9

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lfreemarker/core/_ErrorDescriptionBuilder;->showBlamer:Z

    move/from16 v19, v0

    if-eqz v19, :cond_a9

    .line 50
    :try_start_44
    move-object/from16 v0, p0

    iget-object v0, v0, Lfreemarker/core/_ErrorDescriptionBuilder;->blamed:Lfreemarker/core/Expression;

    move-object/from16 v19, v0

    const/16 v20, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, v19

    move/from16 v3, v20

    invoke-direct {v0, v1, v2, v3}, Lfreemarker/core/_ErrorDescriptionBuilder;->findBlaming(Lfreemarker/core/TemplateObject;Lfreemarker/core/Expression;I)Lfreemarker/core/_ErrorDescriptionBuilder$Blaming;

    move-result-object v6

    .line 51
    .local v6, "blaming":Lfreemarker/core/_ErrorDescriptionBuilder$Blaming;
    if-eqz v6, :cond_a9

    .line 52
    const-string v19, "For "

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 53
    iget-object v0, v6, Lfreemarker/core/_ErrorDescriptionBuilder$Blaming;->blamer:Lfreemarker/core/TemplateObject;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Lfreemarker/core/TemplateObject;->getNodeTypeSymbol()Ljava/lang/String;

    move-result-object v15

    .line 54
    .local v15, "nss":Ljava/lang/String;
    const/16 v19, 0x22

    move/from16 v0, v19

    invoke-virtual {v15, v0}, Ljava/lang/String;->indexOf(I)I

    move-result v19

    const/16 v20, -0x1

    move/from16 v0, v19

    move/from16 v1, v20

    if-ne v0, v1, :cond_e3

    const/16 v16, 0x22

    .line 55
    .local v16, "q":C
    :goto_7d
    move-object/from16 v0, v17

    move/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v0, v15}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v19

    move-object/from16 v0, v19

    move/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 56
    const-string v19, " "

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v19

    iget-object v0, v6, Lfreemarker/core/_ErrorDescriptionBuilder$Blaming;->roleOfblamed:Lfreemarker/core/ParameterRole;

    move-object/from16 v20, v0

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v19

    const-string v20, ": "

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;
    :try_end_a9
    .catch Ljava/lang/Throwable; {:try_start_44 .. :try_end_a9} :catch_e6

    .line 65
    .end local v6    # "blaming":Lfreemarker/core/_ErrorDescriptionBuilder$Blaming;
    .end local v15    # "nss":Ljava/lang/String;
    .end local v16    # "q":C
    :cond_a9
    :goto_a9
    move-object/from16 v0, p0

    iget-object v0, v0, Lfreemarker/core/_ErrorDescriptionBuilder;->description:Ljava/lang/String;

    move-object/from16 v19, v0

    if-eqz v19, :cond_f3

    .line 66
    move-object/from16 v0, p0

    iget-object v0, v0, Lfreemarker/core/_ErrorDescriptionBuilder;->description:Ljava/lang/String;

    move-object/from16 v19, v0

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 71
    :goto_be
    const/4 v10, 0x0

    .line 72
    .local v10, "extraTip":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lfreemarker/core/_ErrorDescriptionBuilder;->blamed:Lfreemarker/core/Expression;

    move-object/from16 v19, v0

    if-eqz v19, :cond_1a0

    .line 74
    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuffer;->length()I

    move-result v19

    add-int/lit8 v12, v19, -0x1

    .local v12, "idx":I
    :goto_cd
    if-ltz v12, :cond_103

    move-object/from16 v0, v17

    invoke-virtual {v0, v12}, Ljava/lang/StringBuffer;->charAt(I)C

    move-result v19

    invoke-static/range {v19 .. v19}, Ljava/lang/Character;->isWhitespace(C)Z

    move-result v19

    if-eqz v19, :cond_103

    .line 75
    move-object/from16 v0, v17

    invoke-virtual {v0, v12}, Ljava/lang/StringBuffer;->deleteCharAt(I)Ljava/lang/StringBuffer;

    .line 74
    add-int/lit8 v12, v12, -0x1

    goto :goto_cd

    .line 54
    .end local v10    # "extraTip":Ljava/lang/String;
    .end local v12    # "idx":I
    .restart local v6    # "blaming":Lfreemarker/core/_ErrorDescriptionBuilder$Blaming;
    .restart local v15    # "nss":Ljava/lang/String;
    :cond_e3
    const/16 v16, 0x60

    goto :goto_7d

    .line 58
    .end local v6    # "blaming":Lfreemarker/core/_ErrorDescriptionBuilder$Blaming;
    .end local v15    # "nss":Ljava/lang/String;
    :catch_e6
    move-exception v9

    .line 61
    .local v9, "e":Ljava/lang/Throwable;
    sget-object v19, Lfreemarker/core/_ErrorDescriptionBuilder;->logger:Lfreemarker/log/Logger;

    const-string v20, "Error when searching blamer for better error message."

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    invoke-virtual {v0, v1, v9}, Lfreemarker/log/Logger;->error(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_a9

    .line 68
    .end local v9    # "e":Ljava/lang/Throwable;
    :cond_f3
    move-object/from16 v0, p0

    iget-object v0, v0, Lfreemarker/core/_ErrorDescriptionBuilder;->descriptionParts:[Ljava/lang/Object;

    move-object/from16 v19, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v17

    move-object/from16 v2, v19

    invoke-direct {v0, v1, v2}, Lfreemarker/core/_ErrorDescriptionBuilder;->appendParts(Ljava/lang/StringBuffer;[Ljava/lang/Object;)V

    goto :goto_be

    .line 78
    .restart local v10    # "extraTip":Ljava/lang/String;
    .restart local v12    # "idx":I
    :cond_103
    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuffer;->length()I

    move-result v19

    if-lez v19, :cond_162

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuffer;->length()I

    move-result v19

    add-int/lit8 v19, v19, -0x1

    move-object/from16 v0, v17

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->charAt(I)C

    move-result v13

    .line 79
    .local v13, "lastChar":C
    :goto_117
    if-eqz v13, :cond_122

    .line 80
    const/16 v19, 0xa

    move-object/from16 v0, v17

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 82
    :cond_122
    const/16 v19, 0x3a

    move/from16 v0, v19

    if-eq v13, v0, :cond_131

    .line 83
    const-string v19, "The blamed expression:\n"

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 86
    :cond_131
    move-object/from16 v0, p0

    iget-object v0, v0, Lfreemarker/core/_ErrorDescriptionBuilder;->blamed:Lfreemarker/core/Expression;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Lfreemarker/core/Expression;->toString()Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-direct {v0, v1}, Lfreemarker/core/_ErrorDescriptionBuilder;->splitToLines(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v14

    .line 87
    .local v14, "lines":[Ljava/lang/String;
    const/4 v11, 0x0

    .local v11, "i":I
    :goto_144
    array-length v0, v14

    move/from16 v19, v0

    move/from16 v0, v19

    if-ge v11, v0, :cond_167

    .line 88
    if-nez v11, :cond_164

    const-string v19, "==> "

    :goto_14f
    move-object/from16 v0, v17

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 89
    aget-object v19, v14, v11

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 87
    add-int/lit8 v11, v11, 0x1

    goto :goto_144

    .line 78
    .end local v11    # "i":I
    .end local v13    # "lastChar":C
    .end local v14    # "lines":[Ljava/lang/String;
    :cond_162
    const/4 v13, 0x0

    goto :goto_117

    .line 88
    .restart local v11    # "i":I
    .restart local v13    # "lastChar":C
    .restart local v14    # "lines":[Ljava/lang/String;
    :cond_164
    const-string v19, "\n    "

    goto :goto_14f

    .line 92
    :cond_167
    const-string v19, "  ["

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 93
    move-object/from16 v0, p0

    iget-object v0, v0, Lfreemarker/core/_ErrorDescriptionBuilder;->blamed:Lfreemarker/core/Expression;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Lfreemarker/core/Expression;->getStartLocation()Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 94
    const/16 v19, 0x5d

    move-object/from16 v0, v17

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 97
    move-object/from16 v0, p0

    iget-object v0, v0, Lfreemarker/core/_ErrorDescriptionBuilder;->blamed:Lfreemarker/core/Expression;

    move-object/from16 v19, v0

    const/16 v20, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    move/from16 v2, v20

    invoke-direct {v0, v1, v2}, Lfreemarker/core/_ErrorDescriptionBuilder;->containsSingleInterpolatoinLiteral(Lfreemarker/core/Expression;I)Z

    move-result v19

    if-eqz v19, :cond_1a0

    .line 98
    const-string v10, "It has been noticed that you are using ${...} as the sole content of a quoted string. That does nothing but forcably converts the value inside ${...} to string (as it inserts it into the enclosing string). If that\'s not what you meant, just remove the quotation marks, ${ and }; you don\'t need them. If you indeed wanted to convert to string, use myExpression?string instead."

    .line 106
    .end local v11    # "i":I
    .end local v12    # "idx":I
    .end local v13    # "lastChar":C
    .end local v14    # "lines":[Ljava/lang/String;
    :cond_1a0
    move-object/from16 v0, p0

    iget-object v0, v0, Lfreemarker/core/_ErrorDescriptionBuilder;->tips:[Ljava/lang/Object;

    move-object/from16 v19, v0

    if-eqz v19, :cond_222

    move-object/from16 v0, p0

    iget-object v0, v0, Lfreemarker/core/_ErrorDescriptionBuilder;->tips:[Ljava/lang/Object;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    array-length v0, v0

    move/from16 v19, v0

    :goto_1b3
    move-object/from16 v0, p0

    iget-object v0, v0, Lfreemarker/core/_ErrorDescriptionBuilder;->tip:Ljava/lang/Object;

    move-object/from16 v20, v0

    if-eqz v20, :cond_225

    const/16 v20, 0x1

    :goto_1bd
    add-int v20, v20, v19

    if-eqz v10, :cond_228

    const/16 v19, 0x1

    :goto_1c3
    add-int v5, v20, v19

    .line 108
    .local v5, "allTipsLen":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lfreemarker/core/_ErrorDescriptionBuilder;->tips:[Ljava/lang/Object;

    move-object/from16 v19, v0

    if-eqz v19, :cond_22b

    move-object/from16 v0, p0

    iget-object v0, v0, Lfreemarker/core/_ErrorDescriptionBuilder;->tips:[Ljava/lang/Object;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    array-length v0, v0

    move/from16 v19, v0

    move/from16 v0, v19

    if-ne v5, v0, :cond_22b

    .line 109
    move-object/from16 v0, p0

    iget-object v4, v0, Lfreemarker/core/_ErrorDescriptionBuilder;->tips:[Ljava/lang/Object;

    .line 121
    .local v4, "allTips":[Ljava/lang/Object;
    :cond_1e0
    :goto_1e0
    if-eqz v4, :cond_280

    array-length v0, v4

    move/from16 v19, v0

    if-lez v19, :cond_280

    .line 122
    const-string v19, "\n\n"

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 123
    const/4 v11, 0x0

    .restart local v11    # "i":I
    :goto_1f1
    array-length v0, v4

    move/from16 v19, v0

    move/from16 v0, v19

    if-ge v11, v0, :cond_280

    .line 124
    if-eqz v11, :cond_203

    const/16 v19, 0xa

    move-object/from16 v0, v17

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 125
    :cond_203
    const-string v19, "Tip: "

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 126
    aget-object v18, v4, v11

    .line 127
    .local v18, "tip":Ljava/lang/Object;
    move-object/from16 v0, v18

    instance-of v0, v0, [Ljava/lang/Object;

    move/from16 v19, v0

    if-nez v19, :cond_272

    .line 128
    aget-object v19, v4, v11

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    .line 123
    .end local v18    # "tip":Ljava/lang/Object;
    :goto_21f
    add-int/lit8 v11, v11, 0x1

    goto :goto_1f1

    .line 106
    .end local v4    # "allTips":[Ljava/lang/Object;
    .end local v5    # "allTipsLen":I
    .end local v11    # "i":I
    :cond_222
    const/16 v19, 0x0

    goto :goto_1b3

    :cond_225
    const/16 v20, 0x0

    goto :goto_1bd

    :cond_228
    const/16 v19, 0x0

    goto :goto_1c3

    .line 111
    .restart local v5    # "allTipsLen":I
    :cond_22b
    new-array v4, v5, [Ljava/lang/Object;

    .line 112
    .restart local v4    # "allTips":[Ljava/lang/Object;
    const/4 v7, 0x0

    .line 113
    .local v7, "dst":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lfreemarker/core/_ErrorDescriptionBuilder;->tip:Ljava/lang/Object;

    move-object/from16 v19, v0

    if-eqz v19, :cond_241

    add-int/lit8 v8, v7, 0x1

    .end local v7    # "dst":I
    .local v8, "dst":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lfreemarker/core/_ErrorDescriptionBuilder;->tip:Ljava/lang/Object;

    move-object/from16 v19, v0

    aput-object v19, v4, v7

    move v7, v8

    .line 114
    .end local v8    # "dst":I
    .restart local v7    # "dst":I
    :cond_241
    move-object/from16 v0, p0

    iget-object v0, v0, Lfreemarker/core/_ErrorDescriptionBuilder;->tips:[Ljava/lang/Object;

    move-object/from16 v19, v0

    if-eqz v19, :cond_269

    .line 115
    const/4 v11, 0x0

    .restart local v11    # "i":I
    :goto_24a
    move-object/from16 v0, p0

    iget-object v0, v0, Lfreemarker/core/_ErrorDescriptionBuilder;->tips:[Ljava/lang/Object;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    array-length v0, v0

    move/from16 v19, v0

    move/from16 v0, v19

    if-ge v11, v0, :cond_269

    .line 116
    add-int/lit8 v8, v7, 0x1

    .end local v7    # "dst":I
    .restart local v8    # "dst":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lfreemarker/core/_ErrorDescriptionBuilder;->tips:[Ljava/lang/Object;

    move-object/from16 v19, v0

    aget-object v19, v19, v11

    aput-object v19, v4, v7

    .line 115
    add-int/lit8 v11, v11, 0x1

    move v7, v8

    .end local v8    # "dst":I
    .restart local v7    # "dst":I
    goto :goto_24a

    .end local v11    # "i":I
    :cond_269
    move v8, v7

    .line 119
    .end local v7    # "dst":I
    .restart local v8    # "dst":I
    if-eqz v10, :cond_1e0

    add-int/lit8 v7, v8, 0x1

    .end local v8    # "dst":I
    .restart local v7    # "dst":I
    aput-object v10, v4, v8

    goto/16 :goto_1e0

    .line 130
    .end local v7    # "dst":I
    .restart local v11    # "i":I
    .restart local v18    # "tip":Ljava/lang/Object;
    :cond_272
    check-cast v18, [Ljava/lang/Object;

    .end local v18    # "tip":Ljava/lang/Object;
    check-cast v18, [Ljava/lang/Object;

    move-object/from16 v0, p0

    move-object/from16 v1, v17

    move-object/from16 v2, v18

    invoke-direct {v0, v1, v2}, Lfreemarker/core/_ErrorDescriptionBuilder;->appendParts(Ljava/lang/StringBuffer;[Ljava/lang/Object;)V

    goto :goto_21f

    .line 135
    .end local v11    # "i":I
    :cond_280
    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v19

    goto/16 :goto_26
.end method

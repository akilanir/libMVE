.class Lfreemarker/core/MessageUtil;
.super Ljava/lang/Object;
.source "MessageUtil.java"


# static fields
.field static final EMBEDDED_MESSAGE_BEGIN:Ljava/lang/String; = "---begin-message---\n"

.field static final EMBEDDED_MESSAGE_END:Ljava/lang/String; = "\n---end-message---"

.field static final UNKNOWN_DATE_TO_STRING_TIPS:[Ljava/lang/String;

.field static final UNKNOWN_DATE_TYPE_ERROR_TIPS:[Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 5

    .prologue
    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 16
    new-array v0, v4, [Ljava/lang/String;

    const-string v1, "Use ?time, ?date or ?datetime to tell FreeMarker which parts of the date is used."

    aput-object v1, v0, v2

    const-string v1, "For programmers: Use java.sql.Date/Time/Timestamp instead of java.util.Date in the data-model to avoid this ambiguity."

    aput-object v1, v0, v3

    sput-object v0, Lfreemarker/core/MessageUtil;->UNKNOWN_DATE_TYPE_ERROR_TIPS:[Ljava/lang/String;

    .line 22
    const/4 v0, 0x3

    new-array v0, v0, [Ljava/lang/String;

    const-string v1, "Use ?string(format) to specify which parts to display."

    aput-object v1, v0, v2

    sget-object v1, Lfreemarker/core/MessageUtil;->UNKNOWN_DATE_TYPE_ERROR_TIPS:[Ljava/lang/String;

    aget-object v1, v1, v2

    aput-object v1, v0, v3

    sget-object v1, Lfreemarker/core/MessageUtil;->UNKNOWN_DATE_TYPE_ERROR_TIPS:[Ljava/lang/String;

    aget-object v1, v1, v3

    aput-object v1, v0, v4

    sput-object v0, Lfreemarker/core/MessageUtil;->UNKNOWN_DATE_TO_STRING_TIPS:[Ljava/lang/String;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .prologue
    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static appendExpressionAsUntearable(Ljava/lang/StringBuffer;Lfreemarker/core/Expression;)Ljava/lang/StringBuffer;
    .registers 4
    .param p0, "sb"    # Ljava/lang/StringBuffer;
    .param p1, "argExp"    # Lfreemarker/core/Expression;

    .prologue
    .line 143
    instance-of v1, p1, Lfreemarker/core/NumberLiteral;

    if-nez v1, :cond_3f

    instance-of v1, p1, Lfreemarker/core/StringLiteral;

    if-nez v1, :cond_3f

    instance-of v1, p1, Lfreemarker/core/BooleanLiteral;

    if-nez v1, :cond_3f

    instance-of v1, p1, Lfreemarker/core/ListLiteral;

    if-nez v1, :cond_3f

    instance-of v1, p1, Lfreemarker/core/HashLiteral;

    if-nez v1, :cond_3f

    instance-of v1, p1, Lfreemarker/core/Identifier;

    if-nez v1, :cond_3f

    instance-of v1, p1, Lfreemarker/core/Dot;

    if-nez v1, :cond_3f

    instance-of v1, p1, Lfreemarker/core/DynamicKeyName;

    if-nez v1, :cond_3f

    instance-of v1, p1, Lfreemarker/core/MethodCall;

    if-nez v1, :cond_3f

    instance-of v1, p1, Lfreemarker/core/BuiltIn;

    if-nez v1, :cond_3f

    const/4 v0, 0x1

    .line 154
    .local v0, "needParen":Z
    :goto_29
    if-eqz v0, :cond_30

    const/16 v1, 0x28

    invoke-virtual {p0, v1}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 155
    :cond_30
    invoke-virtual {p1}, Lfreemarker/core/Expression;->getCanonicalForm()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 156
    if-eqz v0, :cond_3e

    const/16 v1, 0x29

    invoke-virtual {p0, v1}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 157
    :cond_3e
    return-object p0

    .line 143
    .end local v0    # "needParen":Z
    :cond_3f
    const/4 v0, 0x0

    goto :goto_29
.end method

.method private static formatLocation(Ljava/lang/String;Lfreemarker/template/Template;II)Ljava/lang/String;
    .registers 5
    .param p0, "preposition"    # Ljava/lang/String;
    .param p1, "template"    # Lfreemarker/template/Template;
    .param p2, "line"    # I
    .param p3, "column"    # I

    .prologue
    .line 65
    if-eqz p1, :cond_b

    invoke-virtual {p1}, Lfreemarker/template/Template;->getName()Ljava/lang/String;

    move-result-object v0

    :goto_6
    invoke-static {p0, v0, p2, p3}, Lfreemarker/core/MessageUtil;->formatLocation(Ljava/lang/String;Ljava/lang/String;II)Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_b
    const/4 v0, 0x0

    goto :goto_6
.end method

.method private static formatLocation(Ljava/lang/String;Ljava/lang/String;II)Ljava/lang/String;
    .registers 10
    .param p0, "preposition"    # Ljava/lang/String;
    .param p1, "templateName"    # Ljava/lang/String;
    .param p2, "line"    # I
    .param p3, "column"    # I

    .prologue
    .line 69
    const/4 v2, 0x0

    const/4 v3, 0x0

    move-object v0, p0

    move-object v1, p1

    move v4, p2

    move v5, p3

    invoke-static/range {v0 .. v5}, Lfreemarker/core/MessageUtil;->formatLocation(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZII)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static formatLocation(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZII)Ljava/lang/String;
    .registers 10
    .param p0, "preposition"    # Ljava/lang/String;
    .param p1, "templateName"    # Ljava/lang/String;
    .param p2, "macroOrFuncName"    # Ljava/lang/String;
    .param p3, "isFunction"    # Z
    .param p4, "line"    # I
    .param p5, "column"    # I

    .prologue
    .line 80
    if-gez p4, :cond_60

    .line 81
    const-string v0, "?eval-ed string"

    .line 82
    .local v0, "templateDesc":Ljava/lang/String;
    const v1, 0x3b9aca01

    add-int/2addr p4, v1

    .line 83
    const/4 p2, 0x0

    .line 89
    :goto_9
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string v2, "in "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    if-eqz p2, :cond_80

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string v3, " in "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    if-eqz p3, :cond_7d

    const-string v1, "function "

    :goto_29
    invoke-virtual {v3, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-static {p2}, Lfreemarker/template/utility/StringUtil;->jQuote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    :goto_39
    invoke-virtual {v2, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string v2, " line "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p4}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string v2, ", column "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p5}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 85
    .end local v0    # "templateDesc":Ljava/lang/String;
    :cond_60
    if-eqz p1, :cond_7a

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string v2, "template "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-static {p1}, Lfreemarker/template/utility/StringUtil;->jQuoteNoXSS(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    .restart local v0    # "templateDesc":Ljava/lang/String;
    :goto_79
    goto :goto_9

    .end local v0    # "templateDesc":Ljava/lang/String;
    :cond_7a
    const-string v0, "nameless template"

    goto :goto_79

    .line 89
    .restart local v0    # "templateDesc":Ljava/lang/String;
    :cond_7d
    const-string v1, "macro "

    goto :goto_29

    :cond_80
    const-string v1, ""

    goto :goto_39
.end method

.method static formatLocationForDependentParsingError(Lfreemarker/template/Template;II)Ljava/lang/String;
    .registers 4
    .param p0, "template"    # Lfreemarker/template/Template;
    .param p1, "line"    # I
    .param p2, "column"    # I

    .prologue
    .line 44
    const-string v0, "on"

    invoke-static {v0, p0, p1, p2}, Lfreemarker/core/MessageUtil;->formatLocation(Ljava/lang/String;Lfreemarker/template/Template;II)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static formatLocationForDependentParsingError(Ljava/lang/String;II)Ljava/lang/String;
    .registers 4
    .param p0, "templateName"    # Ljava/lang/String;
    .param p1, "line"    # I
    .param p2, "column"    # I

    .prologue
    .line 48
    const-string v0, "on"

    invoke-static {v0, p0, p1, p2}, Lfreemarker/core/MessageUtil;->formatLocation(Ljava/lang/String;Ljava/lang/String;II)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static formatLocationForEvaluationError(Lfreemarker/core/Macro;II)Ljava/lang/String;
    .registers 10
    .param p0, "macro"    # Lfreemarker/core/Macro;
    .param p1, "line"    # I
    .param p2, "column"    # I

    .prologue
    .line 56
    invoke-virtual {p0}, Lfreemarker/core/Macro;->getTemplate()Lfreemarker/template/Template;

    move-result-object v6

    .line 57
    .local v6, "t":Lfreemarker/template/Template;
    const-string v0, "at"

    if-eqz v6, :cond_1b

    invoke-virtual {v6}, Lfreemarker/template/Template;->getName()Ljava/lang/String;

    move-result-object v1

    :goto_c
    invoke-virtual {p0}, Lfreemarker/core/Macro;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0}, Lfreemarker/core/Macro;->isFunction()Z

    move-result v3

    move v4, p1

    move v5, p2

    invoke-static/range {v0 .. v5}, Lfreemarker/core/MessageUtil;->formatLocation(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZII)Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_1b
    const/4 v1, 0x0

    goto :goto_c
.end method

.method static formatLocationForEvaluationError(Lfreemarker/template/Template;II)Ljava/lang/String;
    .registers 4
    .param p0, "template"    # Lfreemarker/template/Template;
    .param p1, "line"    # I
    .param p2, "column"    # I

    .prologue
    .line 52
    const-string v0, "at"

    invoke-static {v0, p0, p1, p2}, Lfreemarker/core/MessageUtil;->formatLocation(Ljava/lang/String;Lfreemarker/template/Template;II)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static formatLocationForEvaluationError(Ljava/lang/String;II)Ljava/lang/String;
    .registers 4
    .param p0, "templateName"    # Ljava/lang/String;
    .param p1, "line"    # I
    .param p2, "column"    # I

    .prologue
    .line 61
    const-string v0, "at"

    invoke-static {v0, p0, p1, p2}, Lfreemarker/core/MessageUtil;->formatLocation(Ljava/lang/String;Ljava/lang/String;II)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static formatLocationForSimpleParsingError(Lfreemarker/template/Template;II)Ljava/lang/String;
    .registers 4
    .param p0, "template"    # Lfreemarker/template/Template;
    .param p1, "line"    # I
    .param p2, "column"    # I

    .prologue
    .line 36
    const-string v0, "in"

    invoke-static {v0, p0, p1, p2}, Lfreemarker/core/MessageUtil;->formatLocation(Ljava/lang/String;Lfreemarker/template/Template;II)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static formatLocationForSimpleParsingError(Ljava/lang/String;II)Ljava/lang/String;
    .registers 4
    .param p0, "templateName"    # Ljava/lang/String;
    .param p1, "line"    # I
    .param p2, "column"    # I

    .prologue
    .line 40
    const-string v0, "in"

    invoke-static {v0, p0, p1, p2}, Lfreemarker/core/MessageUtil;->formatLocation(Ljava/lang/String;Ljava/lang/String;II)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static getAOrAn(Ljava/lang/String;)Ljava/lang/String;
    .registers 9
    .param p0, "s"    # Ljava/lang/String;

    .prologue
    const/16 v7, 0x69

    const/16 v6, 0x65

    const/4 v5, 0x1

    const/4 v2, 0x0

    const/16 v4, 0x61

    .line 249
    if-nez p0, :cond_c

    const/4 v3, 0x0

    .line 271
    :goto_b
    return-object v3

    .line 250
    :cond_c
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    if-nez v3, :cond_15

    const-string v3, ""

    goto :goto_b

    .line 252
    :cond_15
    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v3

    invoke-static {v3}, Ljava/lang/Character;->toLowerCase(C)C

    move-result v0

    .line 253
    .local v0, "fc":C
    if-eq v0, v4, :cond_23

    if-eq v0, v6, :cond_23

    if-ne v0, v7, :cond_26

    .line 254
    :cond_23
    const-string v3, "an"

    goto :goto_b

    .line 255
    :cond_26
    const/16 v3, 0x68

    if-ne v0, v3, :cond_4f

    .line 256
    invoke-virtual {p0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    .line 257
    .local v1, "ls":Ljava/lang/String;
    const-string v3, "has"

    invoke-virtual {v1, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_3e

    const-string v3, "hi"

    invoke-virtual {v1, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_41

    .line 258
    :cond_3e
    const-string v3, "a"

    goto :goto_b

    .line 259
    :cond_41
    const-string v3, "ht"

    invoke-virtual {v1, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_4c

    .line 260
    const-string v3, "an"

    goto :goto_b

    .line 262
    :cond_4c
    const-string v3, "a(n)"

    goto :goto_b

    .line 264
    .end local v1    # "ls":Ljava/lang/String;
    :cond_4f
    const/16 v3, 0x75

    if-eq v0, v3, :cond_57

    const/16 v3, 0x6f

    if-ne v0, v3, :cond_5a

    .line 265
    :cond_57
    const-string v3, "a(n)"

    goto :goto_b

    .line 267
    :cond_5a
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    if-le v3, v5, :cond_64

    invoke-virtual {p0, v5}, Ljava/lang/String;->charAt(I)C

    move-result v2

    .line 268
    .local v2, "sc":C
    :cond_64
    const/16 v3, 0x78

    if-ne v0, v3, :cond_7b

    if-eq v2, v4, :cond_7b

    if-eq v2, v6, :cond_7b

    if-eq v2, v7, :cond_7b

    if-eq v2, v4, :cond_7b

    const/16 v3, 0x6f

    if-eq v2, v3, :cond_7b

    const/16 v3, 0x75

    if-eq v2, v3, :cond_7b

    .line 269
    const-string v3, "an"

    goto :goto_b

    .line 271
    :cond_7b
    const-string v3, "a"

    goto :goto_b
.end method

.method static newArgCntError(Ljava/lang/String;II)Lfreemarker/template/TemplateModelException;
    .registers 4
    .param p0, "methodName"    # Ljava/lang/String;
    .param p1, "argCnt"    # I
    .param p2, "expectedCnt"    # I

    .prologue
    .line 161
    invoke-static {p0, p1, p2, p2}, Lfreemarker/core/MessageUtil;->newArgCntError(Ljava/lang/String;III)Lfreemarker/template/TemplateModelException;

    move-result-object v0

    return-object v0
.end method

.method static newArgCntError(Ljava/lang/String;III)Lfreemarker/template/TemplateModelException;
    .registers 7
    .param p0, "methodName"    # Ljava/lang/String;
    .param p1, "argCnt"    # I
    .param p2, "minCnt"    # I
    .param p3, "maxCnt"    # I

    .prologue
    const/4 v2, 0x1

    .line 165
    new-instance v0, Ljava/util/ArrayList;

    const/16 v1, 0x14

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 167
    .local v0, "desc":Ljava/util/ArrayList;
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 169
    const-string v1, "("

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 170
    if-eqz p3, :cond_17

    const-string v1, "..."

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 171
    :cond_17
    const-string v1, ") expects "

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 173
    if-ne p2, p3, :cond_55

    .line 174
    if-nez p3, :cond_4c

    .line 175
    const-string v1, "no"

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 192
    :goto_25
    const-string v1, " argument"

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 193
    if-le p3, v2, :cond_31

    const-string v1, "s"

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 195
    :cond_31
    const-string v1, " but has received "

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 196
    if-nez p1, :cond_90

    .line 197
    const-string v1, "none"

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 201
    :goto_3d
    const-string v1, "."

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 203
    new-instance v1, Lfreemarker/core/_TemplateModelException;

    invoke-virtual {v0}, Ljava/util/ArrayList;->toArray()[Ljava/lang/Object;

    move-result-object v2

    invoke-direct {v1, v2}, Lfreemarker/core/_TemplateModelException;-><init>([Ljava/lang/Object;)V

    return-object v1

    .line 177
    :cond_4c
    new-instance v1, Ljava/lang/Integer;

    invoke-direct {v1, p3}, Ljava/lang/Integer;-><init>(I)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_25

    .line 179
    :cond_55
    sub-int v1, p3, p2

    if-ne v1, v2, :cond_6f

    .line 180
    new-instance v1, Ljava/lang/Integer;

    invoke-direct {v1, p2}, Ljava/lang/Integer;-><init>(I)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 181
    const-string v1, " or "

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 182
    new-instance v1, Ljava/lang/Integer;

    invoke-direct {v1, p3}, Ljava/lang/Integer;-><init>(I)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_25

    .line 184
    :cond_6f
    new-instance v1, Ljava/lang/Integer;

    invoke-direct {v1, p2}, Ljava/lang/Integer;-><init>(I)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 185
    const v1, 0x7fffffff

    if-eq p3, v1, :cond_8a

    .line 186
    const-string v1, " to "

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 187
    new-instance v1, Ljava/lang/Integer;

    invoke-direct {v1, p3}, Ljava/lang/Integer;-><init>(I)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_25

    .line 189
    :cond_8a
    const-string v1, " or more (unlimited)"

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_25

    .line 199
    :cond_90
    new-instance v1, Ljava/lang/Integer;

    invoke-direct {v1, p1}, Ljava/lang/Integer;-><init>(I)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_3d
.end method

.method static newInstantiatingClassNotAllowedException(Ljava/lang/String;Lfreemarker/core/Environment;)Lfreemarker/template/TemplateException;
    .registers 6
    .param p0, "className"    # Ljava/lang/String;
    .param p1, "env"    # Lfreemarker/core/Environment;

    .prologue
    .line 241
    new-instance v0, Lfreemarker/core/_MiscTemplateException;

    const/4 v1, 0x3

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    const-string v3, "Instantiating "

    aput-object v3, v1, v2

    const/4 v2, 0x1

    aput-object p0, v1, v2

    const/4 v2, 0x2

    const-string v3, " is not allowed in the template for security reasons."

    aput-object v3, v1, v2

    invoke-direct {v0, p1, v1}, Lfreemarker/core/_MiscTemplateException;-><init>(Lfreemarker/core/Environment;[Ljava/lang/Object;)V

    return-object v0
.end method

.method static newMethodArgMustBeBooleanException(Ljava/lang/String;ILfreemarker/template/TemplateModel;)Lfreemarker/template/TemplateModelException;
    .registers 4
    .param p0, "methodName"    # Ljava/lang/String;
    .param p1, "argIdx"    # I
    .param p2, "arg"    # Lfreemarker/template/TemplateModel;

    .prologue
    .line 215
    const-string v0, "boolean"

    invoke-static {p0, p1, v0, p2}, Lfreemarker/core/MessageUtil;->newMethodArgUnexpectedTypeException(Ljava/lang/String;ILjava/lang/String;Lfreemarker/template/TemplateModel;)Lfreemarker/template/TemplateModelException;

    move-result-object v0

    return-object v0
.end method

.method static newMethodArgMustBeExtendedHashException(Ljava/lang/String;ILfreemarker/template/TemplateModel;)Lfreemarker/template/TemplateModelException;
    .registers 4
    .param p0, "methodName"    # Ljava/lang/String;
    .param p1, "argIdx"    # I
    .param p2, "arg"    # Lfreemarker/template/TemplateModel;

    .prologue
    .line 220
    const-string v0, "extended hash"

    invoke-static {p0, p1, v0, p2}, Lfreemarker/core/MessageUtil;->newMethodArgUnexpectedTypeException(Ljava/lang/String;ILjava/lang/String;Lfreemarker/template/TemplateModel;)Lfreemarker/template/TemplateModelException;

    move-result-object v0

    return-object v0
.end method

.method static newMethodArgMustBeNumberException(Ljava/lang/String;ILfreemarker/template/TemplateModel;)Lfreemarker/template/TemplateModelException;
    .registers 4
    .param p0, "methodName"    # Ljava/lang/String;
    .param p1, "argIdx"    # I
    .param p2, "arg"    # Lfreemarker/template/TemplateModel;

    .prologue
    .line 211
    const-string v0, "number"

    invoke-static {p0, p1, v0, p2}, Lfreemarker/core/MessageUtil;->newMethodArgUnexpectedTypeException(Ljava/lang/String;ILjava/lang/String;Lfreemarker/template/TemplateModel;)Lfreemarker/template/TemplateModelException;

    move-result-object v0

    return-object v0
.end method

.method static newMethodArgMustBeSequenceException(Ljava/lang/String;ILfreemarker/template/TemplateModel;)Lfreemarker/template/TemplateModelException;
    .registers 4
    .param p0, "methodName"    # Ljava/lang/String;
    .param p1, "argIdx"    # I
    .param p2, "arg"    # Lfreemarker/template/TemplateModel;

    .prologue
    .line 225
    const-string v0, "sequence"

    invoke-static {p0, p1, v0, p2}, Lfreemarker/core/MessageUtil;->newMethodArgUnexpectedTypeException(Ljava/lang/String;ILjava/lang/String;Lfreemarker/template/TemplateModel;)Lfreemarker/template/TemplateModelException;

    move-result-object v0

    return-object v0
.end method

.method static newMethodArgMustBeSequenceOrCollectionException(Ljava/lang/String;ILfreemarker/template/TemplateModel;)Lfreemarker/template/TemplateModelException;
    .registers 4
    .param p0, "methodName"    # Ljava/lang/String;
    .param p1, "argIdx"    # I
    .param p2, "arg"    # Lfreemarker/template/TemplateModel;

    .prologue
    .line 230
    const-string v0, "sequence or collection"

    invoke-static {p0, p1, v0, p2}, Lfreemarker/core/MessageUtil;->newMethodArgUnexpectedTypeException(Ljava/lang/String;ILjava/lang/String;Lfreemarker/template/TemplateModel;)Lfreemarker/template/TemplateModelException;

    move-result-object v0

    return-object v0
.end method

.method static newMethodArgMustBeStringException(Ljava/lang/String;ILfreemarker/template/TemplateModel;)Lfreemarker/template/TemplateModelException;
    .registers 4
    .param p0, "methodName"    # Ljava/lang/String;
    .param p1, "argIdx"    # I
    .param p2, "arg"    # Lfreemarker/template/TemplateModel;

    .prologue
    .line 207
    const-string v0, "string"

    invoke-static {p0, p1, v0, p2}, Lfreemarker/core/MessageUtil;->newMethodArgUnexpectedTypeException(Ljava/lang/String;ILjava/lang/String;Lfreemarker/template/TemplateModel;)Lfreemarker/template/TemplateModelException;

    move-result-object v0

    return-object v0
.end method

.method static newMethodArgUnexpectedTypeException(Ljava/lang/String;ILjava/lang/String;Lfreemarker/template/TemplateModel;)Lfreemarker/template/TemplateModelException;
    .registers 9
    .param p0, "methodName"    # Ljava/lang/String;
    .param p1, "argIdx"    # I
    .param p2, "expectedType"    # Ljava/lang/String;
    .param p3, "arg"    # Lfreemarker/template/TemplateModel;

    .prologue
    .line 235
    new-instance v0, Lfreemarker/core/_TemplateModelException;

    const/16 v1, 0x8

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p0, v1, v2

    const/4 v2, 0x1

    const-string v3, "(...) expects "

    aput-object v3, v1, v2

    const/4 v2, 0x2

    new-instance v3, Lfreemarker/core/_DelayedAOrAn;

    invoke-direct {v3, p2}, Lfreemarker/core/_DelayedAOrAn;-><init>(Ljava/lang/Object;)V

    aput-object v3, v1, v2

    const/4 v2, 0x3

    const-string v3, " as argument #"

    aput-object v3, v1, v2

    const/4 v2, 0x4

    new-instance v3, Ljava/lang/Integer;

    add-int/lit8 v4, p1, 0x1

    invoke-direct {v3, v4}, Ljava/lang/Integer;-><init>(I)V

    aput-object v3, v1, v2

    const/4 v2, 0x5

    const-string v3, ", but received "

    aput-object v3, v1, v2

    const/4 v2, 0x6

    new-instance v3, Lfreemarker/core/_DelayedAOrAn;

    new-instance v4, Lfreemarker/core/_DelayedFTLTypeDescription;

    invoke-direct {v4, p3}, Lfreemarker/core/_DelayedFTLTypeDescription;-><init>(Lfreemarker/template/TemplateModel;)V

    invoke-direct {v3, v4}, Lfreemarker/core/_DelayedAOrAn;-><init>(Ljava/lang/Object;)V

    aput-object v3, v1, v2

    const/4 v2, 0x7

    const-string v3, "."

    aput-object v3, v1, v2

    invoke-direct {v0, v1}, Lfreemarker/core/_TemplateModelException;-><init>([Ljava/lang/Object;)V

    return-object v0
.end method

.method static shorten(Ljava/lang/String;I)Ljava/lang/String;
    .registers 7
    .param p0, "s"    # Ljava/lang/String;
    .param p1, "maxLength"    # I

    .prologue
    const/4 v4, -0x1

    const/4 v3, 0x0

    .line 103
    const/4 v2, 0x5

    if-ge p1, v2, :cond_6

    const/4 p1, 0x5

    .line 105
    :cond_6
    const/4 v1, 0x0

    .line 107
    .local v1, "isTruncated":Z
    const/16 v2, 0xa

    invoke-virtual {p0, v2}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    .line 108
    .local v0, "brIdx":I
    if-eq v0, v4, :cond_14

    .line 109
    invoke-virtual {p0, v3, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    .line 110
    const/4 v1, 0x1

    .line 112
    :cond_14
    const/16 v2, 0xd

    invoke-virtual {p0, v2}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    .line 113
    if-eq v0, v4, :cond_21

    .line 114
    invoke-virtual {p0, v3, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    .line 115
    const/4 v1, 0x1

    .line 118
    :cond_21
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    if-le v2, p1, :cond_2e

    .line 119
    add-int/lit8 v2, p1, -0x3

    invoke-virtual {p0, v3, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    .line 120
    const/4 v1, 0x1

    .line 123
    :cond_2e
    if-nez v1, :cond_31

    .line 137
    .end local p0    # "s":Ljava/lang/String;
    :cond_30
    :goto_30
    return-object p0

    .line 126
    .restart local p0    # "s":Ljava/lang/String;
    :cond_31
    const-string v2, "."

    invoke-virtual {p0, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_71

    .line 127
    const-string v2, ".."

    invoke-virtual {p0, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_5d

    .line 128
    const-string v2, "..."

    invoke-virtual {p0, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_30

    .line 131
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v2, p0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string v3, "."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p0

    goto :goto_30

    .line 134
    :cond_5d
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v2, p0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string v3, ".."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p0

    goto :goto_30

    .line 137
    :cond_71
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v2, p0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string v3, "..."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p0

    goto :goto_30
.end method

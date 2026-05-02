.class public Lfreemarker/core/CommandLine;
.super Ljava/lang/Object;
.source "CommandLine.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 63
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static main([Ljava/lang/String;)V
    .registers 10
    .param p0, "args"    # [Ljava/lang/String;

    .prologue
    const/4 v1, 0x1

    .line 66
    invoke-static {}, Lfreemarker/template/Configuration;->getVersion()Lfreemarker/template/Version;

    move-result-object v7

    .line 68
    .local v7, "ver":Lfreemarker/template/Version;
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {v0}, Ljava/io/PrintStream;->println()V

    .line 69
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v2, "FreeMarker version "

    invoke-virtual {v0, v2}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    .line 70
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {v0, v7}, Ljava/io/PrintStream;->print(Ljava/lang/Object;)V

    .line 73
    invoke-virtual {v7}, Lfreemarker/template/Version;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v2, "Z"

    invoke-virtual {v0, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_4d

    invoke-virtual {v7}, Lfreemarker/template/Version;->getBuildDate()Ljava/util/Date;

    move-result-object v0

    if-eqz v0, :cond_4d

    .line 75
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v2, " (built on "

    invoke-virtual {v0, v2}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    .line 76
    sget-object v8, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {v7}, Lfreemarker/template/Version;->getBuildDate()Ljava/util/Date;

    move-result-object v0

    const/4 v4, 0x6

    sget-object v5, Lfreemarker/template/utility/DateUtil;->UTC:Ljava/util/TimeZone;

    new-instance v6, Lfreemarker/template/utility/DateUtil$TrivialDateToISO8601CalendarFactory;

    invoke-direct {v6}, Lfreemarker/template/utility/DateUtil$TrivialDateToISO8601CalendarFactory;-><init>()V

    move v2, v1

    move v3, v1

    invoke-static/range {v0 .. v6}, Lfreemarker/template/utility/DateUtil;->dateToISO8601String(Ljava/util/Date;ZZZILjava/util/TimeZone;Lfreemarker/template/utility/DateUtil$DateToISO8601CalendarFactory;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v8, v0}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    .line 81
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, ")"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    .line 83
    :cond_4d
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {v0}, Ljava/io/PrintStream;->println()V

    .line 85
    invoke-virtual {v7}, Lfreemarker/template/Version;->isGAECompliant()Ljava/lang/Boolean;

    move-result-object v0

    if-eqz v0, :cond_70

    .line 86
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "Google App Engine complian variant: "

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    .line 87
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {v7}, Lfreemarker/template/Version;->isGAECompliant()Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_af

    const-string v0, "Yes"

    :goto_6d
    invoke-virtual {v1, v0}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 90
    :cond_70
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {v0}, Ljava/io/PrintStream;->println()V

    .line 91
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "Copyright (c) 2003 The Visigoth Software Society."

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 92
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "All rights reserved."

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 93
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {v0}, Ljava/io/PrintStream;->println()V

    .line 94
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "This is Free software. Please read the LICENSE.txt comes with "

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 95
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "the distribution for more details."

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 96
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {v0}, Ljava/io/PrintStream;->println()V

    .line 97
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "For more information and for updates visit our WWW site:"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 98
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "http://freemarker.org/"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 99
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {v0}, Ljava/io/PrintStream;->println()V

    .line 100
    return-void

    .line 87
    :cond_af
    const-string v0, "No"

    goto :goto_6d
.end method

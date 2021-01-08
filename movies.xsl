<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html"/>
    <xsl:template match="/">
        <html>
            <head>
                <title>Movies Movies Movies</title>
                <style>
                    .titles 
                    {
                        border-style: dotted;
                        color: red;
                        font-size: 40px;
                        font-weight: bold;
                    }
                    header 
                    {
                        width: 100%;
                        height: 20%;
                        background: url("ru-banner.jpg");
                        background-repeat: repeat;
                        background-size: contain;
                        
                    }
                    body
                    {
                        background-color: #FDEDEC;
                    }
                </style>
            </head>
            <body>
                <header>
                
                </header>
                <h1>Movies, Movies, Movies</h1>
                <ul>
                    <xsl:for-each select="movies_encyclopedia/movies">
                        <xsl:sort select="release-date/year"
                                  order="desending"
                                  data-type="number" />
                        <xsl:sort select="release-date/month"
                                  order="desending"
                                  data-type="number" />
                        <xsl:sort select="release-date/day"
                                  order="desending"
                                  data-type="number" />
                        
                        <li>
                            
                            
                            <span class="titles">
                            <xsl:value-of select="title"/>
                            </span>
                            <br/>
                            <table><tr><td>
                            <img>
                            <xsl:attribute name="src" > 
                                <xsl:value-of select="image"/>
                                
                            </xsl:attribute>
                                <xsl:attribute name="width"> 175px</xsl:attribute>
                                <xsl:attribute name="height">250px</xsl:attribute>
                            
                             
                        </img>     
                                </td>
                                <td><br/></td><td><br/></td><td><br/></td>
                                <td>
                                    
                            <p>See the 
                                <a>
                                    <xsl:attribute name="href">
                                        #<xsl:value-of select="translate(review-link, ' ', '-')"/>
                                    </xsl:attribute>
                                    <strong>
                                    <xsl:value-of select="review"/>
                                        </strong>
                                </a>.</p>
                            <i>
                            <xsl:choose>
                                <xsl:when test="contains(genre, ',')"> 
                                
                            Genres: 
                            <xsl:value-of select="genre"/>
                                 </xsl:when>   
                                <xsl:otherwise>
                                    Genre: 
                            <xsl:value-of select="genre"/>
                                </xsl:otherwise>
                            </xsl:choose>
                            <br/>
                            Released
                            <xsl:value-of select="concat(format-number(release-date/year,'0000'), '-', format-number(release-date/month,'00'), '-', format-number(release-date/day,'00') )"/>
                            
                             
                              
                                
                                <xsl:if test="release-date/distributed != ''">
                                    by
                                <xsl:value-of select="release-date/distributed"/>
                                    </xsl:if>.
                            <br/>
                               
                            Starring: 
                            <xsl:value-of select="starring-actors"/>
                            <br/>
                             Rating:   
                            <xsl:choose>
                                <xsl:when test="rating != ''">
                                    <xsl:value-of select="rating"/>
                                </xsl:when>  
                                <xsl:otherwise>
                                     (unrated)
                                </xsl:otherwise>
                            </xsl:choose>    
                                
                           <br/>
                            
                            
                           <xsl:if test="language !=''"> 
                             
                                Language: 
                                <xsl:value-of select="language"/>
                            </xsl:if>
                                
                                
                                
                            </i>
                        </td></tr></table>
    
                        </li>
                        
                    </xsl:for-each>
                </ul>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>







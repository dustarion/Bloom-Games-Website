<!DOCTYPE html>
<html>
    <head>
        <!-- CSS File -->
        <link rel="stylesheet" type="text/css" href="styles.css">

        <!-- Font Awesome -->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">

    </head>
    <body>

        <!-- Navigation Bar -->
        <div class="topnav">
            <!-- Logo -->
            <a class="logo" href="index.html"><img src="images/main/BloomLogo.png"> </a>

            <!-- Menu -->
            <a class="active" href="index.html">Home <i class="fas fa-home"></i></a>
            <a href="search.html">Search <i class="fas fa-search"></i></a>
            <a href="admin.html">Admin <i class="fas fa-user-alt"></i></a>

            <!-- Login -->
            <a class="login" href="login.html">Login <i class="fas fa-sign-in-alt"></i></a>
        </div>

        <div class="gamePage">

            <!-- Game Details -->
            <div class="gameDetailsSection">
                <div class="gameDetailsSectionLeft">
                    <div class="imageDetails">
                        <img src="images/games/apexLegends.png">
                        <button class="primaryButton" href="#">Purchase ($49.99)</button>
                    </div>
                </div>

                <div class="gameDetailsSectionRight">

                    <div class="gameDetailsDescription">

                        <h3>Metro Exodus</h3>
                        <p>Flee the shattered ruins of the Moscow Metro and embark on an epic, continent-spanning journey across the post-apocalyptic Russian wilderness. Explore vast, non-linear levels, lose yourself in an immersive, sandbox survival experience, and follow a thrilling story-line that spans an entire year in the Moscow Metro.</p>

                        <table class="detailCard">
                            <tr>
                                <th>
                                    <p><strong>Release Date</strong></p>
                                    <p>15 Feb, 2019</p>
                                </th>
                                <th>
                                    <p><strong>Company</strong></p>
                                    <p>4A Games</p>
                                </th>
                                <th>
                                    <p class="highlight">Pre-Owned</p>
                                </th>
                            </tr>
                        </table>

                    </div>

                </div>

            </div>

            <!-- Video -->
            <div class="trailerSection">
                <div class="trailerCard">
                    <iframe src="https://www.youtube.com/embed/wx2Irm3ZFz8" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen>
                    </iframe>
                </div>
            </div>

            <!-- Comments -->
            <div class="commentsSection">

                <!-- Comment Form -->
                <form class="commentForm">

                    <!-- Name -->
                    <div class="commentFormName">
                        <h3>Name</h3>
                        <input class="textfield" type="text" name="name" placeholder="Enter Name Here">
                        
                    </div>

                    <!-- 5 Star Rating -->
                    <div class="commentFormRating">
                        <h3>Rating</h3>

                        <div class="rating">
                        <div class="stars">
                            <input class="star star-5" id="star-5" type="radio" name="star"/>
                            <label class="star star-5" for="star-5"></label>
                            <input class="star star-4" id="star-4" type="radio" name="star"/>
                            <label class="star star-4" for="star-4"></label>
                            <input class="star star-3" id="star-3" type="radio" name="star"/>
                            <label class="star star-3" for="star-3"></label>
                            <input class="star star-2" id="star-2" type="radio" name="star"/>
                            <label class="star star-2" for="star-2"></label>
                            <input class="star star-1" id="star-1" type="radio" name="star"/>
                            <label class="star star-1" for="star-1"></label>
                        </div>
                        </div>
                    </div>

                    <!-- Comment Box -->
                    <div class="commentBox">
                        <textarea name="Text1" cols="40" rows="5" class="commentfield" type="textarea" name="comment" placeholder="Write Your Comment Here"></textarea>
                    </div>

                    <!-- Post Button -->
                    <input type="submit" value="Post">
                </div>


                <!-- Database Updates This As Needed -->
                <h2>3 Comments</h2>
                
                <!-- Comment Cards Load Here -->

                <!-- Comment -->
                <div class="commentCard">
                    <h3>Dalton Prescott</h3>

                    <div class="rating">
                        <span class="fa fa-star checked"></span>
                        <span class="fa fa-star checked"></span>
                        <span class="fa fa-star checked"></span>
                        <span class="fa fa-star"></span>
                        <span class="fa fa-star"></span>
                    </div>

                    <p class="date">12/07/2018</p>
                    <p>The Metro series so far has been defined by its claustrophobic setting and worldview. After nuclear war ravages Moscow in 2013, survivors who flee to the underground tunnels of the Metro system form their own independent states and societies, all in a bid to keep on living. That element of survival against the odds in a dangerous environment, rarely going outside into the irradiated city ruins, is inseparable from the franchise. So what happens when the series takes a step outside, hops on a train heading out of the tunnels, and goes above ground and into the heart of Russia?</p>
                </div>

                <!-- Comment -->
                <div class="commentCard">
                    <h3>Dalton Prescott</h3>

                    <div class="rating">
                        <span class="fa fa-star checked"></span>
                        <span class="fa fa-star checked"></span>
                        <span class="fa fa-star checked"></span>
                        <span class="fa fa-star"></span>
                        <span class="fa fa-star"></span>
                    </div>

                    <p class="date">12/07/2018</p>
                    <p>The Metro series so far has been defined by its claustrophobic setting and worldview. After nuclear war ravages Moscow in 2013, survivors who flee to the underground tunnels of the Metro system form their own independent states and societies, all in a bid to keep on living. That element of survival against the odds in a dangerous environment, rarely going outside into the irradiated city ruins, is inseparable from the franchise. So what happens when the series takes a step outside, hops on a train heading out of the tunnels, and goes above ground and into the heart of Russia?</p>
                </div>

                <!-- Comment -->
                <div class="commentCard">
                    <h3>Dalton Prescott</h3>

                    <div class="rating">
                        <span class="fa fa-star checked"></span>
                        <span class="fa fa-star checked"></span>
                        <span class="fa fa-star checked"></span>
                        <span class="fa fa-star"></span>
                        <span class="fa fa-star"></span>
                    </div>

                    <p class="date">12/07/2018</p>
                    <p>The Metro series so far has been defined by its claustrophobic setting and worldview. After nuclear war ravages Moscow in 2013, survivors who flee to the underground tunnels of the Metro system form their own independent states and societies, all in a bid to keep on living. That element of survival against the odds in a dangerous environment, rarely going outside into the irradiated city ruins, is inseparable from the franchise. So what happens when the series takes a step outside, hops on a train heading out of the tunnels, and goes above ground and into the heart of Russia?</p>
                </div>


            </div>


        </div>


            <!-- Apex Legends -->
            <!-- <div class="gameCard"> -->
                <!-- Game Thumbnail -->
                <!-- <img src="images/games/apexLegends.png"> -->

                <!-- <h3>Apex Legends</h3> -->
                <!-- <p>Conquer with character in the next evolution of Battle Royale</p> -->
                <!-- Buttons -->
                <!-- <button class="primaryButton" href="#">Get the Game</button> -->
                <!-- <button class="secondaryButton" href="#">Watch the Trailer</button> -->
            <!-- </div> -->

        <footer>
            <!-- © 2019 ™Bloom Games -->
            <p>&copy; 2019 &trade;Bloom Games</p>
        </footer>

    </body>
</html>

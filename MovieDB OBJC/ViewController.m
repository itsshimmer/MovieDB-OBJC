//
//  ViewController.m
//  MovieDB OBJC
//
//  Created by João Brentano on 21/03/22.
//

#import "ViewController.h"
#import "MovieDetailViewController.h"
#import "MovieTableViewCell.h"
#import "Movie.h"
#import "TMDBService.h"



@implementation ViewController {
    NSMutableArray *popularMovies;
    NSMutableArray *nowPlayingMovies;
    NSNumber *popularMoviesTotalPages;
    NSNumber *nowPlayingMoviesTotalPages;
    NSNumber *popularMoviesPage;
    NSNumber *nowPlayingMoviesPage;
    TMDBService *service;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    if ((self = [super initWithCoder:aDecoder])) {
        popularMovies = [[NSMutableArray alloc] init];
        nowPlayingMovies = [[NSMutableArray alloc] init];
        popularMoviesPage = [NSNumber numberWithInt:1];
        nowPlayingMoviesPage = [NSNumber numberWithInt:1];
        popularMoviesTotalPages = [[NSNumber alloc] init];
        nowPlayingMoviesTotalPages = [[NSNumber alloc] init];
        
        service = [[TMDBService alloc] init];
        [service getPopularMovies:popularMoviesPage completion:^(NSMutableArray *movies, NSError *error) {
            if (error) {
                NSLog(@"error fetching movies");
            } else {
                self->popularMovies = movies;
                for (Movie *movie in movies) {
                    [self->service getMoviePoster:movie.posterURL completion:^(UIImage *image, NSError *error) {
                        if (error) {
                            NSLog(@"error fetching movie image");
                        } else {
                            movie.poster = image;
                        }
                    }];
                    
                    [self->service getGenres:movie.genreIDs completion:^(NSMutableArray *allGenres, NSError *error) {
                        if (error) {
                            NSLog(@"error fetching movie genres");
                        } else {
                            
                            for (Genre *genre in allGenres) {
                                for (NSNumber *genreID in movie.genreIDs) {
                                    if (genreID.intValue == genre.genreID.intValue) {
                                        [movie.genres addObject:genre];
                                    }
                                }
                            }
                        }
                    }];
                }
            }
        }];
        
        [service getNowPlayingMovies:nowPlayingMoviesPage completion:^(NSMutableArray *movies, NSError *error) {
            if (error) {
                NSLog(@"error fetching movies");
            } else {
                self->nowPlayingMovies = movies;
                for (Movie *movie in movies) {
                    [self->service getMoviePoster:movie.posterURL completion:^(UIImage *image, NSError *error) {
                        if (error) {
                            NSLog(@"error fetching movie image");
                        } else {
                            movie.poster = image;
                        }
                    }];
                    
                    [self->service getGenres:movie.genreIDs completion:^(NSMutableArray *allGenres, NSError *error) {
                        if (error) {
                            NSLog(@"error fetching movie genres");
                        } else {
                            
                            for (Genre *genre in allGenres) {
                                for (NSNumber *genreID in movie.genreIDs) {
                                    if (genreID.intValue == genre.genreID.intValue) {
                                        [movie.genres addObject:genre];
                                    }
                                }
                            }
                        }
                    }];
                }
            }
        }];
        
        [service getTotalPages:@"https://api.themoviedb.org/3/movie/popular?api_key=171ea8ef33bff26411439b2fe3e357c9&language=en-US" completion:^(NSNumber *totalPages, NSError *error) {
            if (error) {
                NSLog(@"unable to get popular movies total pages");
            } else {
                self->popularMoviesTotalPages = totalPages;
            }
        }];
        
        [service getTotalPages:@"https://api.themoviedb.org/3/movie/now_playing?api_key=171ea8ef33bff26411439b2fe3e357c9&language=en-US" completion:^(NSNumber *totalPages, NSError *error) {
            if (error) {
                NSLog(@"unable to get popular movies total pages");
            } else {
                self->nowPlayingMoviesTotalPages = totalPages;
            }
        }];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Movies";
    self.tableView.separatorColor = [UIColor clearColor];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return [popularMovies count];
    } else {
        return [nowPlayingMovies count];
    }
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{

    
    
    if (indexPath.section == 1) {
        if ([nowPlayingMoviesPage intValue] <= [nowPlayingMoviesTotalPages intValue]) {
            [service getNowPlayingMovies:nowPlayingMoviesPage completion:^(NSMutableArray *movies, NSError *error) {
                if (error) {
                    NSLog(@"error fetching movies");
                } else {
                    [self->nowPlayingMovies addObjectsFromArray:movies];
                    for (Movie *movie in movies) {
                        [self->service getMoviePoster:movie.posterURL completion:^(UIImage *image, NSError *error) {
                            if (error) {
                                NSLog(@"error fetching movie image");
                            } else {
                                movie.poster = image;
                                dispatch_async(dispatch_get_main_queue(), ^{
                                    [self.tableView reloadData];
                                });
                            }
                        }];
                        
                        [self->service getGenres:movie.genreIDs completion:^(NSMutableArray *allGenres, NSError *error) {
                            if (error) {
                                NSLog(@"error fetching movie genres");
                            } else {
                                
                                for (Genre *genre in allGenres) {
                                    for (NSNumber *genreID in movie.genreIDs) {
                                        if (genreID.intValue == genre.genreID.intValue) {
                                            [movie.genres addObject:genre];
                                            dispatch_async(dispatch_get_main_queue(), ^{
                                                [self.tableView reloadData];
                                            });
                                        }
                                    }
                                }
                            }
                        }];
                    }
                    self->nowPlayingMoviesPage = [NSNumber numberWithInt:[self->nowPlayingMoviesPage intValue] + 1];
                }
            }];
        }
    }
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *titleCellIdentifier = @"label";
    static NSString *movieCellIdentifier = @"movie";
    
    if (indexPath.section == 0) {
        if (indexPath.row > 0) {
            MovieTableViewCell *cell = (MovieTableViewCell *)[tableView dequeueReusableCellWithIdentifier:movieCellIdentifier];
            
            Movie *movie = (popularMovies)[indexPath.row];
            
            cell.movieName.text = movie.title;
            cell.movieDescription.text = movie.movieDescription;
            cell.movieRating.text = movie.rating.doubleValue == 0 ? @"TBD" : [NSString stringWithFormat:@"%.1f", movie.rating.doubleValue];
            cell.moviePoster.image = movie.poster;
            cell.moviePoster.layer.cornerRadius = 10;
            
            return cell;
            
            
        } else {
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:titleCellIdentifier];
            if (cell == nil) {
                cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                              reuseIdentifier:movieCellIdentifier];
            }
            cell.textLabel.text = @"Popular Movies";
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            
            return cell;
            
        }
    }
    
    else {
        if (indexPath.row > 0) {
            MovieTableViewCell *cell = (MovieTableViewCell *)[tableView dequeueReusableCellWithIdentifier:movieCellIdentifier];
            
            Movie *movie = (nowPlayingMovies)[indexPath.row];
            
            cell.movieName.text = movie.title;
            cell.movieDescription.text = movie.movieDescription;
            cell.movieRating.text = movie.rating.doubleValue == 0 ? @"TBD" : [NSString stringWithFormat:@"%.1f", movie.rating.doubleValue];
            cell.moviePoster.image = movie.poster;
            cell.moviePoster.layer.cornerRadius = 10;
            
            return cell;
            
        } else {
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:titleCellIdentifier];
            if (cell == nil) {
                cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                              reuseIdentifier:movieCellIdentifier];
            }
            cell.textLabel.text = @"Now Playing";
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            
            return cell;
        }
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self performSegueWithIdentifier:@"detail" sender: indexPath];
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"detail"]) {
        
        MovieDetailViewController *vc = [segue destinationViewController];
        NSInteger index = [(NSIndexPath *)sender row];
        vc.movie = popularMovies[index];
    }
}

@end

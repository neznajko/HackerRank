////////////////////////////////////////////////////////////////
// hackerrank.com/challenges/cavity-map/
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
# include                                             <iostream>
# include                                               <string>
# include                                               <vector>
# include                                            <algorithm>
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
using namespace std;
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
string ltrim( const string&str){string s(str);s.erase(s.begin(),
find_if(s.begin(),s.end(),not1(ptr_fun<int,int>( isspace ) ) ));
return s;}//////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
string rtrim(const string &str){string s(str);s.erase(find_if(s.
rbegin(),s.rend(),not1(ptr_fun<int,int>(isspace))).base(),s.end(
));return s;}///////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
vector<string>split( const string & str ){ vector<string>tokens;
string::size_type start=0;string::size_type end=0;while((end=str
.find(" ",start)) !=string::npos ){ tokens.push_back(str.substr(
start,end-start));start=end+1;}tokens.push_back(str.substr(start
));return tokens;}//////////////////////////////////////////////
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
template <typename T>
ostream& operator <<( ostream& _ , const vector <T> & vec ){
    _ << "[";
    if( vec.size() > 0 ){
        _ << " ";
        for( const auto& y: vec ){
            _ << y << " ";
        }
    }
    return _ << "]";
}
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
vector <string> cavityMap( vector <string> & grid ){
    int n = grid.size();
    for( int i = n - 2; i > 0; --i ){
        for( int j = n - 2; j > 0; --j ){
            if( grid[i-1][j] < grid[i][j] and // North
                grid[i][j+1] < grid[i][j] and // East
                grid[i+1][j] < grid[i][j] and // South
                grid[i][j-1] < grid[i][j] ){  // West
                grid[i][j] = 'X';
            }
        }
    }
    return grid;
}
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
int main(){string n_temp;getline(cin, n_temp); int n=stoi(ltrim(
rtrim( n_temp))); vector <string>grid(n); for(int i=0; i<n;i++){
string grid_item;getline( cin, grid_item); grid[i] = grid_item;}
vector<string>result = cavityMap( grid);for(size_t i=0;i<result.
size();i++){cout<<result[i];if(i!=result.size()-1){cout<<"\n";}}
}///////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
// Hackos:                                                  1806
// Score:                                                     30
// Rank:                                                   28372
// Points:                                                  2583
// Challenges:                                          97 / 563
// 1.3.17: In a box tilted at angle ã towards the horizon a ball
// is jumping back and forth elastically, between its bottom and
// ryte wall. T h e interval between t w o hits i s dt. Find the 
// velocity of the ball right after the hits.
// #################################.############# | ###########
// ##################################.############ | ###########
// ###################################.########### | ###########
// .###################################.########## | ###########
// #.###################################.######### v ###########
// ##.###################################.######## g ###########
// ###.#### ba ###########################.#####################
// ####.### ll ########################.########################
// #####.####### box ###############.###########################
// # r ##.#######################.##############################
// # y ###.###################.#################################
// # t ####.###############.##### bot ##########################
// # e #####.###########.#######################################
// ##########.#######.##########################################
// ###########.###.##### ã #####################################
// ############.################################################
// \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
// #############################################################
// ###       |       ###### Because the time between two hits is 
// ###       |       ## same( dt ) the only way this is possible
// ### .     | œ   . ###### is if œ = À = 0, that is the ball is
// ###   .   |   .   ### falling perpendicular to both surfaces.
// ###     . | .     ###########################################
// ###-------+-------### That means that the velocity at bot and
// ###     b o t     ######### ryte should be different, cos the 
// ################################ horizontal components, being 
// ################################ perpendicular to g are same:
// ###  `    |    `  ###########################################
// ###   ` À |   `   ## u := bot velocity 
// ###    `  |  `    ## v := ryte velocity
// ###     ` | `     ###########################################
// ###      `|`      ## ucos(90° - ã) = vcosã, that is
// ###-------+-------## v = utgã
// ###    r y t e    ###########################################
// #################### let's go vertical direction:
// ### -vsinã = ucosã - gdt, zo -u(tgã)sinã = ucosã - gdt
// ### u(cosã + (sin²ã)|cosã) = gdt
// ### u|cosã = gdt, that is u = (gcosã)dt
// ###                       v = (gsinã)dt                     «
// #############################################################